Return-Path: <linux-media+bounces-43340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB88BA93BE
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 14:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41D716C50B
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 12:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA94301004;
	Mon, 29 Sep 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="il1zHjha"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5F34BA40;
	Mon, 29 Sep 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759150068; cv=pass; b=Qd4uscBDoWMUBKkANUOCxZuv92VH6Ab4gTelp7D7yZLRINyBbqUnKnk4PN9BxWR6KnFZLxscR5G+T8E2CNWDkgREMksRzpju4CL5X4lH2kFefRoPcGGdnQdv3VDIIuwZ6+U4NF+BKCcK8sMxmuEYpg0mNFrjGVKbHCZ84QeRgOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759150068; c=relaxed/simple;
	bh=7NYKfkWS1mtMKZBN5AvkG1EKJDRnaW+UdSg0YinTlbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gc8ttlz1PorZWOzO3jLGhc9Qx3gICtQzXNW6eNcIRVzFwlChNKvE4Wq4SFPMuPyWG6RD3Om4O2kUbr6ODV9x9RqYWDE8kJLB3XWQfBvuRYvMgUAyOwxTun5q0d1sTt30xgryFPc62Aycx60DM+BrXIpJdL01D2uX63OAdohJwM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=il1zHjha; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759150047; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n/vEwH+icZvAJ+wPzCv3oMoOoJXMpjE6uyaRXrEdinYA5mUpUfd1RSxQHi1WRgkfBb3kfGtw8C+IEiliFF45xYRimVF48MHqSD2JUeUgdcQ+Qr2ldFocfgtRMpEEqim0kV0bHtWnsDVXZQLaGMhI1QFbHpf5tuz6+3SUSDnJbGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759150047; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eM9Sb17d2wXHQmFbrZTrBs7g3dLHXZeM4mN9jnHjrl0=; 
	b=Vmv/WoItTpQS0hRkpFSlxbfmbmZ/B3aYli3H6mgY9rqjcLZyIYCPxRXcciSvwPHVkPlBVVAB8TQ7dD1rXRVavmNSRRa25u9eMfYRJ1xbIG0ha8h0lU8/Hkmkml/6jIWS58/z2tdzHq0p8TwjKM4AsiyzTPhys2AiE3UpGyFPfjQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759150047;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eM9Sb17d2wXHQmFbrZTrBs7g3dLHXZeM4mN9jnHjrl0=;
	b=il1zHjhaaXVDFOdcexPGAxw/XiOtxreugDTpWq4k8JnCRu8KWgdyfr0agmmzKv/H
	EXZW4UdY7Mt/Eb4LxlZflVvqlBR/o6GzU8xepxcJ4Q2nueSKZZTVhwcXL76MJ8F2192
	gpiWbG6d/gdCP/Aq6ihti5lycHI6eQ2xrInKzagg=
Received: by mx.zohomail.com with SMTPS id 1759150044812903.0717172368667;
	Mon, 29 Sep 2025 05:47:24 -0700 (PDT)
Message-ID: <969d4f9d-457e-4188-8741-8d88dda59dc9@collabora.com>
Date: Mon, 29 Sep 2025 08:47:22 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the VDPU381
 variant
To: Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-12-detlev.casanova@collabora.com>
 <DCXPZ9JSN7H2.3B76IQI8N4O6H@cknow.org>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <DCXPZ9JSN7H2.3B76IQI8N4O6H@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Diederik

Thanks for spotting that ! I'll change it in the next patch set :)

Detlev.

On 9/20/25 11:07, Diederik de Haas wrote:
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
>>   .../media/platform/rockchip/rkvdec/Kconfig    |    1 +
>>   .../media/platform/rockchip/rkvdec/Makefile   |    2 +
>>   .../platform/rockchip/rkvdec/rkvdec-cabac.c   | 3435 +++++++++++++++++
>>   .../rockchip/rkvdec/rkvdec-hevc-common.c      |  546 +++
>>   .../rockchip/rkvdec/rkvdec-hevc-common.h      |  101 +
>>   .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  596 +++
>>   .../media/platform/rockchip/rkvdec/rkvdec.c   |   81 +
>>   .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>   8 files changed, 4763 insertions(+)
>>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
>>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
>>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
>> index 5f3bdd848a2cf..3303b0ce32809 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/Kconfig
>> +++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
>> @@ -8,6 +8,7 @@ config VIDEO_ROCKCHIP_VDEC
>>   	select VIDEOBUF2_VMALLOC
>>   	select V4L2_MEM2MEM_DEV
>>   	select V4L2_H264
>> +	select V4L2_HEVC
>>   	select V4L2_VP9
>>   	help
>>   	  Support for the Rockchip Video Decoder IP present on Rockchip SoCs,
>>
>> ...
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index dab34a2322c95..cd01f1e41beb5 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -257,6 +257,60 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
>>   	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
>>   };
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
>>   static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_NV12,
>> @@ -276,6 +330,17 @@ static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
>>   	},
>>   };
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
>>   static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
>>   	{
>>   		.cfg.id = V4L2_CID_STATELESS_VP9_FRAME,
>> @@ -354,6 +419,22 @@ static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
>>   		.decoded_fmts = rkvdec_h264_decoded_fmts,
>>   		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>   	},
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
> In the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image size" :
> 64x64 to 65472x65472; step size 16 pixels
>
> So I think .min_width and .min_height should be 64, not 16.
>
> Cheers,
>    Diederik
>
>> +		.ctrls = &rkvdec_hevc_ctrls,
>> +		.ops = &rkvdec_vdpu381_hevc_fmt_ops,
>> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>> +		.decoded_fmts = rkvdec_hevc_decoded_fmts,
>> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> +	},
>>   };
>>   
>>   static const struct rkvdec_coded_fmt_desc vdpu383_coded_fmts[] = {
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index acb9d72b130bb..df56bc0516ac9 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -173,6 +173,7 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
>>   
>>   /* VDPU381 ops */
>>   extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
>> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_hevc_fmt_ops;
>>   
>>   /* VDPU383 ops */
>>   extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_ops;

