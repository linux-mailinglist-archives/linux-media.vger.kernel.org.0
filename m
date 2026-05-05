Return-Path: <linux-media+bounces-60491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKnlF3Bl+mmnOgMAu9opvQ
	(envelope-from <linux-media+bounces-60491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:47:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC284D405B
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E72583024A28
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 21:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A7E4ADD8C;
	Tue,  5 May 2026 21:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6Iwfg88"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2E4ADD88
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017595; cv=none; b=TNafgRBJt+IlmewilXL7y6LvI0G76YCDjVfeiYPo389hKZsC1lAgL2MGW7O4PWAy8nsrHFrvnEZtSH9xKRsz+Fg88JFhkhALvAJ9hZ0LBkYxQtdyAvKEwCQJt+rERMikhQvKAkbqo3k3rfTwf0onStDjoph7I66YKhfKZ3UoA2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017595; c=relaxed/simple;
	bh=//M46Tga2bI34hWrYo8a2BgcoG977Zc1LR/SYbuK1Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jq880rK3g2E/UYzagLzIzN8K0H7m3AjIeT6aILP8fxeX4HjJiPXT+pZHeNqUsx/M4eEdwtZYXth5kCG9OFWpFFgN17AbZR4hrsG3pWBf2GVFMMmRqBbRUeDniKzWNM0Slrz6FcG2nKYmqICof/Alf6LqYEfPElBkhUrD2HuC13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6Iwfg88; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bd8cc5ad52so24065427b3.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017593; x=1778622393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=B6Iwfg88ad/vaK4zIvY6JIN1bYHDtPTP10C6SxOXbEGngF/B4DYLtXpXDTFvVzO6YX
         Hrfoqs6LFdoXQrZfib7U0NWXhu2JHikfTdH9PK/rKAIIAQgCr/SD98fug9BqpQESDjaT
         twOc6SIGXXxpBiAwHJnpc/NieIX68ZoXN3O13TJxzCkyg6o8JTLRgosqZSC2glWFEPg2
         tzf9yQalZOj4oAA0QJkJrxmYqOD5kGOspbk5ov3AVjNxEj2OiMb2kcwX2j2Qhg9zYpAL
         kAHIPhKNUPmLhDdy+XFbxdp8ZLPBhbRSm37fy0iZSuyBgnOM8d6YDIUKwf6jDFQQhSBa
         q0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017593; x=1778622393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mA3VhW1+zRSIxiOmiAMnVzHu6j3L3rzzIeEBVV/zfx0=;
        b=O7SRcPPNXnUPpIdBUn9HFYdSU48XbcK2zXVVkepinnWvkUsyXOGdpbVUvkRx0WOp97
         uDi1UyIDNVpKYiKTXO3AMa4oXg/XUDHOkglBEuRaKpTR+vuNqCZtoqmCKzucOT3flQKj
         rV5SfxQjY6+Nujwxl31uPvGl722OkOyAwVc0SFDd9C9lPbB0rGyoZrcYbe9SxaVJMNa+
         lJgZ/7VQQ8EDrMHDjbhyJpCc3sR9WYA0KxFAnFmOS9K5M5PaWIioDmeZrvLkCNMpS6Am
         lxjQsSYmowv8kgmyYdoy9fkChRp9fPZwSSWhVELtmtGz26yShW36rviQIH3hsQ4iIK8L
         SKuw==
X-Gm-Message-State: AOJu0YxpuRNeSWngF8ON/D3pEBw9OOhR2p1TDWmTbqzBbkzTMY3AzL2v
	uGW6SMQJNALkLtX2kOpR6s1PlbVhJsTgNP7OCrOnnW+2TuLVjX100C+n
X-Gm-Gg: AeBDies3tl0JBXJrOyKy5K0liJzbeYyySmWOI4qb2D4KkFbSiaEGbBAKsJumILbkBza
	FRiv1yqjfEkGX0guTuLCzzI/vITLyIPQqIoA33R2LT8Pz2Gx0DGjZV1HpEeJiGZWhU4menkLFYh
	fw4iq+ioCYtWzH/fyYdlvAp6kETSOezZe1bhYY0asRO6/bsv0m3AnvlV3ZsSApb9paIVL48+Wnl
	4CW19xyEXNfKu856+0MScl/xI4SPd5cm5B24JwXfs6HsUvLIjr0wZQk+PeGrp4zKXNqDwvyb3yO
	rB3yWYRX4wKBJkAkhFCQIUFINDKpVWOJaMJ6wTJKHwI4UM4HP6xrBivzxu/1w2ijafNLuodwKZm
	udjl1rp5QuB6A6kZYFw55oQROzesVkfdHJcSF86Mo60BdXYOErHaa4EoOZwmOihBAEbiyjac6o3
	0r4X+fEeqHYBK8l4e8onsjmbD51B7PRWC0AI+T
X-Received: by 2002:a05:690c:a05c:b0:7b1:3579:2ef7 with SMTP id 00721157ae682-7bdf5e86fa3mr9817227b3.28.1778017593022;
        Tue, 05 May 2026 14:46:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:32 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:46 +0300
Subject: [PATCH v4 9/9] media: qcom: venus: Enable HEVC decoding for
 MSM8939
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-9-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
X-Rspamd-Queue-Id: 3FC284D405B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60491-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

MSM8939 supports HEVC decoding. Do not disable the HEVC codec HFI bit
and add it to codec type converter method so it can be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       | 2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1871cf3830ac..eda6b19708ab 100644
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


