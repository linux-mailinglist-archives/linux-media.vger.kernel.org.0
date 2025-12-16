Return-Path: <linux-media+bounces-48937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC13CC5545
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 23:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C52B30287C1
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD088327BF8;
	Tue, 16 Dec 2025 22:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="RK3w/b5p"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE6221FDE;
	Tue, 16 Dec 2025 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765923538; cv=pass; b=p5jl9xRraWrM5+oRtjfI6XqmgA3BeFPLyDnmAttPu0agSY1ey6XpzQLsxn0ltwjI/1GhcS73NRSzcTyYPj+REdw9JgrkXfX3IpOamjTQq5yG1T32OzRPXO+uz96wlIRYI7oJe1vh+GRz8nIe+A+YI0nb05CNlwtHu3iBKcXrBr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765923538; c=relaxed/simple;
	bh=q54KHwdKOHJBZ9w6fv5UBvxf3V7uuGM4UalmcveAbEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeR63iGUjRaVWqDnYI4DsxVPRZ2Fy1/6wo3o1g3EHJwJVoYk1DadUUWu1NT6ZMNGlia/ZCHxj35tVwDYXyxULBcVCA65k3OtQ4xJw5cpdkAFSKj6i6M5UM1P85jQ+rPH1cILWP28f45OQ7Zr/ywa2S6IxnwNOVoY+xRMTWxxTQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=RK3w/b5p; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765923506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OV0D0A5O6asIcEtsFvD8ZLki3cGchtfS7/jNAjb6fSewVuSqMe8KBtlvWi4cUb1M7lW1C6xsy8NTHauG3dzAUblvN/RonHijS1rIXoxWaJVc7wHyybOBEXuWLsKFflTF8J3Rq0p2F0kwkia4f4ESM9YTog3S+1wVRCJQzbEnPEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765923506; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lryLzOYRso/AzoIl4crUbDyArIAflV1nbGsXoKzd4I0=; 
	b=QRdfjWpSJNnRSrhlTpsAu04The0EungXhioEktE93DBqrTjA6OBVkAnBYMUIIIwSqh6mo27OQ8pKfukZW3FugJZA8bQJTPPC2a0tp8R2RrRvtcdYjR0RgMIelKsOjeGWP8ldReXgASytBUmGxYWpe384Zqjyjbbx17LyoqCrSRA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765923506;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lryLzOYRso/AzoIl4crUbDyArIAflV1nbGsXoKzd4I0=;
	b=RK3w/b5p0zCARvjXAFHPm20tyFNp9EZyvlHq15ucNVu1GIaHvwg7guEVP0Kw29R0
	FXm+7XfvQZ0Mf4aRbBWwLJh8XmdhQt0eTCgjvNP3vQvpmPGyyHHyfT/DiL37/lk6fq+
	FfOM+CdGeXtBkXAquovMVdp4/UgDfYpYgJnQdRZk=
Received: by mx.zohomail.com with SMTPS id 1765923503338942.6180391987949;
	Tue, 16 Dec 2025 14:18:23 -0800 (PST)
Message-ID: <e88eb64e-ae47-4c70-87af-44c8f0371be9@collabora.com>
Date: Tue, 16 Dec 2025 17:18:20 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/15] media: uapi: HEVC: Add
 v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
 <20251023214247.459931-2-detlev.casanova@collabora.com>
 <d8ef0f88-e81d-4159-8945-52197cbc95ba@kernel.org>
 <37da2fe3-41bd-470e-bb6c-93fe35ee1528@collabora.com>
 <bcbf8247a778c0a179cef2e0338acb2266c18809.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <bcbf8247a778c0a179cef2e0338acb2266c18809.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi,

