Return-Path: <linux-media+bounces-65608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dZbjBAzGPGoQrwgAu9opvQ
	(envelope-from <linux-media+bounces-65608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:09:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A846C2E6B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:09:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65608-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65608-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18E9C300D1C5
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 06:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02AC3BF662;
	Thu, 25 Jun 2026 06:09:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227EC3BED77;
	Thu, 25 Jun 2026 06:08:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367741; cv=none; b=IaqV6w2p+layaTav8fxmpuFZb09TutRdaSJjf6yG5RQ6fYE2FQ4aR78ZuqbWqIfz8hJH7BQGjNX4hZY7pqjKnzXgbkw64kbugDola4YY4IxOAe6vQA4DkMuqBobe5MFcou0WCkSyY6mDBSN7KjhsdxDl0ZEq4qpWCvaMw7hiOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367741; c=relaxed/simple;
	bh=DikJt0cma9xKOUgI9rjr63tNE7VYqe8+ygiSxZXghyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XUfI5n6zggCDX9e+FNJZURWeLovaJTelzSGk8426dtuvptskt/0n2dbE6/bB7itrO2A3ZSGz9GzPptcHmTqNKE42IYADpLdbX+7GnSduhys/sXM4m74ceBT/uYdZTM4KqGl39Qp6v69eTtkJrTrImb1KNIeNrZ1t3p4WlbRUjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAA3xgn0xTxqjYwoFQ--.18826S2;
	Thu, 25 Jun 2026 14:08:52 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Krufky <mkrufky@linuxtv.org>
Cc: Kees Cook <kees@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH] media: dib0090: enable L/S-band tuning table rows
Date: Thu, 25 Jun 2026 14:08:50 +0800
Message-ID: <20260625060850.11250-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3xgn0xTxqjYwoFQ--.18826S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWrXw1fXFWDJw17Gr48WFg_yoW8Gw1xpr
	4kAFWjkFyrtw47try0y3Z8WF95ta1rAa43uw17X3yUZr48JayxXF1jga1rAr1DXrnayFWv
	vrsxXa429a98ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeL05UU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65608-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:mkrufky@linuxtv.org,m:kees@kernel.org,m:brad@nextdimension.cc,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,m:hverkuil@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91A846C2E6B

The DiB0090 tuner source enables C-band, VHF and UHF table rows through
local CONFIG_BAND_* macros, but leaves CONFIG_BAND_LBAND and
CONFIG_BAND_SBAND undefined.

This compiles the L-band and S-band PLL/tuning rows out even though current
frontends still advertise BAND_LBAND and BAND_SBAND in band_caps.  The
runtime band classifier can also route requested frequencies above UHF into
BAND_LBAND or BAND_SBAND before the driver walks the tuning and PLL tables.

Enable the existing L-band and S-band rows so the compiled provider tables
match the currently advertised band capabilities.

This is an RFC/RFT patch draft because the issue was found by static source
and macro-world auditing, not by hardware reproduction.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/media/dvb-frontends/dib0090.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index e2a48059e854..7221aefcdfe1 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -35,6 +35,8 @@ MODULE_PARM_DESC(debug, "turn on debugging (default: 0)");
 #define CONFIG_BAND_CBAND
 #define CONFIG_BAND_VHF
 #define CONFIG_BAND_UHF
+#define CONFIG_BAND_LBAND
+#define CONFIG_BAND_SBAND
 #define CONFIG_DIB0090_USE_PWM_AGC
 
 #define EN_LNA0      0x8000
-- 
2.39.5


