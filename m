Return-Path: <linux-media+bounces-14235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFAF91A2D4
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 11:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2C51C21FBC
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 09:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870F313B2A2;
	Thu, 27 Jun 2024 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="JfCH5f3t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF3213AD09
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719481351; cv=none; b=utyVnzUz+97FLams8CBIZ8A7owpc55yDn6vG9O2t62sA4Zffi4Jdu4f3ihH36/yN+NLx+VdG6foNMixwl96rKSCSNNyC5E6c1GHPjgvuhwPoSGp4n0qJuZoF2P1Mn04oCmdhOc0/zEXpxnjkOeeJpEIlUTG8XVvOSEF/IncDFrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719481351; c=relaxed/simple;
	bh=ZuoDE2MG53dsUuVknhx3SUDT8t21/nbJxSmQX8kdLxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kN7lQsPFzR4fWyY08BD996VCB22S2cmI8t5NrowZF3GwwtEZv2L9Zjs4cnXZVOCMPlWazFCodgepDUDmKGqhPLnrwYpfEvXkNiBeZo9JvIpXO7NtpP53NPp2pmAwhY5/ETe/GM8MwRGbRRBV2idLBf4fIQQOYBpVbLiigYLz5uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=JfCH5f3t; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1719481325;
 bh=pPYFVje1r+HYsCjYPcRBSOHBi4Zt6cCnJxZ7IHyg1b4=;
 b=JfCH5f3tadgbG2TogQu7CO0yMeDqiYbljtQlgzE8XC0n8fXQa04G2uhMuIpVHzw8DZxc+FgTz
 OAXIKVkxvLsPvG+t2rt/jyH/FLlso+Mw5i146PtaBzwXNs7v/poFXNu/lx4y7SuWpK3VFFCWUzW
 G3AIQRUrJ6VeWcr4AY3LL+Xy7VzEchh2TA7WvkzWZWpjywDU3vV3jGOnaixgF+JVZuLZganuhsQ
 aak+P+dkiReRkLbBmG0V79MW0Af0//TpuIbQrHy8crwk3MGiTqtRQYeUEdiUg9glhr/t8h7hgix
 C2yMl9E3DxEDHnFvtOoiUmodYu0Mt82byBuNIesYM7GA==
Message-ID: <66e56996-4b56-4262-973f-672121071391@kwiboo.se>
Date: Thu, 27 Jun 2024 11:41:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: rockchip: Introduce the rkvdec2 driver
To: Alex Bee <knaerzche@gmail.com>, Detlev Casanova
 <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Dragan Simic
 <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>, Andy Yan
 <andy.yan@rock-chips.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-3-detlev.casanova@collabora.com>
 <c7882f94-e2cb-4023-a53e-87ebc8fa3460@gmail.com> <3815203.kQq0lBPeGt@arisu>
 <5a15b138-4e03-4487-8a53-b7ff3527701f@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <5a15b138-4e03-4487-8a53-b7ff3527701f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 667d33ea9aa1b906e1d3e3f3

Hi Alex,

