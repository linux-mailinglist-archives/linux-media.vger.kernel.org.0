Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1146A5EADDE
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 19:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiIZRQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 13:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiIZRQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 13:16:12 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267CA9A6B1
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 09:29:36 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1466E10005E; Mon, 26 Sep 2022 17:29:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1664209774; bh=X/iSV/4Wk4LOuRXJhkZml/B1wKqHhNDhNp5HeQoCphA=;
        h=From:To:Subject:Date:From;
        b=mRmlS3F3iypKeiytBKvmlUqKhtMX+ynVxUI18mRu73whUPzR+BZ0u/VFl8wkjNv8p
         GcH9qo/qjiED0/EY/kHAX6kkmrZffXS86geshF1MtypZ4U92foBt9Ior7pMAUY5Vz1
         p6ThIydvxYAkw2yhpNUdHt2ECV5xyVjeqRLkMzPZBkTkHMAITpMksJCjWDPAhVn3AH
         MFMBbpjd4JmPncWywOXffygy6UIEJGTve3o29T+Dw7G/ycspmt1CNpiOBbWZ5Swnis
         u6XW1odJP9Ci4Jq9wmxYi7AQzgRdDvbQTBvGNRkjUOgb9o3+BEVdm7W77uv4plaRu+
         unneZVw7ZupKA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] keytable: provide configuration for empty keymap
Date:   Mon, 26 Sep 2022 17:29:34 +0100
Message-Id: <20220926162934.16329-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The lirc documentation contains some drastic measures for disabling
in-kernel decoding. Provide a simpler method of disabling kernel
decoding: simply set /etc/rc_maps.cfg to:

*	* 	empty.toml

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c                     | 23 ++++++++-----------
 .../keytable/rc_keymaps_userspace/empty.toml  |  2 ++
 2 files changed, 12 insertions(+), 13 deletions(-)
 create mode 100644 utils/keytable/rc_keymaps_userspace/empty.toml

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 248493a9..6cd1244f 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -382,14 +382,16 @@ static int add_keymap(struct keymap *map, const char *fname)
 
 		protocol = parse_sysfs_protocol(map->protocol, false);
 		if (protocol == SYSFS_INVALID) {
-			struct bpf_protocol *b;
-
-			b = malloc(sizeof(*b));
-			b->name = strdup(map->protocol);
-			b->param = map->param;
-			/* steal param */
-			map->param = NULL;
-			add_bpf_protocol(b);
+			if (strcmp(map->protocol, "none")) {
+				struct bpf_protocol *b;
+
+				b = malloc(sizeof(*b));
+				b->name = strdup(map->protocol);
+				b->param = map->param;
+				/* steal param */
+				map->param = NULL;
+				add_bpf_protocol(b);
+			}
 		} else {
 			ch_proto |= protocol;
 		}
@@ -2105,11 +2107,6 @@ int main(int argc, char *argv[])
 			}
 			add_keymap(map, fname);
 			free_keymap(map);
-			if (!keytable) {
-				fprintf(stderr, _("Empty keymap %s\n"), fname);
-				free(fname);
-				return -1;
-			}
 			free(fname);
 			clear = 1;
 			matches++;
diff --git a/utils/keytable/rc_keymaps_userspace/empty.toml b/utils/keytable/rc_keymaps_userspace/empty.toml
new file mode 100644
index 00000000..0c0b5e69
--- /dev/null
+++ b/utils/keytable/rc_keymaps_userspace/empty.toml
@@ -0,0 +1,2 @@
+[[protocols]]
+protocol = "none"
-- 
2.37.3

