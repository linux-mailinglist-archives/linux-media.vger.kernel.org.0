Return-Path: <linux-media+bounces-13059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61725905687
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD05A1F24F7F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031B517FADE;
	Wed, 12 Jun 2024 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QzsTElNG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C52E17C7C8
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718204996; cv=none; b=dshVNXxl7/iyv0QsFmMTSetu+fMNV1m+OKvuNhtx0jQyMFN2Qjunx+IWDSU07Cmz7e1caKNcGfjuypiwQiLR4tvaEuMHDFoyAB96kXaV+FoYyg6Z2+uNs1XHo3m6ryfTdUOpLT12+QcrcBkS5u37NstJfqQDmC3FhJ0GfBga9Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718204996; c=relaxed/simple;
	bh=33RtesM0p3aOBBwCxfv7CclQs6Uo5qR9M+BtbS2lzjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GywCJQO41OTioc8CkpMzsLxmd5MmRx/kcQIlSwDT0NuU6RvC2wI7aJL8rFf7BBymow3OklgFwpPDirCsnvGClnLiY5LuhoU7eo4Hjy+eohsBShQOPtHLfL+yWPJY/F/g/paMSNwqDn/GmF/ByvfPobrQSk2Xy5YaB2M1eKwj7to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QzsTElNG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74B6F230;
	Wed, 12 Jun 2024 17:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718204979;
	bh=33RtesM0p3aOBBwCxfv7CclQs6Uo5qR9M+BtbS2lzjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QzsTElNGDU66QMBRLjyxx9CmPFE+eCqmKcm83sQmaHKIqzlIxIiNKfwh+Rt8WNMuL
	 opN5m3cAUe521RRwqjRmR/t1/zneUVWaKqMi18v1oac959S9ZCPlo6NbehLDfkdGj8
	 sinQQgfE03mpBhaYjqf+FSJ011l4qJEkg/5MPWO4=
Message-ID: <d587ef5b-716b-4db6-a5f8-f82aa671fe03@ideasonboard.com>
Date: Wed, 12 Jun 2024 16:09:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-3-jacopo.mondi@ideasonboard.com>
 <b5fe2fa2-cd83-46e0-96f7-b8374f1faeb4@ideasonboard.com>
 <20240612143518.GM28989@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240612143518.GM28989@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/06/2024 15:35, Laurent Pinchart wrote:
