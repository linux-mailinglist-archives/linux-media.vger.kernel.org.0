Return-Path: <linux-media+bounces-15060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04298933425
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 00:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C361F24EB5
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 22:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC4014431C;
	Tue, 16 Jul 2024 22:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjmQLgMj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EBF14036F
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721167990; cv=none; b=fXfJR0WqExdjquzIANFOVBINOY9yD9c9E5Fj8L8ftpGRXneYP9Om8KclD9PotJtUkpYGRhc5sZnGqV0ka8N5/RMFGI1/T68J5u6F91Fp3H8UneBhxZMLN0UL/9tWLiNRnJfRlNItqXG7+evIhj3VLacjVdGw1SI3dXqmlg1GCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721167990; c=relaxed/simple;
	bh=XMtSAnQLUPLTjEcZ9/jJuTztPkljj4KBCEwVdIRm9FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYavNCCwSWA4zqqe5sLK3ocgs9s0ykLihCP40DP7kFkvcS1qnCqWkyoSfyWZgaiwvaqq2ShrMITF5lGEtdjEzb+JcXOGJ4tyIi/noqHAaDrl17fWSwx14XbvDohAQtzVrDDASzZzpsDS4rymsQBXZNFuQJc4gNJry0ZSs/lqJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjmQLgMj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58b447c519eso8037164a12.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721167987; x=1721772787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N37H6kLbkNAIPuExxunsB7bhPLTHsDDj/8KnxxdH8yw=;
        b=FjmQLgMjigIdM1J3dcOZykVf0m/v3rTlS5b8bZ/rbCa1+m6MqBp91Ybu/YUBW8fR6I
         wUgnXFEJeMW1qSXGMCyCZ6XxFykfQe/7Bhxn0VihsmXD1aENdk/JqBocGb2xtsSEP04L
         0ppImgesB9rCJv2Xu6elhVNxOAOPEY2B3vd3H9DZiUIH8wf30LOFQywn5pDGFgTr1bgs
         NB3PrQuuIqu8OCykSm8mfckpi/QtWy40QincLyLT4Q80v8/OkrDeWj7MsPtfPNCnG07S
         6Ka53AhIpqvv1a18CulBy3nRV4GBtIB/2vX1hkaYzflc4C7HobqrP5jvKAcYMg2WAApN
         oM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721167987; x=1721772787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N37H6kLbkNAIPuExxunsB7bhPLTHsDDj/8KnxxdH8yw=;
        b=fDpZO7VH5V5v7Vs731A9N1LOpSApOQN8nbuB/CfMO4SZGwxSQlUEEG0iXJDRobXlFg
         HGOZQDU3LI1+K9dp7jiYmCtw6s4UoU1EYtlggxh8tZ3QPneuM/nvvBPr5Pq/SHiXubVH
         LSqDnuob1rB86BKXE4r4U7AQWs2ZoKv+wz/FWGUGZB7X2cphpqUBWiYLA5YRSNlMWqbB
         6IgAJtxMKmMDwRQaq9R3k3NsKSv+hntLrALmIA8glsmDDId7lC+2hSsh0ozRl1jM0bFv
         mTCxtW/t/mDkTy5WLyqyOqEwTSO+f/L9aWciM3WBtq4JeJDJAMHuR5RP7g6jeuucsmTl
         zIKg==
X-Gm-Message-State: AOJu0Yy0683uuS5I8MUUrLmHt2KlML7RPdu4+OXLPf+aBuD6pZFAmluo
	ctysW8TraFz3ri78PkNJ2frzbjHqwa/0TVUDJ57Bp4qBDrJ5D7eaZVmIYsuLHQQ=
X-Google-Smtp-Source: AGHT+IG+MADQTpWKslhKvuJZKyGIHvh1adrMraY/f13ntQtqMtGVpyG6NOKMVQVgZZdl1PITC4I3bw==
X-Received: by 2002:a50:a6d7:0:b0:58c:74ae:24ee with SMTP id 4fb4d7f45d1cf-59ef06b97fcmr1807973a12.38.1721167987397;
        Tue, 16 Jul 2024 15:13:07 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a28ddsm5582997a12.71.2024.07.16.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 15:13:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 16 Jul 2024 23:13:25 +0100
Subject: [PATCH v2 2/2] media: qcom: camss: Fix ordering of
 pm_runtime_enable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-linux-next-24-07-13-camss-fixes-v2-2-e60c9f6742f2@linaro.org>
References: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
In-Reply-To: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-13183

pm_runtime_enable() should happen prior to vfe_get() since vfe_get() calls
pm_runtime_resume_and_get().

This is a basic race condition that doesn't show up for most users so is
not widely reported. If you blacklist qcom-camss in modules.d and then
subsequently modprobe the module post-boot it is possible to reliably show
this error up.

The kernel log for this error looks like this:

qcom-camss ac5a000.camss: Failed to power up pipeline: -13

Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..d64985ca6e88 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2283,6 +2283,8 @@ static int camss_probe(struct platform_device *pdev)
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
 
+	pm_runtime_enable(dev);
+
 	num_subdevs = camss_of_parse_ports(camss);
 	if (num_subdevs < 0) {
 		ret = num_subdevs;
@@ -2323,8 +2325,6 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	pm_runtime_enable(dev);
-
 	return 0;
 
 err_register_subdevs:
@@ -2332,6 +2332,7 @@ static int camss_probe(struct platform_device *pdev)
 err_v4l2_device_unregister:
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
+	pm_runtime_disable(dev);
 err_genpd_cleanup:
 	camss_genpd_cleanup(camss);
 

-- 
2.45.2


