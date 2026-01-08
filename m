Return-Path: <linux-media+bounces-50218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EFCD0205B
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 11:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E3E3006F71
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 09:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2989F335555;
	Thu,  8 Jan 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYEvjE3a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED92314B93
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861143; cv=none; b=rM3yjBmX5V70fkvq08Jz/eMPytoZzGU64q7Babt/U3QNC+h+5O2MbhWV3Qwdrv0yidhknDjJoxgU5oVEdYBl8aYGrdP3zS6+JUXa3d6qPKIq/9hcsrLXP2RKE5YCsRpTwIz+WW5ECEcSRAK+h6lz7vdH8Rds6olvLgTo1lnutTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861143; c=relaxed/simple;
	bh=YDBAlDkKk7Tj8b0XQcfHgfeggiQHDFyxpIdOJWwg7RE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZTyqklPigxC0uvoR1PDv3iZ1MKglWO0lgy852lE1wse9ZkY0jRKpbQbQM1zIf4wTn3oZAfGnRYhL7Wdbk8YKDvUSTkbl0QhkEizflT0RyfAhzIiuc2E3pxOCkM6605IulYm1ntfPCPVn/y1eQyi7Rr4QwlGql8x5AUPmmHlCIGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYEvjE3a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767861137; x=1799397137;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=YDBAlDkKk7Tj8b0XQcfHgfeggiQHDFyxpIdOJWwg7RE=;
  b=PYEvjE3aIBMLuqPJDQBUze5mTLZV8qbWkY96Y9KVfkQr/8eGwMJCTAi2
   I5hNVNi/YdxOQ3W213tMHKw6zz+858Fy3Q5J2SEJmNDSpRDTrQoinWPRZ
   7USFyIcYnf06R+PfbQQZ9Nrj290jFCQpFmOZ+DcbjGYEGjRw2aEstrEAs
   JYGesX1pTJGY4Fc84xJlhomGaIqBD2TIS0ptHJaAVwMoIs2Kl62Aw41Wp
   S6h+mATtbi3paG3FRzkBvymYSIJ7sKuDvrTG7RC0OQdDRzloQLGOfv/1b
   XN7T+cdFdeVqUOtmkIhEJ66c4ZTYIpyV80Gtex5Q5cbczu8D4BZrO/KPt
   Q==;
X-CSE-ConnectionGUID: NCTvKsXXTRqEYr4NYQvSpw==
X-CSE-MsgGUID: pVGWwgWqS4ybh9SNZOjTjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68969473"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68969473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:32:10 -0800
X-CSE-ConnectionGUID: wdRSptyyQ+uT7E3g2qjLaQ==
X-CSE-MsgGUID: 6TfKEDt4TMC3pfvG5Ipw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203052970"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:32:08 -0800
Subject: Re: [PATCH v4 13/14] media: ipu6: Drop custom functions to obtain sd
 state information
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: tian.shu.qiu@intel.com, antti.laakso@linux.intel.com,
 mehdi.djait@linux.intel.com
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
 <20260108081712.543704-14-sakari.ailus@linux.intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <10f1de80-42a1-48cd-a5df-acd8807b3df6@linux.intel.com>
Date: Thu, 8 Jan 2026 16:22:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260108081712.543704-14-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sakari,

