Return-Path: <linux-media+bounces-7140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C60BE87D060
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A2A2B23A45
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843C23D967;
	Fri, 15 Mar 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="vmGZpmC5"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0E1946C
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710516784; cv=none; b=kCTMEyDvSZFkPFEGrvRVbkysWUJz73ixAuW2TNa9wlb9o4/84l9FzAivp0TqewsoGLmu1IVI4DqWVPdKepbgDaE+AuUeRW/8jr2XQoDpNG2oERBrSjEKJ58wzoaCUngf3t89pOsedO1tibuYEm3GCNwxwmXj1pc2gwBoUSfgdBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710516784; c=relaxed/simple;
	bh=0MAezFTJHt/h/3aWeshwy5d/HnHjrtGq8W+aWhHxfvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kb2L3DRChGjuAUNRTIyA6L9CFvfeXeqo9OCCUIHG/Sy7PjPUiqbEKo9RQtUyDULyoIKoPVq/DNpFE35ss0FpQprnkjEqulIqfcrGrWgfmXzbuLSrhFlFOpUC0VcZ2zW2KiXg2mGXWhHAiZguU1IINRoAxYHstPhHUn85IstMJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=vmGZpmC5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710516781;
	bh=0MAezFTJHt/h/3aWeshwy5d/HnHjrtGq8W+aWhHxfvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vmGZpmC59UY+9mO8l/0liV+0E4P4cBwd6TO0OdHpAMQpIOCD0rbX+t5TE0zi5qoZN
	 8q5VzvAMkmlXMozUL6O5mrrCR2sHgkmJnaoiXfeSjDfmg9cQgRPDAeEXx9rYxxiwyN
	 famu7uaWPp5McrcoRrut9Tv8g1ORutXI9rbPFpj1AZjleENAYzEivcEi8dlTsOX3pB
	 TdweAYe4Yy28sMNoqzu28D7OqkkgwmtZl24QQARy789w13d2PAFDnoQAFibKudlken
	 Dh6dEduYxULjmk7khHBwLNYTgi9iGDq+UZ6fTxSbYKPfL400XYxGDVT9QIGN58HyU8
	 L4vdB+mEEby4A==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 426B237804B2;
	Fri, 15 Mar 2024 15:33:00 +0000 (UTC)
Message-ID: <f4e9ebbe-29a6-4f7e-9420-c6c46293d762@collabora.com>
Date: Fri, 15 Mar 2024 16:32:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/38] media: Documentation: v4l: Document internal
 source pads
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-10-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-10-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> Document internal source pads, pads that have both SINK and INTERNAL flags
> set. Use the IMX219 camera sensor as an example.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/dev-subdev.rst    | 145 ++++++++++++++++++
>   1 file changed, 145 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index a387e8a15b8d..1808f40f63e3 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
>   sub-device and a (pad, stream) pair. For sub-devices that do not support
>   multiplexed streams the 'stream' field is always 0.
>   
> +.. _v4l2-subdev-internal-source-pads:
> +
> +Internal source pads and routing
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Cases where a single sub-device source pad is traversed by multiple streams, one
> +or more of which originate from within the sub-device itself, are special as
> +there is no external sink pad for such routes. In those cases, the sources of
> +the internally generated streams are represented by internal source pads, which
> +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> +pad flag set.
> +
> +Internal pads have all the properties of an external pad, including formats and
> +selections. The format in this case is the source format of the stream. An
> +internal pad always has a single stream only (0).
> +
> +Routes from an internal source pad to an external source pad are typically not
> +modifiable but they can be activated and deactivated using the
> +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> +on driver capabilities.
> +
>   Interaction between routes, streams, formats and selections
>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   
> @@ -668,3 +689,127 @@ To configure this pipeline, the userspace must take the following steps:
>      the configurations along the stream towards the receiver, using
>      :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>      stream endpoint in each sub-device.
> +
> +Internal pads setup example
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +A simple example of a multiplexed stream setup might be as follows:
> +
> +- An IMX219 camera sensor source sub-device, with one sink pad (0), one source pad
> +  (1), an internal sink pad (2) that represents the source of embedded
The pixel pad is an internal pad as well ?

> +  data. There are two routes, one from the sink pad to the source, and another
> +  from the internal sink pad to the source pad. Both streams are always active,
> +  i.e. there is no need to separately enable the embedded data stream. The
> +  sensor uses the CSI-2 bus.
> +
> +- A CSI-2 receiver in the SoC (Receiver). The receiver has a single sink pad
> +  (pad 0), connected to the bridge, and two source pads (pads 1-2), going to the
> +  DMA engine. The receiver demultiplexes the incoming streams to the source
> +  pads.
> +
> +- DMA Engines in the SoC (DMA Engine), one for each stream. Each DMA engine is
> +  connected to a single source pad in the receiver.
> +
> +The sensor, the bridge and the receiver are modeled as V4L2 sub-devices,
> +exposed to userspace via /dev/v4l-subdevX device nodes. The DMA engines are
> +modeled as V4L2 devices, exposed to userspace via /dev/videoX nodes.
> +
> +To configure this pipeline, the userspace must take the following steps:
> +
> +1) Set up media links between entities: connect the sensors to the bridge,
> +   bridge to the receiver, and the receiver to the DMA engines. This step does
> +   not differ from normal non-multiplexed media controller setup.
> +
> +2) Configure routing
> +
> +.. flat-table:: Camera sensor. There are no configurable routes.
> +    :header-rows: 1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 0/0
> +      - 1/0
- 1/0
- 0/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from the sink pad
> +    * - 2/0
> +      - 1/1
- 0/1
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from the internal sink pad

In latest patch "[PATCH v6 05/15] media: i2c: imx219: Add embedded data 
support"
we have:
- 0 -> source pad
- 1 -> pixel/image
- 2 -> EDATA

This is also what you did for ov2740.

With that fixed:
Reviewed-by Julien Massot <julien.massot@collabora.com>
Julien

