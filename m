Return-Path: <linux-media+bounces-61547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNsyHI7sBGr7QQIAu9opvQ
	(envelope-from <linux-media+bounces-61547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:26:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02B53AFBF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B74A303E22D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877E83B9942;
	Wed, 13 May 2026 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip2Xvq6r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA303B5F59
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707583; cv=none; b=oPUmV00y5+8bScGWJ62uBx4MYSiuxW0QVwithxArJPSYpgO3vMldfqjjehwSzXB9wBDu8+egL9iXrLg6MVl/Tni61MUVkbiy6b+Aaf/mShbRCuSvPOmmt/qMS2wE9bS3GXKjcHTfBBOkG+KFsWpmRFNA+slGw3jRbYUVudgSkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707583; c=relaxed/simple;
	bh=eWvwFj63Oe5rLHhL9VyXX1Yhyfqj3Z9mzRiwe5LaGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJambzeOTGRSdkfhFqaD0dGLiySC+2LgN5OqeWVk1HIC7LU/XoJ41jh2+Hgq9jQvZTzwunXK0y88XitNDfiviBNfCTGXu74dJOQ3yyHCGUSN2tnPJNEJXbelTSJCjFAUhh5yDT5Ld3DbnLQl8veqVbRddddoDI93kjMWpfyXzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip2Xvq6r; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65c7a459105so8875517d50.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707580; x=1779312380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=ip2Xvq6rdZ3Giv5cML3cUgYclSNkxIHf8wTKmdyNK38TiXuS/QwfgaL/fTWa7jcBfG
         sHwC6yuK3X+uFSbsPAlhDoDnlYXL4MKjdZlcXRHKhVEnOW8GvWl4TNg0QS+9+OEDoys8
         dmB7xLo0R//A2Ajz0XGYkFXPzceIUBvMUakJK9C2UnvO4oDGMzgwSD/NvxtTrNp3uUeY
         B/WMaQqzFIEGiEi3NenX3UPPt/kUxA5Ssqd2pGzJL40eluiBaGZhuCOX+72WT7E8m/QT
         mzqdAspl/az/o4bhQdo5eOsYz8FjnM3TGGwuKiOj1rbTMSz3M3w6pmwdfg+e5g/OJMRS
         qRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707580; x=1779312380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ktJMLSr1SMVyv2PkF3WNZjUBeXP3YGWJAx5pUXBljGM=;
        b=oo5AEchPHJwD3cRch/q5IisDbZecdfPms2ZTyKPq5JBJTdjW1y1QNQ9OGFEj2pZ6lj
         l64v74l+wN50lyIBcmTHDClOw5Op0xUD5U3jCrcmC/AxMdcyx49akboWiqu9XwGVRsG6
         uXTeA5MB+mv+uYz1Dm/jT1wrz5dtp6nqIohEThWwUXrFuMS4xYv6nRVBZmz864kKFy4b
         dOmq5k/ht0ZMbwlqfS3Uo/XNVgLMTZIonP0JcUMNe2QZfJmxz+7iDuFT/2pd9i6vgXRg
         RvHmuzCqyWoyiiTrbf4fJ3sXMsQi4bHdXpx6SQ4Hn/dX6e20r0vPtkDnsmoLCf6XFmCY
         2/Rw==
X-Gm-Message-State: AOJu0Yy1kpaDL2h6YHjNrivzsUSKfopwfwXfp62hJ/6w51XyCHTFQggh
	hLftaxrygAFFE0Ri4yf747HN6duIA50nfwwFvzcq+zAOif6vgLb11Zyp
X-Gm-Gg: Acq92OEk4ZQM/qPSWoCYomLxPBvecdwQZqxlvVi+utt59AHBv7WOU5FYdqikIC/oxVx
	qh1ZctdmmTTClbhy4ddIYUWfv8SeXuqVoAV3HX1h3WtO0gjZz1Vqf+iRcYxUICGENhCKA/ajkyk
	AYtfhSAaiQLgSeAZLyzCc59CmVq2TCHF+wsnySRBUc9eErU5bNvWP8Nj1YUcgB742iAaNYivqNg
	vDuLAcxS38WrI9mmjH5qYSbTHijKG+EayrQoiMobHW6F3rC7Y2Ri4F8uBNti63PSXBK0f6NX3qG
	+rhFYZejqLZGQUysg2Zi89jK15kTWwiPBKJYn5pxqbqaifqDQ8aRs5vm22e+2QmaI4Wn4812u2z
	vuxKfuGZMDPjgZDpoPmvOrPmgntVhxBREWNy7pfEhFgmH9zUSses5vCE3rcL5C4HKUcVTAimmiA
	qE82WUNMqtpFxfkfvxm3RjYaunHA==
X-Received: by 2002:a05:690c:6286:b0:7b6:783f:2122 with SMTP id 00721157ae682-7c7e668eb6fmr11694307b3.9.1778707580397;
        Wed, 13 May 2026 14:26:20 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:19 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:36 +0300
Subject: [PATCH v7 7/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-7-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
X-Rspamd-Queue-Id: DA02B53AFBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61547-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  4 ++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..1b5e72980702 100644
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
@@ -684,6 +686,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index ff9174a4e8c1..3f162b11e669 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,8 @@ struct venus_resources {
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0