On 12/16/25 17:02, Nicolas Dufresne wrote:
> Hi,
>
> Le mardi 16 décembre 2025 à 15:48 -0500, Detlev Casanova a écrit :
>> Hi Hans,
>>
>> On 10/24/25 03:55, Hans Verkuil wrote:
>>> On 23/10/2025 23:42, Detlev Casanova wrote:
>>>> Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need the
>>>> long and short term reference information for HEVC decoding.
>>>>
>>>> Add controls to provide it as the raw data form the stream.
>>>>
>>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>>> ---
>>>>    .../media/v4l/ext-ctrls-codec-stateless.rst   | 114 ++++++++++++++++++
>>>>    .../media/v4l/videodev2.h.rst.exceptions      |   2 +
>>>>    .../media/v4l/vidioc-queryctrl.rst            |  12 ++
>>>>    3 files changed, 128 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>>>> index 497ae74379f6..7b18e12fafbb 100644
>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>>>> @@ -2959,6 +2959,120 @@ This structure contains all loop filter related parameters. See sections
>>>>          - 0x00000004
>>>>          -
>>>>    
>>>> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
>>>> +    Specifies the list of Long-Term reference sets parameters from the SPS.
>>>> +    These parameters are defined according to :ref:`hevc`.
>>>> +    They are described in section 7.4.3.2.1 "General sequence parameter set
>>>> +    RBSP semantics" of the specification.
>>>> +    This control is a dynamically sized 1-dimensional array,
>>>> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
>>> I'd drop this last sentence. It suggests that the application has to set it,
>>> but is it set by the kernel.
>>>
>>> Same for the next control below.
>>>
>>> I noticed that this is probably a copy-and-paste from the V4L2_CID_STATELESS_HEVC_SLICE_PARAMS
>>> documentation: can you post a separate patch removing that same line from the description of
>>> that control? I think it is a confusing line, and we missed it during the original review
>>> of V4L2_CID_STATELESS_HEVC_SLICE_PARAMS.
>>>
>>> I have another question about these two controls: currently dynamic controls have always at
>>> least one element. I have been working on supporting zero-sized dynamic controls. Would
>>> that make sense here? Or will these two controls - if present - always have one element or
>>> more?
>>>
>>> If zero-length dynamic array controls are useful here, then I can clean up my patches and
>>> post them so you can use it.
>> I guess that could happen depending on what userspace does, but the size
>> of the array is determined by num_long_term_ref_pics_sps and
>> num_short_term_ref_pic_sets from v4l2_ctrl_hevc_sps respectively.
>>
>> If that value is 0, there is no point in setting the (respective)
>> control, except for simplifying userspace code I suppose.
>>
>> So 0-length support is avoidable.
> With our rule of keeping controls as consistent as possible, we'd need a zero
> length array here since key frame have zero long and short references.
>
> Basically, we should be able to clear that control when
> long_term_ref_pics_present_flag is not set, or num_short_term_ref_pic_sets is
> zero.
>
> Feel free to send an update anyway, since I don't expect Hans to be able to
> provide this code now, would have been better to reply earlier. In fact, I agree
> we can probably move on without the zero-length immediately added and add it
> later.
I don't really see why it can't currently be set to a zero-length though.
> Before going that route, how big are these two arrays ? Short term can be 64
> ref, long term 32, how big in bytes that is ? Was is worth goign with dynamic
> array ? Its not like slices, where we can have 600 or more.

The short term one can still be quite big, it's about 80 bytes per 
element, so 5120 bytes for the 64.

I don't know how often we go that high, I've seen around 10 short term 
ref sets in test videos.

