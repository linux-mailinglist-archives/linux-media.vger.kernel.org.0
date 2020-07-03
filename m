Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213E421394F
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 13:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgGCL2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 07:28:16 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:30588 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCL2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 07:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=rag6RijV9TeiOIlsz8mX0V9zwQwneqNwPAR2reKybCg=;
        b=kt7yE439G6k1rzT8VB9uoscQM7cz3sqrff4LucL4TGVzp4VvWiwhHwOZf/RWqZeyluwP
        xZgy4MwswLkSMmaqkEHgGWs4Rh2ViXRDuG2iwdP/o3aU6aCBAoI4sMxi+32jH6csX6jvZH
        CFTLnro82uO5hjB6gzl5rceXSGSC1MtVM=
Received: by filterdrecv-p3iad2-5b55dcd864-m99xc with SMTP id filterdrecv-p3iad2-5b55dcd864-m99xc-18-5EFF164E-31
        2020-07-03 11:28:14.610105909 +0000 UTC m=+584329.215054177
Received: from [10.13.72.108] (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id BdWamlxBStGtxZSk8Y6P_w
        Fri, 03 Jul 2020 11:28:14.136 +0000 (UTC)
Subject: Re: [PATCH 3/9] media: rkvdec: h264: Fix pic width and height in mbs
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200701215616.30874-4-jonas@kwiboo.se>
 <abfa036dc0c997bb68280195b2cc422e88c6f4b5.camel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <3534f9a4-2151-447f-069c-4a277a810535@kwiboo.se>
Date:   Fri, 03 Jul 2020 11:28:14 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <abfa036dc0c997bb68280195b2cc422e88c6f4b5.camel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hwI80fPjPVYIZ5loW?=
 =?us-ascii?Q?4kKfi4jaVDhLR8zCwFHhYeuZQDLKcZ5qF6UfWG6?=
 =?us-ascii?Q?RPRt4wQERf8VlTk5BZI=2FH96cA6TzBNZLbky2uem?=
 =?us-ascii?Q?gjpEuAutm7SB=2FDrPqxSlowDGI0ozvlkGztxO9Ic?=
 =?us-ascii?Q?xJq4jNm1rKCljHHWWLRU07ueLziEsfe2g=2F8FoIh?=
 =?us-ascii?Q?wvAIXHdgELWCNBWmrqEZw=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-07-03 04:48, Ezequiel Garcia wrote:
> On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
>> The width and height in mbs is currently configured based on OUTPUT buffer
>> resolution, this works for frame pictures but can cause issues for field
>> pictures or when frmsize step_width is changed to support 10-bit decoding.
>>
>> When frame_mbs_only_flag is 0 the height in mbs should be height of
>> the field instead of height of frame.
>>
>> Validate pic_width_in_mbs_minus1 and pic_height_in_map_units_minus1
>> against CAPTURE buffer resolution and use these values to configure HW.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  drivers/staging/media/rkvdec/rkvdec-h264.c | 44 +++++++++++++++++++---
>>  1 file changed, 39 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
>> index f0cfed84d60d..c9aebeb8f9b3 100644
>> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
>> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
>> @@ -672,8 +672,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
>>  		  LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4);
>>  	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO),
>>  		  DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG);
>> -	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.width, 16), PIC_WIDTH_IN_MBS);
>> -	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.height, 16), PIC_HEIGHT_IN_MBS);
>> +	WRITE_PPS(sps->pic_width_in_mbs_minus1 + 1, PIC_WIDTH_IN_MBS);
>> +	WRITE_PPS(sps->pic_height_in_map_units_minus1 + 1, PIC_HEIGHT_IN_MBS);
>>  	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY),
>>  		  FRAME_MBS_ONLY_FLAG);
>>  	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD),
>> @@ -1058,10 +1058,33 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>>  	kfree(h264_ctx);
>>  }
>>  
>> -static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
>> -				     struct rkvdec_h264_run *run)
>> +static int validate_sps(struct rkvdec_ctx *ctx,
>> +			const struct v4l2_ctrl_h264_sps *sps)
>> +{
>> +	unsigned int width, height;
>> +
>> +	if (WARN_ON(!sps))
>> +		return -EINVAL;
>> +
>> +	width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
>> +	height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
>> +
>> +	if (width > ctx->decoded_fmt.fmt.pix_mp.width ||
>> +	    height > ctx->decoded_fmt.fmt.pix_mp.height) {
> 
> Why using decoded_fmt instead of coded_fmt?

I used decoded_fmt because that would be the outer limits of what can be
decoded into in the CAPTURE buffer. Not sure if or how coded_fmt is validated
that it does not exceed the decoded_fmt resolution.

> 
> Also, by the time the SPS control is passed, the OUTPUT
> and CAPTURE formats should be already set, so it should be
> possible to validate the SPS at TRY_EXT_CTRLS, using
> v4l2_ctrl_ops.try_ctrl.

I was not sure how to access the rkvdec_ctx from v4l2_ctrl_ops.try_ctrl
so I went with similar approach as was done in the VP9 series, looks like
we can use container_of and ctrl->handler to find rkvdec_ctx.

Will try to move the validation into rkvdec_try_ctrl for v2.

Regards,
Jonas

> 
> That would be much better, since once the application
> calls STREAMON on both queues, I think things are
> expected to be validated as much as possible.
> 
> Thanks,
> Ezequiel
> 
>> +		dev_err(ctx->dev->dev,
>> +			"unexpected bitstream resolution %ux%u\n",
>> +			width, height);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
>> +				    struct rkvdec_h264_run *run)
>>  {
>>  	struct v4l2_ctrl *ctrl;
>> +	int ret;
>>  
>>  	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
>>  			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
>> @@ -1080,6 +1103,12 @@ static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
>>  	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
>>  
>>  	rkvdec_run_preamble(ctx, &run->base);
>> +
>> +	ret = validate_sps(ctx, run->sps);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>>  }
>>  
>>  static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>> @@ -1088,8 +1117,13 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>>  	struct rkvdec_dev *rkvdec = ctx->dev;
>>  	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
>>  	struct rkvdec_h264_run run;
>> +	int ret;
>>  
>> -	rkvdec_h264_run_preamble(ctx, &run);
>> +	ret = rkvdec_h264_run_preamble(ctx, &run);
>> +	if (ret) {
>> +		rkvdec_run_postamble(ctx, &run.base);
>> +		return ret;
>> +	}
>>  
>>  	/* Build the P/B{0,1} ref lists. */
>>  	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
> 
> 
