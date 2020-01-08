Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4A513454D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 15:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbgAHOq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 09:46:57 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59073 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726697AbgAHOq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 09:46:57 -0500
Received: from [IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1]
 ([IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pCbiibkeHT6sRpCbliI6kY; Wed, 08 Jan 2020 15:46:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578494814; bh=AsR4xjN/awnmLfBnEaGevlZtxpg0jILGUFkca1kabWw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mGMsL66YR3goe/PCP20bW/gn1Dt8R9x9Yu3i8Ao07aaB+1yyCS4qLaX2cywawjDYw
         VFp1anSq+ltepYElqNpGp0sFE5Fz6T5bh+y+8OQJda6CSuhUSIO0ybAkGbwwWAVj6E
         hIED2JuZ3fQhYqyZAO7MRg9obMjJUU0ESnWbN4MzQbuoOwluOt3i0NhSEnfT29+RRZ
         2tl8s7Bk/TBcFogdAI7oygh/jw/XCKQvDam5RMISdk21U6lMWEGTBK9BIfp2I4UnWP
         t8eAJEa0RPBIRHCX6S8WC7T82bYpAETFNZ6nhdAiLOSbHnEo710QQnyfsKUEhffZSO
         9pQ0Yaa/lfJnw==
Subject: Re: [PATCH v2 2/4] media: cedrus: hevc: Add support for scaling
 matrix
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
 <20191213160428.54303-3-jernej.skrabec@siol.net>
 <4ac91ed5-a220-6a04-b1da-de27a306f8f2@xs4all.nl>
 <2627039.Y6S9NjorxK@jernej-laptop>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <46364792-7eaf-0a51-b8f8-db376cc2dbe2@xs4all.nl>
Date:   Wed, 8 Jan 2020 15:46:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2627039.Y6S9NjorxK@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKRC0OyPIqq609LUChtv5Wk1gFYQQNCtG6b78bPxuhkz3rv7y43BQx134IbARXUoQtrnXNn499dv9gNyPKmdOVTZKnoQdjaaBU0tiH5BCYigH3Iue9Ow
 7Lq+h4swuvzZzmR+3Eq/vaBTjs4FW4afxL3fkHM3p5tu8fGdk55n+PfaG2pgdcZBTRR6t3u58XTsFRv0yC6C3OUI1SYXkGZz96lwpSqxxSerjFdevI5T6Mvv
 L3UGCx2Q/Im6DjSdOwOt9iwmgoz3GfvDnfMYpJKW88ZiBzBkFU+CQFAdrC3lPHksSF3nBb3MlEh8CXsGmIarf5DG3Y9mlzSpAuu133jSnuIXlTQ+pZcw72mL
 ClQbvGV3xGsYACf9paqQ5RLH4sBK46ybrRGvrjLPmOxoUhYvWEAiK4FMHrAiY/Oa8ajlcgaVpX0PIQNANdHw2DBSBPIVaK9JOB9MSDUs3D9chrq8hEjIl4Nl
 La2waBIg4PYn0NPOgpL7+mOzVVYVv+SFo32sW1arVt3UCeP1qGbC2o1prX0anqaAk56YOpryL/Z4WVJXKplpUYVToSKxReHxWvxF9zHJpsfXlLU0Jvncl9ro
 qSPdn7CfQPKvQ/y/gPa1D73CA0vYuhRL9+G6uh9Vl63X1Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/7/20 6:10 PM, Jernej Škrabec wrote:
> Hi!
> 
> Dne torek, 07. januar 2020 ob 16:01:16 CET je Hans Verkuil napisal(a):
>> On 12/13/19 5:04 PM, Jernej Skrabec wrote:
>>> HEVC frames may use scaling list feature. Add support for it.
>>>
>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>>> ---
>>>
>>>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 ++
>>>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>>>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
>>>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 70 ++++++++++++++++++-
>>>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +
>>>  5 files changed, 81 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
>>> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
>>> c6ddd46eff82..bf68bc6b20c8 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
>>> @@ -116,6 +116,13 @@ static const struct cedrus_control cedrus_controls[]
>>> = {> 
>>>  		.codec		= CEDRUS_CODEC_H265,
>>>  		.required	= true,
>>>  	
>>>  	},
>>>
>>> +	{
>>> +		.cfg = {
>>> +			.id	= 
> V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
>>> +		},
>>> +		.codec		= CEDRUS_CODEC_H265,
>>> +		.required	= true,
>>
>> Should this be true? This means that existing applications are now
>> suddenly required to always pass the scaling matrix for every buffer.
>>
>> Especially since the commit log says: 'HEVC frames *may* use scaling list
>> feature', indicating that this is an optional feature.
> 
> True. Can you fix this when applying if this is the only issue?

I realized that after changing this to false, you also need to document
what happens if you do NOT set this control in the request.

Does it fall back to default values? It looks like the HEVC spec defines
some defaults (if I understand it correctly).

Regards,

	Hans

> 
> Best regards,
> Jernej
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +	},
>>>
>>>  	{
>>>  	
>>>  		.cfg = {
>>>  		
>>>  			.id	= 
> V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
>>>
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
>>> b/drivers/staging/media/sunxi/cedrus/cedrus.h index
>>> 96765555ab8a..d945f4f0ff2d 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
>>> @@ -73,6 +73,7 @@ struct cedrus_h265_run {
>>>
>>>  	const struct v4l2_ctrl_hevc_sps			*sps;
>>>  	const struct v4l2_ctrl_hevc_pps			*pps;
>>>  	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
>>>
>>> +	const struct v4l2_ctrl_hevc_scaling_matrix	
> *scaling_matrix;
>>>
>>>  };
>>>  
>>>  struct cedrus_run {
>>>
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>>> b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
>>> 4a2fc33a1d79..327ed6c264dc 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>>> @@ -66,6 +66,8 @@ void cedrus_device_run(void *priv)
>>>
>>>  			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
>>>  		
>>>  		run.h265.slice_params = cedrus_find_control_data(ctx,
>>>  		
>>>  			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
>>>
>>> +		run.h265.scaling_matrix = cedrus_find_control_data(ctx,
>>> +			V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
>>>
>>>  		break;
>>>  	
>>>  	default:
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>> b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
>>> 6945dc74e1d7..888bfd5ca224 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>> @@ -220,6 +220,69 @@ static void cedrus_h265_pred_weight_write(struct
>>> cedrus_dev *dev,> 
>>>  	}
>>>  
>>>  }
>>>
>>> +static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
>>> +					   struct cedrus_run 
> *run)
>>> +{
>>> +	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
>>> +	struct cedrus_dev *dev = ctx->dev;
>>> +	u32 i, j, k, val;
>>> +
>>> +	scaling = run->h265.scaling_matrix;
>>> +
>>> +	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF0,
>>> +		     (scaling->scaling_list_dc_coef_32x32[1] << 24) |
>>> +		     (scaling->scaling_list_dc_coef_32x32[0] << 16) |
>>> +		     (scaling->scaling_list_dc_coef_16x16[1] << 8) |
>>> +		     (scaling->scaling_list_dc_coef_16x16[0] << 0));
>>> +
>>> +	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF1,
>>> +		     (scaling->scaling_list_dc_coef_16x16[5] << 24) |
>>> +		     (scaling->scaling_list_dc_coef_16x16[4] << 16) |
>>> +		     (scaling->scaling_list_dc_coef_16x16[3] << 8) |
>>> +		     (scaling->scaling_list_dc_coef_16x16[2] << 0));
>>> +
>>> +	cedrus_h265_sram_write_offset(dev,
>>> VE_DEC_H265_SRAM_OFFSET_SCALING_LISTS); +
>>> +	for (i = 0; i < 6; i++)
>>> +		for (j = 0; j < 8; j++)
>>> +			for (k = 0; k < 8; k += 4) {
>>> +				val = ((u32)scaling-
>> scaling_list_8x8[i][j + (k + 3) * 8] << 24) |
>>> +				      ((u32)scaling-
>> scaling_list_8x8[i][j + (k + 2) * 8] << 16) |
>>> +				      ((u32)scaling-
>> scaling_list_8x8[i][j + (k + 1) * 8] << 8) |
>>> +				      scaling-
>> scaling_list_8x8[i][j + k * 8];
>>> +				cedrus_write(dev, 
> VE_DEC_H265_SRAM_DATA, val);
>>> +			}
>>> +
>>> +	for (i = 0; i < 2; i++)
>>> +		for (j = 0; j < 8; j++)
>>> +			for (k = 0; k < 8; k += 4) {
>>> +				val = ((u32)scaling-
>> scaling_list_32x32[i][j + (k + 3) * 8] << 24) |
>>> +				      ((u32)scaling-
>> scaling_list_32x32[i][j + (k + 2) * 8] << 16) |
>>> +				      ((u32)scaling-
>> scaling_list_32x32[i][j + (k + 1) * 8] << 8) |
>>> +				      scaling-
>> scaling_list_32x32[i][j + k * 8];
>>> +				cedrus_write(dev, 
> VE_DEC_H265_SRAM_DATA, val);
>>> +			}
>>> +
>>> +	for (i = 0; i < 6; i++)
>>> +		for (j = 0; j < 8; j++)
>>> +			for (k = 0; k < 8; k += 4) {
>>> +				val = ((u32)scaling-
>> scaling_list_16x16[i][j + (k + 3) * 8] << 24) |
>>> +				      ((u32)scaling-
>> scaling_list_16x16[i][j + (k + 2) * 8] << 16) |
>>> +				      ((u32)scaling-
>> scaling_list_16x16[i][j + (k + 1) * 8] << 8) |
>>> +				      scaling-
>> scaling_list_16x16[i][j + k * 8];
>>> +				cedrus_write(dev, 
> VE_DEC_H265_SRAM_DATA, val);
>>> +			}
>>> +
>>> +	for (i = 0; i < 6; i++)
>>> +		for (j = 0; j < 4; j++) {
>>> +			val = ((u32)scaling->scaling_list_4x4[i][j + 
> 12] << 24) |
>>> +			      ((u32)scaling->scaling_list_4x4[i][j + 
> 8] << 16) |
>>> +			      ((u32)scaling->scaling_list_4x4[i][j + 
> 4] << 8) |
>>> +			      scaling->scaling_list_4x4[i][j];
>>> +			cedrus_write(dev, VE_DEC_H265_SRAM_DATA, 
> val);
>>> +		}
>>> +}
>>> +
>>>
>>>  static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>>>  
>>>  			      struct cedrus_run *run)
>>>  
>>>  {
>>>
>>> @@ -499,7 +562,12 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>>>
>>>  	/* Scaling list. */
>>>
>>> -	reg = VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
>>> +	if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED) {
>>> +		cedrus_h265_write_scaling_list(ctx, run);
>>> +		reg = VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED;
>>> +	} else {
>>> +		reg = VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
>>> +	}
>>>
>>>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
>>>  	
>>>  	/* Neightbor information address. */
>>>
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>>> b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h index
>>> 7beb03d3bb39..0d9449fe2b28 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
>>> @@ -492,6 +492,8 @@
>>>
>>>  #define VE_DEC_H265_ENTRY_POINT_OFFSET_ADDR	(VE_ENGINE_DEC_H265 + 
> 0x64)
>>>  #define VE_DEC_H265_TILE_START_CTB		(VE_ENGINE_DEC_H265 + 
> 0x68)
>>>  #define VE_DEC_H265_TILE_END_CTB		(VE_ENGINE_DEC_H265 + 
> 0x6c)
>>>
>>> +#define VE_DEC_H265_SCALING_LIST_DC_COEF0	(VE_ENGINE_DEC_H265 + 
> 0x78)
>>> +#define VE_DEC_H265_SCALING_LIST_DC_COEF1	(VE_ENGINE_DEC_H265 + 
> 0x7c)
>>>
>>>  #define VE_DEC_H265_LOW_ADDR			(VE_ENGINE_DEC_H265 + 
> 0x80)
> 
> 
> 
> 

