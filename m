Return-Path: <linux-media+bounces-40041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9CB29438
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 18:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E993AA69F
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 16:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4462FFDC3;
	Sun, 17 Aug 2025 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="yyyjtaI2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B225285075
	for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755448753; cv=none; b=u1sH5ggUenKr1l5hPM6GieZBdvb+XxuEMyHEu51NfSa75BrFbxEO5uthszL4PpG+vESHRGLDi+qwbHjOyiDzIrly0xRBiHMsRl/1evYChDU3euoysmQyosuxAqd7HIiMKO4hpq/x/sbgtgZ71+Mpl+j1++eJQVWIkWP/ds0oaOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755448753; c=relaxed/simple;
	bh=ofYhjUoAlAyPP/6FEwfCDG8+B81fn+SScA24kECzTOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQs8QIW3kmjg6sz3kMdeqc5WLDDD+0HcSRF7nZ5tpETvES7OeEBQj5M3XUNTaaNcq5McSecL1X7NF53lvphZ8Zua0xdjaz8Sz65QG1xfNNfqdVFPiy5BxGw8iwrn1/+FUMe6l4gGQQRS2mrgbkGqpHioEd/XBIm2Ycy5jxy703s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=yyyjtaI2; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1755448749;
 bh=K+oe7LSc6cLOZKagroUHhRzFusGZANhQcBMhRCIl2z8=;
 b=yyyjtaI2OrYNYLbkYliN4Rthw7LqAzd75i2lD1Iru0b/qH2OhSLNnW0h0Q8A4u/73vsk/ElLd
 gTJi6aC1F3YX/Vkqg4oLhdU/MsshSK4Hd6zGdKP9SLfiqv1x1/031bjCqBVO2iJecHCeIeyTkJ7
 cwxSYdVVYMYhxDbNpO4qOQRgcMG9PplnzlRoyvaQuNNS48yFmK1eiWME7lHsJiq52PpPQsUbzvx
 HhnxEp3B2wrREAmV8CPLk1/qRfSTRygy3VmuAe/SqUG7shWBZDOAR2U9GtpSrpFU4gXeAF+w0DK
 NbD/9GBe05PhX1X9j/EoLCSOo7nyLDLMHTpYhCCwvIEg==
X-Forward-Email-ID: 68a205a99a82a81f459cf8d7
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d7446ed8-4af1-475f-88e0-07025c60d0b1@kwiboo.se>
Date: Sun, 17 Aug 2025 18:39:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <4b3c409b-5f10-4aa0-996f-1dc2d28816ef@kwiboo.se>
 <d180f611d37a85017044cbaf003d140807bf5a97.camel@collabora.com>
 <13998356.uLZWGnKmhe@earth>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <13998356.uLZWGnKmhe@earth>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Detlev,

On 8/12/2025 9:54 PM, Detlev Casanova wrote:
> On Tuesday, 12 August 2025 09:07:33 EDT Nicolas Dufresne wrote:
>> Le mardi 12 août 2025 à 02:58 +0200, Jonas Karlman a écrit :
>>> Hi Nicolas,
>>>
>>> On 8/11/2025 11:07 PM, Nicolas Dufresne wrote:
>>>> First pass of review,
>>>>
>>>> There is obvious conflict between Detlev RK3388/3576 series, please
>>>> coordinate. By picking the same direction, the common code can be split
>>>> from platform code, and then both sets can share that common code and
>>>> avoid conflicts.> 
>>> Yes, it is very unfortunate that Detlev did not base the work on v1 of
>>> this series, this has been sitting idle on the list for almost 2 years
>>> only waiting on its dependent H264 High10/4:2:2 series to be merged.
>>>
>>> Most feedback for v1 was related to unstaging and the series could be
>>> applied clean until iommu detach/attach was introduced very recently.
>>>
>>> This series has also been referenced in multiple threads related to
>>> rkvdec2 work, most recent at [1]. Unfortunately, I have missed both v1
>>> and v2 of Detlev's new rkvdec2 series, and was not able to send a v2 of
>>> this until now due to family tragedy.
>>>
>>> I will take a closer look at Detlev's new rkvdec2 series and see what I
>>> can do in a v3 to ease any merge conflicts.
>>
>> All in all, I'd like to have both of these series ready for 6.18. To avoid
>> the need for dependant series, I can pick top patches if the preparation is
>> properly split from the platform specific code. Please make you
>> recommendation.
>>
>> My main concern at the moment is the back and forth from register to
>> structure, Detlev already ported everything else to structures, so porting
>> a single codec for a single SoC seems like the least amount of work. I'd
>> like to ear if any of you would be willing to convert it. This way I can
>> land the conversion early, and we remove one massive clash between the two
>> sets.
> 
> The conversion won't be too difficult to manage, I can do it as I did for h264 
> and add that to my serie over this one.

