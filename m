Return-Path: <linux-media+bounces-13550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0413090D33A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 16:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789861F21E81
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731311684B2;
	Tue, 18 Jun 2024 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PBtoONjp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B373166314
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717873; cv=none; b=FykU3FYEoN7EOKGQmotM+TVF1HqcNjCvbxrlYxWm3J4P8Mi2W2/pKFFBcSGO6nFXN+5xDi/Mj3v2iGZ5TuPtw3dpJGyV3VK1hbnDGptJsa3rJic3a/DfNpwcjUdzsAzb/0eM0X4fMz2+N1sTn7AHJrTAR9fiUGj3OtHqz1Yx2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717873; c=relaxed/simple;
	bh=GoXx+LUbk1pIIGrnFwGZ+D3NCJxZwtQES8xRkbwieRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaZ2RsQdmc/Q06hVQYhDrWWVzhY4wVRRttHNte4gYiIzANWqTpp67JiaeJjUWqJik/+VXn9n4Al0UtGi4HCnU2ULOBnZ4CCyp8WeZexL0es6KjkR6w9Hx6Jnn0KSWSwX695O8ufmdBkimeyWOmz028mVy0LvBuWN9iX/UFirn3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PBtoONjp; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3cabac56b38so3183417b6e.3
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718717871; x=1719322671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyFYwbZ5CJhnsT3ZAVEp/WPT2f72YwpJexmvGlup3eA=;
        b=PBtoONjpp8Yb95gX83yBzyI7CvzCNSeoVGBBPcj6lD59IVcw5ZuHqMMtoqLk3TvMh8
         xY67HKSF+dC/akFDVRQR8ffSCvOh8iWrlzSoIeqsp7dfIipF6w7g/FMJybboJWc17tHy
         PGYdqjEVwHDttgsoqmUSLhELBcQPT/re3guf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717871; x=1719322671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyFYwbZ5CJhnsT3ZAVEp/WPT2f72YwpJexmvGlup3eA=;
        b=FQZQ4wm3HQ898BqpR2r/wXuxWjRK6H+HiHIizRI52IILNjmw6/Ob5x5sQGZhob6XNq
         4VvueWu2dcQG9OYqsSR75LaC27mBkwLcpkuoOr2mcUSXvdMFBIhtPX5KZHGZH2rhpuq1
         LU2ZiTrdzsxkgRu3GH2kC45d3QmWM2Oy8leCkh+EuTZR++7iRXC24XcFkUEnujzY8kPD
         4d+kHyJI6hcoy2YwXFL7ukOMFP0rh8wdgXaFfFo4QPFiDcpa1Uy9pdhSVX69a4wmLd7K
         2so+BwLG6Tahrcg2XLZO0hTkHomP7vebLJpwvBB0+IDMl5KlVqGY2lEwHBqv+ISyFvLJ
         3j9A==
X-Forwarded-Encrypted: i=1; AJvYcCV/L3D5oSTgA2YcTzWW6kkc9eB0+6iGxCPQAqoQc0CMTx23xuk7ZpO5Nc2XQ7Z9kIGh8TRoTMiQ1ph0ABd5Cx2Mp6gb5zwZ/Uvv/Bs=
X-Gm-Message-State: AOJu0YyW/BkLcqAXSDGk2Qxro2rE/Bxx36tT9M0K5EMn42YMKp77ucXY
	53kwpAm68KZHi/BILbgC5FwKJ93/TRPCiWtnN4YTv1zR6dHbQw6l724EZdxPi4hejjXYmFZkpbz
	V32o7
X-Google-Smtp-Source: AGHT+IEmRQPni9rlDK9KsV2t5smDWQkyDsQQTzI4m1+U7VAK4E1oD11JY+8S6sqxF/BUxo0nnLHy7A==
X-Received: by 2002:a05:6808:1a18:b0:3d2:21c8:e1d5 with SMTP id 5614622812f47-3d24e8fb77bmr15257913b6e.25.1718717871081;
        Tue, 18 Jun 2024 06:37:51 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc06e93sm521666385a.82.2024.06.18.06.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:37:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 13:37:44 +0000
