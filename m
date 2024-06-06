Return-Path: <linux-media+bounces-12652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE938FE782
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C39DC1F2274E
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486F2197A66;
	Thu,  6 Jun 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hz5QRfdb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5051974E3
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679860; cv=none; b=AIRUesVkRG8/++E2cC+XGl/X8orsbM67DkhDt4TCygK4Ea2ANC5S2OU751f+uh5bH7d3vS+rbclBeEIQYtL6WtugK9xzNLChQfBgL5KW3ziai5zB+isA7Oc/nDIlHE45Av8ipRY7keAZOXghRUacTfa/QooPmCiQVtKtAoZr1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679860; c=relaxed/simple;
	bh=eSS6CFxpjOrEMCtb9xmg56c0gCLfaI7dITUwdjRcSbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EadpLDnHuA29yVhK34wCUrFZGDd5DemqyV3HAbEK/wrK6COCJFjFXzyO6vEp53EO9jztcMj/FM4pxzMeIqSEby1b9t+QRQoEjQ9Q9+CyuX6uE/GEXC1Fr1ci2r11cxw5cNQCMI/u/jh62Wozf1fL/kh/OPU7eXvkLvxmnbSAOoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hz5QRfdb; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ae2e6dba36so5067606d6.3
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717679857; x=1718284657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAc0af9hq9pueFWwvpNqs+gjxvVge6a6O9DHrtQZV0s=;
        b=Hz5QRfdbzej5QLlbrWvb4i+VPuU2IgPOnLuFxX7frGcuhbkT9mZy3FbM35RiBVoJIv
         7zeEOd/K0SSh/F0Vaeb8eQOq77+5ef6L8xe2HOYFsGB7hcgUHaSRVw5T6ru9QvcDGFHz
         m8FvAIrqdJkP8dyR1Qo6oJuLOWyFLcxWsewKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679857; x=1718284657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAc0af9hq9pueFWwvpNqs+gjxvVge6a6O9DHrtQZV0s=;
        b=MY9UUP6vfJH/6ut/KX2SyFlQic773nJ5/1gvS+DlMssQX7gEHHT6WBiArOPd4A25k1
         Oky4v+r1VK+O1qJgqxIDr9wZEYhErqNUutO8hw9lStscnxrg7FRFgA37ce/+Wlc8KKTy
         +3KK1FGGUcI6khMptJWVSDx34SN1xBLTpO9DtIOlFYmgN+VR3W1qdzIN9Trp4cQ0idwo
         TefXZD1kWVYVLe8IrIvixVshPBJRLhzy0sN8uY35n6LxuC+8w0ScYFnso2viEGis4PQS
         x0e74E9qWFNpS5DtqGb3AfeSF9/0uYEGgnHru6RCJMWMgXeeiXvG1QscbON+sTzfiv1O
         6hiA==
X-Forwarded-Encrypted: i=1; AJvYcCWIZpAOK5X8nV00m1DZRdMBEITQGtO8kosXDMQMYh1Ansj2m72zLG4Agc91Ga+/hw7YaI1HVfLm++TAT70HXJUjqvd7U8rmJUyKgI4=
X-Gm-Message-State: AOJu0YxWf7yMpsskWtaOJRPq0tySbqu4GnyapvtnEfaVf7JussMmdhwg
	aEiy728GUQm+bVNQdrwypAKqal7C7RntPTCG2pbEslckLc00eKmQmkrcc76F2g==
X-Google-Smtp-Source: AGHT+IEJIOJiyMJDDmMHLc74buNW9eEFQjpvgj2J4ah7/DbHCd2DHUJMyDhfPoLk1ARALTqqXFgIww==
X-Received: by 2002:a05:6214:451e:b0:6af:5af5:cf63 with SMTP id 6a1803df08f44-6b020320c3emr73595046d6.1.1717679856728;
        Thu, 06 Jun 2024 06:17:36 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f6607f5sm6118036d6.31.2024.06.06.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:17:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Jun 2024 13:16:40 +0000
Subject: [PATCH v4 06/11] media: venus: Refactor struct
 hfi_uncompressed_format_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-cocci-flexarray-v4-6-3379ee5eed28@chromium.org>
References: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
In-Reply-To: <20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

plane_info is not a typical array, the data is not contiguous:
pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
	2 * sizeof(u32);

Replace the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index eb0a4c64b7ef..dee439ea4d2e 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -1006,7 +1006,7 @@ struct hfi_uncompressed_plane_info {
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
2.45.2.505.gda0bf45e8d-goog


