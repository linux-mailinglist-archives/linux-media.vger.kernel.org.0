Return-Path: <linux-media+bounces-61024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIqgLXRUAGp5GQEAu9opvQ
	(envelope-from <linux-media+bounces-61024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:48:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6AC503682
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0C453002B17
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F401F36F415;
	Sun, 10 May 2026 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FToPpjRm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4050637C92C
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406502; cv=none; b=SKyf8qvg2bCHpiH4frtybm9XWDvEFJ2+P44ouJ8m6aFKNywnyZc2LJ8JEvt0o3Cg8KrxN8XUNt5bSdXuPDtlZhbXuftw9z4khv7ZE6r76cCU1t66ksAa52JNgmepHpJ5B8V6gu5q+OGVzXEK01SLp2IEwG50b3MfqaITZHPz6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406502; c=relaxed/simple;
	bh=oPx+TYWEbOLSoB6gl8GiiVCXJsV3cGiWKVqM3xR9UtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cL6tOHw7gR4hY1nUNKe2pfvRCs7CP4uPsYZ0bA9cGqEkczoghGHYHt7hO0Ba7oV9je1aAivFHS6uYlhjestNYmxTehiLQg3dHLI55rrDByGI3XPpvLZCWztPLDmcqYTH4+zZAdfL3zEUPrj8hhnwoNZ3h0osgu5m3/RaLjou2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FToPpjRm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so56170485e9.2
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406492; x=1779011292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=FToPpjRm4RG+zsaGViYBOCvdo2+0SXHSbBAleSZ2kQyCB2yac72sRj07vVMsyJqIDl
         Go8ZubrjIwoGCm6/SPjgs7lo/T5z3cCgYmEix0dWTV1bc766tNJqpLzYJ1h6D+vnscK2
         79tb5DObwslWUk3+oRFLwsldEMiVUJ+lLxPikurtOlCXxL3fvs4U0NL/0ljpOxv2vMIv
         KNXjcL+s8ml2G/OO8G1OafDfZR7UzNDuxFzoKDWm2K0kV+HULejHtsgsTWfX3SuA+4Pe
         A2sGn4uTLfp6NrXrukjlfxMpg44jMl3wkSmMQxKHdiL5A8mliDyf+04pJSwkY/aBve3h
         ZHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406492; x=1779011292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+ZA0O5WYutVBzNDlZS1hqQyKCHJ3cdUiG33N7QKPgQ=;
        b=Q1gePeTFUuMqd2aQIUPYns2j4qWO/Qsk+kibSfbw0ikdjDlRUBTfp4yjWzE/gphoHn
         DRuN0Iop363QOxH/wC1n7CbLRF2ovBtOyx/XI4qeq/yPu9mgZ/96uN8IsTIZTy5UkYOE
         NtPIF2OD/343k7ui+sk5NsoXkOFklSUtN7kHG7t7Kp08G3BUUfC8PP+rjltvPV5103mB
         s2g+0WHl+H33kBKxb1iv9innX34svOApeHL+K9hU9ILLNrdAs13IzY+yRInJR7lLNtKV
         /oA1DA2VNbRruUwwSHTc9vHhVb7LSSwtIGjcuhAnyHnTzKh5wEaHsi4p7zNzGVz0fGMG
         +h9w==
X-Gm-Message-State: AOJu0YwJ2/JGqwbqfIqqY7WjE7wXYU3ewrYMeTckMtbR67RARyW9ZIDH
	tGC+FlZWRfDOTSYXAxWe8TKVlTqJOSJY1x3MDtXn+4+6FEb8Y9XXIhdB
X-Gm-Gg: Acq92OEiiZuU9vUk5Uw3mHQGSt20CGmO1rp8+/+XWlC3htTzdQ7H8ZLbAP3Gpy9K/52
	FTsoILQkTjutl8YkVRaEgOXlpvyvBHgziMR6D9GfJel/EbYVWdA37ckZZfm+FZXnHzIMoz+vuCC
	jB2NNDtE7tijRsnPsWuEAEuwWqaHA2stZgvSilqWHf5OxP4ulA2JDIPaqzvJJRzxmzyfJqhkxFQ
	2tXzYs78pz3fBwdUCHppCjkYNJXVU01QU5aXTYh41M5HY/3Bqr6H1Q2nqfD5Glp/aPsJL6y4DpZ
	oj1ekSAEC+iM7anhL6zc9fBzNwvzIAvxoknlSGxUiczrYPa34uiztKB3G1QUrr7Onf4AC1oKMtg
	CmwdP8CeGFL68U4xTHUXzuoy++lE95vrm8vUw3zCnKWDS5dcz/TKx+jA7EWoLkcuSqHirqYqlGi
	OYYPLq3vtiSbfe+WTrvMXJjflDy4wR
X-Received: by 2002:a05:600c:4ba6:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-48e51f4bab4mr180086765e9.25.1778406491652;
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:46 +0300
Subject: [PATCH v6 8/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-8-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
X-Rspamd-Queue-Id: 5D6AC503682
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61024-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Despite using HFI version 1, MSM8939 supports HEVC decoding, therefore
it is not blacklisted. Add HEVC to the type converter function so it can
be recognized.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  6 ++++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6ad20d58dda2..75cf63b452dd 100644
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
@@ -724,6 +728,8 @@ static const struct venus_resources msm8939_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..514dfb99449c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -84,6 +84,8 @@ struct venus_resources {
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