Thanks for the patch.
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 1/8/26 4:17 PM, Sakari Ailus wrote:
> Drop the custom functions that are used to obtain information from the
> sub-device state.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 17 ++++++---
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 -------------------
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 ---
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 33 +++++++----------
>  4 files changed, 24 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index 651ddab9ef14..c862de31af9c 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -420,7 +420,7 @@ static void buf_queue(struct vb2_buffer *vb)
>  
>  static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
>  {
> -	struct v4l2_mbus_framefmt format;
> +	struct v4l2_mbus_framefmt format, *__format;
>  	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
>  	struct device *dev = &av->isys->adev->auxdev.dev;
>  	struct media_pad *remote_pad =
> @@ -435,13 +435,20 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
>  	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
>  	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
>  
> -	ret = ipu6_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
> -					   &format);
> +	struct v4l2_subdev_state *state =
> +		v4l2_subdev_lock_and_get_active_state(sd);
>  
> -	if (ret) {
> +	__format = v4l2_subdev_state_get_format(state, remote_pad->index,
> +						r_stream);
> +	if (__format)
> +		format = *__format;
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (!__format) {
>  		dev_dbg(dev, "failed to get %s: pad %d, stream:%d format\n",
>  			sd->entity.name, remote_pad->index, r_stream);
> -		return ret;
> +		return -EPIPE;
>  	}
>  
>  	if (format.width != ipu6_isys_get_frame_width(av) ||
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> index 869e7d4ba572..dbd6f76a066d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> @@ -265,42 +265,6 @@ static int subdev_set_routing(struct v4l2_subdev *sd,
>  	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>  }
>  
> -int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
> -				 struct v4l2_mbus_framefmt *format)
> -{
> -	struct v4l2_mbus_framefmt *fmt;
> -	struct v4l2_subdev_state *state;
> -
> -	if (!sd || !format)
> -		return -EINVAL;
> -
> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	fmt = v4l2_subdev_state_get_format(state, pad, stream);
> -	if (fmt)
> -		*format = *fmt;
> -	v4l2_subdev_unlock_state(state);
> -
> -	return fmt ? 0 : -EINVAL;
> -}
> -
> -int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
> -				  struct v4l2_rect *crop)
> -{
> -	struct v4l2_subdev_state *state;
> -	struct v4l2_rect *rect;
> -
> -	if (!sd || !crop)
> -		return -EINVAL;
> -
> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> -	rect = v4l2_subdev_state_get_crop(state, pad, stream);
> -	if (rect)
> -		*crop = *rect;
> -	v4l2_subdev_unlock_state(state);
> -
> -	return rect ? 0 : -EINVAL;
> -}
> -
>  u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
>  {
>  	struct v4l2_subdev_state *state;
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> index 268dfa01e903..35069099c364 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> @@ -38,10 +38,6 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_mbus_code_enum
>  				    *code);
>  u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
> -int ipu6_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
> -				 struct v4l2_mbus_framefmt *format);
> -int ipu6_isys_get_stream_pad_crop(struct v4l2_subdev *sd, u32 pad, u32 stream,
> -				  struct v4l2_rect *crop);
>  int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *state,
>  				 enum v4l2_subdev_format_whence which,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index b035c7342a91..e9dab8a709ef 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -455,6 +455,7 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
>  {
>  	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
>  	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
> +	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
>  	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
>  	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
>  	struct ipu6_isys_stream *stream = av->stream;
> @@ -464,26 +465,13 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
>  		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
>  	struct v4l2_rect v4l2_crop;
>  	struct ipu6_isys *isys = av->isys;
> -	struct device *dev = &isys->adev->auxdev.dev;
>  	int input_pins = cfg->nof_input_pins++;
>  	int output_pins;
>  	u32 src_stream;
> -	int ret;
>  
>  	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
> -	ret = ipu6_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
> -					   &fmt);
> -	if (ret < 0) {
> -		dev_err(dev, "can't get stream format (%d)\n", ret);
> -		return ret;
> -	}
> -
> -	ret = ipu6_isys_get_stream_pad_crop(sd, src_pad->index, src_stream,
> -					    &v4l2_crop);
> -	if (ret < 0) {
> -		dev_err(dev, "can't get stream crop (%d)\n", ret);
> -		return ret;
> -	}
> +	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
> +	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
>  
>  	input_pin = &cfg->input_pins[input_pins];
>  	input_pin->input_res.width = fmt.width;
> @@ -784,13 +772,16 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
>  	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
>  	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
>  	if (link_freq > 0) {
> +		struct v4l2_subdev_state *state =
> +			v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
> +
>  		lanes = csi2->nlanes;
> -		ret = ipu6_isys_get_stream_pad_fmt(&csi2->asd.sd, 0,
> -						   av->source_stream, &format);
> -		if (!ret) {
> -			bpp = ipu6_isys_mbus_code_to_bpp(format.code);
> -			pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
> -		}
> +		format = *v4l2_subdev_state_get_format(state, 0,
> +						       av->source_stream);
> +		bpp = ipu6_isys_mbus_code_to_bpp(format.code);
> +		pixel_rate = mul_u64_u32_div(link_freq, lanes * 2, bpp);
> +
> +		v4l2_subdev_unlock_state(state);
>  	}
>  
>  	av->watermark.pixel_rate = pixel_rate;
> 

-- 
Best regards,
Bingbu Cao

