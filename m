Return-Path: <linux-media+bounces-34594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C041BAD6C16
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF6A3AE4FE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DD5227BB5;
	Thu, 12 Jun 2025 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jys0qIJN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9015A1DDC1B
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720264; cv=none; b=SiSIEFBvikGc91FLDHC/mgri/kmmjL3A0A0EeS7Gc0PnpNmyIWiCclymZHJe8N9PhWDSnGOqdVaOah19FHQbxiMW+BZOnUjkUnwqY/w239c9IX+G9Z4IGCx5FKCze/32SOxZAH8xWLzSOOIMK0ozT5GmG7KgaWeMsm3CSiC3z+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720264; c=relaxed/simple;
	bh=3snzu0SfCD0pw94QVsHtKNeANdkpHitmprp9y4GHtAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9zDxmUNzSF5ZJ/fI0Uf4sb8ZE7sXxUN9LBlDlSgNnVbOedlyR9x4Zqa4KxZq9SsJyc6+k5YGns2WeikaNxpiADUuYKNSbc9dLLrD04BKZxAihdyhDZMi6/mpG3YWNzik2eCiZZywzrvYAtsJxNeRAgJVNUO4sBSwhOQ1kXBCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jys0qIJN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00152B5;
	Thu, 12 Jun 2025 11:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749720252;
	bh=3snzu0SfCD0pw94QVsHtKNeANdkpHitmprp9y4GHtAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jys0qIJNVvDqeJayRT/6VHkhCnMKuSNrQl65UkN/+XjUqxy2ZoarhzFRVgf4ePgdw
	 MpABW9SbsYQnMsBmZX8iikp5YzBShZUqV3DgFPeUvdDe4BT5KBaB0+4ZPlprB2LMfv
	 NFgOwZrVxU03cv52/tdtKxgvPK7Y99B0CkvovB0w=
Date: Thu, 12 Jun 2025 12:24:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword: bdma_(?:buf|fence|resv) b" <linux-media@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Subject: Re: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Message-ID: <20250612092406.GA25137@pendragon.ideasonboard.com>
References: <PN3P287MB18297E8A4F568F064D19A1D18B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB18297E8A4F568F064D19A1D18B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Thu, Jun 12, 2025 at 07:52:32AM +0000, Tarang Raval wrote:
> Hi
> 
> I’m trying to bring up the OV5695 camera sensor on the Debix Model A board.
> 
> Kernel Version: v6.15-rc2
> 
> The issue occurs when attempting to capture a frame, the system hangs at 
> the VIDIOC_STREAMON call.

When you say "hang", do you mean that it freezes completely and becomes
unresponsive (no serial console, no network, ...), or that it doesn't
capture frames ?

> 1. I've verified the data lane connections, and they are correct.
> 
> 2. Regarding link frequency:
> In the mainline driver, the default link frequency is set to 420 MHz, but according 
> to the sensor's datasheet, the MIPI data rate can go up to 1000 MHz. So, I also tried 
> configuring the link frequency to 500 MHz, but the issue still persists.

I assume you meant 1000 Mbps, not 1000 MHz.

> but the issue still persists.
> 
> Could this be a driver-related bug, or is there something else I should be checking? 
> I would appreciate any guidance on the possible causes or the correct direction to 
> investigate.
> 
> Best Regards,
> Tarang
> 
> ##########################################################################
> debix@imx8mp-debix:~$ v4l2-ctl --device /dev/video0 --set-fmt-video=width=1920,height=1080,pixelformat=BG10 --stream-mmap --stream-to=image.raw --stream-count=1 --verbose

What device is /dev/video0 ?

>  
> VIDIOC_QUERYCAP: ok
> VIDIOC_G_FMT: ok
> VIDIOC_S_FMT: ok
> Format Video Capture Multiplanar:
>         Width/Height      : 1920/1080
>         Pixel Format      : 'BG10' (10-bit Bayer BGBG/GRGR)
>         Field             : None
>         Number of planes  : 1
>         Flags             : 
>         Colorspace        : sRGB
>         Transfer Function : sRGB
>         YCbCr/HSV Encoding: ITU-R 601
>         Quantization      : Limited Range
>         Plane 0           :
>            Bytes per Line : 3840
>            Size Image     : 4147200
>                 VIDIOC_REQBUFS returned 0 (Success)
>                 VIDIOC_QUERYBUF returned 0 (Success)
>                 VIDIOC_QUERYBUF returned 0 (Success)
>                 VIDIOC_QUERYBUF returned 0 (Success)
>                 VIDIOC_QUERYBUF returned 0 (Success)
>                 VIDIOC_QBUF returned 0 (Success)
>                 VIDIOC_QBUF returned 0 (Success)
>                 VIDIOC_QBUF returned 0 (Success)
>                 VIDIOC_QBUF returned 0 (Success)
>                 VIDIOC_STREAMON returned 0 (Success)
> 
> 
> ################################################################################
> 
> echo 8 > /sys/module/videobuf2_common/parameters/debug
> echo 8 > /sys/module/videobuf2_v4l2/parameters/debug
> 
> Logs:
> 
> [  133.181274] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: buffer 0, plane 0 offset 0x00000000
> [  133.182569] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: buffer 1, plane 0 offset 0x00008000
> [  133.183766] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: buffer 2, plane 0 offset 0x00010000
> [  133.185209] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: buffer 3, plane 0 offset 0x00018000
> [  133.185230] videobuf2_common: [cap-(____ptrval____)] __vb2_queue_alloc: allocated 4 buffers, 1 plane(s) each
> [  133.185607] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 0, plane 0 successfully mapped
> [  133.185678] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 1, plane 0 successfully mapped
> [  133.185763] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 2, plane 0 successfully mapped
> [  133.185822] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 3, plane 0 successfully mapped
> [  133.185847] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf of buffer 0 succeeded
> [  133.185879] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf of buffer 1 succeeded
> [  133.185907] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf of buffer 2 succeeded
> [  133.185942] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf of buffer 3 succeeded
> [  133.501480] videobuf2_common: [cap-(____ptrval____)] vb2_core_streamon: successful
> [  133.501579] videobuf2_common: [cap-(____ptrval____)] __vb2_wait_for_done_vb: will sleep waiting for buffers
> [  147.031310] videobuf2_common: [cap-(____ptrval____)] __vb2_wait_for_done_vb: sleep was interrupted
> [  147.039118] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: done processing on buffer 0, state: error
> [  147.039135] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: done processing on buffer 1, state: error
> [  147.039141] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: done processing on buffer 2, state: error
> [  147.039146] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: done processing on buffer 3, state: error
> [  147.039603] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free: freed plane 0 of buffer 0
> [  147.040152] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free: freed plane 0 of buffer 1
> [  147.040595] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free: freed plane 0 of buffer 2
> [  147.041036] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free: freed plane 0 of buffer 3

-- 
Regards,

Laurent Pinchart

