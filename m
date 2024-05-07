Return-Path: <linux-media+bounces-11078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F668BE942
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 272E2B2AF2E
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAADC16F8F1;
	Tue,  7 May 2024 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WIKjFtO1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC116F28D
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099244; cv=none; b=HNvjjQ7PL1JrEl1emL+saotY5YkUD7E+zeAsJa2ZxrvYWuawZ9sfokIcHb8FBE6LSc8BfOCYGH1keAKb8rpgBebTNfIIJLYGwiSYwK4VFwXX5xbcInrylJsSGZ8LDZmffdmyrgis9++EEcrj/KNVD1rFu0B3X6/zvd9hVo8wvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099244; c=relaxed/simple;
	bh=EDdfr0+Pnj9r3H0XIbqR962gzmaw2rY41SXbAP3xmuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jX+lBT6279X7vQ7EewORYYqThyWcjOspK0dJqPM8rqCyNrnM4EZfyxuiZ1b7mWOJpT/6QhVzL9OOXKU7oHCfLurvPKupAApnBdbPdALcKbWMnWe/H/cY3VTLoWliTkLzpmWP3oRzBayhen1LPhWqP4+iy+bujO3FehwJAmT0ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WIKjFtO1; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c96a34a263so977319b6e.2
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099241; x=1715704041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grfwfbVNg0FYwVP8zOHueia/jYu69rJdnTVnLodDO7c=;
        b=WIKjFtO15qIEiOUIaH8zNzHAeoTTRSau1VhKV0Tb8pgaGmqxd0Qsigle8ftUITsYhW
         QY6ViB12ThStBYQASSGqEWs8cIGw1ZjHM3bi+KLg7eLZUCItD3TkeXqgYc2umVmIkWp9
         tHJz/xKRUiO/x7Lz2BI6PPc8zMp9d0GfIrrYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099241; x=1715704041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grfwfbVNg0FYwVP8zOHueia/jYu69rJdnTVnLodDO7c=;
        b=XaFoIltg47jOGlXJTHM81WQxmmDjOIckkjgoebp5a3b4vDRzOHt02BeB+4mVyBzc9r
         xOOATpU5v32d5aDzCVXzNasdPCnlaaBOGrhTIlW3zkSc4ApJ+ht/9Igw88898UfPobs9
         FnhM5EO3UQqlRKImc1hYnyzW+NR+ml1cNihWXB2CmjLPvADYZ5STWNW19cc6OJxWhoVg
         ACtPEMPrOS5xUe5gOtsT5sylYvgY9ixVyFpwDERfblCyAN2vxX7/MTpw8BpaEXvvAmtc
         FDRnUS/V93PHMe+ronrK0WhM4E8F3ebJ1z11V2cGVuIEHQyF2oZIkDBWrYMlB3Y46IXP
         2V3A==
X-Gm-Message-State: AOJu0YwgQZ0pOAeTEGrF4Y0sWTexbDAx/4NZaGqnidZtV0q8C+3ruhG2
	xi2jWons/ZegY6ofjy0Ax7Qi3tygpYQljDjthWad7yNbXLdO61eve2nf5qaKBw==
X-Google-Smtp-Source: AGHT+IGh8pK0RlJouH/fYCBI41k6wvrr3zRYdR0ye3qSLW9c+wx7vH7WZyfMG13hJNctWTluPMz8Sg==
X-Received: by 2002:a05:6808:617:b0:3c9:7593:7613 with SMTP id 5614622812f47-3c98529bf00mr82279b6e.8.1715099240437;
        Tue, 07 May 2024 09:27:20 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:18 +0000
Subject: [PATCH v2 13/18] media: venus: Refactor struct
 hfi_uncompressed_format_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-13-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

plane_info is not a typical array, the data is not contiguous:
pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
	2 * sizeof(u32);

Replace the single element array with a single element field.

This fixes the following cocci warning:
drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

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
2.45.0.rc1.225.g2a3ae87e7f-goog


