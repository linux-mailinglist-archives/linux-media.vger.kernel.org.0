Return-Path: <linux-media+bounces-56598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OjIGCOavmlPUAMAu9opvQ
	(envelope-from <linux-media+bounces-56598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:16:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA282E575B
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10147303B7D4
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 13:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638EA379EFA;
	Sat, 21 Mar 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwRQDhi/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD5378D93
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098790; cv=none; b=DPc+FplvLoev74gT7Vm7XReM6uTC1B40CMMBvk1V0kzPwFzlwKWnLBR34pkTqC+qsM++/GN40viQOaINIrodyTa258v4CmKmgJh5+RFz9haB95NkFcEpY2GC+dCpY7ZU9k/Pnzf1T04Bz5iiK7nFaLULz17IhAphlqBk3O+xDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098790; c=relaxed/simple;
	bh=Lf0s0Fcik0dvR4AtpKW3/RTsPV3IsfB65rE+J909tAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAyOwskubmRHdQ8ozYZHNJ5nlTSEUWlGDKbAaVhuj+vcPaxJvBImGoPnhnsoNpOrMjdsJ3NEqSfiWBYUrB3k+OorCP1i1760+BFYqWhQQt10cpDRVi2U80lFNCxCXfmk4/RzmlEvXw6y5vky91wZ4Rje8t5tQNUGi5LSqa3XMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwRQDhi/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82735a41920so1175190b3a.2
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774098789; x=1774703589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pz23bkdf2LTLBeYwmuaoc4PB3larGLWkHam76/mv9U=;
        b=XwRQDhi/bdYFR71RTsw2hh//aKW55bOQ00KBRpZR3YvgbQ19kReCWujAe04/1fPtQO
         DftC9yhN2rCwBpxX17p8ekUPQdxrwmlDxsdvYioyz1jh01bjUpFy8Ju09g705PfKAAqH
         ukXOJDfP+smSvfkfGvmVvrqVrtFeyKm1OFzYIk/ubfovfSuWvcIYswv6/d2HHCNmzjz3
         digNzvtT/ONFNgWdCD1rAEekkSWeQWAQ4/nEEiOz7QmzZWm2GagzGvMghdTm5r8QLTan
         iwM8J85ZTH9xiv2ZO6PD3TtT/uFaJrlcX6Uxx9XP57vCvsAqMcPWQmWmQ4gB1HOjsir5
         5M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774098789; x=1774703589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pz23bkdf2LTLBeYwmuaoc4PB3larGLWkHam76/mv9U=;
        b=ULS5oCoaD5CNYAmuPjJjvDC3goXla2vrd9KePUfyizI33YqfWhW/aCU4xqOLYza12f
         apr/FQNG7OtuHhSIkuZEWV/A5N1LaHoz8SwsanHgl/sXHiMkNvwa3mRcfLacyG6xbza8
         +ct0XlO+BP+u2HXPe4XSWx7l33XICO8+G0TkuqZzeZCcrzG4vdjTandPV10UCSn9bUsP
         HQaRgKC8dV4D1KVefRccwf8inbQ4oEnuE7Fo3k5PW2we9tL78gLo2QHtZRCrhe9BKSCh
         gqRirZlxHoVma4moMYCssm3vrRzqpTcIcGFMkaKt+mO/OhY5ewIZ8Q+4IXyJ7ct0to08
         tf6w==
X-Gm-Message-State: AOJu0YxGLdZ4wtWb+hnSSgPyNw9o0Vd+a79UREGNcFqb79n7d6+3NLno
	1I+6TJrcAIlT64OTT485d7QwKnyr/kpsQ5GyphlZJMY/+12q4EOMIpDFybXgjcj0UMqkpQ==
X-Gm-Gg: ATEYQzyPqONVTYrdcwJsJuRuioOJV0H6HqTRaR/AJz12hcbg1d9FGPKItXqQcwaV6gz
	wrA5NNTU8ETbirDPsbmiisqj504/89rlsXTiE8kq9iO3DGS5pI1c9U3lg4bw65aWyaCJRGn/5x3
	zBHiBIjhieO6zuEyoYWUVW94JbSsbjlkUZ1Jj9JKHu0enPIkBJkk+N/OL9I9zHqyMciJ2h2kEYo
	Q9o0jbPxpzwWV4oSiwYOgdv5s5w4f+efvcTgpkccBQjCqSXYoE05YmbJeOjXgdfvwTy0h9uRyAZ
	VYODqdgSQwwlCOg1eHynIbao0+RhJeh9ujdw23Civvbq+aeajiNA+3mlT8YrTcAsZS+DV4BlAbW
	12DABI+sRzqA0VP1VJ0Qv7xthTURkDcFTvyBAzYClH13tZKUNQZaiZxi7/VQdH6+/xL0tKUCO6x
	ZBN7MZLRiNhW2e3ibFspE/63LKEv0AJGtL+TKV
X-Received: by 2002:a05:6a00:ac8f:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-82a8c35cfb1mr4934444b3a.30.1774098788969;
        Sat, 21 Mar 2026 06:13:08 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040db767sm5000809b3a.51.2026.03.21.06.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:13:08 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Mar 2026 21:12:55 +0800
Subject: [PATCH v2 2/3] media: ti: vpe: Fix the error code of
 devm_request_irq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-vip-v2-2-d502c1954817@gmail.com>
References: <20260321-vip-v2-0-d502c1954817@gmail.com>
In-Reply-To: <20260321-vip-v2-0-d502c1954817@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774098779; l=835;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Lf0s0Fcik0dvR4AtpKW3/RTsPV3IsfB65rE+J909tAw=;
 b=LNUt3jU+IOmy4tWNsPQ8Q/7s6T67Yjd1MiUD1UBFaujT1/jr6vN+077ILsnmvPHJ0itMmsuFb
 I5LgrkZ0pL8DRSVrba1HeC1E/8CCzk0EbhTwr1nxAz5g8cNUjSLokUn
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56598-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DFA282E575B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Return the actual error code from devm_request_irq() instead of
incorrectly returning -ENOMEM.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index 4fe9e059313b..ea65b7ec9b09 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3471,7 +3471,7 @@ static int vip_probe_slice(struct platform_device *pdev, int slice)
 	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
 			       0, VIP_MODULE_NAME, dev);
 	if (ret < 0)
-		return -ENOMEM;
+		return ret;
 
 	spin_lock_init(&dev->slock);
 	mutex_init(&dev->mutex);

-- 
2.43.0


