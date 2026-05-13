Return-Path: <linux-media+bounces-61548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BvyIaLsBGr7QQIAu9opvQ
	(envelope-from <linux-media+bounces-61548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:26:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66253AFEC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 750BD304A673
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56AD3B1EC7;
	Wed, 13 May 2026 21:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jwqgme17"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8C33B8D7E
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707588; cv=none; b=Ymu6RyVYmA0rrIKFdqGG0ikRHq+xf+a9ur9YgR3z2hwdgp8ngfYCICxLrJxPQKLWNloRlFx5qMPPzd3xHgVmHib40skJ9XHf3DC0IIqZtKaRpR2gN3KFBSL7Gj3Na+8KpzTMh1ldUVZHRpvjeCmxHTBwi2M1dY47P4VvmTQ2MnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707588; c=relaxed/simple;
	bh=kbRxkDSklKmUXRkpNNt2jlXF+tF+3iVfzCr636P03P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Goznlf7Z9TziQNSMWveFTHNd7t4DQxcql1bvGIE1VXLAz+ThdANDB2ZlDEICUm1ZHd4/AMiAl26IqMOztvTedsxNEXDeNXC0LKxWQwH5xMDicGvqYD5U0ANnirwCghB+jF3lA4iJssO5MyHf2ch2HUxq+SAv126gzgF8d+ipIko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jwqgme17; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65c24be9e4bso8467166d50.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707586; x=1779312386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=Jwqgme17n8uOUs6ZlP0KdYudX83NJbk9t0JGX0V3YTPd2KaYUvP5wy1io4mxcOBUOA
         q3c/ixn897y83zTBLixiZLrP7ls+JX3O1rSY7CIAi+OHP+1qluvSXU2b6DK7LPT0N9cK
         /nLe9lgzoD4EGKuIp/vMUXPIMfPvVRh63N8GOMZ9qJboxEsy6JDXiRZ+X/q2wJq4molG
         sDnL8WBb10tvcAtbOC5ONtbsfmMfH2Ua6OV3kmJGVSeDm0hc3ZRFhrPJFC3xX1to5Wuk
         rQioImlMTJAp4zmK9Aggi74xn3SnbJevjtXCvg2Nv26xg9yTKkq/XsMVVatT8ZykUnt2
         Sosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707586; x=1779312386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3TcPVRIkkCvtZzIpVvk6MMaDhrZ9WpVELhUPvDjGtg=;
        b=lM6fNZ+nuxgXQTtSM5ZjAAIPhBbD/Q1o2gFznVWo6P7Gk9JKw6xXXLWBtvEzPe1bAy
         4gmu2hSaReF8d8oSFMyVsEk2oiqFGR1XTQ+k3tMRZOBOc4kJCIniRtVqmlmpyvG8tfX7
         mIQMkQ9jPphWvnavKXMB4TtbG6+00kAeZtIbVXzKA0akAubenHLsHMrMH82lERl3pZkP
         04jBYlGWwyrIaF+YF62u1tC1vJBgkJNBLPJNhP1imU0F5TMdhUm/Ob4Ito9dP1DMQjek
         8R+XQWHph0syQLzAcL3PPcoo+c9FCJglIzF684bZPclh+5ApnXHGA4fMpt65Vk22QvSk
         0mBw==
X-Gm-Message-State: AOJu0Ywfvvk27Ukj0XACCocu2wMiPAJxfDsPoyXqc4mbObAI2mMlbHAQ
	RU19Ds3c7/cEn55TprKbPtq3JUb43umkp2AKF3b3jAhYzLT2Jjf4//5x
X-Gm-Gg: Acq92OEJsDcw05N3FZ5vPaIOZH9+LgltY0599yjPlQmc3pkhMy2sZgQmLIadFHpnWuA
	MhCLwWl62GIJQL9esfGd0IcnFC1X0ZMUsTGS2cfaTynbFb3DFrCcIHOVLx+0JSjL1s2jcz8U6ti
	Tnf6BfosdOZ6fZU++W/rSIZSyOtUrylXatQwshRxVrKkrOLujOR4rY2n/7CZVzQcIXjbfwJRbe/
	eOt+KH/BfjWU7T17lVtoEb76z/qSHyOp3qvvmRcey/Zi6obixYRNS/7g79jkALsvpq8JXQFfaF9
	4zruq24ztb11GEcbTlhv0oKgfbYV9BsXyX17a+16E6qXChCiGFiQPUlKSdcs2EpBxFR9rd0vmoD
	R3+HxRrx9VX0onhRzUYxaDlBBbdOxHKpB7MWrN0C4fLo5E2CyVhqEiYufz+ugBUaPib1A+oDk3I
	8xARH6lC3Ruwj2S9wa4SMnw8qesg==
X-Received: by 2002:a05:690c:e3e2:b0:7bd:8782:bb63 with SMTP id 00721157ae682-7c6aa11b5ccmr54775837b3.19.1778707585933;
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:25 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:37 +0300
Subject: [PATCH v7 8/8] media: qcom: venus: Add msm8939 resource struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-8-33c6c6fb9285@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4B66253AFEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-61548-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.30:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,apitzsch.eu:email]
X-Rspamd-Action: no action

From: André Apitzsch <git@apitzsch.eu>

Add msm8939 configuration data and related compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 1b5e72980702..b6eb96e43319 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -692,6 +692,45 @@ static const struct venus_resources msm8916_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl msm8939_freq_table[] = {
+	{ 489600, 266670000 },	/* 1080p @ 60 */
+	{ 244800, 133330000 },	/* 1080p @ 30 */
+	{ 220800, 133330000 },	/* 720p @ 60 */
+	{ 108000, 133330000 },	/* 720p @ 30 */
+	{ 72000, 133330000 },	/* VGA @ 60 */
+	{ 36000, 133330000 },	/* VGA @ 30 */
+};
+
+static const struct reg_val msm8939_reg_preset[] = {
+	{ 0xe0020, 0x0aaaaaaa },
+	{ 0xe0024, 0x0aaaaaaa },
+	{ 0x80124, 0x00000003 },
+};
+
+static const struct venus_resources msm8939_res = {
+	.freq_tbl = msm8939_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
+	.reg_tbl = msm8939_reg_preset,
+	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
+	.clks = { "core", "iface", "bus", },
+	.clks_num = 3,
+	.vcodec_clks = { "vcodec0_core", "vcodec1_core" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.max_load = 489600, /* 1080p@30 + 1080p@30 */
+	.hfi_version = HFI_VERSION_1XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xddc00000 - 1,
+	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
+	.dec_nodename = "video-decoder",
+	.enc_nodename = "video-encoder",
+};
+
 static const struct freq_tbl msm8996_freq_table[] = {
 	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
 	{  972000, 520000000 },	/* 4k UHD @ 30 */
@@ -1125,6 +1164,7 @@ static const struct venus_resources qcm2290_res = {
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
+	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },

-- 
2.54.0


