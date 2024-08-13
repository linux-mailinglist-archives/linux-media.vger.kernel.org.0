Return-Path: <linux-media+bounces-16211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C5950515
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBAEDB27F69
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FD019E7DB;
	Tue, 13 Aug 2024 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="advjup4V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990BD19DF50
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552299; cv=none; b=hEiSnrTk4IerqjFtasTEU4tqPJranpJ5jR/dBt+gT/vSxLq3FvYthY2NNstl5b8sWnBzcwwsQbld4OqU3E1JT5c48ADToq9JbQRLSl2a9iKqpFCnNYs9o+nMXIVNe1Q3UQkR29jkZ/dHM8G0uhIFQe0TP/Wm52Z2LHcqWGwP2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552299; c=relaxed/simple;
	bh=+CaEvMFtp6+vW8dd+4vdYR7UCy2/V+0eTuF+Ay8On5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4geYZqU9sbrjg2S3HVDxr0863yCCYrWDwQpQD9B1+JrhgWOkMRCItiwnFCjQfRQ8WsvFnOULXOrJjfwiZQru1WlyrbbVdlmO9rwHp+iV/He/lX/tHY2jtg3+smR369QHYxARpYGG2tIla2SSJaUb6O7+qjiqm9w56uJ9GrsCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=advjup4V; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7095bfd6346so2892122a34.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723552297; x=1724157097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH6hs7TBxxS/YEw6+1SJGhyHiJvtnJuQXXY87tDn62g=;
        b=advjup4VBND4CuAVj8l9GuqzmubjR+lgB6UfV/S5B0v5UudhjHRGF7s6n0wQUa8we0
         OaOjX4GMaqAZb07kFx1EhJF82JQmo1M6WhEzKfu2EMqrn9GMmJqfx2/5yow0b7qct6L5
         Od5IOWWUHXWK0AjLTaC55JGDUjuN1bDo3Q5tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552297; x=1724157097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH6hs7TBxxS/YEw6+1SJGhyHiJvtnJuQXXY87tDn62g=;
        b=YETZPjp1iBDKrNQVY7/+te7KCCIZk/tU6r6i2HWOVkIZkKNV/GbthLmYocoZfJmqSA
         jmZ2fte1qQBZBRgg25UTlvxQ6xVm9g4jtW0Zxdn2wPhgh73XGPdRhB8k+POa/aTduy7p
         Y3Qii0+c9TcSKs52d15A1SvW0ijR+TnVcaWCNiCEVyXF8fHXnnrFF3Z18QNMsrZzbhOr
         Ud8fIfLJVa0vS3nYhwZAJRePFS+kstJmzBeWTDGA5i6iI1BnVokzzfUIsMwTeeN970+b
         RoYxOC2+f59EVuF69TLoopw4aet4GockhWiczHrG4CvjjOWAvNe6XTATnaXHp45L4h3A
         Y4qA==
X-Forwarded-Encrypted: i=1; AJvYcCVnehWmY3fBafwGha4/UJ39T85DlsMluq3Sp4mOhbKN1K85TU0oBAJXDDmyFZy8WRRr4lr2UzDHS4AIZAR3h9wJ2PNdMN2VfzO5Y+g=
X-Gm-Message-State: AOJu0Yw7XPKgMk1VnXVigDuAFAFnwsaqA8myXjtYbQdNSYzMywmwCHrp
	i/+AOzgO6kVG/ME+S6066Whmtl0svY+WKJnzOLsM8aiRdb2mXNcTctxp/tBi3g==
X-Google-Smtp-Source: AGHT+IHogC7GOQUcmfObrPNW1iILSP+KxRxv47DDOynRgsgLm33kY19LjuOqUoeUX6BYwlxMP62DDA==
X-Received: by 2002:a05:6358:7e47:b0:1ac:66ef:a369 with SMTP id e5c5f4694b2df-1b19d2eb1e2mr402285655d.21.1723552296539;
        Tue, 13 Aug 2024 05:31:36 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d66093sm337126685a.12.2024.08.13.05.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:31:35 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:31:30 +0000
Subject: [PATCH v6 10/10] media: venus: Convert one-element-arrays to
 flex-arrays
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-cocci-flexarray-v6-10-de903fd8d988@chromium.org>
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


