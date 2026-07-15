Return-Path: <linux-media+bounces-67633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KeJwF7FEV2qEIQEAu9opvQ
	(envelope-from <linux-media+bounces-67633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:28:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44875BE10
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:28:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iYNV30ep;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67633-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67633-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E522B3084746
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C285F3CC9E8;
	Wed, 15 Jul 2026 08:25:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70553CA4B3;
	Wed, 15 Jul 2026 08:25:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103940; cv=none; b=szKRkBEPtxwaer+gtFHV6VcA/gStJM+QRW/yNIN7Jao7SsXTjuBeYXOdYmdClpymktOvKqw+MCrSibaINtSrWVEklzRf3HRxu5LMuZc2qz1c36C72fgMqiW1f8tmLR7e4cMMmWR8tl9ZSnZWlfHJMV/TfMQJ8m/QqN7CTaoXe2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103940; c=relaxed/simple;
	bh=VA489iJmfvSIIS6zCkGAI+diWfCh9Aow6uBb+2qStsk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bAVdNx25sGj+4o8engkqIILnnttqinpSj0OydhR9qBPrVMyCayIJ8dzfNShici6B5zPhC9q+lGTxAJ5LHAIj8Ooii+voYhILmh4cCOjaWvDMHsMI5TQDCnTLUrZ8wCoFha/zQdy5YJWpsng6yFEa0tvM0XDmG+BDObG7whLkrbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYNV30ep; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1AC1F000E9;
	Wed, 15 Jul 2026 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103938;
	bh=7Kg9E7GsmDh7hENS97sqL6GD8dmTGG/hPjBDQLQ/ZXQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=iYNV30epQQrHm1bY7vwyrG/UzwpT/XeHBVm9qdwrKS+x67ggCWy1i/rtFuUGL26tr
	 25IpjMn1OeBD4Lo6PvIeEx6hlHtpEFHkWfHLxrFhKtE3mGfzFGECmqqRQuw8nn4psM
	 24FxPeBENh+BwQe+XMnleA+eYidCzJNSf2NceTONTX+EDD71jGeoDe8whuAMmOorFu
	 LuHZG4rHaUDLGQBtA4pZmZ66STkxaGXB6v+dY5rXFTpGFwV/4b4OiGI8JmoYPl8AzB
	 I+djbKSzXtD9XbEQTSOrgMKeNuLbkHL0OcbgMFcnvXYE00vcJrUGyOZcYzxHEyLpxf
	 dPsI5XQDaNwUQ==
Message-ID: <fb72164e-ae4f-4ee0-9030-bb1d21ee7ce9@kernel.org>
Date: Wed, 15 Jul 2026 10:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 1/3] media: uapi: Introduce new control for video
 encoder ROI
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
 <20260714-enc_roi_enable-v2-1-63683f9dbcef@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260714-enc_roi_enable-v2-1-63683f9dbcef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67633-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS(0.00)[m:deepa.madivalara@oss.qualcomm.com,m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF44875BE10

On 14/07/2026 21:00, Deepa Guthyappa Madivalara wrote:
> Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
> video encoder Region of Interest to allow applications to specify
> different quality levels for specific regions in video frames. Define
> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
> codec from the hardware encoder and set the corresponding ROI MB delta_qp
> map that adjusts quantization relative to the frame QP's base value.
> 
> This enables use cases like prioritizing quality for faces in video
> conferencing or important objects in surveillance footage while reducing
> bitrate for less critical areas.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst  | 14 ++++++++++++++
>  .../userspace-api/media/v4l/videodev2.h.rst.exceptions     |  1 +
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst         |  4 ++++
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst |  6 ++++++
>  include/media/v4l2-ctrls.h                                 |  1 +
>  include/uapi/linux/v4l2-controls.h                         |  2 ++
>  include/uapi/linux/videodev2.h                             |  3 +++
>  7 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..1995e7335fb29611151c61561df577f2bdac7a48 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1674,6 +1674,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Codecs need to always use the specified range, rather then a HW custom range.
>      Applicable to encoders
>  
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (integer)``

integer -> __s8

> +    This custom control is used to set ROI MB map delta_Qp for whole frame.

Why is this a 'custom' control? This looks like a standard control to me.
Or do you perhaps mean that the value is HW dependent?

> +    The frame is divided into grid with MB Size returned from querying

The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``).

> +    V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE. Each block is configured with delta_Qp
> +    in raster order. The valid range for delta_Qp is encoder dependent.
> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE (integer)``
> +    This read-only control returns the MB Size for ROI MB delta_Qp map.
> +    Its valid range depends on encoder supported codec format.
> +    Example: For H.264, 16 is returned for 16x16 MB size.
> +    For HEVC, 32 is returned for 32x32 MB size.
> +    Depending on the size returned, delta_Qp Map is set to the encoder.

Sorry, it's not clear what you mean with that last sentence.

Is it possible to have codecs with non-square macroblocks? E.g. 32x16?

Regards,

	Hans

> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index b8698b85bd808979fc590715125f689880e5a30e..8d5eec357509700c9a582b98c14843bb5e483be0 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -185,6 +185,10 @@ still cause this situation.
>        - ``p_u32``
>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
> +    * - __s8 *
> +      - ``p_s8``
> +      - A pointer to a matrix control of signed 8-bit values. Valid if
> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>      * - __s32 *
>        - ``p_s32``
>        - A pointer to a matrix control of signed 32-bit values. Valid if
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>        - any
>        - An unsigned 32-bit valued control ranging from minimum to maximum
>  	inclusive. The step value indicates the increment between values.
> +    * - ``V4L2_CTRL_TYPE_S8``
> +      - any
> +      - any
> +      - any
> +      - A signed 8-bit valued control ranging from minimum to maximum
> +	inclusive. The step value indicates the increment between values.
>      * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>        - n/a
>        - n/a
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
>  	s32 *p_s32;
>  	s64 *p_s64;
>  	u8 *p_u8;
> +	s8 *p_s8;
>  	u16 *p_u16;
>  	u32 *p_u32;
>  	char *p_char;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
>  };
>  
>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index eda4492e40dc14a90a230601d8e23b0e13845d34..1e307781645543960e4b73ba46fdf83279fda4dd 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1880,6 +1880,7 @@ struct v4l2_ext_control {
>  		__s64 value64;
>  		char __user *string;
>  		__u8 __user *p_u8;
> +		__s8 __user *p_s8;
>  		__u16 __user *p_u16;
>  		__u32 __user *p_u32;
>  		__s32 __user *p_s32;
> @@ -1957,6 +1958,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	V4L2_CTRL_TYPE_S8		 = 0x0103,
>  	V4L2_CTRL_TYPE_AREA          = 0x0106,
>  	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>  
> @@ -1993,6 +1995,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>  	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
>  	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
> +
>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> 


