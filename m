Return-Path: <linux-media+bounces-7134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19387CF6A
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13B8B1C22860
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 14:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512EE3838C;
	Fri, 15 Mar 2024 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3vN0ICPE"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBAC3D0A8
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710514172; cv=none; b=bfDiVXCld3VdBiOPktNLflVHeKibb02GLRr2ifSgUbKNPTSdgXB9x2CPkmPUX0glj3lwhCENCNt4qFzdTzlCBS55vYfw01eilX5ju6w0wE3dujJ2HkNUlVxwtR1cpnxgpljHHN5tjsSbB8gtDwyKvsaEdrDJsBwrySjqbVhpHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710514172; c=relaxed/simple;
	bh=rrcAuVZd9iWZYRS1dJmRRiG57zIVvxpAo30zjd8A6j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4ESPoBi/LeDjwzbt58ZQH0FR7F4E/tljE8nWFhtRtNQU0xd8PaAVhx75T3rkDLQwAd04I9IoEuYhPFfPt8u/bB4KKoZA9nG29b0ciYoxW8CNmMx+eYXsLMd6zu2mnhcsZK9KqHX26rKAOFaGGlOw83cyuSkSr7BZb6tmUi6BTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3vN0ICPE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710514169;
	bh=rrcAuVZd9iWZYRS1dJmRRiG57zIVvxpAo30zjd8A6j8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3vN0ICPEpoxoNna/aob+negashe56jzv49AMhilZ6+kp4bC0Kkn2NpiUgMH9YaVeN
	 k29lRaEUgD2D/Vr/1vMzyC8yjw//HoXmRRme+8qale0G1ujuysHZTrfIkIxvYx5kYI
	 qFdbNQ+b4+0aTXyAxmy4dOrOJ6e8DTt6CIT+II4xzQ5zI26VjoP37vD2HQQ1uIWtKT
	 gv0hREF2YtGJsi/SY+t4RZjqreRmiDGgzRROTcsXO/2PXPh5EH28j+6sD13D+fb+Kg
	 gvWd7wwB6gZ2KwVTHGVEvlrGLD/YUwBNhYNLz5UdhHDe6yhojr6Sau/QXgf8dc314e
	 0o53ywnlvwjtg==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 526D53782110;
	Fri, 15 Mar 2024 14:49:28 +0000 (UTC)
Message-ID: <589e0485-0a2e-48b4-846e-6dd6fa351652@collabora.com>
Date: Fri, 15 Mar 2024 15:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/38] media: Documentation: Document embedded data
 guidelines for camera sensors
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
 <20240313072516.241106-9-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> Document how embedded data support should be implemented for camera
> sensors, and when and how CCS embedded data format should be referenced.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../media/drivers/camera-sensor.rst           | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 919a50e8b9d9..92545538b855 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -102,3 +102,32 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
>   values programmed by the register sequences. The default values of these
>   controls shall be 0 (disabled). Especially these controls shall not be inverted,
>   independently of the sensor's mounting rotation.
> +
> +Embedded data
> +-------------
> +
> +Many sensors, mostly raw sensors, support embedded data which is used to convey
> +the sensor configuration for the captured frame back to the host. While CSI-2 is
> +the most common bus used by such sensors, embedded data can be available on
> +other bus types as well.
> +
> +Embedded data support shall use an internal source pad (a pad that has
> +``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> +<MEDIA-PAD-FL-INTERNAL>`` flags set) and route to the external pad. If embedded
> +data output can be disabled in hardware, it should be possible to disable the
> +embedded data route via ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> +
> +In general, changing the embedded data format from the driver-configured values
> +is not supported. The height of the metadata is hardware specific and the width
> +is that (or less of that) of the image width, as configured on the pixel data
> +stream.
> +
> +CCS and non-CCS embedded data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Embedded data which is compliant with CCS definitions shall use ``CCS embedded
> +data format <MEDIA-BUS-FMT-CCS-EMBEDDED>``. Device specific embedded data which
> +is compliant up to MIPI CCS embedded data levels 1 or 2 only shall refer to CCS
> +embedded data formats and document the level of conformance. The rest of the
> +device specific embedded data format shall be documented in the context of the
> +data format itself.
Reviewed-by: Julien Massot <julien.massot@collabora.com>

Julien

