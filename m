Return-Path: <linux-media+bounces-56782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHTZIOLuwWkgYAQAu9opvQ
	(envelope-from <linux-media+bounces-56782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:54:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D04300C05
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87631301CAA7
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EDC37BE6E;
	Tue, 24 Mar 2026 01:52:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78DE14884C;
	Tue, 24 Mar 2026 01:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317152; cv=none; b=kGJUUXD3GJJU7fb1CtRc2gPKGIY5QMQPn0HbPS6+wkB5MY2Hma6iP3yoXPPGzNFHbRXM7i9ryAuq8AxTlwZIOae18WUqw/JSC21dLUlKDDoluhmEie+XdL80oG0gmqWpWIQsLKxzGA4JwiOUIEsqcx7f+xSv2CPqUm38QGFWpWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317152; c=relaxed/simple;
	bh=RwfF5TUs2hlBjtXsNHHVPGVXCi4yNDlBNm4p8KHlt6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4ZXGcHK2Rq1lWdGJuSH0tQ+JwwzcOreGtpn4X7KbvSuJgQFYg97rYdRvM1zRkvtdfNiWUKkcFcXekzMlKES6Lcm2TMzF6UtlU6WI19399+rIYqL2S9ezJ09EVff80Y+8wgjEfKR+rjaPIQPgBvAgn53J1NuKnHgcdaMDv9Rxw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAD3hAib7MFpzK5JCw--.45024S2;
	Tue, 24 Mar 2026 09:44:59 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] media: ttusb-dec: reject oversized packet lengths early
Date: Tue, 24 Mar 2026 09:44:59 +0800
Message-ID: <20260324014459.93362-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3hAib7MFpzK5JCw--.45024S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW7Cw43XrWDXFW7Zw1UWrg_yoW8Zw4kpa
	90g343Kw4jqw4rtry3A3WrW3s5C3yxCa4IqrW7X3yqgws3Xa1akF12gw4F9ayUJFy3AayU
	G3yDZrWrGr12vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUym14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUajgxUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56782-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88D04300C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ttusb_dec_process_urb_frame() derives packet_payload_length directly
from bytes in the incoming USB stream and then uses that length to
append data into dec->packet[]. The driver only rejects oversized PVA
payloads later in ttusb_dec_process_pva(), after the receive state
machine has already filled the fixed packet buffer.

Reject packet lengths that cannot fit in dec->packet[] before advancing
the receive state machine to the bulk copy state.
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 28 +++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 825a3875989d..072ce5b09683 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -703,17 +703,41 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
 
 			if (dec->packet_type == TTUSB_DEC_PACKET_PVA &&
 			    dec->packet_length == 8) {
-				dec->packet_state++;
+				unsigned int max_payload_length;
+
 				dec->packet_payload_length = 8 +
 					(dec->packet[6] << 8) +
 					dec->packet[7];
+				max_payload_length = sizeof(dec->packet) - 4;
+				if (dec->packet_payload_length >
+				    max_payload_length) {
+					printk("%s: packet too long - discarding\n",
+					       __func__);
+					dec->packet_state = 0;
+					dec->packet_length = 0;
+					break;
+				}
+				dec->packet_state++;
 			} else if (dec->packet_type ==
 					TTUSB_DEC_PACKET_SECTION &&
 				   dec->packet_length == 5) {
-				dec->packet_state++;
+				unsigned int max_payload_length;
+
 				dec->packet_payload_length = 5 +
 					((dec->packet[3] & 0x0f) << 8) +
 					dec->packet[4];
+				max_payload_length = sizeof(dec->packet) - 4;
+				if (dec->packet_payload_length % 2)
+					max_payload_length--;
+				if (dec->packet_payload_length >
+				    max_payload_length) {
+					printk("%s: packet too long - discarding\n",
+					       __func__);
+					dec->packet_state = 0;
+					dec->packet_length = 0;
+					break;
+				}
+				dec->packet_state++;
 			}
 
 			length--;
-- 
2.50.1 (Apple Git-155)


