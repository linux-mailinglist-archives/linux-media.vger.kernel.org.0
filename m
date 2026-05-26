Return-Path: <linux-media+bounces-62798-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KTMJ4ajFWprWwcAu9opvQ
	(envelope-from <linux-media+bounces-62798-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:43:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC515D6BDF
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C509A30B799E
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F5B3FE372;
	Tue, 26 May 2026 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFp96kBh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77523FA5E7
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802313; cv=none; b=gC+FjlkU1suUPPi4gVeXgY9IXDMDkUKuAgl+jIi91NBS9BKu20CPo2j9UqMHgz1UwPxr5lsP1qVV0+PVzKPgQpHn+S9L2x/orZ9pqbySxGJZSAoVdoPoqrHNI29lSo6uDVdkuoR57RTebmFKT/yBvKFEH6Ym6o02a8+rhy1bnTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802313; c=relaxed/simple;
	bh=XGtDm0iA2CBt34o1okB+xYp7cM9M0icTJZWbbBSl+W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOOmDUsHwW8qCXkKbaH76sVSxXrrVqorhy0mFXb7u2PgvVMUNRSs8bokZcxvB1fnBZVs9eAOB0Ct7WlpEm27+Mg7ElCTLadFIddfxSGwR8nDefmJfKh+4DNHZXSqbtcwBt7g0/evKRp8ww4B2xupvazj5J9TSg1+49gsHk6Ttfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFp96kBh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so67100065e9.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802300; x=1780407100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rez1vuaNhDUPgx/4FRbuY6S0ijfuvuK4QmeI9SL+0yw=;
        b=qFp96kBhche/eFWbLQbfEp7AzmsHTG2axZSFrY300/n1iU5C2xqJKfKF1TouW8E5iY
         XgInZZRxLw8Sjb+uOw3LOfEOK0mOLBy+VnyP2wJdiQ0JJvoYP0jWtummAgYaiZA/iUYI
         wt1XKh6iZZpChD+WXjD1CI0l6aV5yynl8ZqXk3tjPx4rEeuDLbMOlfg/+AsdvuIZuaHB
         NeGJALAmhiIBMQPexLGOLiUcqQAiKm1AxAA/e4X7etQZhcjDDr/N7JKQ814GBoYKdsHE
         8rqT0fiwt6gwJphrx7px/Zo+RQgm5hJ4Mu7cgErfGS0LxO6TqeQLmuZsqP99tvvrTAOO
         Yjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802300; x=1780407100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rez1vuaNhDUPgx/4FRbuY6S0ijfuvuK4QmeI9SL+0yw=;
        b=ZjwqXvNYAAq6ln7WA8n5F39+Wi8y4xw3LeY/ZvR0ErAT1qksGqlCAPzuTrkrDj9rQW
         HDDBZJiSNN+qmpRTQrJWp8nk719WWA5TqUNu/zP8qwZmpnRAASMztQ7XTNntzVQtdJTj
         PazgnCdnjSHgRwfe3qwSAeOGNbPQXCQ4NuDnkG7CL84m+fHIohNpNYjdizcwHfD5v56Y
         fRsl4aZaOiZgosaLvPj37vz7mWa6RixnOKgu1gqkK8HZLhD9FLjY1xxeIm4UR9lRhB3u
         K++bM2HbXFRqQ2bFvhe3pMrbHp7dpP+KS9VQY6smgNOjCKbrfrFgSAHcCsDcLP/aIYuQ
         Ybjw==
X-Gm-Message-State: AOJu0YzHB702XIkWCZEAZmdCGcqmx4k/WiDc/393WpCjJHUjZWNwMCSQ
	Ni0VIs7FhrQZvr9NHpeuoDhIAxxqnarKcpMPUMQIkC/Qzor8wqyF+blj
X-Gm-Gg: Acq92OHXRj+jTLvMI2eKlF0cA8Mzko/MByOHdHa+VKYYLi4jbCztkcdLOMVdJ0e/nLp
	HwUae1B41j0EKDnsmA10Ck0yBozMDmrE2VdfLwHPQnkB3/cOoasVX5Tfc5M8VESFdfWHFx+tvyV
	d4Qq83rq1Qt4UBo73ydSblGfGNBfbW+5LAhL2P4b0VP9DblaMRHRtecoc3Ttw2tP3n5TrV7jM1p
	7IjG/bBVK0GCuLH90ik3H2GN7AvAf83a9HXnmfN0ySS6wkJg1SoxoI/KCcl/CklFH3hhZF+i7dY
	dLWc6ZAtsvOmEIibTgY3mpd3YpGxyQ+zeyKfN41a3efBvIvf1A3bwmvMBBHMXLcqERJRoH9AkIe
	i3B/38GJekKazox7QYw/bOD0AMnC+TZhHHuzwyNqder5No6Loo5Nqfm5g56wVPHyhnrMdDCVuJI
	euu5Q9924IVQkLuxckTjXIB99YaA==
X-Received: by 2002:a05:600c:a402:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-490426c5b3emr264652305e9.17.1779802299999;
        Tue, 26 May 2026 06:31:39 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:27 +0300
Subject: [PATCH v9 4/8] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-4-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62798-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 1EC515D6BDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c       |  5 +++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..bd88e2b484a5 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -18,6 +18,7 @@
 #include <linux/types.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-mem2mem.h>
@@ -178,6 +179,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 static u32 to_v4l2_codec_type(u32 codec)
 {
 	switch (codec) {
+	case HFI_VIDEO_CODEC_HEVC:
+		return V4L2_PIX_FMT_HEVC;
 	case HFI_VIDEO_CODEC_H264:
 		return V4L2_PIX_FMT_H264;
 	case HFI_VIDEO_CODEC_H263:
@@ -684,6 +687,8 @@ static const struct venus_resources msm8916_res = {
 	.vmem_addr = 0,
 	.dma_mask = 0xddc00000 - 1,
 	.fwname = "qcom/venus-1.8/venus.mbn",
+	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
+	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c1603eebd757..46705a666776 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -88,6 +88,8 @@ struct venus_resources {
 	const char **opp_pmdomain;
 	unsigned int opp_pmdomain_num;
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


