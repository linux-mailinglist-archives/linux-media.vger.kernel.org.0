Return-Path: <linux-media+bounces-45457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7CC04DED
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEA8F4FDD59
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 07:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DFD2F619F;
	Fri, 24 Oct 2025 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+fPR5BM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE22F6180;
	Fri, 24 Oct 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292547; cv=none; b=AlmUOQWfbrQlsos8rJFKk0o/5QuPB3WDKm2Qb1r1EzyWaYndYUEVYPCvUUdzB2bc7GbkUVpSh3ZHrtLJQZiY637ZLVQaevJaBF8xhFp++M5fOokCyRpUhB3L1H0Z4fgc7Edv4SSVpXIZnZgOfnJcz+9+Q/4cgMHxqmXLL9/wjLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292547; c=relaxed/simple;
	bh=Hdklt2chKnjkuOe9ZHbv7X1qKK4yJxGkjdwOW0cEIxM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IPfU98aa9Y2HfX5vzGqWrlaPCSAeqvYo38tzh7H1M/CWdRvR8AmPnPlE4Hxkd8Aqw5RXxCAJSqJmtwaI8k8th1QPj8oOe9ebZs5su+3UiRVTU/kjlCDvL35hLkuo55mq583ELVArjUvH9rcvexcpF9bmrGAFSqWrEXywRTdBCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+fPR5BM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8EC4CEF1;
	Fri, 24 Oct 2025 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761292546;
	bh=Hdklt2chKnjkuOe9ZHbv7X1qKK4yJxGkjdwOW0cEIxM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Z+fPR5BM3ecrRdmcNC4u3g2wWA3rQ2498FmYSaN+DnRr/1TBt2QP9oCmzH7Ka7Azc
	 rrzOXHrwLKuldNvS+rXeTwtCZwxMhCM0nwt7XbV7G+B39Kv+JMwBlJ86gtGhJ08Lz6
	 lK/4vugKy5qSV2DlcmV4Wx0TCJYGRAbFzQQLLAWMga+mmJLbkOqJdKdcGMCyjem3jX
	 4A9j0j9O3CsipOr0ukooKE7Ho8iX/iexg5YDNPYWfWB+697Pgfjo/gAP+S0ZkqAMLn
	 JtMG2ClqNqNoiNX6GGlawCl4S+TIMSlFXDXQayT5k8tSyenwUkKzbFzsagIp2XWEQr
	 Cx6Pk7QdGEz8A==
Message-ID: <d8ef0f88-e81d-4159-8945-52197cbc95ba@kernel.org>
Date: Fri, 24 Oct 2025 09:55:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 01/15] media: uapi: HEVC: Add
 v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
To: Detlev Casanova <detlev.casanova@collabora.com>,
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
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
 <20251023214247.459931-2-detlev.casanova@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20251023214247.459931-2-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2025 23:42, Detlev Casanova wrote:
> Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need the
> long and short term reference information for HEVC decoding.
> 
> Add controls to provide it as the raw data form the stream.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 114 ++++++++++++++++++
>  .../media/v4l/videodev2.h.rst.exceptions      |   2 +
>  .../media/v4l/vidioc-queryctrl.rst            |  12 ++
>  3 files changed, 128 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index 497ae74379f6..7b18e12fafbb 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2959,6 +2959,120 @@ This structure contains all loop filter related parameters. See sections
>        - 0x00000004
>        -
>  
> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
> +    Specifies the list of Long-Term reference sets parameters from the SPS.
> +    These parameters are defined according to :ref:`hevc`.
> +    They are described in section 7.4.3.2.1 "General sequence parameter set
> +    RBSP semantics" of the specification.
> +    This control is a dynamically sized 1-dimensional array,
> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.

I'd drop this last sentence. It suggests that the application has to set it,
but is it set by the kernel.

Same for the next control below.

I noticed that this is probably a copy-and-paste from the V4L2_CID_STATELESS_HEVC_SLICE_PARAMS
documentation: can you post a separate patch removing that same line from the description of
that control? I think it is a confusing line, and we missed it during the original review
of V4L2_CID_STATELESS_HEVC_SLICE_PARAMS.

