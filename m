Return-Path: <linux-media+bounces-67635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cx1eM2NHV2ogIgEAu9opvQ
	(envelope-from <linux-media+bounces-67635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:40:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26475BF74
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67635-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67635-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 016CC301A16D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB413C942E;
	Wed, 15 Jul 2026 08:39:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A742BC31;
	Wed, 15 Jul 2026 08:39:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104790; cv=none; b=e1doMb9NkN9cxPfo+H03apvICxmPY9Gh7BoCSNZqVN7SV/3p9GUtCxYP7eCDubhdNSV3DEsN+R7UJKkcXGC08myzm3Bz8/5ItIODT97DOM/zficxhTTM876ntRBx0OycTUx8JMixpid+6Aqch55BhEnCvyeD8kl36V1xQRlghfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104790; c=relaxed/simple;
	bh=E5EYzML7R643gT8cXq5HdAwgJAnViqY0BBoJjVXvreo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFpKlWx/xt6JZTYC7Fbu7nN4MVnUPrJj1IKQQTIBE8n3cWP7M00bb4ndZno8u7f4GIOkQ0nPpjgFqvTnrQ6KoUVBY26WeavQa78HvED+wjpilIm5pKko0YHiEYXpGSCP9vbDmSWbLOvwCh62bs1NefsdAmDTl0RXU2mpA1GBBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAB30NNRR1dqzF1HGA--.14562S2;
	Wed, 15 Jul 2026 16:39:45 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laura Abbott <labbott@fedoraproject.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb-frontends: si2168: validate firmware record length
Date: Wed, 15 Jul 2026 16:39:45 +0800
Message-ID: <20260715083945.33781-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAB30NNRR1dqzF1HGA--.14562S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF43WrWrAr1fKw48Gr17Jrb_yoW5Aw1fpF
	Z8JF98tF4UWrW3Ca43Gay3Z3WfA393G34UGay7G3ZYgrnI9Fyrtayjg3yj9r1Ykr4Sy3yU
	XrZ2qry8ZFy3JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjnmRU
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:pengpeng@iscas.ac.cn,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:labbott@fedoraproject.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67635-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:from_mime,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C26475BF74

The new Si2168 firmware format stores one command in each 17-byte record:
the first byte is the command length and the remaining 16 bytes are the
command data.

The existing check only compares the length with SI2168_ARGLEN, which
protects the destination command array but not the current firmware record.
A length from 17 through SI2168_ARGLEN makes cmd_init() copy from the next
record, or past the firmware blob for the final record.  An empty firmware
file also passes the modulo test before fw->data[0] is read.

Reject empty files and require each new-format command length to fit the
16-byte payload of its record before copying it.

Fixes: 47810b4341ac ("[media] si2168: Bounds check firmware")
Cc: stable@vger.kernel.org
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- Reject empty firmware blobs before reading the first record byte.
- Name the old and new record sizes while retaining the current-record
  payload bound.

Link: https://lore.kernel.org/r/20260705084706.62129-1-pengpeng@iscas.ac.cn

 drivers/media/dvb-frontends/si2168.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 8bc3b6eb1dd3..182c2b671508 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -11,6 +11,9 @@
 
 static const struct dvb_frontend_ops si2168_ops;
 
+#define SI2168_NEW_FIRMWARE_RECORD_SIZE 17
+#define SI2168_OLD_FIRMWARE_RECORD_SIZE 8
+
 static void cmd_init(struct si2168_cmd *cmd, const u8 *buf, int wlen, int rlen)
 {
 	memcpy(cmd->args, buf, wlen);
@@ -459,11 +462,15 @@ static int si2168_init(struct dvb_frontend *fe)
 	dev_info(&client->dev, "downloading firmware from file '%s'\n",
 			dev->firmware_name);
 
-	if ((fw->size % 17 == 0) && (fw->data[0] > 5)) {
+	if (fw->size &&
+	    fw->size % SI2168_NEW_FIRMWARE_RECORD_SIZE == 0 &&
+	    fw->data[0] > 5) {
 		/* firmware is in the new format */
-		for (remaining = fw->size; remaining > 0; remaining -= 17) {
+		for (remaining = fw->size; remaining > 0;
+		     remaining -= SI2168_NEW_FIRMWARE_RECORD_SIZE) {
 			len = fw->data[fw->size - remaining];
-			if (len > SI2168_ARGLEN) {
+			if (len > SI2168_ARGLEN ||
+			    len >= SI2168_NEW_FIRMWARE_RECORD_SIZE) {
 				ret = -EINVAL;
 				break;
 			}
@@ -473,10 +480,13 @@ static int si2168_init(struct dvb_frontend *fe)
 			if (ret)
 				break;
 		}
-	} else if (fw->size % 8 == 0) {
+	} else if (fw->size &&
+		   fw->size % SI2168_OLD_FIRMWARE_RECORD_SIZE == 0) {
 		/* firmware is in the old format */
-		for (remaining = fw->size; remaining > 0; remaining -= 8) {
-			cmd_init(&cmd, &fw->data[fw->size - remaining], 8, 1);
+		for (remaining = fw->size; remaining > 0;
+		     remaining -= SI2168_OLD_FIRMWARE_RECORD_SIZE) {
+			cmd_init(&cmd, &fw->data[fw->size - remaining],
+				 SI2168_OLD_FIRMWARE_RECORD_SIZE, 1);
 			ret = si2168_cmd_execute(client, &cmd);
 			if (ret)
 				break;
-- 
2.43.0


