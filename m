Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 686A02AC40
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 23:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbfEZVJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 17:09:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:56371 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbfEZVJl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 17:09:41 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 07F7C60632; Sun, 26 May 2019 22:09:39 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 1/2] keytable: load bpf protocol for unsupported protocols
Date:   Sun, 26 May 2019 22:09:38 +0100
Message-Id: <20190526210939.29849-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If there is no hardware decoder or kernel software decoder available
for a protocol, attempt to load a bpf protocol for this.

This opens the door for building the kernel without IR decoders (non
bpf ones) and just rely on bpf and hardware decoders. This requires
the bpf decoders to be written though, this still needs to be done.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 9384532b..daf82c0e 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -326,6 +326,10 @@ static bool compare_parameters(struct toml_table_t *a, struct toml_table_t *b)
 	int64_t avalue, bvalue;
 	const char *name, *raw;
 
+	if (a == NULL || b == NULL) {
+		return true;
+	}
+
 	while ((name = toml_key_in(a, i++)) != NULL) {
 		raw = toml_raw_in(a, name);
 		if (!raw)
@@ -1110,6 +1114,26 @@ static struct sysfs_names *find_device(char *name)
 	return names;
 }
 
+static enum sysfs_protocols create_bpf_for_unsupported(enum sysfs_protocols protocols, enum sysfs_protocols supported)
+{
+	const struct protocol_map_entry *pme;
+	struct bpf_protocol *b;
+
+	for (pme = protocol_map; pme->name; pme++) {
+		if (!(protocols & pme->sysfs_protocol) ||
+		    (supported & pme->sysfs_protocol))
+			continue;
+
+		b = malloc(sizeof(*b));
+		b->name = strdup(pme->name);
+		add_bpf_protocol(b);
+
+		protocols &= ~pme->sysfs_protocol;
+	}
+
+	return protocols;
+}
+
 static enum sysfs_protocols v1_get_hw_protocols(char *name)
 {
 	FILE *fp;
@@ -1466,13 +1490,13 @@ static int set_proto(struct rc_device *rc_dev)
 {
 	int rc = 0;
 
-	rc_dev->current &= rc_dev->supported;
-
 	if (rc_dev->version == VERSION_2) {
 		rc = v2_set_protocols(rc_dev);
 		return rc;
 	}
 
+	rc_dev->current &= rc_dev->supported;
+
 	if (rc_dev->type == SOFTWARE_DECODER) {
 		const struct protocol_map_entry *pme;
 
@@ -2215,7 +2239,8 @@ int main(int argc, char *argv[])
 		if (rc_dev.lirc_name)
 			clear_bpf(rc_dev.lirc_name);
 
-		rc_dev.current = ch_proto;
+		rc_dev.current = create_bpf_for_unsupported(ch_proto, rc_dev.supported);
+
 		if (set_proto(&rc_dev))
 			fprintf(stderr, _("Couldn't change the IR protocols\n"));
 		else {
-- 
2.20.1

