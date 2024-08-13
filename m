Return-Path: <linux-media+bounces-16204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E49504FF
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DD9C1C23727
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD82319CD12;
	Tue, 13 Aug 2024 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SokGhc/P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7619B3D7
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552293; cv=none; b=bvEWHKJfNf2D3t0a7p7LKJP9ok8VxGsV9vtZa/oqspDWCRhwWZ98Wm+oPhiMGBXl3STY+6FK37WVTG1M+mJeKPbMH43WOvyfQzRkCKGvoqwr34W73ZOH97BXJfkwklbW8O1UlzbfnBkuDtq4nerl9U0TW/so3vGoC6nrmRktuUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552293; c=relaxed/simple;
	bh=ApVSPxuYMUN4H8lzD4Upg+Z+gSvcQcwbvpLfoIq2hbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnyLZUxnVpLrqu5kbZ+zItWNpPIzMC2GERe4CnSmS8udZf0ERGT67byCMND9NYtQMY1/5M5cgjO60jmKo/svJ4WsL883XQMPPU1qXeuFbcqFiLcc2oRl2gzGVTkT5b7UN33PECs+leZNNFsj5dZbGuBwD0mjKkJeLfcZy+G4bIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SokGhc/P; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1da036d35so342935785a.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552290; x=1724157090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cM75UgAWxu+REaaiYKxkbph00GT0OvjjuSsc322MsKo=;
        b=SokGhc/PmhWT/xmp4ulSQiLWsZttx4NqY4ECHZNAmK8LDrAEstEq46JWcEXzcc/oTV
         geaenCuvHw7M69kPnFtLvg6yz0OGiczUWcwHssVWVSvN9upLjQvnG0cMeKAwD9Mi9sAU
         PzYv8TzTMmE/gG6kGhq6eNshFFk3pg/f9FEFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552290; x=1724157090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cM75UgAWxu+REaaiYKxkbph00GT0OvjjuSsc322MsKo=;
        b=qKGup6+ewT+JN6KdR39QbUiWk91baP9XLWTYzZ07AsjsqDP77vt/0x6s8v3VfGxHQ0
         yVRuX1unaEkEUFbIciqzP3iraMHTTeszpqpRMY0Zbj7Vb1N9zIg8JShV/wuqt+X4yKp7
         TT6QFK+ytTYXCQWmzi2Y6mGinYoAa8pNu7dNSEsGhSHh8r6YTGhl50gEVQbYwcB4cGUO
         Fuspyjv8D6+FVAuu71yOZr3raceYVqTK+5xK/OgnHXBfszc1FKE2oBL5Dl0sLMEGRmvP
         mRZIawy9r5bfV3RXMZ6YahNOvxlMHwpktxQE6UcbZaSTSX9VCiYaj+bxaP8P4NJLr/x+
         YGXg==
X-Forwarded-Encrypted: i=1; AJvYcCVLLN2aa32X9z+H0aGDOgYIxeCjb4h51MM1JiC/c3nSPeMdrZ0IwKuosrDbADkSa422k4bOm6jbqg887eYAPywN+puts4hj03dPXfY=
X-Gm-Message-State: AOJu0Yy9inNACIWKIwvnPEwXQQq/Lggmgk47zWXHJ4/G4Q7MDa/FihY6
	UX/TuYUflpY3Ksj51sMzrdUrVHvvN3lV2Oe1fx9TuPRz6gYYNiAWxWEkkYchFQ==
X-Google-Smtp-Source: AGHT+IGqUsckyjgQSDiOTZ2qQ5fmPaXoSD45meFlBIHRhS+FYbD9MyabumWybzKK7Lio3WuJ2DBAQA==
X-Received: by 2002:a05:620a:371d:b0:79f:1783:4ba5 with SMTP id af79cd13be357-7a4e15102f8mr337731385a.12.1723552290179;
        Tue, 13 Aug 2024 05:31:30 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:24 +0000
Subject: [PATCH v6 04/10] media: venus: Refactor struct
 hfi_uncompressed_format_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-4-de903fd8d988@chromium.org>
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
In-Reply-To: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

plane_info is not a typical array, the data is not contiguous:
pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
	2 * sizeof(u32);

Replace the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 5e91f3f6984d..3edefa4edeb9 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1011,7 +1011,7 @@ struct hfi_uncompressed_plane_info {
 struct hfi_uncompressed_format_supported {
 	u32 buffer_type;
 	u32 format_entries;
-	struct hfi_uncompressed_plane_info plane_info[1];
+	struct hfi_uncompressed_plane_info plane_info;
 };
 
 struct hfi_uncompressed_plane_actual {
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index c43839539d4d..3df241dc3a11 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -157,7 +157,7 @@ static void
 parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
 {
 	struct hfi_uncompressed_format_supported *fmt = data;
-	struct hfi_uncompressed_plane_info *pinfo = fmt->plane_info;
+	struct hfi_uncompressed_plane_info *pinfo = &fmt->plane_info;
 	struct hfi_uncompressed_plane_constraints *constr;
 	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
 	u32 entries = fmt->format_entries;

-- 
2.46.0.76.ge559c4bf1a-goog


