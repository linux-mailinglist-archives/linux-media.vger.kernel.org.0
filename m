Return-Path: <linux-media+bounces-45393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC78C01A3C
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D4EC734A524
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27D831D377;
	Thu, 23 Oct 2025 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="AP8SnN0s"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7531BCB8;
	Thu, 23 Oct 2025 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228486; cv=pass; b=WirUK0WcLfrTMizc2CLBidNo/s5vcEWZuzA2As19Re7JyS6Tl0yJ4y2PO2uWONQiKkC4jOPTro/UIXd7IyhT/u7ZFOdI8DrY2of06AskjOn4nxusuTfrelNuQprwGUk/RfyHBo/6Flk66FP+NSXFOcNiRhcOuQk2jLqt2QAqdkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228486; c=relaxed/simple;
	bh=GGx8e8MdSqy28KUToPNYLFH73/gYVKUsFzMFF8jI71E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRboo0betGiwt4vaa4WZ/YgkARmYyKJ+247658WzeYm/nwuXbuxRdnuQ5lWMkZEk7ONZAiOIOuoza+wTA2J8hMCeZrnJzxeCtfdYeVzGCxGjD5LGCCUlkJ4v8xDH0fOOdybSMVwcJB71ri/UXXWHhRNugus9I+tXLfN2kFIS82w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=AP8SnN0s; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1761228452; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QJTDz73q9ULElSJbe3UBcx+2Lh0bvt0HNsiJran5Vx51osYjS85rMDSnSIQ3D8wy4/5jWxUFB33nEv6gyOwj3VXh8p8BOzgzdIsQLkL2bgHCAcrqnBurjZdf9P7ar8l9Z18pFsADQr4gUEobSTfCMDZfk34f+CEs91kZGRTU20M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761228452; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Zn87WStNUu8QnMPbdDiRsUi5A/QpkGCBEl8yDwMULUg=; 
	b=LTpLW0BGhziv59wBl4U/yI/p/C7UWo1UnC0ZolcyfF7kM0SRjzxJpGPW1m0xAS/bNuMDSKdyjiqo5nCsc65riPiGB/oSsy7l4FaYkrsbgdOQgCq9fZwLMYyCAGU8hFgVW0XO/Zck5R2/XKbG1cEqQysrz3X3suS5DPMf8/a9JTg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761228452;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Zn87WStNUu8QnMPbdDiRsUi5A/QpkGCBEl8yDwMULUg=;
	b=AP8SnN0sy9jK6LmZJPJ5zgN9OdYE/1DvKHCdkQNCHLsPQ1DZN3s027C/aUb+l4Wd
	UhbHHc0zrptRAa8zRgFvAy5gpjv1rdRrdNbyqHYsX3MK8TbMgjBaNvH8/40DNlqtZwy
	ZyStghdS8G1krBgZ694sxhxkSAyL0v2DCAYevoVI=
Received: by mx.zohomail.com with SMTPS id 1761228449352726.4571148367125;
	Thu, 23 Oct 2025 07:07:29 -0700 (PDT)
Message-ID: <c7ea2422-cff3-46ad-8c46-20aa651a18d4@collabora.com>
Date: Thu, 23 Oct 2025 10:07:27 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps
 controls
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
 <20251022174508.284929-3-detlev.casanova@collabora.com>
 <6eaa8b26-edab-4bfa-9c6a-1fbb54c36b4e@kernel.org>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <6eaa8b26-edab-4bfa-9c6a-1fbb54c36b4e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Hans,

On 10/23/25 04:04, Hans Verkuil wrote:
> On 22/10/2025 19:44, Detlev Casanova wrote:
>> The vdpu381 decoder found on newer Rockchip SoC need the information
>> from the long term and short term ref pic sets from the SPS.
>>
>> So far, it wasn't included in the v4l2 API, so add it with new dynamic
>> sized controls.
>>
>> Each element of the hevc_ext_sps_lt_rps array contains the long term ref
>> pic set at that index.
>> Each element of the hevc_ext_sps_st_rps contains the short term ref pic
>> set at that index, as the raw data.
>> It is the role of the drivers to calculate the reference sets values.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 18 +++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++
>>   include/uapi/linux/v4l2-controls.h        | 61 +++++++++++++++++++++++
>>   include/uapi/linux/videodev2.h            |  2 +
>>   4 files changed, 91 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 7c660cd61e48..b330bd7719e9 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -418,6 +418,12 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>   		pr_cont("HEVC_SLICE_PARAMS");
>>   		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
>> +		pr_cont("HEVC_EXT_SPS_ST_RPS");
>> +		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
>> +		pr_cont("HEVC_EXT_SPS_LT_RPS");
>> +		break;
>>   	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
>>   		pr_cont("HEVC_SCALING_MATRIX");
>>   		break;
>> @@ -1248,6 +1254,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>   		break;
>>   
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
>> +		break;
>> +
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
>> +		break;
>> +
> There is nothing to validate here? Any value is fine? Just checking...

I don't think we can really validate anything here without more context: 
e.g.: Cannot validate that a referenced frame is valid

