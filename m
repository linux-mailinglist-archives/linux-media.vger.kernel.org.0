Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC81D6136
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2020 15:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgEPNKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 May 2020 09:10:01 -0400
Received: from gofer.mess.org ([88.97.38.141]:51641 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgEPNKB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 May 2020 09:10:01 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DA2F9C636B; Sat, 16 May 2020 14:09:59 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Ralf Schmidt <rds2@gmx.de>
Subject: [PATCH v4l-utils] keytable: "-p all" should not attempt BPF decodes that don't exist
Date:   Sat, 16 May 2020 14:09:59 +0100
Message-Id: <20200516130959.2593-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently we only have a BPF decoder for xbox_dvd. Other decoders
should not be attempted.

Reported-by: Ralf Schmidt <rds2@gmx.de>
Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 4db91267..3df5fcf2 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -945,12 +945,21 @@ static struct sysfs_names *find_device(char *name)
 	return names;
 }
 
+/*
+ * If an rcdev does not have a decoder for a protocol, try to load a bpf
+ * replacement.
+ */
 static enum sysfs_protocols load_bpf_for_unsupported(enum sysfs_protocols protocols, enum sysfs_protocols supported)
 {
 	const struct protocol_map_entry *pme;
 	struct bpf_protocol *b;
 
 	for (pme = protocol_map; pme->name; pme++) {
+		// So far, we only have a replacement for the xbox_dvd
+		// protocol
+		if (pme->sysfs_protocol != SYSFS_XBOX_DVD)
+			continue;
+
 		if (!(protocols & pme->sysfs_protocol) ||
 		    (supported & pme->sysfs_protocol))
 			continue;
@@ -1156,7 +1165,7 @@ static int v2_set_protocols(struct rc_device *rc_dev)
 
 	if (!stat(name, &st) && !(st.st_mode & 0222)) {
 		fprintf(stderr, _("Protocols for device can not be changed\n"));
-		return 0;
+		return EINVAL;
 	}
 
 	fp = fopen(name, "w");
@@ -1323,8 +1332,7 @@ static int set_proto(struct rc_device *rc_dev)
 	int rc = 0;
 
 	if (rc_dev->version == VERSION_2) {
-		rc = v2_set_protocols(rc_dev);
-		return rc;
+		return v2_set_protocols(rc_dev);
 	}
 
 	rc_dev->current &= rc_dev->supported;
@@ -2151,9 +2159,7 @@ int main(int argc, char *argv[])
 
 		rc_dev.current = load_bpf_for_unsupported(ch_proto, rc_dev.supported);
 
-		if (set_proto(&rc_dev))
-			fprintf(stderr, _("Couldn't change the IR protocols\n"));
-		else {
+		if (!set_proto(&rc_dev)) {
 			fprintf(stderr, _("Protocols changed to "));
 			write_sysfs_protocols(rc_dev.current, stderr, "%s ");
 			fprintf(stderr, "\n");
-- 
2.26.2

