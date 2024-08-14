Return-Path: <linux-media+bounces-16295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D66951A2A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11DE71F22098
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 11:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C7A1B373F;
	Wed, 14 Aug 2024 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dl+QfuuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D091B32B4
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635579; cv=none; b=ZRD9AXbEs3pOEzWjh9r0cZaCrOS9uMUi7r7kRsmuoJ1jRfqr0ENaxuj/FHTPhSLsoYi3X++JfihJz0tP68QhYxW2MM/xK0rE8zapHhIKRZ6UVl70pyfoMQxXVJsseNDUooxnPlw44yse/anMKl2omp65wGDapl4lQfyzHsyTc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635579; c=relaxed/simple;
	bh=+CaEvMFtp6+vW8dd+4vdYR7UCy2/V+0eTuF+Ay8On5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRahOH2rPlELT7A1r04wVrho8hhMBlsOOWAok7cOUo5WthSeoyXnjKVZqlw6QsKBH7U8yIQ1PyD7RnkYSvpCpWEN7BE5QFKi5JZJ98c6Rb3SSlXke9MH/FeyJHCqMKNpWYEVyagozyrtO3NWXsQ50Tx08AkQQVoyrTpNbvA4yNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dl+QfuuJ; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70945a007f0so3916436a34.2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723635577; x=1724240377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH6hs7TBxxS/YEw6+1SJGhyHiJvtnJuQXXY87tDn62g=;
        b=dl+QfuuJiepA0A96RA/13tNw9Gls+s5+sJNv8SvpTJQTw6dnpKwNgMSkbFEbUlPpyR
         aYvoWDSB7nGyf9LbgZ4GaFgDJDdaOZmfUvPDO/M/rGc254ywYRd5pvI3+dDMJ3Q2w88T
         yJumYIb4YDlfz/RtTDucpvHmITPnBYiIu/rb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723635577; x=1724240377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH6hs7TBxxS/YEw6+1SJGhyHiJvtnJuQXXY87tDn62g=;
        b=kd8jc4I6zR6kjflhzU/bK51B2pz2kY9jAmyRZMZ45EJjbzu+FKBf7QCxg6vz779dWW
         a/Br5U+jUty5hgkKO83yldTCdInIs/wVE0QP2trfGngab96PbM7fy6cI35s4fbJnNYV4
         VYraOldEA2Je6eAT85FBvDk9K7J/lK64hqAlv6Xs3fJN3k2K+SG3XIfE4HMz4X5PJ3+6
         nJbdOFnxDKvqy6TE3NeaGmQ6kqHZk2tuhuOfVo/waJS4DeTYwA5R/VFc7gu/s2YFHVvn
         SXG18v9WNqc0rUNhSLYaGGi4qfvqV7zgYwBmbO0NwmA1WjJtTo2QaQs5+Xn8VFcmO01v
         0P3g==
X-Forwarded-Encrypted: i=1; AJvYcCXfRmcobsxDqnZlg9GxPF1B/HRCixRxjwJBLZMBDAq/zDlOrZVJ08Cbaouv1kWca9zJJcYbAW9sl8hDRFpMbju6cxDHzUMeWLEwPPg=
X-Gm-Message-State: AOJu0YwWS33ApYvYf/yuy+vupcgZXZdizuadA9T48GH7nfE835e6mJsI
	FklyTtNtMvMtyKKA5jQrJf/9X3LUmNkf3L7CnomdDyDP0S8R6Jgd9fESsTU2oA==
X-Google-Smtp-Source: AGHT+IEtMdN3+LLVZ8wsdeGDjt8+c2zo2szF4F9XAwgyc+ibeBZWZn4V0pAfv9GBu2VgPAmVm/URKw==
X-Received: by 2002:a05:6359:410d:b0:1a5:dca5:a902 with SMTP id e5c5f4694b2df-1b1aab85aabmr281649655d.17.1723635576908;
        Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca0daasm42167916d6.68.2024.08.14.04.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:39:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 11:39:30 +0000
Subject: [PATCH v7 10/10] media: venus: Convert one-element-arrays to
 flex-arrays
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cocci-flexarray-v7-10-8a1cc09ae6c4@chromium.org>
References: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
In-Reply-To: <20240814-cocci-flexarray-v7-0-8a1cc09ae6c4@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This structures are not used, and have a single element array at the end
of them.

This fix the following cocci warnings:
drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/hfi_cmds.h   |  6 +++---
 drivers/media/platform/qcom/venus/hfi_helper.h | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 63b93a34f609..1cd1b5e2d056 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -82,7 +82,7 @@ struct hfi_sys_set_buffers_pkt {
 	u32 buffer_type;
 	u32 buffer_size;
 	u32 num_buffers;
-	u32 buffer_addr[1];
+	u32 buffer_addr[];
 };
 
 struct hfi_sys_ping_pkt {
@@ -177,7 +177,7 @@ struct hfi_session_empty_buffer_uncompressed_plane1_pkt {
 	u32 filled_len;
 	u32 offset;
 	u32 packet_buffer2;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_empty_buffer_uncompressed_plane2_pkt {
@@ -186,7 +186,7 @@ struct hfi_session_empty_buffer_uncompressed_plane2_pkt {
 	u32 filled_len;
 	u32 offset;
 	u32 packet_buffer3;
-	u32 data[1];
+	u32 data;
 };
 
 struct hfi_session_fill_buffer_pkt {
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 755aabcd8048..f44059f19505 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -761,7 +761,7 @@ struct hfi_multi_stream_3x {
 
 struct hfi_multi_view_format {
 	u32 views;
-	u32 view_order[1];
+	u32 view_order[];
 };
 
 #define HFI_MULTI_SLICE_OFF			0x1
@@ -1038,7 +1038,7 @@ struct hfi_codec_supported {
 
 struct hfi_properties_supported {
 	u32 num_properties;
-	u32 properties[1];
+	u32 properties[];
 };
 
 struct hfi_max_sessions_supported {
@@ -1085,12 +1085,12 @@ struct hfi_resource_ocmem_requirement {
 
 struct hfi_resource_ocmem_requirement_info {
 	u32 num_entries;
-	struct hfi_resource_ocmem_requirement requirements[1];
+	struct hfi_resource_ocmem_requirement requirements[];
 };
 
 struct hfi_property_sys_image_version_info_type {
 	u32 string_size;
-	u8  str_image_version[1];
+	u8  str_image_version[];
 };
 
 struct hfi_codec_mask_supported {
@@ -1141,7 +1141,7 @@ struct hfi_extradata_header {
 	u32 port_index;
 	u32 type;
 	u32 data_size;
-	u8 data[1];
+	u8 data[];
 };
 
 struct hfi_batch_info {
@@ -1236,7 +1236,7 @@ static inline void hfi_bufreq_set_count_min_host(struct hfi_buffer_requirements
 
 struct hfi_data_payload {
 	u32 size;
-	u8 data[1];
+	u8 data[];
 };
 
 struct hfi_enable_picture {
@@ -1269,7 +1269,7 @@ struct hfi_buffer_alloc_mode_supported {
 
 struct hfi_mb_error_map {
 	u32 error_map_size;
-	u8 error_map[1];
+	u8 error_map[];
 };
 
 struct hfi_metadata_pass_through {

-- 
2.46.0.76.ge559c4bf1a-goog