Even the num_negative_pics and num_positive_pics range ([0 16]) can't be 
validated here without reconstructing the information, as it is done in 
the driver (and I don't think that should be done twice).

Maybe just the flags could be validated though.

> Is this something that should be added to the visl driver so it is tested during regression
> tests? Or does this not apply to visl?

This could be added to visl indeed. Currently, the data is constructed 
in the rkvdec driver as it is the only one using it, but if added to 
visl, I'd add some v4l2 function to do the work and use it in rkvdec and 
visl.

Also, I think this should be part of another patchset, once this lands.

>
> I haven't looked in-depth into this, but I wondered about it.
Detlev.
>
>>   	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>   		break;
>>   
>> @@ -2000,6 +2012,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>   		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>>   		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
>> +		elem_size = sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps);
>> +		break;
>> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
>> +		elem_size = sizeof(struct v4l2_ctrl_hevc_ext_sps_lt_rps);
>> +		break;
>>   	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
>>   		elem_size = sizeof(struct v4l2_ctrl_hevc_scaling_matrix);
>>   		break;
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index ad41f65374e2..167286c9e424 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -1233,6 +1233,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>>   	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
>>   	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:		return "HEVC Short Term Ref Sets";
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:		return "HEVC Long Term Ref Sets";
>>   	case V4L2_CID_STATELESS_AV1_SEQUENCE:			return "AV1 Sequence Parameters";
>>   	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:		return "AV1 Tile Group Entry";
>>   	case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame Parameters";
>> @@ -1578,6 +1580,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   		*type = V4L2_CTRL_TYPE_U32;
>>   		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>>   		break;
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:
>> +		*type = V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>> +		break;
>> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:
>> +		*type = V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>> +		break;
>>   	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
>>   		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
>>   		break;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 2d30107e047e..dd9e29afa155 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -2093,6 +2093,8 @@ struct v4l2_ctrl_mpeg2_quantisation {
>>   #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELESS_BASE + 405)
>>   #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 406)
>>   #define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_STATELESS_BASE + 407)
>> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 408)
>> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 409)
>>   
>>   enum v4l2_stateless_hevc_decode_mode {
>>   	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
>> @@ -2548,6 +2550,65 @@ struct v4l2_ctrl_hevc_scaling_matrix {
>>   	__u8	scaling_list_dc_coef_32x32[2];
>>   };
>>   
>> +#define V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED	0x1
>> +
>> +/*
>> + * struct v4l2_ctrl_hevc_ext_sps_st_rps - HEVC short term RPS parameters
>> + *
>> + * Dynamic size 1-dimension array for short term RPS. The number of elements
>> + * is v4l2_ctrl_hevc_sps::num_short_term_ref_pic_sets. It can contain up to 65 elements.
>> + *
>> + * @delta_idx_minus1: Specifies the delta compare to the index. See details in section 7.4.8
>> + *                    "Short-term reference picture set semantics" of the specification.
>> + * @delta_rps_sign: Sign of the delta as specified in section 7.4.8 "Short-term reference picture
>> + *                  set semantics" of the specification.
>> + * @abs_delta_rps_minus1: Absolute delta RPS as specified in section 7.4.8 "Short-term reference
>> + *                        picture set semantics" of the specification.
>> + * @num_negative_pics: Number of short-term RPS entries that have picture order count values less
>> + *                     than the picture order count value of the current picture.
>> + * @num_positive_pics: Number of short-term RPS entries that have picture order count values
>> + *                     greater than the picture order count value of the current picture.
>> + * @used_by_curr_pic: Bit j specifies if short-term RPS j is used by the current picture.
>> + * @use_delta_flag: Bit j equals to 1 specifies that the j-th entry in the source candidate
>> + *                  short-term RPS is included in this candidate short-term RPS.
>> + * @delta_poc_s0_minus1: Specifies the negative picture order count delta for the i-th entry in
>> + *                       the short-term RPS. See details in section 7.4.8 "Short-term reference
>> + *                       picture set semantics" of the specification.
>> + * @delta_poc_s1_minus1: Specifies the positive picture order count delta for the i-th entry in
>> + *                       the short-term RPS. See details in section 7.4.8 "Short-term reference
>> + *                       picture set semantics" of the specification.
>> + * @flags: See V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_{}
>> + */
>> +struct v4l2_ctrl_hevc_ext_sps_st_rps {
>> +	__u8	delta_idx_minus1;
>> +	__u8	delta_rps_sign;
>> +	__u16	abs_delta_rps_minus1;
>> +	__u8	num_negative_pics;
>> +	__u8	num_positive_pics;
>> +	__u32	used_by_curr_pic;
>> +	__u32	use_delta_flag;
>> +	__u16	delta_poc_s0_minus1[16];
>> +	__u16	delta_poc_s1_minus1[16];
>> +	__u8	flags;
>> +};
>> +
>> +#define V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT		0x1
>> +
>> +/*
>> + * struct v4l2_ctrl_hevc_ext_sps_lt_rps - HEVC long term RPS parameters
>> + *
>> + * Dynamic size 1-dimension array for long term RPS. The number of elements
>> + * is v4l2_ctrl_hevc_sps::num_long_term_ref_pics_sps. It can contain up to 65 elements.
>> + *
>> + * @lt_ref_pic_poc_lsb_sps: picture order count modulo MaxPicOrderCntLsb of the i-th candidate
>> + *                          long-term reference picture.
>> + * @flags: See V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_{}
>> + */
>> +struct v4l2_ctrl_hevc_ext_sps_lt_rps {
>> +	__u16	lt_ref_pic_poc_lsb_sps;
>> +	__u8	flags;
>> +};
>> +
>>   /* Stateless VP9 controls */
>>   
>>   #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index becd08fdbddb..ae1d33fd37b7 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1981,6 +1981,8 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
>>   	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
>>   	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
>> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS	= 0x0275,
>> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS	= 0x0276,
>>   
>>   	V4L2_CTRL_TYPE_AV1_SEQUENCE	    = 0x280,
>>   	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

