Return-Path: <linux-media+bounces-7141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A792187D06E
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7EA11C22B8C
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFEE3EA96;
	Fri, 15 Mar 2024 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="yjI3dD5M"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B501210E8
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517107; cv=none; b=b5sFBduqYjm931GA9OSienUcEWwHRseMI51yGmgfJso7wS5wTSYvtx9C7xNjp/t25SVCimSZsdBYlpRR8TxGwK/pYTNcT95S+YKjom+N82JTStYb5ExK2ucp9ZimCrO82ss8xzHvelDF4Lk69LxPgBF9QNRSFj4Jd7RtGm73KD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517107; c=relaxed/simple;
	bh=evgYqzksgRzUqnyNbMskf3gv8X8lgEogDiQfZ30AD3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezY0hyn3oJztLicdiHGJl5BIFAa+6De8nlDA2ASM28lGNa8jf5cpHmAdzPt1SvGeiNYDxz5XrJ1lA1VtEKmUC0Iq+bGtIRrH0A8gIdYt7k5VrN/QUFbkcxmDzns9SPCSsfo2hFu3telbXi1ihWd6D7jBiLa5ooAarsuqQBnBdKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=yjI3dD5M; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710517104;
	bh=evgYqzksgRzUqnyNbMskf3gv8X8lgEogDiQfZ30AD3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yjI3dD5MreLct0v3QC8zkYGs5o9J9s/HYt3Ml1or9zfa9PhqP1UPXoirn/5iPXJ5/
	 MWBRLSdOGbDKjNpkjO51DfQ5tTNEcTO8fmveLf3tmh03JqX3fYrkeWZqXiFYtjqIYQ
	 aba++86OW37hzdmDC+/ykQPBb5tEmLK+JvWqwe7+PA4DCzPA2/tr1IWtS8EMm4lr/3
	 Ywe2s9NZpfDPqIZN0BlxceQsSYmJJVE66eUW2Nw+Jb1VmvJIjcXa2JUK+WGKUU8XLu
	 Psbw3RblF/VJPthlcpBDBzVhtBKL2KQMLUg6n83lzpV+0qDi0HsjeW1omOoVOmf8uh
	 N/AAdXuRsexQw==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEC873782110;
	Fri, 15 Mar 2024 15:38:23 +0000 (UTC)
Message-ID: <18b4864b-4214-4452-9c1f-e57125042b81@collabora.com>
Date: Fri, 15 Mar 2024 16:38:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/38] media: Documentation: Document S_ROUTING
 behaviour
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
 <20240313072516.241106-11-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> Document S_ROUTING behaviour for different devices.
> 
> Generally in devices that produce streams the streams are static and some
> can be enabled and disabled, whereas in devices that just transport them
> or write them to memory, more configurability is allowed. Document this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 1808f40f63e3..08495cc6f4a6 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -593,6 +593,30 @@ Any configurations of a stream within a pad, such as format or selections,
>   are independent of similar configurations on other streams. This is
>   subject to change in the future.
>   
> +Device types and routing setup
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Different kinds of sub-devices have differing behaviour for route activation,
> +depending on the hardware. In all cases, however, only routes that have the
> +``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
> +
> +Devices generating the streams may allow enabling and disabling some of the
> +routes or the configuration is fixed. If the routes can be disabled, not
> +declaring the routes (or declaring them without
> +``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
> +disable the routes while the sub-device driver retains the streams and their
> +configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
> +back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
> +flag unset.
> +
> +Devices transporting the streams almost always have more configurability with
> +respect to routing. Typically any route between the sub-device's sink and source
> +pads is possible, and multiple routes (usually up to certain limited number) may
> +be active simultaneously. For such devices, no routes are created by the driver
> +and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> +called on the sub-device. Such newly created routes have the device's default
> +configuration for format and selection rectangles.
> +
>   Configuring streams
>   ^^^^^^^^^^^^^^^^^^^
>   
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Julien