I have another question about these two controls: currently dynamic controls have always at
least one element. I have been working on supporting zero-sized dynamic controls. Would
that make sense here? Or will these two controls - if present - always have one element or
more?

If zero-length dynamic array controls are useful here, then I can clean up my patches and
post them so you can use it.

Regards,

	Hans

> +
> +.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u16
> +      - ``lt_ref_pic_poc_lsb_sps``
> +      - Long term reference picture order count as described in section 7.4.3.2.1
> +        "General sequence parameter set RBSP semantics" of the specification.
> +    * - __u8
> +      - ``flags``
> +      - See :ref:`Extended Long-Term RPS Flags <hevc_ext_sps_lt_rps_flags>`
> +
> +.. _hevc_ext_sps_lt_rps_flags:
> +
> +``Extended SPS Long-Term RPS Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
> +      - 0x00000001
> +      - Specifies if the long-term reference picture is used 7.4.3.2.1 "General sequence parameter
> +        set RBSP semantics" of the specification.
> +
> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
> +    Specifies the list of Short-Term reference sets parameters from the SPS.
> +    These parameters are defined according to :ref:`hevc`.
> +    They are described in section 7.4.8 "Short-term reference picture set
> +    semantics" of the specification.
> +    This control is a dynamically sized 1-dimensional array,
> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
> +
> +.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``delta_idx_minus1``
> +      - Specifies the delta compare to the index. See details in section 7.4.8 "Short-term
> +        reference picture set semantics" of the specification.
> +    * - __u8
> +      - ``delta_rps_sign``
> +      - Sign of the delta as specified in section 7.4.8 "Short-term reference picture set
> +        semantics" of the specification.
> +    * - __u16
> +      - ``abs_delta_rps_minus1``
> +      - Absolute delta RPS as specified in section 7.4.8 "Short-term reference picture set
> +        semantics" of the specification.
> +    * - __u8
> +      - ``num_negative_pics``
> +      - Number of short-term RPS entries that have picture order count values less than the
> +        picture order count value of the current picture.
> +    * - __u8
> +      - ``num_positive_pics``
> +      - Number of short-term RPS entries that have picture order count values greater than the
> +        picture order count value of the current picture.
> +    * - __u32
> +      - ``used_by_curr_pic``
> +      - Bit i specifies if short-term RPS i is used by the current picture.
> +    * - __u32
> +      - ``use_delta_flag``
> +      - Bit i specifies if short-term RPS i is included in the short-term RPS entries.
> +    * - __u16
> +      - ``delta_poc_s0_minus1[16]``
> +      - Specifies the negative picture order count delta for the i-th entry in the short-term RPS.
> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
> +        specification.
> +    * - __u16
> +      - ``delta_poc_s1_minus1[16]``
> +      - Specifies the positive picture order count delta for the i-th entry in the short-term RPS.
> +        See details in section 7.4.8 "Short-term reference picture set semantics" of the
> +        specification.
> +    * - __u8
> +      - ``flags``
> +      - See :ref:`Extended Short-Term RPS Flags <hevc_ext_sps_st_rps_flags>`
> +
> +.. _hevc_ext_sps_st_rps_flags:
> +
> +``Extended SPS Short-Term RPS Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED``
> +      - 0x00000001
> +      - Specifies if the short-term RPS is predicted from another short term RPS. See details in
> +        section 7.4.8 "Short-term reference picture set semantics" of the specification.
> +
>  .. _v4l2-codec-stateless-av1:
>  
>  ``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> index c41693115db6..6182b4e2d2ee 100644
> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> @@ -150,6 +150,8 @@ replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`V4L.v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_ctrl_type`
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index c8baa9430c14..82c8b52e771c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -531,6 +531,18 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
>  	decoding parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_lt_rps`, containing HEVC
> +	extended Long-Term RPS for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_hevc_ext_sps_st_rps`, containing HEVC
> +	extended Short-Term RPS for stateless video decoders.
>      * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
>        - n/a
>        - n/a


