Return-Path: <linux-media+bounces-48726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95263CB9CF3
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 21:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A23A3065183
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 20:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1E32D73BB;
	Fri, 12 Dec 2025 20:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="RInLigh7"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858373B8D47;
	Fri, 12 Dec 2025 20:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765572594; cv=pass; b=u85GWTIg4JjbyCBjRcfpD8xiAs+Zu1DpMI4J2LYLrt5R8F1/EZ7Hmail77JijbHSNotEe8U078GapwaN80mlapPYRXnE3f8MuNuJr28Th7XbxwsTxfZgP7okMmCBCvuLJFmvIy+3uJUNQq7F22mWU2UpIEEtKHShGqmDMdd+jxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765572594; c=relaxed/simple;
	bh=WIHfSYogtSmRrGvQDlAqo6RLNVCJurq9v+zwjOMPcas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZ5feFKl0Ltu96wrqSLQULGl/nzYKuMZ9LI3i4ja+xkxsKbjcLRboQy5KsLz7gM0LmpDZj8WKN7d57VwY9Dz3DULvA1x5S0Q9hsGsk60DN2VK/3nbcQRA5dgRBD0kfVvBKygOCrFsZMX5G4AHHysAHesXlAeIttzrLxBr9H32W0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=RInLigh7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765572559; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z9GVlmPifcW+xfLbaBGX3/NpeQxpmRfFzofsR+wOCxTG6T3zurWG8iX2qu2syPgD3RAuPtf88a8mq+xOYIl2omJz/A4Z5SPH24D4cf4eM/gcixl9p+eLHcFki86Fje3dAHoMnps9wVLpHlZuTK3Is84IaHolP67/rmIlh8MTB1c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765572559; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j4zd/bLmNxIBdmGgMoI59Kau0qXWli1hhYAv9EFxc64=; 
	b=jbWUgjfCHKDeqDsE3WmWZRshoiedZuFzpHDtfMYs3DcJAhmlrGqzkc6DjDxeTGliCoNIzAsS/iylwhQNWVyvptmC4j4IvctyKRp7fOQhxRgFEmNEq/qpHjA+KRhIFHjDox7bN8R5Dc360U23RJA9UfYzbkGSXN8XmwAODMAOvBA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765572559;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j4zd/bLmNxIBdmGgMoI59Kau0qXWli1hhYAv9EFxc64=;
	b=RInLigh70AuLm66EsJBAjWyASCPLh5UBdAqqQYxFP7Bxj4Wc5gDeytSFFy/Cfk/R
	1Fg8K5p8OOojzBwgrKXzFTU9BQRLMvudVFlquQ73n9CdslCSXuKHlpGvDYEcYKrebK/
	SqHMaoJpPShYmAps5BOl8tifrEgolDK9ob0KYdJU=
Received: by mx.zohomail.com with SMTPS id 176557255681035.1287439437358;
	Fri, 12 Dec 2025 12:49:16 -0800 (PST)
Message-ID: <34a5dade-cef1-4c2b-a031-c1bccdf5c134@collabora.com>
Date: Fri, 12 Dec 2025 15:49:14 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] media: uapi: HEVC: Add
 v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-kernel@vger.kernel.org
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
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
 <20251022162459.271603-2-detlev.casanova@collabora.com>
 <a46d28aab764afcf3feab29df0fd1793bfe27c52.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <a46d28aab764afcf3feab29df0fd1793bfe27c52.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Nicolas,