Subject: [PATCH v5 01/10] media: venus: Remove unused structs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-cocci-flexarray-v5-1-6a8294942f48@chromium.org>
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

This structures are not used, and have a single element array at the end
of them. Remove them.

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
 drivers/media/platform/qcom/venus/hfi_cmds.h   | 26 ---------------
 drivers/media/platform/qcom/venus/hfi_helper.h | 46 --------------------------
 2 files changed, 72 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
index 20acd412ee7b..41f765eac4d9 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.h
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
@@ -77,14 +77,6 @@ struct hfi_sys_get_property_pkt {
 	u32 data[1];
 };
 
-struct hfi_sys_set_buffers_pkt {
-	struct hfi_pkt_hdr hdr;
-	u32 buffer_type;
-	u32 buffer_size;
-	u32 num_buffers;
-	u32 buffer_addr[1];
-};
-
 struct hfi_sys_ping_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 client_data;
@@ -171,24 +163,6 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
 	u32 data[1];
 };
 
-struct hfi_session_empty_buffer_uncompressed_plane1_pkt {
-	u32 flags;
-	u32 alloc_len;
-	u32 filled_len;
-	u32 offset;
-	u32 packet_buffer2;
-	u32 data[1];
-};
-
-struct hfi_session_empty_buffer_uncompressed_plane2_pkt {
-	u32 flags;
-	u32 alloc_len;
-	u32 filled_len;
-	u32 offset;
-	u32 packet_buffer3;
-	u32 data[1];
-};
-
 struct hfi_session_fill_buffer_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 stream_id;
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index e4c05d62cfc7..f61295819cc1 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -759,11 +759,6 @@ struct hfi_multi_stream_3x {
 	u32 enable;
 };
 
-struct hfi_multi_view_format {
-	u32 views;
-	u32 view_order[1];
-};
-
 #define HFI_MULTI_SLICE_OFF			0x1
 #define HFI_MULTI_SLICE_BY_MB_COUNT		0x2
 #define HFI_MULTI_SLICE_BY_BYTE_COUNT		0x3
@@ -1036,11 +1031,6 @@ struct hfi_codec_supported {
 	u32 enc_codecs;
 };
 
-struct hfi_properties_supported {
-	u32 num_properties;
-	u32 properties[1];
-};
-
 struct hfi_max_sessions_supported {
 	u32 max_sessions;
 };
@@ -1076,23 +1066,6 @@ struct hfi_resource_ocmem {
 	u32 mem;
 };
 
-struct hfi_resource_ocmem_requirement {
-	u32 session_domain;
-	u32 width;
-	u32 height;
-	u32 size;
-};
-
-struct hfi_resource_ocmem_requirement_info {
-	u32 num_entries;
-	struct hfi_resource_ocmem_requirement requirements[1];
-};
-
-struct hfi_property_sys_image_version_info_type {
-	u32 string_size;
-	u8  str_image_version[1];
-};
-
 struct hfi_codec_mask_supported {
 	u32 codecs;
 	u32 video_domains;
@@ -1135,15 +1108,6 @@ struct hfi_index_extradata_config {
 	u32 index_extra_data_id;
 };
 
-struct hfi_extradata_header {
-	u32 size;
-	u32 version;
-	u32 port_index;
-	u32 type;
-	u32 data_size;
-	u8 data[1];
-};
-
 struct hfi_batch_info {
 	u32 input_batch_count;
 	u32 output_batch_count;
@@ -1234,11 +1198,6 @@ static inline void hfi_bufreq_set_count_min_host(struct hfi_buffer_requirements
 		req->count_min = val;
 };
 
-struct hfi_data_payload {
-	u32 size;
-	u8 data[1];
-};
-
 struct hfi_enable_picture {
 	u32 picture_type;
 };
@@ -1267,11 +1226,6 @@ struct hfi_buffer_alloc_mode_supported {
 	u32 data[1];
 };
 
-struct hfi_mb_error_map {
-	u32 error_map_size;
-	u8 error_map[1];
-};
-
 struct hfi_metadata_pass_through {
 	int enable;
 	u32 size;

-- 
2.45.2.627.g7a2c4fd464-goog