> Nicolas
>
>> Detlev.
>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> +
>>>> +.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
>>>> +
>>>> +.. cssclass:: longtable
>>>> +
>>>> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
>>>> +    :header-rows:  0
>>>> +    :stub-columns: 0
>>>> +    :widths:       1 1 2
>>>> +
>>>> +    * - __u16
>>>> +      - ``lt_ref_pic_poc_lsb_sps``
>>>> +      - Long term reference picture order count as described in section 7.4.3.2.1
>>>> +        "General sequence parameter set RBSP semantics" of the specification.
>>>> +    * - __u8
>>>> +      - ``flags``
>>>> +      - See :ref:`Extended Long-Term RPS Flags <hevc_ext_sps_lt_rps_flags>`
>>>> +
>>>> +.. _hevc_ext_sps_lt_rps_flags:
>>>> +
>>>> +``Extended SPS Long-Term RPS Flags``
>>>> +
>>>> +.. cssclass:: longtable
>>>> +
>>>> +.. flat-table::
>>>> +    :header-rows:  0
>>>> +    :stub-columns: 0
>>>> +    :widths:       1 1 2
>>>> +
>>>> +    * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
>>>> +      - 0x00000001
>>>> +      - Specifies if the long-term reference picture is used 7.4.3.2.1 "General sequence parameter
>>>> +        set RBSP semantics" of the specification.
>>>> +
>>>> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
>>>> +    Specifies the list of Short-Term reference sets parameters from the SPS.
>>>> +    These parameters are defined according to :ref:`hevc`.
>>>> +    They are described in section 7.4.8 "Short-term reference picture set
>>>> +    semantics" of the specification.
>>>> +    This control is a dynamically sized 1-dimensional array,
>>>> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
>>>> +
>>>> +.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
>>>> +
>>>> +.. cssclass:: longtable
>>>> +
>>>> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
>>>> +    :header-rows:  0
>>>> +    :stub-columns: 0
>>>> +    :widths:       1 1 2
>>>> +
>>>> +    * - __u8
>>>> +      - ``delta_idx_minus1``
>>>> +      - Specifies the delta compare to the index. See details in section 7.4.8 "Short-term
>>>> +        reference picture set semantics" of the specification.
>>>> +    * - __u8
>>>> +      - ``delta_rps_sign``
>>>> +      - Sign of the delta as specified in section 7.4.8 "Short-term reference picture set
>>>> +        semantics" of the specification.
>>>> +    * - __u16
>>>> +      - ``abs_delta_rps_minus1``
>>>> +      - Absolute delta RPS as specified in section 7.4.8 "Short-term reference picture set
>>>> +        semantics" of the specification.
>>>> +    * - __u8
>>>> +      - ``num_negative_pics``
>>>> +      - Number of short-term RPS entries that have picture order count values less than the
>>>> +        picture order count value of the current picture.
>>>> +    * - __u8
>>>> +      - ``num_positive_pics``
>>>> +      - Number of short-term RPS entries that have picture order count values greater than the
>>>> +        picture order count value of the current picture.
>>>> +    * - __u32
>>>> +      - ``used_by_curr_pic``
>>>> +      - Bit i specifies if short-term RPS i is used by the current picture.
>>>> +    * - __u32
>>>> +      - ``use_delta_flag``
>>>> +      - Bit i specifies if short-term RPS i is included in the short-term RPS entries.
>>>> +    * - __u16
>>>> +      - ``delta_poc_s0_minus1[16]``
>>>> +      - Specifies the negative picture order count delta for the i-th entry in the short-term RPS.
>>>> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
>>>> +        specification.
>>>> +    * - __u16
>>>> +      - ``delta_poc_s1_minus1[16]``
>>>> +      - Specifies the positive picture order count delta for the i-th entry in the short-term RPS.
>>>> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
>>>> +        specification.
>>>> +    * - __u8
>>>> +      - ``flags``
>>>> +      - See :ref:`Extended Short-Term RPS Flags <hevc_ext_sps_st_rps_flags>`
>>>> +
>>>> +.. _hevc_ext_sps_st_rps_flags:
>>>> +
>>>> +``Extended SPS Short-Term RPS Flags``
>>>> +
>>>> +.. cssclass:: longtable
>>>> +
>>>> +.. flat-table::
>>>> +    :header-rows:  0
>>>> +    :stub-columns: 0
>>>> +    :widths:       1 1 2
>>>> +
>>>> +    * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED``
>>>> +      - 0x00000001
>>>> +      - Specifies if the short-term RPS is predicted from another short term RPS. See details in
>>>> +        section 7.4.8 "Short-term reference picture set semantics" of the specification.
>>>> +
>>>>    .. _v4l2-codec-stateless-av1:
>>>>    
>>>>    ``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
>>>> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>>>> index c41693115db6..6182b4e2d2ee 100644
>>>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>>>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>>>> @@ -150,6 +150,8 @@ replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`V4L.v4l2_ctrl_type`
>>>>    replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v4l2_ctrl_type`
>>>>    replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
>>>>    replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
>>>> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`V4L.v4l2_ctrl_type`
>>>> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`V4L.v4l2_ctrl_type`
>>>>    replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
>>>>    replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
>>>>    replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>>>> index c8baa9430c14..82c8b52e771c 100644
>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>>>> @@ -531,6 +531,18 @@ See also the examples in :ref:`control`.
>>>>          - n/a
>>>>          - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
>>>>    	decoding parameters for stateless video decoders.
>>>> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
>>>> +      - n/a
>>>> +      - n/a
>>>> +      - n/a
>>>> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_lt_rps`, containing HEVC
>>>> +	extended Long-Term RPS for stateless video decoders.
>>>> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
>>>> +      - n/a
>>>> +      - n/a
>>>> +      - n/a
>>>> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_st_rps`, containing HEVC
>>>> +	extended Short-Term RPS for stateless video decoders.
>>>>        * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
>>>>          - n/a
>>>>          - n/a