On 12/10/25 15:03, Nicolas Dufresne wrote:
> Hi,
>
> Le mercredi 22 octobre 2025 à 12:22 -0400, Detlev Casanova a écrit :
>> Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need the
>> long and short term reference information for HEVC decoding.
> That's seems a bit short and incomplete. My understanding is that the decoder on
> this hardware needs to full parse the slice headers, and cannot be passed with
> the slice information. It also does not implement a a skip method similar to
> Hantro.
>
> So in short, I think the justification for this API is that these parameters are
> needed to fully parse HEVC slice headers. You should perhaps say that similar
> paramters ares passed in Vulkan Video API ?
Yes, I will clarify
>> Add controls to provide it as the raw data form the stream.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   .../media/v4l/ext-ctrls-codec-stateless.rst   | 114 ++++++++++++++++++
>>   .../media/v4l/videodev2.h.rst.exceptions      |   2 +
>>   .../media/v4l/vidioc-queryctrl.rst            |  12 ++
>>   3 files changed, 128 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>> index 0da635691fdc..bb6772cf3cee 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
>> @@ -2958,6 +2958,120 @@ This structure contains all loop filter related parameters. See sections
>>         - 0x00000004
>>         -
>>   
>> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
>> +    Specifies the list of Long-Term reference sets parameters from the SPS.
>> +    These parameters are defined according to :ref:`hevc`.
>> +    They are described in section 7.4.3.2.1 "General sequence parameter set
>> +    RBSP semantics" of the specification.
>> +    This control is a dynamically sized 1-dimensional array,
>> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
> Can we making a bit clearer that this is a subset of the SPS (perhaps use the
> term subset). And this is user to extend another control (mention this other
> control) ?
>
>> +
>> +.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
>> +
>> +.. cssclass:: longtable
>> +
>> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - __u16
>> +      - ``lt_ref_pic_poc_lsb_sps``
>> +      - Long term reference picture order count as described in section 7.4.3.2.1
>> +        "General sequence parameter set RBSP semantics" of the specification.
>> +    * - __u8
>> +      - ``flags``
>> +      - See :ref:`Extended Long-Term RPS Flags <hevc_ext_sps_lt_rps_flags>`
>> +
>> +.. _hevc_ext_sps_lt_rps_flags:
>> +
>> +``Extended SPS Long-Term RPS Flags``
>> +
>> +.. cssclass:: longtable
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
>> +      - 0x00000001
>> +      - Specifies if the long-term reference picture is used 7.4.3.2.1 "General sequence parameter
>> +        set RBSP semantics" of the specification.
>> +
>> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
>> +    Specifies the list of Short-Term reference sets parameters from the SPS.
>> +    These parameters are defined according to :ref:`hevc`.
>> +    They are described in section 7.4.8 "Short-term reference picture set
>> +    semantics" of the specification.
>> +    This control is a dynamically sized 1-dimensional array,
>> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
> Déjà vue, this is a duplicate right ?

Almost, you saw the description of the Long term sets before, this is 
for the Short term.

Only the name and specification section have changed in the description.

>> +
>> +.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
>> +
>> +.. cssclass:: longtable
>> +
>> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - __u8
>> +      - ``delta_idx_minus1``
>> +      - Specifies the delta compare to the index. See details in section 7.4.8 "Short-term
>> +        reference picture set semantics" of the specification.
>> +    * - __u8
>> +      - ``delta_rps_sign``
>> +      - Sign of the delta as specified in section 7.4.8 "Short-term reference picture set
>> +        semantics" of the specification.
>> +    * - __u16
>> +      - ``abs_delta_rps_minus1``
>> +      - Absolute delta RPS as specified in section 7.4.8 "Short-term reference picture set
>> +        semantics" of the specification.
>> +    * - __u8
>> +      - ``num_negative_pics``
>> +      - Number of short-term RPS entries that have picture order count values less than the
>> +        picture order count value of the current picture.
>> +    * - __u8
>> +      - ``num_positive_pics``
>> +      - Number of short-term RPS entries that have picture order count values greater than the
>> +        picture order count value of the current picture.
>> +    * - __u32
>> +      - ``used_by_curr_pic``
>> +      - Bit i specifies if short-term RPS i is used by the current picture.
>> +    * - __u32
>> +      - ``use_delta_flag``
>> +      - Bit i specifies if short-term RPS i is included in the short-term RPS entries.
>> +    * - __u16
>> +      - ``delta_poc_s0_minus1[16]``
>> +      - Specifies the negative picture order count delta for the i-th entry in the short-term RPS.
>> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
>> +        specification.
>> +    * - __u16
>> +      - ``delta_poc_s1_minus1[16]``
>> +      - Specifies the positive picture order count delta for the i-th entry in the short-term RPS.
>> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
>> +        specification.
>> +    * - __u8
>> +      - ``flags``
>> +      - See :ref:`Extended Short-Term RPS Flags <hevc_ext_sps_st_rps_flags>`
>> +
>> +.. _hevc_ext_sps_st_rps_flags:
>> +
>> +``Extended SPS Short-Term RPS Flags``
>> +
>> +.. cssclass:: longtable
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED``
>> +      - 0x00000001
>> +      - Specifies if the short-term RPS is predicted from another short term RPS. See details in
>> +        section 7.4.8 "Short-term reference picture set semantics" of the specification.
>> +
>>   .. _v4l2-codec-stateless-av1:
>>   
>>   ``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
>> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 35d3456cc812..1663fdf8444c 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -149,6 +149,8 @@ replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 3549417c7feb..128c044d2e3c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -523,6 +523,18 @@ See also the examples in :ref:`control`.
>>         - n/a
>>         - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
>>   	decoding parameters for stateless video decoders.
>> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
>> +      - n/a
>> +      - n/a
>> +      - n/a
>> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_lt_rps`, containing HEVC
>> +	extended Long-Term RPS for stateless video decoders.
>> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
>> +      - n/a
>> +      - n/a
>> +      - n/a
>> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_st_rps`, containing HEVC
>> +	extended Short-Term RPS for stateless video decoders.
>>       * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
>>         - n/a
>>         - n/a
> cheers,
> Nicolas

