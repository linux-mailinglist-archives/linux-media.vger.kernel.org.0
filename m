Return-Path: <linux-media+bounces-4237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F386483E67C
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 00:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68DE51F224AE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 23:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C245B5A7;
	Fri, 26 Jan 2024 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oJy1CgN5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AE35A10B
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310969; cv=none; b=TG/iUe8D0ovlqCbE2yflg1lMxSPb6Ek2NGTT4fvV4xfKN8QGcM/r3nr3ahtPQAzukVk0aLNrG6tBIzcWBhr4nPH6xwFxjkiSMUaX0/NYwon4qECbcZ0F+WBi/Is6D1NkkspAQ7oO0Ph7bhO1H5Nk7ntyQyYLE+0AaXvFIxPgits=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310969; c=relaxed/simple;
	bh=GhTHyKYpLdDQHYJccb0YJVMX/ipsIOS1bQVmw69ltqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kl519/7BH6pjjmnei3vH+2seUZVfu4nkIbhSjcfPuu/rbXTUbx2r6PaOPo6OmuB7pfJ/cHX3laQUNgGKu1quD9nnW9XqrlNsRvJfbU9HUk7Tkac1xXQRHrkOvLrv6s5uJOi3drKc9T8SVXafjDC6KzcW+h6swP78z0gXC/ezKyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oJy1CgN5; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7838d13395dso63859385a.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 15:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310967; x=1706915767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKZ2I0FgT+c8VUKnt1mK+wIxC1JMtHjQ/OWMUKXoVdE=;
        b=oJy1CgN5SfIPKCq2tLKWxaPB6qqAKJWMa6hqD9Yll3zok5+sRpZrVGcbtkXNd8UvdX
         DVe6c1FlYpsPEgrV0Chs/KZ8SWgh4gucLbuyqgMslF8GEHY0uD5HAbchlODpClFlZ1ox
         9B+kYSxpU0sDUwAM2kYXHofhZvgjVetm+oGTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310967; x=1706915767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKZ2I0FgT+c8VUKnt1mK+wIxC1JMtHjQ/OWMUKXoVdE=;
        b=dEgZ5qC3qRYLs27LFbL9m1gTmVn/wXchAgQi9YlaEOG5Yw+wPzlMNCAaMrOWrGQuio
         629ZvJAPibcr4tqtPdx1AilStojYHpltfUYAxCbXMzTtNsW48uf1eAPAL8W3OrCPytep
         QJH2UcNHFpHoioZng3wueu4b5SBIqGn6Er3ISJP3VGCMm7dF8Qq8MJvobCO80FSOTrRV
         XOTXKlVWOZH7/Z2aZCf+n58WCVDCZBAmi4oSIDd8F4jBLSXZThJbxw1lpgG1Qrxd/Xli
         Z4VlVPO1sMkqg9SHFgoBIlcF612iuSeidEWC2ZuwCqg20vcHdVfPY9gdPGJtqFB15MZt
         52SQ==
X-Gm-Message-State: AOJu0Yz9OL8KQKuN/1G58THoCwliDu/P24CLgxFLOAXRf/PDa/gi3odL
	Vxrfml5SditgeB6wAvkC3obIwnunPe3B/Rb8skkTdFtajKz2iNA7vLmi49xPEw==
X-Google-Smtp-Source: AGHT+IGfaDanel4bAe+Gm4pPjfl4j2bUb1CcCFTzpsa5FCnRkAwIXhqbnMbyXrNSHptz1QBTZemCAg==
X-Received: by 2002:a05:620a:3888:b0:783:3cee:425a with SMTP id qp8-20020a05620a388800b007833cee425amr491959qkn.141.1706310966713;
        Fri, 26 Jan 2024 15:16:06 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:05 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:01 +0000
Subject: [PATCH 02/17] media: videodev2.h: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-2-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

Named nested unions need their prefix:
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#nested-structs-unions

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/uapi/linux/videodev2.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 68e7ac178cc2..a8015e5e7fa4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1041,13 +1041,13 @@ struct v4l2_requestbuffers {
  * struct v4l2_plane - plane info for multi-planar buffers
  * @bytesused:		number of bytes occupied by data in the plane (payload)
  * @length:		size of this plane (NOT the payload) in bytes
- * @mem_offset:		when memory in the associated struct v4l2_buffer is
+ * @m.mem_offset:	when memory in the associated struct v4l2_buffer is
  *			V4L2_MEMORY_MMAP, equals the offset from the start of
  *			the device memory for this plane (or is a "cookie" that
  *			should be passed to mmap() called on the video node)
- * @userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer
+ * @m.userptr:		when memory is V4L2_MEMORY_USERPTR, a userspace pointer
  *			pointing to this plane
- * @fd:			when memory is V4L2_MEMORY_DMABUF, a userspace file
+ * @m.fd:		when memory is V4L2_MEMORY_DMABUF, a userspace file
  *			descriptor associated with this plane
  * @m:			union of @mem_offset, @userptr and @fd
  * @data_offset:	offset in the plane to the start of data; usually 0,
@@ -1085,14 +1085,14 @@ struct v4l2_plane {
  * @sequence:	sequence count of this frame
  * @memory:	enum v4l2_memory; the method, in which the actual video data is
  *		passed
- * @offset:	for non-multiplanar buffers with memory == V4L2_MEMORY_MMAP;
+ * @m.offset:	for non-multiplanar buffers with memory == V4L2_MEMORY_MMAP;
  *		offset from the start of the device memory for this plane,
  *		(or a "cookie" that should be passed to mmap() as offset)
- * @userptr:	for non-multiplanar buffers with memory == V4L2_MEMORY_USERPTR;
+ * @m.userptr:	for non-multiplanar buffers with memory == V4L2_MEMORY_USERPTR;
  *		a userspace pointer pointing to this buffer
- * @fd:		for non-multiplanar buffers with memory == V4L2_MEMORY_DMABUF;
+ * @m.fd:		for non-multiplanar buffers with memory == V4L2_MEMORY_DMABUF;
  *		a userspace file descriptor associated with this buffer
- * @planes:	for multiplanar buffers; userspace pointer to the array of plane
+ * @m.planes:	for multiplanar buffers; userspace pointer to the array of plane
  *		info structs for this buffer
  * @m:		union of @offset, @userptr, @planes and @fd
  * @length:	size in bytes of the buffer (NOT its payload) for single-plane
@@ -2423,15 +2423,15 @@ struct v4l2_meta_format {
 
 /**
  * struct v4l2_format - stream data format
- * @type:	enum v4l2_buf_type; type of the data stream
- * @pix:	definition of an image format
- * @pix_mp:	definition of a multiplanar image format
- * @win:	definition of an overlaid image
- * @vbi:	raw VBI capture or output parameters
- * @sliced:	sliced VBI capture or output parameters
- * @raw_data:	placeholder for future extensions and custom formats
- * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
- *		and @raw_data
+ * @type:		enum v4l2_buf_type; type of the data stream
+ * @fmt.pix:		definition of an image format
+ * @fmt.pix_mp:		definition of a multiplanar image format
+ * @fmt.win:		definition of an overlaid image
+ * @fmt.vbi:		raw VBI capture or output parameters
+ * @fmt.sliced:		sliced VBI capture or output parameters
+ * @fmt.raw_data:	placeholder for future extensions and custom formats
+ * @fmt:		union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr,
+ *			@meta and @raw_data
  */
 struct v4l2_format {
 	__u32	 type;

-- 
2.43.0.429.g432eaa2c6b-goog


