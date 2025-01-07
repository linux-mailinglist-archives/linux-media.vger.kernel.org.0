Return-Path: <linux-media+bounces-24334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E43AFA03D07
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DADE41651DE
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0E91EE008;
	Tue,  7 Jan 2025 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mWPAcYSj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46FD1E3DCD
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247278; cv=none; b=O8FloidG7mgNT8xjl+K03k7nsP8ZKV97pGMgQ7j6iaZo58QHGdQ9ytoJWNyQ8ftaF59j4wSUz1OvH2EXYlH8u2VPADLPbHMKzSndt5EBzq9tudFS+tPcGDq+20piVrbSaWN22o3Z72ptXnYZkeUK0ALdm8rwMC6cmORb66CRYes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247278; c=relaxed/simple;
	bh=wNqPLVCH3hrYmgRdcOul7vFmT8NC6JPiLWWSYrAMGoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdmTZUjpxll8RHNhso1M5JZ4vfhg9bu5PBS9uUJ9Ou30wExknLNnJkSYYOZ0L3j2kRKyg0/K+b1DzJjVjQs9lqeJ0ZRS6y2QFSexQTSDViFnjq65vrcAQ60MpFYBivGpVPqNuaIxbZXp5pZa92HgR3SS4MjeQhxY0UbvjDXaHZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mWPAcYSj; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46792996074so151041951cf.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 02:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247273; x=1736852073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=mWPAcYSjr9grfY3JXlYpA2Sy3GBF4dZ7nxYh0BxR0v/EwB+LHCcBCT/ExMOdapdhgx
         qXgrZOSJb57RU1His2CdnDRybknfFEkK2dG96jPfVYPvK83BSqwHSK/araJ6vqgSpUKX
         YSstVU4HyZlZpqQi4+5zo5K7Zw2m+QYrttPFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247273; x=1736852073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCQd+Ixr8eKIqoAvIvPqynaVVvGYXfmfSE/3mmNL7HE=;
        b=Bu79NBUHNkrmiXeBw5xX3rcvXCAveO4Z9JaMrOtqaBp8BPJHqICTrxis/TPHma3Ms/
         h9Un6woxEoHqKrF6z2T1z94tzfQR2lIbABpWnHfjDsKuundbj9RdT1cagBbNLu9GJDbS
         VSPsbGZiR65XDga8fmXE14qeZ4I4N1sxU3sgk79bcLT2y/Ic7rdUEGNByd/+kgbPgH4a
         eJj7E+RP3B2jdcdiDKqG52rfhF3rPxRrPDzjEfdeyPgF6QK86bxx0rLAhyiY8B3QXk2V
         s+KcYsWVgExwD+vw19482Na0GIXdcn/aIvcaxRzUMzwK0stClUz6NF94mUFYPB2+v/py
         WJqg==
X-Gm-Message-State: AOJu0Yzk2oEpaA0rZj+pW1pNgD2k8zuJI6AioTeUE7H9yRWLpwXOC+S6
	NeBfTzKYO6ezH2aKduhxp6sWzAkUn5wn9NOPN8ecwKdUpd8E0+rdqaG57jyLXw==
X-Gm-Gg: ASbGncsm+SnyyWx8dlhtXTLfs7ByrZPzCAiq7eC/PyCL2egAR5GDi3dkbJRpWhtIXnI
	HO83hOgFlBix5Y5CxfH03kK+PC+0cxJnBu97cJyIe4+Z0uCbBfMbSlr/zo4gnvJe/jSu94cuPKK
	d8bAegiNzSayVlNA1PxrQmQE6GLzeQ1x185hE7IvEOfPPqV8mFXrrZj2D+QosHQL+ocP/idDfFi
	t5+3tw8zeRF+4WQAD4eKMhGgBGauTVd0WlTOZvG5rruAN2WsQ3FMwpVleT0ce4yraNQT6tdu4/p
	sdqUaZcPcYAxcicd/ShiYG12RYnxaUv37tT/
X-Google-Smtp-Source: AGHT+IGKeyvvoUZ2svFx+YPGpG6WrV538GXxzvSPHqikjfxzI0msn6hiyTBtp0Rw8fsFZQS4ecDYVw==
X-Received: by 2002:a05:622a:8f:b0:467:5e1c:1ab6 with SMTP id d75a77b69052e-46a4a8ebaedmr1117456131cf.24.1736247272995;
        Tue, 07 Jan 2025 02:54:32 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 Jan 2025 10:54:27 +0000
Subject: [PATCH v5 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-fix-cocci-v5-2-b26da641f730@chromium.org>
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
In-Reply-To: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The driver uses "whole" fps in all its calculations (e.g. in
load_per_instance()). Those calculation expect an fps bigger than 1, and
not big enough to overflow.

Clamp the value if the user provides a parm that will result in an invalid
fps.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h | 2 ++
 drivers/media/platform/qcom/venus/vdec.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 44f1c3bc4186..afae2b9fdaf7 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -28,6 +28,8 @@
 #define VIDC_RESETS_NUM_MAX		2
 #define VIDC_MAX_HIER_CODING_LAYER 6
 
+#define VENUS_MAX_FPS			240
+
 extern int venus_fw_debug;
 
 struct freq_tbl {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..c1d5f94e16b4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
 	do_div(us_per_frame, timeperframe->denominator);
 
-	if (!us_per_frame)
-		return -EINVAL;
-
+	us_per_frame = max(USEC_PER_SEC, us_per_frame);
 	fps = (u64)USEC_PER_SEC;
 	do_div(fps, us_per_frame);
+	fps = min(VENUS_MAX_FPS, fps);
 
 	inst->fps = fps;
 	inst->timeperframe = *timeperframe;

-- 
2.47.1.613.gc27f4b7a9f-goog


