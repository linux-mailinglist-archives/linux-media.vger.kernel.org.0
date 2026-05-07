Return-Path: <linux-media+bounces-60757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOjqCqZR/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:47:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB864E5189
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01E793132BB8
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383FC37EFEC;
	Thu,  7 May 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKaJ/t5P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8630E821
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142869; cv=none; b=L7XPMhLeDFbbrVFugHE+xsCcSn/CsfbOaDt+f8G3FrHq7YEjP4/PhFI0JhlY4yx0fUt/6rPOTyJfcmsGwEgX6vHMcCQdBmmJdYhyxf7Eno12yLegI9aQBxft/qHUovtkW7Mdfaewy7KcrajgxiTY6RvinxOxx4RD3Eafglvc1dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142869; c=relaxed/simple;
	bh=Hgic8MxAnTFchNHGOEh1DGqhIUm8syxUYUmVA61qdbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhYfTwEWiGYgh+VYoB2t3YZKFcd3gLuj01M0EtSILvs1O+FN+htRQPNVTmV7FTXhYGAbLze9lWppOalibApAevuhBTdclvGkYFzJ6v9q0E3W43KiYWsKhKsLIpJidDr5eX7LAH5BuR/wjopBfl42y4nM/R8sAF++R8o4cm3DY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKaJ/t5P; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79a2ee65171so4721237b3.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142864; x=1778747664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=pKaJ/t5PeESzq4Ku8QJaTko0AFoNXDrstBGeJbCiaaOYOV1Yxgt6ECLJ9y+19OFDCJ
         jlHvWF9kwHqyB4z3x/RApNHtEefxc55zgwp9rT7I/V6x/bStZfuVW1zximSBx6lc6YMY
         F/cseBlHVL/fn4/aOZB/ycQba4Y/DqaG/RLLggT4lCMGxBzB0h1Bdw/MLtrHf8jU/QVn
         mV7XmHoLGY9Q/2yEnq5clF9V/ZlpBVg5BvtAz6hTuTUWbqXz8CTt/+65o/FN3ydfPDRW
         x5YL9CFCKs146RuwF1yslsWhtjcrEhV5BGCUO3FW2Rk2oE3CCaYtvxjFpDMNuit81+Rd
         Ue0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142864; x=1778747664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mztCL7JMamVAXPjkOpC2zBeTslrHsHuCunn4L1+puRM=;
        b=VHODPril5itUfbPylrfOR97diRp360ALrzAitld/Mq3EO9Da7Aa1kjcv4gH5/bY89+
         CKE5pFxBUXOq2Bw1dAEOFXnD2A04r+R7DFLeczzymo1mGLMDNc2kwc/39wuQXqmmxoAL
         BIuW69d7lF4Bm+3oXQy0xnnchqZKofimFKBxY2upJUo2iHpS2LDbTQkGjGNugoO4NUTg
         KYC6Ix7InghxwfJLaOVZziWw2zCT8e8kW8Ut+9SE6478EAbmve508GXI6f0eh8D+hZ6m
         HB0o6/8GfQiFhC2zq6RK8AR/Yo9LQrvAjnTdG2bKUdf+mmWeaUDKJOs4NR8gZxMfv8Ro
         NS7g==
X-Gm-Message-State: AOJu0YyTHgG9Aw3BHe+dL8+vQih2Dn7ZI4YFmfKDPBKASRLUxM+paJXO
	5W5yPi0HzZjcr0YniFaPv17hKMKS9ZYPVdR+JwUTeJP+hrLqVfTQ2X3W
X-Gm-Gg: AeBDietjfcRAHvLoHcOQOygf/3nlqFB9NMZGrNtAZE7H2ZFDOoV+c7X1oYEkIhREU+E
	u/h5qlUij0oUOQVtwadlMY4DT3cMHnOiaXZYM3gFZAHl+DZ6youT5T1J91iJyPL+Be/CvdYcyXo
	Rhk2QkhTOpOf/LY/G/nKzsWoLBrQm7EExylu3Au533joXK5WDjBFxdhbrY2x06BVLHKeq8jk42/
	zp6jjUh4YuIkU7cmVHVt7ps0H/SiXUDrzTMOe2GhyGNuO4pjK+tPcdnXxj+VB4GfyEewenOpiZi
	wqSHvOqxUiXqkY19IKRvZkZsHvIAWNXeMjepNsKTIcfn5a4nxt6CcgaVYxZFgCXhB1WBVlMGXvu
	zjJGB0qfhF51I2sFh7Z5WTZ7wfkUpRH2/7q5aYu9Nd5pr2IZccMt68fJOhqlw43JwDuzHPtt6lX
	sSK+hY8G30cpvT4AoCVG/LqntqJUr0IuMYtGdv
X-Received: by 2002:a05:690c:c4f3:b0:79f:b903:88c4 with SMTP id 00721157ae682-7bdf5efbc18mr71178527b3.46.1778142864586;
        Thu, 07 May 2026 01:34:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:23 +0300
Subject: [PATCH v5 8/8] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-8-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 9AB864E5189
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60757-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Action: no action

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6ad20d58dda2..89798ad1087b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -178,6 +178,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..178274d10c02 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -207,7 +207,8 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->enc_codecs = codecs->enc_codecs;
 
 	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
+		if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))
+			core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
 		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}

-- 
2.54.0