> On Wed, Jun 12, 2024 at 11:00:37AM +0100, Daniel Scally wrote:
>> On 05/06/2024 17:54, Jacopo Mondi wrote:
>>> Add a new format definition for the RkISP1 extensible parameters
>>> format and document it.
>>>
>>> Document the usage of the new format in the rkisp1 admin guide.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>>    Documentation/admin-guide/media/rkisp1.rst    | 11 +++-
>>>    .../media/v4l/metafmt-rkisp1.rst              | 62 ++++++++++++++++---
>>>    drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>>>    include/uapi/linux/videodev2.h                |  1 +
>>>    4 files changed, 64 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
>>> index 6f14d9561fa5..934c25e191df 100644
>>> --- a/Documentation/admin-guide/media/rkisp1.rst
>>> +++ b/Documentation/admin-guide/media/rkisp1.rst
>>> @@ -114,11 +114,18 @@ to be applied to the hardware during a video stream, allowing userspace
>>>    to dynamically modify values such as black level, cross talk corrections
>>>    and others.
>>>    
>>> -The buffer format is defined by struct :c:type:`rkisp1_params_cfg`, and
>>> -userspace should set
>>> +The ISP driver supports two different parameters configuration methods, the
>>> +`fixed parameters format` or the `extensible parameters format`.
>>> +
>>> +When using the `fixed parameters` method the buffer format is defined by struct
>>> +:c:type:`rkisp1_params_cfg`, and userspace set
>>>   :ref:`V4L2_META_FMT_RK_ISP1_PARAMS <v4l2-meta-fmt-rk-isp1-params>` as the
>>>   dataformat.
>>>    
>>> +When using the fixed parameters method the buffer format is defined by struct
>>> +:c:type:`rkisp1_ext_params_cfg`, and userspace set
>> s/set/should set
> Above too.
>
>>> +:ref:`V4L2_META_FMT_RK_ISP1_EXT_PARAMS <v4l2-meta-fmt-rk-isp1-ext-params>` as
>>> +the dataformat.
>>>    
>>>    Capturing Video Frames Example
>>>    ==============================
>>> diff --git a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>>> index fa04f00bcd2e..6ff776d071a3 100644
>>> --- a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>>> +++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>>> @@ -1,28 +1,72 @@
>>>    .. SPDX-License-Identifier: GPL-2.0
>>>    
>>> -.. _v4l2-meta-fmt-rk-isp1-params:
>>> -
>>>    .. _v4l2-meta-fmt-rk-isp1-stat-3a:
>>>    
>>> -*****************************************************************************
>>> -V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s')
>>> -*****************************************************************************
>>> +************************************************************************************************************************
>>> +V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s'), V4L2_META_FMT_RK_ISP1_EXT_PARAMS ('rk1e')
>>> +************************************************************************************************************************
>>>    
>>> +========================
>>>   Configuration parameters
>>>   ========================
>>>    
>>> -The configuration parameters are passed to the
>>> +The configuration of the RkISP1 ISP is performed by userspace by providing
>>> +parameters for the ISP to the driver using the :c:type:`v4l2_meta_format`
>>> +interface.
>>> +
>>> +There are currently two methods that allow to configure the ISP, the `fixed
> s/currently //
>
>>> +parameters` configuration format and the `extensible parameters` configuration
>>> +format.
>>> +
>>> +.. _v4l2-meta-fmt-rk-isp1-params:
>>> +
>>> +Fixed parameters configuration format
>>> +=====================================
>>> +
>>> +When using the fixed configuration format, parameters are passed to the
>>> :ref:`rkisp1_params <rkisp1_params>` metadata output video node, using
>>> -the :c:type:`v4l2_meta_format` interface. The buffer contains
>>> -a single instance of the C structure :c:type:`rkisp1_params_cfg` defined in
>>> -``rkisp1-config.h``. So the structure can be obtained from the buffer by:
>>> +the `V4L2_META_FMT_RK_ISP1_PARAMS` meta pixel format.
> s/meta pixel format/meta format/ I think. Same below.
>
>>> +
>>> +The buffer contains a single instance of the C structure
>>> +:c:type:`rkisp1_params_cfg` defined in ``rkisp1-config.h``. So the structure can
>>> +be obtained from the buffer by:
>>>    
>>>    .. code-block:: c
>>>    
>>>    	struct rkisp1_params_cfg *params = (struct rkisp1_params_cfg*) buffer;
>>>    
>>> +As the members of :c:type:`rkisp1_params_cfg` are defined in the
>>> +``rkisp1-config.h`` header, the structure layout is immutable and cannot be
>>> +extended further. For this reason the fixed configuration format only allows the
>>> +configuration of the ISP blocks supported at the time when the structure had
>>> +been defined in the header file, as introducing new parameters or modifying the
>>> +existing ones would change the buffer layout and cause breakages in existing
>>> +applications.
>> I'm not sure I'd bother with the last sentence; up to you though.
>> Possibly a quick explainer as to why there's two separate methods and
>> why the extensible one should be preferred could be in the
>> "Configuration parameters" section instead.
> I agree. The last sentence here belongs to a commit message more than to
> the in-kernel documentation. I would replace it with "This method
> supports a subset of the ISP features only, new applications should use
> the extensible parameters method." or something similar.
>
>>> +
>>> +.. _v4l2-meta-fmt-rk-isp1-ext-params:
>>> +
>>> +Extensible parameters configuration format
>>> +==========================================
>>> +
>>> +When using the extensible configuration format, parameters are passed to the
>>> +:ref:`rkisp1_params <rkisp1_params>` metadata output video node, using
>>> +the `V4L2_META_FMT_RK_ISP1_EXT_PARAMS` meta pixel format.
>>> +
>>> +The buffer contains a single instance of the C structure
>>> +:c:type:`rkisp1_ext_params_cfg` defined in ``rkisp1-config.h``. The
>>> +:c:type:`rkisp1_ext_params_cfg` structure is designed to allow userspace to
>>> +populate the data buffer with only the configuration data for the ISP block it
>> s/block/block(s)?
>>
>>> +intends to configure. The extensible parameters format design allows to define
>>> +new block types and new configuration parameters and defines a versioning scheme
>> Perhaps "allows developers to define new block types to support new configuration parameters"?
>>
>>> +so that it can be extended and versioned without breaking compatibility with
>>> +existing applications.
>>> +
>>> +For these reasons, this configuration method if preferred over the `fixed
>>> +parameters` format alternative.
>>> +
>>>    .. rkisp1_stat_buffer
>>>    
>>> +===========================
>>>    3A and histogram statistics
>>>    ===========================
>>>    
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index 4c76d17b4629..aefdc1efd24b 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -1456,6 +1456,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>    	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>>>    	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>>>    	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
>>> +	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
>> I think spell out "Extensible" personally; we already allow breaking like length limits here.
> Format descriptions are limited to 32 bytes in the UAPI :-(

Today I learned!
>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>>
>>>    	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>>>    	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>>>    	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index fe6b67e83751..7c2a303c6f59 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -840,6 +840,7 @@ struct v4l2_pix_format {
>>>    /* Vendor specific - used for RK_ISP1 camera sub-system */
>>>    #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>>>    #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>>> +#define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
>>>    
>>>    #ifdef __KERNEL__
>>>    /*