On 2024-06-26 11:12, Alex Bee wrote:
> Hi Detlev,
> 
> Am 25.06.24 um 18:56 schrieb Detlev Casanova:
>> Hi Alex,
>>
>> On Sunday, June 23, 2024 5:33:28 A.M. EDT you wrote:
>>> Hi Detlev,
>>>
>>> Am 20.06.24 um 16:19 schrieb Detlev Casanova:
>>>> This driver supports the second generation of the Rockchip Video
>>>> decoder, also known as vdpu34x.
>>>> It is currently only used on the RK3588(s) SoC.
>>>>
>>>> There are 2 decoders on the RK3588 SoC that can work in pair to decode
>>>> 8K video at 30 FPS but currently, only using one core at a time is
>>>> supported.
>>>>
>>>> Scheduling requests between the two cores will be implemented later.
>>>>
>>>> The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
>>>> currently only supports H264.
>>>>
>>>> The driver is based on rkvdec and they may share some code in the
>>>> future.
>>>> The decision to make a different driver is mainly because rkvdec2 has
>>>> more features and can work with multiple cores.
>>>>
>>>> The registers are mapped in a struct in RAM using bitfields. It is IO
>>>> copied to the HW when all values are configured.
>>>> The decision to use such a struct instead of writing buffers one by one
>>>>
>>>> is based on the following reasons:
>>>>    - Rockchip cores are known to misbehave when registers are not written
>>>>    
>>>>      in address order,
>>>>    
>>>>    - Those cores also need the software to write all registers, even if
>>>>    
>>>>      they are written their default values or are not related to the task
>>>>      (this core will not start decoding some H264 frames if some VP9
>>>>      registers are not written to 0)
>>>>    
>>>>    - In the future, to support multiple cores, the scheduler could be
>>>>    
>>>>      optimized by storing the precomputed registers values and copy them
>>>>      to the HW as soos as a core becomes available.
>>>>
>>>> This makes the code more readable and may bring performance improvements
>>>> in future features.
>>>>
>>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>>> ---
>>>>
>>>>    drivers/staging/media/Kconfig                |    1 +
>>>>    drivers/staging/media/Makefile               |    1 +
>>>>    drivers/staging/media/rkvdec2/Kconfig        |   15 +
>>>>    drivers/staging/media/rkvdec2/Makefile       |    3 +
>>>>    drivers/staging/media/rkvdec2/TODO           |    9 +
>>>>    drivers/staging/media/rkvdec2/rkvdec2-h264.c |  739 +++++++++++
>>>>    drivers/staging/media/rkvdec2/rkvdec2-regs.h |  345 +++++
>>>>    drivers/staging/media/rkvdec2/rkvdec2.c      | 1253 ++++++++++++++++++
>>>>    drivers/staging/media/rkvdec2/rkvdec2.h      |  130 ++
>>>>    9 files changed, 2496 insertions(+)
>>>>    create mode 100644 drivers/staging/media/rkvdec2/Kconfig
>>>>    create mode 100644 drivers/staging/media/rkvdec2/Makefile
>>>>    create mode 100644 drivers/staging/media/rkvdec2/TODO
>>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
>>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
>>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
>>>>    create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h
>>> ...
>>>
>>>> +static inline void rkvdec2_memcpy_toio(void __iomem *dst, void *src,
>>>> size_t len) +{
>>>> +#ifdef CONFIG_ARM64
>>>> +	__iowrite32_copy(dst, src, len);
>>>> +#elif defined(CONFIG_ARM)
>>> I guess that can get an "#else" since memcpy_toio exists for all archs.
>>>
>>>> +	memcpy_toio(dst, src, len);
>>>> +#endif
>>>> +}
>>>> +
>>> ...
>>>
>>>> +	/* Set timeout threshold */
>>>> +	if (pixels < RKVDEC2_1080P_PIXELS)
>>>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_1080p;
>>>> +	else if (pixels < RKVDEC2_4K_PIXELS)
>>>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_4K;
>>>> +	else if (pixels < RKVDEC2_8K_PIXELS)
>>>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;
>>>> +
>>> Did you test if it works with anything > 8K? If so, you propably want to
>>> make the check above
>>>
>>> +	else
>>> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;
>>>
>>> Otherwise the timeout may not be set/contain invalid values from any former
>>> stream.
>> That's right, but it would be set to 0 because of the memset.
>> RKVDEC2_TIMEOUT_8K might not be enough for bigger frame sizes, so I'll set it
>> to the maximum value (0xffffffff) when frames are bigger than 8K and also adapt
>> the watchdog time: RKVDEC2_TIMEOUT_8K is around 100 ms, but 0xffffffff is arnoud
>> 5.3 seconds (reg032/axi_clock_freq)
>>
>> I'll do more tests with this as well.
>>
>>> ...
>>>
>>>> +
>>>> +static const struct rkvdec2_coded_fmt_desc rkvdec2_coded_fmts[] = {
>>>> +	{
>>>> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>>>> +		.frmsize = {
>>>> +			.min_width = 16,
>>>> +			.max_width =  65520,
>>>> +			.step_width = 16,
>>>> +			.min_height = 16,
>>>> +			.max_height =  65520,
>>>> +			.step_height = 16,
>>>> +		},
>>>> +		.ctrls = &rkvdec2_h264_ctrls,
>>>> +		.ops = &rkvdec2_h264_fmt_ops,
>>>> +		.num_decoded_fmts =
>> ARRAY_SIZE(rkvdec2_h264_decoded_fmts),
>>>> +		.decoded_fmts = rkvdec2_h264_decoded_fmts,
>>>> +		.subsystem_flags =
>> VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>>> +	},
>>>> +};
>>>> +
>>> Note, that this is also given to userspace (VIDIOC_ENUM_FRAMESIZES) and
>>> this is already incorrect in the old rkvdec driver (and hantro): From
>>> userspace perspective we do not have a restriction in
>>> step_width/step_width, as we are aligning any given width/height to HW
>>> requirements in the driver - what we should give to userspace is
>>> fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS; fsize->stepwise.min_height =
>>> 1; fsize->stepwise.min_width = 1; fsize->stepwise.max_height = 65520;
>>> fsize->stepwise.max_width = 65520;
>> Is fsize->stepwise.min_height = 1; and fsize->stepwise.min_width = 1 correct ?
>> Or do you mean fsize->stepwise.step_height = 1; and fsize->stepwise.setp_width
>> = 1 ?
>>
>> It would give this instead:
>>
>> .frmsize = {
>> 	.min_width = 16,
>> 	.max_width =  65520,
>> 	.step_width = 1,
>> 	.min_height = 16,
>> 	.max_height =  65520,
>> 	.step_height = 1,
>> },
>>
>> and .vidioc_enum_framesizes sets fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> You can't adapt this here, because this .frmsize is also given to the
> v4l2_apply_frmsize_constraints helper, which does the actual alignment to
> HW requirements and requires the HW step_with and step_height.
> IIRC, we also align framesizes which are below minimum HW requirement, at
> least in rkvdec1 driver and it looks a lot like this is done here the same:
> so this should be .min_height = 1 and .min_width = 1. (I remember because
> there are VP9 conformance tests with very small framesizes). And yes, it
> looks like you've had to set .step_width and .step_height to 1 for
> V4L2_FRMSIZE_TYPE_CONTINUOUS, not sure why that is required.
> 
> So, imho, the final rkvdec2_enum_framesizes should look like
> 
> +static int rkvdec2_enum_framesizes(struct file *file, void *priv,
> +                   struct v4l2_frmsizeenum *fsize)
> ....
> +    fmt = rkvdec2_find_coded_fmt_desc(fsize->pixel_format);
> +    if (!fmt)
> +        return -EINVAL;
> +
> +    fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +    fsize->stepwise.min_height = 1;
> +    fsize->stepwise.max_height = fmt->frmsize.max_height;
> +    fsize->stepwise.min_width = 1;
> +    fsize->stepwise.max_width = fmt->frmsize.max_width;
> +    fsize->stepwise.min_width = 1;
> +    fsize->stepwise.step_height = 1;
> +    fsize->stepwise.step_width = 1;
> +    return 0;
> +}
> 
> Note: Not even build tested :)
> Jonas: maybe you can add a fixup patch to your rkvdec patches as well.

Thanks, will take a closer look and include something for rkvdec high10
v6 later today/tomorrow.

Regards,
Jonas

> 
> Regards,
> 
> Alex
> 
>>> I guess this new driver should be an
>>> opportunity to fix that and distinguish between internal and external
>>> frame size requirements and the .vidioc_enum_framesizes callback should
>>> adapted accordingly. Regards, Alex
>> Detlev.