Thanks, I very much appreciate that!, I won't have time to look into a
conversion until at earliest next weekend.

> 
> As my series is already doing a conversion, I'm not against keeping this one 
> without structs and simply do the conversion later, even if that means merging 
> code we know will change later.
> 
> I'd also like to mention that currently, my serie changes the writel to 
> structs only for the registers, not for PPS and SPS.
> So I don't mind keeping that part as is for rkvdec-hevc.
> 
> For the variants support, I can also merge in my changes: my rkvdec_config 
> would just become an extention your rkvdec_variant.
> 
> Finally, this series has been here for longer than mine, so it's only fair to 
> have me rebase mine, especially because it means doing a bit more of what I 
> already did.

Great, I will try to get a v3 out in next few days after addressing some
of the feedback.

Regards,
Jonas

> 
> Regards,
> Detlev.
> 
>>> [1]
>>> https://lore.kernel.org/linux-media/a787e6e0-d4ce-45e3-8263-2489585d3ec0@
>>> kwiboo.se/> 
>>>> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>>>>> The Rockchip VDEC supports the HEVC codec with the Main and Main10
>>>>> Profile up to Level 5.1 High tier: 4096x2304@60 fps.
>>>>>
>>>>> Add the backend for HEVC format to the decoder.
>>>>>
>>>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>>>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Use new_value in transpose_and_flatten_matrices()
>>>>> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
>>>>> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
>>>>> ---
>>>>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>>>>>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848
>>>>> +++++++++++++++++
>>>>>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  817 ++++++++
>>>>>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    2 +
>>>>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   76 +
>>>>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>>>>  6 files changed, 2745 insertions(+), 1 deletion(-)
>>>>>  create mode 100644
>>>>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c create mode
>>>>> 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>>>
>>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile
>>>>> b/drivers/media/platform/rockchip/rkvdec/Makefile index
>>>>> cb86b429cfaa..a77122641d14 100644
>>>>> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
>>>>> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
>>>>> @@ -1,3 +1,3 @@
>>>>>  obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += rockchip-vdec.o
>>>>>  
>>>>> -rockchip-vdec-y += rkvdec.o rkvdec-h264.o rkvdec-vp9.o
>>>>> +rockchip-vdec-y += rkvdec.o rkvdec-h264.o rkvdec-hevc.o rkvdec-vp9.o
>>>
>>> [snip]
>>>
>>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c new file mode
>>>>> 100644
>>>>> index 000000000000..1994ea24f0be
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>>> @@ -0,0 +1,817 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Rockchip Video Decoder HEVC backend
>>>>> + *
>>>>> + * Copyright (C) 2023 Collabora, Ltd.
>>>>> + *      Sebastian Fricke <sebastian.fricke@collabora.com>
>>>>> + *
>>>>> + * Copyright (C) 2019 Collabora, Ltd.
>>>>> + *	Boris Brezillon <boris.brezillon@collabora.com>
>>>>> + *
>>>>> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
>>>>> + *	Jeffy Chen <jeffy.chen@rock-chips.com>
>>>>> + */
>>>>> +
>>>>> +#include <media/v4l2-mem2mem.h>
>>>>> +
>>>>> +#include "rkvdec.h"
>>>>> +#include "rkvdec-regs.h"
>>>>> +#include "rkvdec-hevc-data.c"
>>>>> +
>>>>> +/* Size in u8/u32 units. */
>>>>> +#define RKV_SCALING_LIST_SIZE		1360
>>>>> +#define RKV_PPS_SIZE			(80 / 4)
>>>>> +#define RKV_PPS_LEN			64
>>>>> +#define RKV_RPS_SIZE			(32 / 4)
>>>>> +#define RKV_RPS_LEN			600
>>>>> +
>>>>> +struct rkvdec_sps_pps_packet {
>>>>> +	u32 info[RKV_PPS_SIZE];
>>>>> +};
>>>>> +
>>>>> +struct rkvdec_rps_packet {
>>>>> +	u32 info[RKV_RPS_SIZE];
>>>>> +};
>>>>> +
>>>>> +struct rkvdec_ps_field {
>>>>> +	u16 offset;
>>>>> +	u8 len;
>>>>> +};
>>>>> +
>>>>> +#define PS_FIELD(_offset, _len) \
>>>>> +	((struct rkvdec_ps_field){ _offset, _len })
>>>>> +
>>>>> +/* SPS */
>>>>> +#define VIDEO_PARAMETER_SET_ID				PS_FIELD(0, 
> 4)
>>>>> +#define SEQ_PARAMETER_SET_ID				PS_FIELD(4, 
> 4)
>>>>> +#define CHROMA_FORMAT_IDC				PS_FIELD(8, 
> 2)
>>>>> +#define PIC_WIDTH_IN_LUMA_SAMPLES			PS_FIELD(10, 
> 13)
>>>>> +#define PIC_HEIGHT_IN_LUMA_SAMPLES			PS_FIELD(23, 
> 13)
>>>>> +#define BIT_DEPTH_LUMA					
> PS_FIELD(36, 4)
>>>>> +#define BIT_DEPTH_CHROMA				PS_FIELD(40, 
> 4)
>>>>> +#define LOG2_MAX_PIC_ORDER_CNT_LSB			PS_FIELD(44, 
> 5)
>>>>> +#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	PS_FIELD(49, 2)
>>>>> +#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			PS_FIELD(51, 
> 3)
>>>>> +#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			PS_FIELD(54, 
> 3)
>>>>> +#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	PS_FIELD(57, 
> 2)
>>>>> +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		PS_FIELD(59, 
> 3)
>>>>> +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		PS_FIELD(62, 
> 3)
>>>>> +#define SCALING_LIST_ENABLED_FLAG			
> PS_FIELD(65, 1)
>>>>> +#define AMP_ENABLED_FLAG				PS_FIELD(66, 
> 1)
>>>>> +#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		
> PS_FIELD(67, 1)
>>>>> +#define PCM_ENABLED_FLAG				PS_FIELD(68, 
> 1)
>>>>> +#define PCM_SAMPLE_BIT_DEPTH_LUMA			PS_FIELD(69, 
> 4)
>>>>> +#define PCM_SAMPLE_BIT_DEPTH_CHROMA			PS_FIELD(73, 
> 4)
>>>>> +#define PCM_LOOP_FILTER_DISABLED_FLAG			
> PS_FIELD(77, 1)
>>>>> +#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	PS_FIELD(78, 
> 3)
>>>>> +#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		PS_FIELD(81, 
> 3)
>>>>> +#define NUM_SHORT_TERM_REF_PIC_SETS			PS_FIELD(84, 
> 7)
>>>>> +#define LONG_TERM_REF_PICS_PRESENT_FLAG			
> PS_FIELD(91, 1)
>>>>> +#define NUM_LONG_TERM_REF_PICS_SPS			PS_FIELD(92, 
> 6)
>>>>> +#define SPS_TEMPORAL_MVP_ENABLED_FLAG			PS_FIELD(98, 
> 1)
>>>>> +#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		PS_FIELD(99, 
> 1)
>>>>
>>>> Detlev is moving to structures and memcpy, with a minor performance
>>>> gain, this is the way to go, I can understand if this is quite
>>>> involving, but one of you will have to do it.
>>>
>>> Sure, and this was the the main reason why I mentioned this incoming
>>> series back in [1], to consider this series before doing too much
>>> re-work on a future rkvdec1 + rkvdec2 merge series.
>>>
>>> As mentioned above, I will take a closer look at Detlev's new rkvdec2
>>> series and see what I can do in a v3 to ease any merge conflicts.
>>>
>>>>> +/* PPS */
>>>>> +#define PIC_PARAMETER_SET_ID				
> PS_FIELD(128, 6)
>>>>> +#define PPS_SEQ_PARAMETER_SET_ID			
> PS_FIELD(134, 4)
>>>>> +#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		
> PS_FIELD(138, 1)
>>>>> +#define OUTPUT_FLAG_PRESENT_FLAG			
> PS_FIELD(139, 1)
>>>>> +#define NUM_EXTRA_SLICE_HEADER_BITS			
> PS_FIELD(140, 13)
>>>>> +#define SIGN_DATA_HIDING_ENABLED_FLAG			
> PS_FIELD(153, 1)
>>>>> +#define CABAC_INIT_PRESENT_FLAG				
> PS_FIELD(154, 1)
>>>>> +#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			
> PS_FIELD(155, 4)
>>>>> +#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			
> PS_FIELD(159, 4)
>>>>> +#define INIT_QP_MINUS26					
> PS_FIELD(163, 7)
>>>>> +#define CONSTRAINED_INTRA_PRED_FLAG			
> PS_FIELD(170, 1)
>>>>> +#define TRANSFORM_SKIP_ENABLED_FLAG			
> PS_FIELD(171, 1)
>>>>> +#define CU_QP_DELTA_ENABLED_FLAG			
> PS_FIELD(172, 1)
>>>>> +#define LOG2_MIN_CU_QP_DELTA_SIZE			
> PS_FIELD(173, 3)
>>>>> +#define PPS_CB_QP_OFFSET				
> PS_FIELD(176, 5)
>>>>> +#define PPS_CR_QP_OFFSET				
> PS_FIELD(181, 5)
>>>>> +#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	PS_FIELD(186, 1)
>>>>> +#define WEIGHTED_PRED_FLAG				
> PS_FIELD(187, 1)
>>>>> +#define WEIGHTED_BIPRED_FLAG				
> PS_FIELD(188, 1)
>>>>> +#define TRANSQUANT_BYPASS_ENABLED_FLAG			PS_FIELD(189, 
> 1)
>>>>> +#define TILES_ENABLED_FLAG				
> PS_FIELD(190, 1)
>>>>> +#define ENTROPY_CODING_SYNC_ENABLED_FLAG		PS_FIELD(191, 
> 1)
>>>>> +#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	PS_FIELD(192, 1)
>>>>> +#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		
> PS_FIELD(193, 1)
>>>>> +#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		
> PS_FIELD(194, 1)
>>>>> +#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		
> PS_FIELD(195, 1)
>>>>> +#define PPS_BETA_OFFSET_DIV2				
> PS_FIELD(196, 4)
>>>>> +#define PPS_TC_OFFSET_DIV2				
> PS_FIELD(200, 4)
>>>>> +#define LISTS_MODIFICATION_PRESENT_FLAG			
> PS_FIELD(204, 1)
>>>>> +#define LOG2_PARALLEL_MERGE_LEVEL			
> PS_FIELD(205, 3)
>>>>> +#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	
> PS_FIELD(208, 1)
>>>>> +#define NUM_TILE_COLUMNS				PS_FIELD(212, 
> 5)
>>>>> +#define NUM_TILE_ROWS					PS_FIELD(217, 
> 5)
>>>>> +#define COLUMN_WIDTH(i)					
> PS_FIELD(256 + ((i) * 8), 8)
>>>>> +#define ROW_HEIGHT(i)					
> PS_FIELD(416 + ((i) * 8), 8)
>>>>> +#define SCALING_LIST_ADDRESS				
> PS_FIELD(592, 32)
>>>
>>> [snip]
>>>
>>>>> +/*
>>>>> + * Creation of the Reference Picture Set memory blob for the
>>>>> hardware.
>>>>> + * The layout looks like this:
>>>>> + * [0] 32 bits for L0 (6 references + 2 bits of the 7th reference)
>>>>> + * [1] 32 bits for L0 (remaining 3 bits of the 7th reference + 5
>>>>> references + *     + 4 bits of the 13th reference)
>>>>> + * [2] 11 bits for L0 (remaining bit for 13 and 2 references) and
>>>>> + *     21 bits for L1 (4 references + first bit of 5)
>>>>> + * [3] 32 bits of padding with 0s
>>>>> + * [4] 32 bits for L1 (remaining 4 bits for 5 + 5 references + 3 bits
>>>>> of 11) + * [5] 22 bits for L1 (remaining 2 bits of 11 and 4
>>>>> references)
>>>>> + *     lowdelay flag (bit 23), rps bit offset long term (bit 24 - 32)
>>>>> + * [6] rps bit offset long term (bit 1 - 3),  rps bit offset short
>>>>> term (bit 4 - 12) + *     number of references (bit 13 - 16),
>>>>> remaining 16 bits of padding with 0s + * [7] 32 bits of padding with
>>>>> 0s
>>>>> + *
>>>>> + * Thus we have to set up padding in between reference 5 of the L1
>>>>> list.
>>>>> + */
>>>>> +static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>>>>> +			    struct rkvdec_hevc_run *run)
>>>>
>>>> Rockchip calls this one the swp_rps, in the sense the the slice header
>>>> and its enclosed reference are parsed by software. Detlev implements
>>>> the HW RPS (which requires an extended control) since SW RPS wasn't
>>>> documented and this implementation did not work for newer chip. We have
>>>> no information that HW RPS would work on RK3399 and older, I'm just
>>>> asking to rename to we can differentiate it.
>>>
>>> Sure, I can rename this this assemble_sw_rps or similar in a v3.
>>>
>>>>> +{
>>>>> +	const struct v4l2_ctrl_hevc_decode_params *decode_params =
>>>>> run->decode_params; +	const struct v4l2_ctrl_hevc_sps *sps =
>>>>> run->sps;
>>>>> +	const struct v4l2_ctrl_hevc_slice_params *sl_params;
>>>>> +	const struct v4l2_hevc_dpb_entry *dpb;
>>>>> +	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
>>>>> +	struct rkvdec_hevc_priv_tbl *priv_tbl = hevc_ctx->priv_tbl.cpu;
>>>>> +	struct rkvdec_rps_packet *hw_ps;
>>>>> +	int i, j;
>>>>> +	unsigned int lowdelay;
>>>>> +
>>>>> +#define WRITE_RPS(value, field) set_ps_field(hw_ps->info, field,
>>>>> value)
>>>>> +
>>>>> +#define REF_PIC_LONG_TERM_L0(i)			PS_FIELD((i) * 5, 
> 1)
>>>>> +#define REF_PIC_IDX_L0(i)			PS_FIELD(1 + ((i) * 5), 4)
>>>>> +#define REF_PIC_LONG_TERM_L1(i)			PS_FIELD(((i) < 5 ? 
> 75 : 132) +
>>>>> ((i) * 5), 1) +#define REF_PIC_IDX_L1(i)			
> PS_FIELD(((i) < 4 ? 76 :
>>>>> 128) + ((i) * 5), 4) +
>>>>> +#define LOWDELAY				PS_FIELD(182, 1)
>>>>> +#define LONG_TERM_RPS_BIT_OFFSET		PS_FIELD(183, 10)
>>>>> +#define SHORT_TERM_RPS_BIT_OFFSET		PS_FIELD(193, 9)
>>>>> +#define NUM_RPS_POC				PS_FIELD(202, 4)
>>>>> +
>>>>> +	for (j = 0; j < run->num_slices; j++) {
>>>>> +		uint st_bit_offset = 0;
>>>>> +		uint num_l0_refs = 0;
>>>>> +		uint num_l1_refs = 0;
>>>>> +
>>>>> +		sl_params = &run->slices_params[j];
>>>>> +		dpb = decode_params->dpb;
>>>>> +
>>>>> +		if (sl_params->slice_type != V4L2_HEVC_SLICE_TYPE_I) {
>>>>> +			num_l0_refs = sl_params-
>> num_ref_idx_l0_active_minus1 + 1;
>>>>> +
>>>>> +			if (sl_params->slice_type == 
> V4L2_HEVC_SLICE_TYPE_B)
>>>>> +				num_l1_refs = sl_params-
>> num_ref_idx_l1_active_minus1 + 1;
>>>>> +
>>>>> +			lowdelay = 1;
>>>>> +		} else {
>>>>> +			lowdelay = 0;
>>>>> +		}
>>>>> +
>>>>> +		hw_ps = &priv_tbl->rps[j];
>>>>> +		memset(hw_ps, 0, sizeof(*hw_ps));
>>>>> +
>>>>> +		for (i = 0; i < num_l0_refs; i++) {
>>>>> +			const struct v4l2_hevc_dpb_entry dpb_l0 =
>>>>> dpb[sl_params->ref_idx_l0[i]]; +
>>>>> +			WRITE_RPS(!!(dpb_l0.flags &
>>>>> V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE),
>>>>> +				  REF_PIC_LONG_TERM_L0(i));
>>>>> +			WRITE_RPS(sl_params->ref_idx_l0[i], 
> REF_PIC_IDX_L0(i));
>>>>> +
>>>>> +			if (dpb_l0.pic_order_cnt_val > sl_params-
>> slice_pic_order_cnt)
>>>>> +				lowdelay = 0;
>>>>> +		}
>>>>> +
>>>>> +		for (i = 0; i < num_l1_refs; i++) {
>>>>> +			const struct v4l2_hevc_dpb_entry dpb_l1 =
>>>>> dpb[sl_params->ref_idx_l1[i]]; +			int 
> is_long_term =
>>>>> +				!!(dpb_l1.flags & 
> V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE);
>>>>> +
>>>>> +			WRITE_RPS(is_long_term, REF_PIC_LONG_TERM_L1(i));
>>>>> +			WRITE_RPS(sl_params->ref_idx_l1[i], 
> REF_PIC_IDX_L1(i));
>>>>> +
>>>>> +			if (dpb_l1.pic_order_cnt_val > sl_params-
>> slice_pic_order_cnt)
>>>>> +				lowdelay = 0;
>>>>> +		}
>>>>> +
>>>>> +		WRITE_RPS(lowdelay, LOWDELAY);
>>>>> +
>>>>> +		if (!(decode_params->flags & 
> V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC))
>>>>> {
>>>>> +			if (sl_params->short_term_ref_pic_set_size)
>>>>> +				st_bit_offset = sl_params-
>> short_term_ref_pic_set_size;
>>>>> +			else if (sps->num_short_term_ref_pic_sets > 1)
>>>>> +				st_bit_offset = fls(sps-
>> num_short_term_ref_pic_sets - 1);
>>>>> +		}
>>>>> +
>>>>> +		WRITE_RPS(st_bit_offset + sl_params-
>> long_term_ref_pic_set_size,
>>>>> +			  LONG_TERM_RPS_BIT_OFFSET);
>>>>> +		WRITE_RPS(sl_params->short_term_ref_pic_set_size,
>>>>> +			  SHORT_TERM_RPS_BIT_OFFSET);
>>>>> +
>>>>> +		WRITE_RPS(decode_params->num_poc_st_curr_before +
>>>>> +			  decode_params->num_poc_st_curr_after +
>>>>> +			  decode_params->num_poc_lt_curr,
>>>>> +			  NUM_RPS_POC);
>>>>> +	}
>>>>> +}
>>>
>>> [snip]
>>>
>>>> Looks good otherwise. Please let me know your plan to combine or prepare
>>>> for both series.
>>>
>>> I will take a closer look at Detlev's new rkvdec2 series and see what I
>>> can do in a v3 to ease any merge conflicts.
>>>
>>> I am just a little bit sad that this series has been completely ignored
>>> for the continued work with rkvdec2, the new series even seem to
>>> implement a slightly different variant system when this has been here
>>> waiting all this time :-/
>>>
>>> Regards,
>>> Jonas
>>>
>>>> Nicolas
> 
> 
> 
> 


