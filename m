Return-Path: <linux-media+bounces-13554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D090D348
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6678B1C24A6C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2207C16D320;
	Tue, 18 Jun 2024 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V7OZe8z5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7C16B3A0
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717878; cv=none; b=no0BMQbwXkCKDrmSJNJl4G/rnWcr/6wVbvyNZBp/LoR665Q+z8GMZHt/RXCNR/5+N2XuaYaoXbigazWMUpLIYK+ZtKnH6bREC6srRGTCrbNiaGoKfNmsBIZMvd8IG7pJDDfqWd75c+3KUGLYdQuAhjIGWhdqgD2OghBkxNzBwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717878; c=relaxed/simple;
	bh=w3DHP4p4643nKW5OrdOfOxfbPI1T7mPQssl6ldJECKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQkVPkJ3wGlVHdj1pTgCcr7Z0e8yWUc2vYARFBJE0JevUWmc5ZcHjIFJn6ci0FMzlasBvqTuUmG4zu5PrugHtOZh/sNcnLcdnVJchduVsq/yR+yyStkxN9+RdLD+brl42T5oxYfK7bS/nYUhIuUf4q0N4OpXOyMGoUn9SKlG9kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V7OZe8z5; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-796df041d73so384873785a.3
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717875; x=1719322675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSnUXEZtxSx3BYm4BCVxhmYch12bVybwuYwnU/i/Z5U=;
        b=V7OZe8z5aThjADq3yKVV7PgW7gt1/y8zN+5CVDQG1T3urnC8ITxBj+dQlYrSZklzrG
         usKeswnZ+2PTX37povjfrmivhR/fjkSJp3U6NdWwq9SQQDc0IQK4qEUiTeUcNZ8ZcV12
         6nfFykFBL2K3zwJOkwMKdCJcuK2RoLlGLo8sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717875; x=1719322675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSnUXEZtxSx3BYm4BCVxhmYch12bVybwuYwnU/i/Z5U=;
        b=Nki8mTABniJSdFNpR+PixXWkezgrC4+3p/5rLqPsfV7ZnE8ZvsBEQqVvZRstKqDUU9
         geCI8GVf/9e1/G52K2n/S9GJOJGdCyAQbq8lyXmOO8o9ZgFyNnyGQFr6URixff8cOR/2
         lu5ojovVrISuaRd0lbFhr+tD+IbgFuwEu8V4F0NMGunal0zWEeNzYYhhjcAtGnWwhYuG
         OkGLr6LC1wQhpwZyVjjB1aOWFYzr0ivWviG0aUgRewI7SppZ319Wit1X/ZugbVqtY5ml
         IlR3LM8fZgpWSHL8bXTch3zuCZSmgaele7YcN47MNRsBZhGCJdYRBr+xCjSp6GPDksqx
         DRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWRrX+OdUm4nrB5ITmW5aBcFcySFa0lcuEGBx3jdnwxODJf7QMCJ4E3JjBedlfBVMP0SMke1EkETIB5osaoF2hb1ZVCZoh+6bnryM=
X-Gm-Message-State: AOJu0Yxtom0H3a4V/QLdZzwlf6UG95lf4cmclOR0EC/2M60SJY2FKd67
	brGbad87FJzj/cWhVGTYDPLIRtU7rm1HV90LvjT7vmC4jP0NwtgtZHeysMrjXmo6Q9DgVTj8Hb7
	QRSV7
X-Google-Smtp-Source: AGHT+IFosDDClF84gGgSRj5dHMhRBg9h/CZLMI1/BJ04L5j1+KPNuSW/Ol/HXseq/SYmSspuibOWHA==
X-Received: by 2002:a05:620a:444f:b0:795:5815:2f9f with SMTP id af79cd13be357-798d241d00fmr1513504185a.25.1718717875384;
        Tue, 18 Jun 2024 06:37:55 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:48 +0000
Subject: [PATCH v5 05/10] media: venus: Refactor struct
 hfi_uncompressed_format_supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-5-6a8294942f48@chromium.org>
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
In-Reply-To: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
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
index c53e2fb2d42c..6202dcfc467a 100644
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
2.45.2.627.g7a2c4fd464-goog


