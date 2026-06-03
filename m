Return-Path: <linux-media+bounces-63560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Gc0KMD2H2pVtQAAu9opvQ
	(envelope-from <linux-media+bounces-63560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:41:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 956D96363E1
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:41:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foxmail.com header.s=s201512 header.b=QqUvZf56;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63560-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63560-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foxmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BEFF2305B8EA
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F96429838;
	Wed,  3 Jun 2026 09:31:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6943C065;
	Wed,  3 Jun 2026 09:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479061; cv=none; b=VqjfgCNuOR/SiBTpQhk1aWKlkeZJJy29T8vNYUkdbV7UsS7aauTNk0m2gGyl948DSLFa0tatD7uMMCkopJh6BjJoIiPRL2zBbqdHUcCHF4p/xWj2ZNrHuPjc8oG1D/UAOsXgKz0q8EV9tcxtd6jLamuSUsFkIHq2xbu/atd4blA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479061; c=relaxed/simple;
	bh=u5JMMRJBUAGWREzp42H+JYxu0TwT5f7ye1hd4H1g+Xs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RgBNQdb1A6bvTyEN2D7YoribDf+C1cidNNKPI6k5WrAmLQnkKIgt+K+39WIY8W71N+CH3mP88JmNhwDooXxUu0GWq99yZYMSDhFQIlkHfSf9HzzgGKU7AUOSYGx+HTHWnepZ0YzHgyuu9JnC/30TyrIYYSEo0w6KOqxjzt8hCAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=QqUvZf56; arc=none smtp.client-ip=162.62.58.216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780479048;
	bh=kuYo8OrY6VjKTU2IM0TzRqqs0rJ+oVTg+2X1ZXefV+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QqUvZf560jDQfT4PDdJCAQVkIfIrlLd/PZ6wsaxX+2ixTPvpOknAeRQZWXxA0Dh1m
	 B1cWZyrV5NV45BF7lBaYKG1ay/N7o0fOEq4G0TOqEr7ei0GgrU8IPdJSgq6ynZ4MQK
	 vM67Jgul8k6zhyX3tYRkBLYqFcLLFaDiemrrVbSM=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 7AD2A816; Wed, 03 Jun 2026 17:30:45 +0800
X-QQ-mid: xmsmtpt1780479046t2if38kad
Message-ID: <tencent_BBC0716F510542067A1D9D6CCC0DB87E470A@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Juwytx9IypIk/WRv+0i4EE5+yPQcZvljJLgZLOThl4142bT1bMCZ
	 tpXb0tUaCQHWN5bXb4kbNDThYxa54eYu9VTuXsohrTHonYX8orxjGXCP3fRwsFNgQwgqsNIPxFXY
	 /V+a44L+pp9TH2M0pTSFbgVGabofkVwmstdfIPQWQv2eMjDUzuNkRv2TYqUXTe05Gii+Y41K/IbN
	 m8ZfUza9Yo/SV7NepUv2tXBYHAiDQ1z1TVH6qK7LmP5CQ0F+BW9R8ghR81FukYhQfTsNEaytblTV
	 PXUkwefWxTq+b9Ljzylc+OFRr4OkZt3EO44Dtdc0NlMqNrjbUIBFEkO6SS2bh3QhvhtnRxYP2C0z
	 G7phl3x0t1tnJ0B2UBHfsjiWLZ1rvNpxJfbvEQiYxY5+e0sO+sNxO/ohvOECyDthbeP0Z4MUEDyj
	 b8bs4idxodkSIEsZ+cOixS6g9C/Nc3XWvlQ8PGVQ+gQfSQyCDi5eFasvCTOu7TjtHUw+bO4b2BSD
	 9ci/P8+S4gamOzuj8mecICayt8QIDatjiFC9gpcniMufvi++cVqHFLKlKhwuCUwRfhQ0R1ZAWlvR
	 g9jT2FI7QXYKO73NpimRI8ytU2zRLSNsGZHTks6xHrOA8+xwC/r9bn2u2Vjhnu3+Vix3NdQwcAEb
	 ud17IL2G5M+Ky2IXHPaDwQaOGN1sWCZgO4kEiCSpw9SFawFSG1eeHx7Cagla8wPodoj5hbExcl37
	 2xTumLm9qE3I2GU+DMqNXVLSdzvvGkqMchR8cTHRXGi1RD5fHe4QUDSTW1Ifo3vFoxDsUvXT0JnE
	 ya+dg2yfAH3oXtp+N0+YqkeEx7c386ptPoHJIgSa/acagTSAZ2yJuZfc8ntZc939rygdu2JsAOuq
	 gT3yEous14JlnP29M2/qUt41iENaKYRPJaOy/fmIWkZXwFkv21Bn3Q/P9bYbC+IwwktZOsKamQZ2
	 8rbfho7dZxIqrqsx7SQfIx+I+/7jmRNlKAktxl3kwLnepIgBqr26fa4Ag50vgVMQTRGA1uFOGlLG
	 UoxRiL5W07Q5G7mHu4n9zAFDs3tp2IkjyxvED/Ysw21aTjrcu90NTPP4WSy2I=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: xiaopeitux@foxmail.com
To: shuangpeng.kernel@gmail.com,
	mchehab@kernel.org,
	mchehab+huawei@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	aha310510@gmail.com,
	hverkuil+cisco@kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: as102: fix frontend leak on dvb_register() error path
Date: Wed,  3 Jun 2026 17:30:24 +0800
X-OQ-MSGID: <00af53af93553984fcace5adf329c9ca3bd42ea7.1780478859.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f439482f78c398f7a342357c0848550189712d07.1780478859.git.xiaopei01@kylinos.cn>
References: <f439482f78c398f7a342357c0848550189712d07.1780478859.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63560-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[xiaopeitux@foxmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:shuangpeng.kernel@gmail.com,m:mchehab@kernel.org,m:mchehab+huawei@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:aha310510@gmail.com,m:hverkuil+cisco@kernel.org,m:xiaopei01@kylinos.cn,m:stable@vger.kernel.org,m:shuangpengkernel@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[foxmail.com:+];
	FREEMAIL_FROM(0.00)[foxmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopeitux@foxmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,kylinos.cn];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,foxmail.com:from_mime,foxmail.com:dkim,qq.com:mid,vger.kernel.org:from_smtp,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 956D96363E1

From: Pei Xiao <xiaopei01@kylinos.cn>

In as102_dvb_register(), if dvb_register_frontend() fails, the error
path jumps directly to label "efereg", which releases the dmxdev
resources but does not detach the already allocated frontend
(in as102_attach kzalloc struct as102_state*).
This results in a memory leak of the frontend structure.

Fix this by adding a new label "fail_frontend" that calls
dvb_frontend_detach().

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/lkml/DAD7161C-A1DA-422E-BBC5-2893ABDC2DD0@gmail.com/
Fixes: d6317c68f332 ("[media] as102: promote it out of staging")
Cc: stable@vger.kernel.org
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/media/usb/as102/as102_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..b57ae8357a73 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -338,7 +338,7 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	if (ret < 0) {
 		dev_err(dev, "%s: as102_dvb_register_frontend() failed: %d",
 		    __func__, ret);
-		goto efereg;
+		goto fail_frontend;
 	}
 
 	/* init bus mutex for token locking */
@@ -358,6 +358,8 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	pr_info("Registered device %s", as102_dev->name);
 	return 0;
 
+fail_frontend:
+	dvb_frontend_detach(dvb->frontend);
 efereg:
 	dvb_dmxdev_release(&as102_dev->dvb_dmxdev);
 edmxdinit:
-- 
2.25.1


