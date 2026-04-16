Return-Path: <linux-media+bounces-58904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJkSL6np4Gl/nQAAu9opvQ
	(envelope-from <linux-media+bounces-58904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:52:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270E40F38A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 031EA319F752
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162F53CF02F;
	Thu, 16 Apr 2026 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKeS/fIr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107663D3CEE
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347089; cv=none; b=qfpar/UbxPYWyjQGz8dwbS0Wm7tppRRyNNlphvUXFjhXwLwUmg1sM57HSW6elU7FLGVU7H+o0I8rYe6G4aX6uUa40DVIlCgaLmG72XRQWEXMf96fxTt1u0DlFxrMCPLXLBkKH7PeuaPv4Pbmn6hV3PpHOi3iPzSB+eycEJPrTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347089; c=relaxed/simple;
	bh=onS0/m/vDkiKzWD/tkw4RzM9xpJQaL3JH9xNGGk0fWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnIUJUER29Zu9dM2+NEL/MBDmDEKU9hRlt/zuJx3Erfr4xvpYGs2k7YUHxrkvec2cXd+Fd+teKeLWTFPjoFY9TLX8APFbqEz6Bp3JmOXjGKC816gyyBUcHTp63s2pHAWbyy++rTyrjIiCQVLm/Y9GZx+dOmGVo+ul+/3gWZ3Vpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKeS/fIr; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7b81f5ab95fso15873237b3.2
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347087; x=1776951887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=JKeS/fIrS24+QrCftHVpyQgkwuka/CElhnzLAkzVsAKfs9Rf2S6qUUR6DvQib4H3pE
         hLBcoX1fj2e+uvUp5BZ9NfvB6dEMpNJIpPKbVDlZfOpFEdchbIcrTU6v8hLUBBlmERMh
         5MGE+sfAp5aeFUtlOckadwx6z7kupLtEDsY8qwRJch1fFXJTCvOPgt2PevP7WY7ocHFm
         8EfZh9UfIYtIMdBlCVGaBKzQMf0zVfgGB8GJyUt0adofxIOthHSO1zg5JAW0gZzKnc+E
         mwwcL2J1ytU9j/0nR4j3I9i55HRbDJmRQe954emWkf7jMZsD8STjxVSNqZUvY2H31PsA
         tiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347087; x=1776951887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5q85WGONNVVR0+yKGqs+n47zXRUM373JSpoxp6zRqP4=;
        b=Lg22hMzdzxo929kZsT+dPAUz3dBTOeaqE6iryHKY0WzQIkgV7jAuoKwY1QQXZf7mn8
         9p60k1q+WS5/3yM3S5UwLvdd22Yi4PXHjSW3lQXggIvWXxS23ckJ3vgBaY4i/A9LSPBa
         7Jtw/lxCatRl/c30h+uSrxF29YQ/JbVcykf+HuZ2sjGhIYSCj/6+Kgbx335Fb+R7UFrr
         pGI5zwsn/LyMOjJz7ycnTPghjqMEeDlQsf7rl+5Xw89o5w7pWZctvR8wgXI6G0AHHBHz
         sNyHqYsZELfenwjrM/FaQKg0EfnuAQH8KybvKE9L5OBMXiIzqVvnfEs7h7xtoWFESyWW
         ISMg==
X-Gm-Message-State: AOJu0YzRaAAp18W5Bp/3FhvsyU/fOHdQXlGRyyJcupqiz7z8A/mg4v0R
	tptO0JIt0Vk/IWiD522sJrgXO+qxdMCurocD2BnUsuTLJ2KdMW1Uo6+E
X-Gm-Gg: AeBDiescTaPB+t4szZYkWva794K6tm85Ml2g+NMjnOJtv+Kub6CXoMoZWpYJhM41Q6A
	yu6tIiUJWZz96eUvvBKkjphQToiebLdFr+vXSNsdVZ4isLPPGqncmvZyb1sj2yZersd1UBmZh6N
	22s6norY4PHEtIqHOhg92xx2AoeJgOus40Xu+4+v92tGp1fU7HE1QchSW9h3sZYp9n5KfT3IN64
	RgOpXa7oTzqAoIPXvBDtq8osl6sxeEeXV33rCWsjwJIITGE1VbxsnpEnt7CEdqVdxs/qJ1JHCPm
	fBQxKGMBJ1yWXXyuK60GzT3NnND13IA1QhTWl+hqmdEnivPEw/FU2Angv59DSt0sxw6PQ60ANYZ
	pEYD/B7JD3RgHgPkDna1cSRARTaadKpDbNMBQJ1IdLCV43xz3Hb2U4jdLGsAui0xhcOFldlM7y9
	OQ3knNYFYR3PwMc/9VV/bxHwuAYrtk6QS+5+EA
X-Received: by 2002:a05:690c:a056:b0:7a0:4146:6ebf with SMTP id 00721157ae682-7af71e48dacmr224335337b3.46.1776347087013;
        Thu, 16 Apr 2026 06:44:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:55 +0300
Subject: [PATCH RFC 08/10] media: venus: move getting vdec and venc for
 later
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-8-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58904-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6270E40F38A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call vdec_get and venc_get later in the probe, after core->dev_{dec,enc}
get assigned. This is needed so dev_dec and dev_enc are initialized
when we are calling vdec_get and venc_get, so we can attach core power
domain lists to their devices.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 ++++++------
 drivers/media/platform/qcom/venus/venc.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index daa8f56610c7..a4aacf5e535b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1792,12 +1792,6 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1817,6 +1811,12 @@ static int vdec_probe(struct platform_device *pdev)
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..5f6844d3d9d0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1568,12 +1568,6 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1593,6 +1587,12 @@ static int venc_probe(struct platform_device *pdev)
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);

-- 
2.53.0


