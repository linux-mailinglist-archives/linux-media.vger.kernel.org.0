Return-Path: <linux-media+bounces-42831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D09EFB8CC99
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 18:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1B95617A9
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 16:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732CC2F0C5C;
	Sat, 20 Sep 2025 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="eg7fqqUS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54D2AE90
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758385436; cv=none; b=UKvdHNrxIjB+5+NtaItfm/gncLKbfvk57dc8W49KNikK4TEvdo7SxYD94a6vswcexO4oiGBf3gwM56dW/U5rwmdtF5Zv9PFoUet0I/g1ESfxJyXIgyGQZvN4pk6D6g40zcMTFcYFsHLnRy3yEZN4ZekBX8r323WF8w9jzfo9hNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758385436; c=relaxed/simple;
	bh=KkYmBMccXCkZYp+wDBH/vHfvOsRBM6K6iSd1B/rfwfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP6c8eVDtCb2L7tDcMz5ldvuOQlMiYyVgmtdogeNabCwccdSLusHEQi3w580uv3vsLfuq/WmaDa4/AHTci9CkT7O4xr6oPI2uLN3Fa5PFoaXDRsAE90fGhka+ZM3xNrUNTdv83CRB5W/qTtpS+LOS9Gwgk5ybzO/O1dvJRlEeLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=eg7fqqUS; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1758385432;
 bh=sStQgpFpatTI3PbP7WquxJfXXTB3wwCSrxR2yVmtcGA=;
 b=eg7fqqUSc4KyIg3mVxuzKWVjnuUlqXVjOgTEPPaxL4HB31xqW6q5rf71S7rqueFRQT2Nat7EM
 7ssyugxbsQ6CxVJpLO+Di+nuEfTmOmeN7KDSFdpYalbZNJbKftE/sBYlhtCgDwJURaKTK94TU6A
 ahcHeM5wsqx/S3cFPQcejQ+afLXcX4EY7CbYXt8g1SbSXOrsdaFpdCvjINwdKpRVze27WuFORjM
 0m0HHZwQ8Feazjufmwk+5hAhbkodtgBuPgf4nDKK8dE4arxNb9we/5CJ7XB3SVHtk/lJxt+OcwO
 SloKIEADQsdmxq3StKZ2NFNb/v/OZVsMRAjblj5cuhoQ==
X-Forward-Email-ID: 68ced5159c5715b3f5de0074
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <60353116-98cd-48f7-9f91-b2e51f2ff813@kwiboo.se>
Date: Sat, 20 Sep 2025 18:23:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the VDPU381
 variant
To: Diederik de Haas <didi.debian@cknow.org>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-12-detlev.casanova@collabora.com>
 <DCXPZ9JSN7H2.3B76IQI8N4O6H@cknow.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <DCXPZ9JSN7H2.3B76IQI8N4O6H@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Diederik and Detlev,

On 9/20/2025 5:07 PM, Diederik de Haas wrote:
> Hi again,
> 
> I think I've found a similar issue here as I did for H264.
> 
> On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
>> The VDPU381 supports HEVC decoding up to 7680x4320@30fps.
>> It could double that when using both decoder cores.
>>
>> It support YUV420 (8 and 10 bits) as well as AFBC (not implemented
>> here)
>>
>> The fluster score is 146/147 for JCT-VC-HEVC_V1, tested on ROCK 5B.
>> None of the other test suites works.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>  .../media/platform/rockchip/rkvdec/Kconfig    |    1 +
>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +
>>  .../platform/rockchip/rkvdec/rkvdec-cabac.c   | 3435 +++++++++++++++++
>>  .../rockchip/rkvdec/rkvdec-hevc-common.c      |  546 +++
>>  .../rockchip/rkvdec/rkvdec-hevc-common.h      |  101 +
>>  .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  596 +++
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   81 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>  8 files changed, 4763 insertions(+)
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
>> index 5f3bdd848a2cf..3303b0ce32809 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
>> +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
>> @@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_VDEC
>>  	select VIDEOBUF2_VMALLOC
>>  	select V4L2_MEM2MEM_DEV
>>  	select V4L2_H264
>> +	select V4L2_HEVC
>>  	select V4L2_VP9
>>  	help
>>  	  Support for the Rockchip Video Decoder IP present on Rockchip SoCs,
>>
>> ...
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index dab34a2322c95..cd01f1e41beb5 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -257,6 +257,60 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
>>  	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
>>  };
>>  
>> +static const struct rkvdec_ctrl_desc rkvdec_hevc_ctrl_descs[] = {
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_SPS,
>> +		.cfg.ops = &rkvdec_ctrl_ops,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_PPS,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>> +		.cfg.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> +		.cfg.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> +		.cfg.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_START_CODE,
>> +		.cfg.min = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> +		.cfg.def = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> +		.cfg.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> +		.cfg.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> +		.cfg.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>> +		.cfg.menu_skip_mask =
>> +			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>> +		.cfg.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> +		.cfg.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>> +		.cfg.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
>> +		.cfg.dims = { 65 },
>> +	},
>> +	{
>> +		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
>> +		.cfg.dims = { 65 },
>> +	},
>> +};
>> +
>> +static const struct rkvdec_ctrls rkvdec_hevc_ctrls = {
>> +	.ctrls = rkvdec_hevc_ctrl_descs,
>> +	.num_ctrls = ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>> +};
>> +
>>  static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
>>  	{
>>  		.fourcc = V4L2_PIX_FMT_NV12,
>> @@ -276,6 +330,17 @@ static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
>>  	},
>>  };
>>  
>> +static const struct rkvdec_decoded_fmt_desc rkvdec_hevc_decoded_fmts[] = {
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_NV12,
>> +		.image_fmt = RKVDEC_IMG_FMT_420_8BIT,
>> +	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_NV15,
>> +		.image_fmt = RKVDEC_IMG_FMT_420_10BIT,
>> +	},
>> +};
>> +
>>  static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
>>  	{
>>  		.cfg.id = V4L2_CID_STATELESS_VP9_FRAME,
>> @@ -354,6 +419,22 @@ static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
>>  		.decoded_fmts = rkvdec_h264_decoded_fmts,
>>  		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>  	},
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_HEVC_SLICE,
>> +		.frmsize = {
>> +			.min_width = 16,
>> +			.max_width = 65472,
>> +			.step_width = 16,
>> +			.min_height = 16,
>> +			.max_height = 65472,
>> +			.step_height = 16,
>> +		},
> 
> In the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image size" :
> 64x64 to 65472x65472; step size 16 pixels
> 
> So I think .min_width and .min_height should be 64, not 16.

This should probably be changed to use min/max of 64 together with use
of 64 as step_width. With that we should not really need the special
vdpu38x_fill_pixfmt_mp, if I am not mistaken.

Use of 64 aligned buffers was introduced to correctly align buffers for
H264 hi10 and 10-bit HEVC, I currently do not see any reason why we need
to do something different for "rkvdec2".

Regards,
Jonas

> 
> Cheers,
>   Diederik
> 
>> +		.ctrls = &rkvdec_hevc_ctrls,
>> +		.ops = &rkvdec_vdpu381_hevc_fmt_ops,
>> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>> +		.decoded_fmts = rkvdec_hevc_decoded_fmts,
>> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> +	},
>>  };
>>  
>>  static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] = {
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index acb9d72b130bb..df56bc0516ac9 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -173,6 +173,7 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
>>  
>>  /* VDPU381 ops */
>>  extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
>> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops;
>>  
>>  /* VDPU383 ops */
>>  extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops;
> 


