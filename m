Return-Path: <linux-media+bounces-15287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1A939D11
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 11:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE47A1F21487
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 09:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938692561B;
	Tue, 23 Jul 2024 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rOhQ3otY"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D6DDDDC;
	Tue, 23 Jul 2024 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721725237; cv=none; b=mNeaQIwamfwrQn9Z8A+84UGvafNIR65677K67XbN5xm19frbp5hjnTfZtL3YSM47BtmtHdtFh+KSdCpEPIwrytzZO+Mm2RMGMXs8ZvMZqwZWytYSKnhXXH3/oNnSo09yjpfiRwa5McJbXSWWBWeqetbS+aMxlpPWqOZvQ85WNYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721725237; c=relaxed/simple;
	bh=jfLE9tpnZChXcVn8NYHzUuHrYd/r/GTpbk7NGi3GtOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOnoCkGa9Sm2hCSDQAn3opfSmQfOyPJCHRnw4DTjJSA2LUcabh0QQP2bcQdRdCWExz0gyP/xOdyShklGoOFRmLrF3CkACMz6h4NgJ/f15PLgHO7Yt06znKTCKLo2CcJc2k8OyUeNovCf9kkM9XlULqhQzl3w/5GBJOgTRv/qLhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rOhQ3otY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721725233;
	bh=jfLE9tpnZChXcVn8NYHzUuHrYd/r/GTpbk7NGi3GtOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOhQ3otYyKYfJ8hOJSPsZ9L3itr87QK9ScTyIpWs5hSVTiTao5b2E9JzzHSkqMIXk
	 lxd+aQdaZy0IQvOwPq8KEa0X1Vsc33MgjI0GkJCUgomnlXuudyqcyJyd6lk8uYlg+p
	 Ygx99gDG+Bgrw2rzQWn0gZv3OmvR4vR3hC2qJxO12L+aavT4p1Pyrtx0la2iu0uahh
	 FNpjGGBtNNMTDDhOGuFLZeR8oR4wQa0dW/Dogs64djjxSQqF6xrg7j7OxUtq7iZIo5
	 SwlRzYbSeJdUh+clBGd0jSOY6CA65wBGSh5EnbNxaNYxs1tic+HNM8CUkq++aWkc5B
	 q9mW+nReEUYcw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 49EF13780EC6;
	Tue, 23 Jul 2024 09:00:33 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:00:32 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v5 1/3] media: videodev2: Add flag to unconditionnaly
 enumerate pixels formats
Message-ID: <20240723090032.x24ezk5vgihaf6z3@basti-XPS-13-9310>
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240722150523.149667-2-benjamin.gaignard@collabora.com>

Hey Benjamin,

in the subject line:

s/unconditionnaly enumerate pixels/unconditionally enumerate pixel/

On 22.07.2024 17:05, Benjamin Gaignard wrote:
>When the index field is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver

s/is ORed with/is set with/ (same meaning but a lot less confusing)

>will ignore any configuration and enumerate all the possible formats.
>Drivers which do not support this flag yet always return an EINVAL

s/yet always/yet, always/

>error code.
>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
>changes in version 5:
>- Reset the proposal to follow Hans's advices
>- Add new flag to be used with index field.
>
> .../userspace-api/media/v4l/vidioc-enum-fmt.rst      | 12 +++++++++++-
> .../userspace-api/media/videodev2.h.rst.exceptions   |  1 +
> include/uapi/linux/videodev2.h                       |  3 +++
> 3 files changed, 15 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>index 3adb3d205531..12e1e65e6a71 100644
>--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>@@ -85,7 +85,11 @@ the ``mbus_code`` field is handled differently:
>     * - __u32
>       - ``index``
>       - Number of the format in the enumeration, set by the application.
>-	This is in no way related to the ``pixelformat`` field.
>+        This is in no way related to the ``pixelformat`` field. When the
>+        index is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver will ignore

s/ORed/set/ (same as above)

>+        any configuration and enumerate all the possible formats. Drivers
>+        which do not support this flag yet always return an ``EINVAL``

s/yet always/yet, always/

>+        error code.
>     * - __u32
>       - ``type``
>       - Type of the data stream, set by the application. Only these types
>@@ -234,6 +238,12 @@ the ``mbus_code`` field is handled differently:
> 	valid. The buffer consists of ``height`` lines, each having ``width``
> 	Data Units of data and the offset (in bytes) between the beginning of
> 	each two consecutive lines is ``bytesperline``.
>+    * - ``V4L2_FMT_FLAG_ENUM_ALL``
>+      - 0x80000000
>+      - When the applications ORs ``index`` with ``V4L2_FMT_FLAG_ENUM_ALL`` flag

s/applications/application/
s/ORs/sets/

>+        the driver enumerates all the possible pixel formats without taking care
>+        of any already set configuration. Drivers which do not support this flag
>+        yet always return ``EINVAL``.

s/yet always/yet, always/

>
> Return Value
> ============
>diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>index bdc628e8c1d6..8dc10a500fc6 100644
>--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>@@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
> replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
> replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
> replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>+replace define V4L2_FMT_FLAG_ENUM_ALL fmtdesc-flags
>
> # V4L2 timecode types
> replace define V4L2_TC_TYPE_24FPS timecode-type
>diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>index 4e91362da6da..3d11f91273a1 100644
>--- a/include/uapi/linux/videodev2.h
>+++ b/include/uapi/linux/videodev2.h
>@@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
> #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>
>+/*  Format description flag, to be ORed with the index */

s/ORed/set/

Regards,
Sebastian

>+#define V4L2_FMT_FLAG_ENUM_ALL			0x80000000
>+
> 	/* Frame Size and frame rate enumeration */
> /*
>  *	F R A M E   S I Z E   E N U M E R A T I O N
>-- 
>2.43.0
>
>_______________________________________________
>Kernel mailing list -- kernel@mailman.collabora.com
>To unsubscribe send an email to kernel-leave@mailman.collabora.com
>This list is managed by https://mailman.collabora.com

