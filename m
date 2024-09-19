Return-Path: <linux-media+bounces-18400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1E97C9C2
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 15:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2713CB2339C
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 13:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E979919FA89;
	Thu, 19 Sep 2024 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="8MZHMi9J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8B19F480
	for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726751269; cv=none; b=GsOHQFMbrT0zJ4rLdgD9QN6bRW9HGYtlt3iBOK7IJlDmxMAb9Bvc+DftLcpTuWiDmbyfZBn6dApR3zHEJVgODFTNkc4HGX2VIG5UvdALwICG78y2CuK1SxMMazfB5RerO+IJjVH+r22+5We0XztLOajtcLIA3ggEP0pnCJwt68s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726751269; c=relaxed/simple;
	bh=OgMK76aEC5fJpsaVGpf9RcDTNXOaIUNYrznBHdxuJwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HS7T1GNAY6Ltpz2HmQSIqJxvvynjrOm5lp3zRVPALmIn1Dn6lL1i9yHE9WnCCsAMrcFLGuLRjvX+sIEiAUiVpkhMzhUt5PRdUPwCupFpxtPTrwmoQCaV/6ZDP1iWEyrUFmelYDDDltTZcO7ZsCJ825xGdAJFgXBwa0XiB3z4KMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=8MZHMi9J; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JBOdNi017274;
	Thu, 19 Sep 2024 15:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	uQ+Gh5W4/m05J6SqQ1nYaixm1xeORHItMXmhEbzCmwQ=; b=8MZHMi9JOe6diJPj
	nQmzcni8dD+CxR/hW20JCaR96IaSbXtDkDkuQQGCJ8LyfdI2o3Z6K3Th2zzZFk4W
	Vn+nnFDh55Dyy4I+pP8+kUbL8I4ga5qLZkhcwVLuxaT6qounSCv2+VlpeTVh4/7B
	n0bS7ZbzY99M5v1O2gjQIl/W+RNTHSJscPA6kCtD6iYb436QVzrhjQdCxTTTlRni
	7LDFwiAjqugasikNlMJB6VKfApLoxK0EhFMCT+wgkt46jW5BGtoDG0cPHzUwV0hj
	49kOeFX8krp5/RIMeYE2qSRQRAjBFScgAV7Uv/VuHcDGMoU+DzgrSHdctzI1CsX4
	RQrodA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41nnehv49s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 15:07:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 37B8E400E0;
	Thu, 19 Sep 2024 15:06:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73CE426F230;
	Thu, 19 Sep 2024 15:03:28 +0200 (CEST)
Received: from [10.252.14.15] (10.252.14.15) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Sep
 2024 15:03:27 +0200
Message-ID: <c550fd63-cf6d-4723-bf30-c4131cfedd63@foss.st.com>
Date: Thu, 19 Sep 2024 15:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: Documentation: Deprecate s_stream video op,
 update docs
To: Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <tomi.valkeinen@ideasonboard.com>,
        Alain Volmat <alain.volmat@foss.st.com>, <hverkuil@xs4all.nl>
References: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
 <20240917150254.17639-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240917150254.17639-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Sakari,

On 9/17/24 17:02, Sakari Ailus wrote:
> The scope of the s_stream video operation is now fully supported by
> {enable,disable}_straems. Explicitly document the s_stream() op as

s/straems/streams/

> deprecated and update the related documentation.>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

This is a good opportunity for me to thank you for keeping the
documentation up to date.

> ---
>  Documentation/driver-api/media/camera-sensor.rst |  8 ++++----
>  Documentation/driver-api/media/tx-rx.rst         | 13 ++++++++-----
>  include/media/v4l2-subdev.h                      |  5 +++--
>  3 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> index b4920b34cebc..c290833165e6 100644
> --- a/Documentation/driver-api/media/camera-sensor.rst
> +++ b/Documentation/driver-api/media/camera-sensor.rst
> @@ -81,10 +81,10 @@ restart when the system is resumed. This requires coordination between the
>  camera sensor and the rest of the camera pipeline. Bridge drivers are
>  responsible for this coordination, and instruct camera sensors to stop and
>  restart streaming by calling the appropriate subdev operations
> -(``.s_stream()``, ``.enable_streams()`` or ``.disable_streams()``). Camera
> -sensor drivers shall therefore **not** keep track of the streaming state to
> -stop streaming in the PM suspend handler and restart it in the resume handler.
> -Drivers should in general not implement the system PM handlers.
> +(``.enable_streams()`` or ``.disable_streams()``). Camera sensor drivers shall
> +therefore **not** keep track of the streaming state to stop streaming in the PM
> +suspend handler and restart it in the resume handler. Drivers should in general
> +not implement the system PM handlers.
>  
>  Camera sensor drivers shall **not** implement the subdev ``.s_power()``
>  operation, as it is deprecated. While this operation is implemented in some
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 29d66a47b56e..dd09484df1d3 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -49,11 +49,14 @@ Link frequency
>  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
>  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
>  
> -``.s_stream()`` callback
> -^^^^^^^^^^^^^^^^^^^^^^^^
> +``.enable_streams()`` and ``.disable_streams()`` callbacks
> +^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> -The struct struct v4l2_subdev_video_ops->s_stream() callback is used by the
> -receiver driver to control the transmitter driver's streaming state.
> +The struct v4l2_subdev_pad_ops->enable_streams() and struct
> +v4l2_subdev_pad_ops->disable_streams() callbacks are used by the receiver driver
> +to control the transmitter driver's streaming state. These callbacks may not be
> +called directly, but by using ``v4l2_subdev_enable_streams()`` and
> +``v4l2_subdev_disable_streams()``.
>  
>  
>  CSI-2 transmitter drivers
> @@ -127,7 +130,7 @@ Stopping the transmitter
>  ^^^^^^^^^^^^^^^^^^^^^^^^
>  
>  A transmitter stops sending the stream of images as a result of
> -calling the ``.s_stream()`` callback. Some transmitters may stop the
> +calling the ``.disable_streams()`` callback. Some transmitters may stop the
>  stream at a frame boundary whereas others stop immediately,
>  effectively leaving the current frame unfinished. The receiver driver
>  should not make assumptions either way, but function properly in both
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8daa0929865c..3cc6b4a5935f 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -450,8 +450,9 @@ enum v4l2_subdev_pre_streamon_flags {
>   *	already started or stopped subdev. Also see call_s_stream wrapper in
>   *	v4l2-subdev.c.
>   *
> - *	New drivers should instead implement &v4l2_subdev_pad_ops.enable_streams
> - *	and &v4l2_subdev_pad_ops.disable_streams operations, and use
> + *	This callback is DEPRECATED. New drivers should instead implement
> + *	&v4l2_subdev_pad_ops.enable_streams and
> + *	&v4l2_subdev_pad_ops.disable_streams operations, and use
>   *	v4l2_subdev_s_stream_helper for the &v4l2_subdev_video_ops.s_stream
>   *	operation to support legacy users.
>   *

-- 
Regards,

Benjamin

