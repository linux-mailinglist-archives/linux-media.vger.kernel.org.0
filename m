Return-Path: <linux-media+bounces-17016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94034962751
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49974282EA6
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B583517AE0C;
	Wed, 28 Aug 2024 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="XoIrdLPt"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB21176259;
	Wed, 28 Aug 2024 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848736; cv=pass; b=dxGcUvJeIuvRIDCV2RlHDPBeqV9RigiBnb9IgdTobiqd8BtZdURax+XpGO7BstGcSHBa0rvO18njwV14Cn6BJvGYZmISBeGPLfEx/e0FSILJFP6fh4orP4+MxIknDXFNwL+KHWpkOX4r98XxZm6hn02gaSnujcHQq22b6Yw7e3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848736; c=relaxed/simple;
	bh=Wer20zJuLRZXAMZEi0db2/OmxXz5vejqhqv+61+vmBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXhnssc4KW16Bx4ol3zyceq2IhbyASYpnmtHDRH6jVXpftx1T9R1aGDrg4y2SJYrJWP9tFbCKbzpRvT72V1cqE4O7hX4LkOABH5/BGaM4VieUvfG9CdxDYsYOvjLMsLJrw7r9AZDN7sCq5V9wxPfce3/HisXH1nAeTgftQ2B2Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=XoIrdLPt; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724848730; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NYFcKg8HKPUuF9M8io20kUsJ/+ptsOHQWe1NlaaE03oiXNdI9qnvaaEkOKo87P+ASYYwE23tv9SxJotI/rKwdge4K4p1m2W2XmgPZgzABZTOhzsgHKVmKb06XyGMgUBy/X8bfTcmKjKMQLUeVw1Ylh+Bbn04u1MKpBgOb6He/B4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724848730; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XelG6d/QHrGCLu35Ea1mIVVPz8COrRfNwsceaykWgrM=; 
	b=Uz3S/PmZzgrxrVWGYdgw7NaZTzc0yHkM0gQn4SH24iRE1dE6vHDpXBpqvW/LeIQSgS5WrI4Y+kXE/VBYxSYJYw2VBDS+HICuhTId5KO8fbhVlw4ekQ0M17m5ASywHx8wJjNDK5e+YZIikGcBddRfeqk5kYmm4Nav7CpS5YB81rw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724848730;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=XelG6d/QHrGCLu35Ea1mIVVPz8COrRfNwsceaykWgrM=;
	b=XoIrdLPt5qRMPfFO8omIQnijoGjVzb79az9/M13Ld7w/KC6aLBkcvdGy9N0QOaW9
	ni04kWFg6k3yEYStvs3u3oAEowHcw9/yROVB+BYwW+Jc/THIRAzCfpHD8Z+WNXSiHuo
	eTh202Qr+LMww9Pt4rkcXwtkvy04wBB+7SWi0qQY=
Received: by mx.zohomail.com with SMTPS id 1724848727482920.3578273304919;
	Wed, 28 Aug 2024 05:38:47 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:38:44 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-input@vger.kernel.org,
	Erling Ljunggren <hljunggr@cisco.com>
Subject: Re: [PATCH 3/6] media: docs: Add V4L2_CAP_EDID
Message-ID: <20240828123844.4dcpfsgii736hrq5@basti-XPS-13-9310>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <5b880a060574363d5ea351e20e0766abb476f6db.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <5b880a060574363d5ea351e20e0766abb476f6db.1723190258.git.hverkuil-cisco@xs4all.nl>
X-ZohoMailClient: External

Hello,

On 09.08.2024 09:57, Hans Verkuil wrote:
>From: Erling Ljunggren <hljunggr@cisco.com>
>
>Add documentation for the new edid capability.
>
>Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
>Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian

>---
> Documentation/userspace-api/media/v4l/biblio.rst      | 11 +++++++++++
> .../userspace-api/media/v4l/vidioc-querycap.rst       | 11 +++++++++++
> .../userspace-api/media/videodev2.h.rst.exceptions    |  1 +
> 3 files changed, 23 insertions(+)
>
>diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
>index 72aef1759b60..35674eeae20d 100644
>--- a/Documentation/userspace-api/media/v4l/biblio.rst
>+++ b/Documentation/userspace-api/media/v4l/biblio.rst
>@@ -334,6 +334,17 @@ VESA DMT
>
> :author:    Video Electronics Standards Association (http://www.vesa.org)
>
>+.. _vesaeddc:
>+
>+E-DDC
>+=====
>+
>+
>+:title:     VESA Enhanced Display Data Channel (E-DDC) Standard
>+:subtitle:  Version 1.3
>+
>+:author:    Video Electronics Standards Association (http://www.vesa.org)
>+
> .. _vesaedid:
>
> EDID
>diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
>index 6c57b8428356..3d11d86d9cbf 100644
>--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
>+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
>@@ -244,6 +244,17 @@ specification the ioctl returns an ``EINVAL`` error code.
>       - 0x01000000
>       - The device supports the :c:func:`read()` and/or
> 	:c:func:`write()` I/O methods.
>+    * - ``V4L2_CAP_EDID``
>+      - 0x02000000
>+      - The device stores the EDID for a video input, or retrieves the EDID for a video
>+        output. It is a standalone EDID device, so no video streaming etc. will take place.
>+
>+        For a video input this is typically an eeprom that supports the
>+        :ref:`VESA Enhanced Display Data Channel Standard <vesaeddc>`. It can be something
>+        else as well, for example a micro controller.
>+
>+        For a video output this is typically read from an external device such as an
>+        HDMI splitter accessed by a serial port.
>     * - ``V4L2_CAP_STREAMING``
>       - 0x04000000
>       - The device supports the :ref:`streaming <mmap>` I/O method.
>diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>index bdc628e8c1d6..d67fd4038d22 100644
>--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>@@ -197,6 +197,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
> replace define V4L2_CAP_DEVICE_CAPS device-capabilities
> replace define V4L2_CAP_TOUCH device-capabilities
> replace define V4L2_CAP_IO_MC device-capabilities
>+replace define V4L2_CAP_EDID device-capabilities
>
> # V4L2 pix flags
> replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
>-- 
>2.43.0
>
>

