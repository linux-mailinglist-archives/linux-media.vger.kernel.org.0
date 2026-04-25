Return-Path: <linux-media+bounces-59608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCf2Ba8J7WkEegAAu9opvQ
	(envelope-from <linux-media+bounces-59608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:36:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC54675F0
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48E32305EABA
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBF4378D9C;
	Sat, 25 Apr 2026 18:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhL0F4Cu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B2377EA5
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141900; cv=none; b=eA1wznP0Na1yGWAauv7Hzl2NDWRIjL7svBt4c+yO13W0DsiQXIzxI/m1SOkp6jXRj1I+e7EBbK+kly+TrcLaztYV1C1QnoCcaJapovm0fW5/0HE3cxrvuLLec/ENGqKRbC7/mPYK69kVQLQ1rGqJ+FSAEBHSsGkM933xLh+yXo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141900; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXxHYzpjxCl4QfW9A1eUTJlr9irFXqIWz4zf9AWD9ovCmUBYlgDl4UwYuClhs4Vz7JdpYB9NOrLeO6CJY5gEve1BBFT7OQZc7Q4o2T4lGkCHWNzvXV9oOI1BwlVoFQw6DqIu6ACarWINr2oFgziw+t9GZOo4DOtxD9PciIAl/Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhL0F4Cu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4890098abbaso68280395e9.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141894; x=1777746694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=bhL0F4Cuhij0g00JTwrvocAdkSOsjDTaw7hE++UVsu6HLQ2jaiXFLNITMyMRikYCNc
         jIdO5qepEk3mZWXEfgsmOGE9UMclCvh0KkCE7dXKKSB1U7I/pdm90MfKXNd6JHSmrcyS
         MSi9xzVoGEfbEqA5i0nOnFZwsjl6k0g8vK3K4yxw6ohmiRPKOjvskA/r9XsUMnw0Bs1x
         nNEsqw3K6BivPUV8UbLD1trTmIknRA7OrrsT77HUo4f5t2woEaAFuYy7s8oYLcTpiHeS
         VYYB70aSec2M/ka1sbtSgdHeUpJFPkUhk/BeyV4CvfY1cLeGClce36RUmmWjQz4tj2cW
         JnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141894; x=1777746694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=hTgAVrpT3jszeM6KS/Beq/jFfQYLK8r6egSqv8/hDFidCPG1iwhm036KU05bMQrLFH
         lJ8Kz2sGJpFt/MYi8DXlOt7757klGRe/SAsdJb0ovqSH59MX9QzfyZ/DnJdk3oGFeiiu
         XlUVxZmiVdLavlC7eAOnvHJorxueaZfFxLM6k4TWeIjVQJg20Ro5C5hYw6R59woQ2Oic
         heqXVNmV3z5Sz32fqAwdmfell6zzE6pgdF1J9qnz612xUFrNuD9dEG8lBFUQw2bN7x5V
         I1ixujAWfpaw5uPkaSkKorI4tJ2ygWrJIxc/zzNHxxHVDVERRNJqPdLyMJwQGZ6RLeIN
         Ap7w==
X-Gm-Message-State: AOJu0Ywqfujd3d06YIxbuw/L6Y+2yfM5VIRmasuwDFmxUgl/2gB3xhfE
	p5yyP/GaewG6GExtWWWlePCTjCmt+bwiazXM4Tm8U2fXZxmQT1V9B9UJ
X-Gm-Gg: AeBDieufrZHOgsqY2sWSE1ALzRyK+DTRiDDf6ETGEgHbdFwp67LPWDqr0VdvaJEliRc
	2Uc/sKji5TyTy8ogKvWhnxah3iRMLVZNT1Cy9qZoGr+lkt3Oxh149CxRliNH8hB7VVhpcrBJEu1
	6VPlssvUrYG+YBp9fQNvMMXmbdySzqE0kSSiegb1bzL2erMBlVJbikXTrH+Nsm/+69PhC6FOL5R
	GovXO2uk+c1fZEFnAlYJ0/o0ijBmyFk+JHS7rbV9L5ek+hJ2PCvH9FDsLGiixpAipjhsWL75Sg5
	j9CzzaWfW0xjArNfr3FAahnuM86i51YiOrkkNELo5YnJc5cqAT8UNnFkF+eurmYPPn2gIxcJ67Y
	MvYiAMM32W2hvJEFfWNN+A0RzbwUl0XMJN2DVYXI8KjfEREY/U7otM58KYkx7lmCKjCxIhi3b0l
	uRKVZWdO9fCLXKsIcllN8/wYmlCRUgv8d3ZB8=
X-Received: by 2002:a05:600c:1993:b0:489:e696:836f with SMTP id 5b1f17b1804b1-489e69686a7mr348688125e9.10.1777141893727;
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:09 +0300
Subject: [PATCH RFC v2 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-8-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
X-Rspamd-Queue-Id: B4FC54675F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59608-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Call vdec_get() and venc_get() later in the probe so dev_dec and dev_enc
are initialized when getting clocks and power domains. This allows us to
attach necessary power domains to dev_dec and dev_enc.
This is required for the subsequent patch which adds power domains for
HFI v1 and attaches them to dev_dec and dev_enc.

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
2.54.0


