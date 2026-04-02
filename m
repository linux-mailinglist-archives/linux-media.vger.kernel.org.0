Return-Path: <linux-media+bounces-57942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA+nKJ9UzmmEmwYAu9opvQ
	(envelope-from <linux-media+bounces-57942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 13:35:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A93E388655
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 13:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43C9330A04C7
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 11:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B713CA4A9;
	Thu,  2 Apr 2026 11:28:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25443D649B;
	Thu,  2 Apr 2026 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129305; cv=none; b=MLidKPijZifTS+ukEztrYY0Z6hfHUODX8VT0Mf1YQ/HREU2QpX7vx++YUP14GuEs8px5yYmwJOkdlYrHS+TPABZun8PMrr2rpswb9THqc+69+wDZo1e85tuXCt2p9i3zk36VnnlJeYhu90VOvOTdJclc2CMLgAw/2NuEfUoMBcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129305; c=relaxed/simple;
	bh=DUgpiLoTxiYhaUIvk9RbJGb+PTKuUE9jDkMLrPRocFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rVkjvF5NVqtHPH4c0+fwE3tYRbOm4c5CLWJCuuFy3+HdQnW1261Vw8/rDGz5pcDyb5pDWe4URYTDvciEkfhbHpAfuK5DqvQtAsnXeQapPtBAXfbUtnhtKLRoZwBhRsATKCh+oyvaCOFm7X5V9jx7HRMc28jFAvSdy8QwWOFI19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowACHa+LAUs5pz7WoDA--.7231S2;
	Thu, 02 Apr 2026 19:28:00 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] media: ttusb-dec: reject oversized packets before copying them
Date: Thu,  2 Apr 2026 19:28:00 +0800
Message-ID: <20260402112800.39716-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHa+LAUs5pz7WoDA--.7231S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4ftr17Xw4rtF1UGrWUCFg_yoW8uFW3pa
	9Yg343tw40qw18tr1fAF1rWr98X3yrAFy2q3y7X3Wj9ws3X3W5K3Wjgw4j9a4UGFy7AayU
	tws8Z3yrGr42vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A93E388655
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ttusb_dec_process_urb_frame() derives packet lengths from packet
bytes and uses those lengths to drive memcpy() into dec->packet.
That staging buffer is fixed at MAX_PVA_LENGTH + 4 bytes, but the
parser does not currently verify that a PVA or section packet still
fits before it continues copying the rest of the packet.

For PVA packets, the parsed payload length is 8 plus a 16-bit field
and the parser later appends a 4-byte trailer before processing the
packet. For section packets, the parser similarly uses the parsed
payload length and then appends a 4-byte trailer plus one padding byte
for odd-sized payloads. Reject packets whose advertised total staged
length would exceed dec->packet before entering the bulk-copy state.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 825a3875989d..92259ebe59c6 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -703,17 +703,32 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
 
 			if (dec->packet_type == TTUSB_DEC_PACKET_PVA &&
 			    dec->packet_length == 8) {
-				dec->packet_state++;
 				dec->packet_payload_length = 8 +
 					(dec->packet[6] << 8) +
 					dec->packet[7];
+				if (dec->packet_payload_length + 4 >
+				    sizeof(dec->packet)) {
+					pr_warn("%s: PVA packet too long - discarding\n",
+						__func__);
+					dec->packet_state = 0;
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
+				if (dec->packet_payload_length + 4 +
+				    (dec->packet_payload_length % 2) >
+				    sizeof(dec->packet)) {
+					pr_warn("%s: section packet too long - discarding\n",
+						__func__);
+					dec->packet_state = 0;
+					break;
+				}
+				dec->packet_state++;
 			}
 
 			length--;
-- 
2.50.1 (Apple Git-155)


