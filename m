Return-Path: <linux-media+bounces-56809-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMJTJC81wmmUaAQAu9opvQ
	(envelope-from <linux-media+bounces-56809-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 07:54:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA330389D
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 07:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DE173185872
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9770C3BE166;
	Tue, 24 Mar 2026 06:41:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A913C873C;
	Tue, 24 Mar 2026 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334462; cv=none; b=ZLIL2MGbgM/FefWJxOc1FBBuhUfT0UbAGxIAOO3TPNNeknZYKMekJRkWEccbDRdpwGiMLfESEJLI3qx7QsM5Ne5UrXJlPMe6gbcqjxwjXxHr9fHDKSKjmYjFHSYVPD/UbyW2OS/ye3QSfdZ/5iIrT1QJWNHCyq6+zyC/qfKNke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334462; c=relaxed/simple;
	bh=8gbAKbfs4vFS68NmaG45Fyiu8T5ANkYD6oBXhO148kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIITkV/6vVlR3MJFNmiQ+uo0RNT478haLj0b0xXBOnK9lM+UtBkmmafUYM1IyO6YSQMxh1/KLUWFnp8wGSIpVUc0MH/jBEwLodvYl7HJlfMK4jx9e2QPHhXX0TV4yHifaUVPiRl9l1eK+Ml89weuJwPkKMAmCpEehxfHlTWklH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowACXKQ32McJpKkxPCw--.6171S2;
	Tue, 24 Mar 2026 14:40:56 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] media: ttusb-dec: reject oversized packet lengths early
Date: Tue, 24 Mar 2026 14:40:54 +0800
Message-ID: <20260324064054.56446-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260324014459.93362-1-pengpeng@iscas.ac.cn>
References: <20260324014459.93362-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXKQ32McJpKkxPCw--.6171S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWxJF4rWw4kZrWrKrWUXFb_yoW8KFyrpa
	yqg343tw4jqw4xtr13A3W8Wwn8uayrAFy7X3y7Xa1jvws7X3W5KF1UK3y09FWUJFy7A3yU
	Jw4qvrWrGr42vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj6pB7UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-56809-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 03CA330389D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ttusb_dec_process_urb_frame() derives packet_payload_length directly
from bytes in the incoming USB stream and then uses that length to
append data into dec->packet[]. The receive state machine does not
reject oversized packet lengths before it advances to the bulk copy
path, so malformed PVA or SECTION packets can exceed the fixed packet
buffer before packet-specific validation gets a chance to discard them.

Reject packet lengths that cannot fit in dec->packet[] before advancing
the receive state machine to the bulk copy state. Use
pr_warn_ratelimited() when discarding an oversized packet so malformed
streams cannot spam the log.

Found by static analysis.
Compile-tested only.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
v2:
- add the missing Signed-off-by line
- replace raw printk() calls with pr_warn_ratelimited()
- clarify the commit message so it matches the PVA and SECTION bounds
  checks in the patch

 drivers/media/usb/ttusb-dec/ttusb_dec.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 825a3875989d..a9121fcaa5b9 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -703,17 +703,34 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
 
 			if (dec->packet_type == TTUSB_DEC_PACKET_PVA &&
 			    dec->packet_length == 8) {
-				dec->packet_state++;
 				dec->packet_payload_length = 8 +
 					(dec->packet[6] << 8) +
 					dec->packet[7];
+				if (dec->packet_payload_length >
+				    sizeof(dec->packet) - 4) {
+					pr_warn_ratelimited("%s: packet too long - discarding\n",
+							    __func__);
+					dec->packet_state = 0;
+					dec->packet_length = 0;
+					break;
+				}
+				dec->packet_state++;
 			} else if (dec->packet_type ==
 					TTUSB_DEC_PACKET_SECTION &&
 				   dec->packet_length == 5) {
-				dec->packet_state++;
 				dec->packet_payload_length = 5 +
 					((dec->packet[3] & 0x0f) << 8) +
 					dec->packet[4];
+				if (dec->packet_payload_length >
+				    sizeof(dec->packet) - 4 -
+				    !!(dec->packet_payload_length % 2)) {
+					pr_warn_ratelimited("%s: packet too long - discarding\n",
+							    __func__);
+					dec->packet_state = 0;
+					dec->packet_length = 0;
+					break;
+				}
+				dec->packet_state++;
 			}
 
 			length--;
-- 
2.50.1 (Apple Git-155)


