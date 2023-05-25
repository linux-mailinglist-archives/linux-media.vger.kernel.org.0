Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85622710E85
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 16:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241402AbjEYOqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 10:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241599AbjEYOqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 10:46:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF65189
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:46:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C78BB64658
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 14:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E849C433A8;
        Thu, 25 May 2023 14:46:46 +0000 (UTC)
Message-ID: <e674cfcb-6b1b-8052-7f29-e0e97bdda3be@xs4all.nl>
Date:   Thu, 25 May 2023 16:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: verisilicon: Fix null pointer dereference in
 try_fmt
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Michael Tretter <m.tretter@pengutronix.de>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, benjamin.gaignard@collabora.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@pengutronix.de
References: <20230516091209.3098262-1-m.tretter@pengutronix.de>
 <118d51d7734d6673ed1d90b09533fab50ece4b78.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <118d51d7734d6673ed1d90b09533fab50ece4b78.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/05/2023 16:38, Nicolas Dufresne wrote:
> Le mardi 16 mai 2023 à 11:12 +0200, Michael Tretter a écrit :
>> Since commit db6f68b51e5c ("media: verisilicon: Do not set context
>> src/dst formats in reset functions"), vpu_src_fmt is not set in the
>> reset function, but only set in hantro_set_fmt_out, which calls
>> hantro_try_fmt before setting the format. Therefore, hantro_try_fmt
>> might be called with vpu_src_fmt still being null.
>>
>> Add a test if the format is actually set before checking the format.
>>
>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>> Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst formats in reset functions")
> 
> This patch highlights yet more issues in the driver default format handling, but
> the remaining bug is extremely minor (too small sizeimage before S_FMT is
> called, rather then kernel oops.). Considering how long this has been going,
> please consider merging this.

I went with this fix:

https://patchwork.linuxtv.org/project/linux-media/patch/20230523162515.993862-1-benjamin.gaignard@collabora.com/

Part of this pull request:

https://patchwork.linuxtv.org/project/linux-media/patch/d4b08420-f7c0-4950-2d20-385d98f3cad9@xs4all.nl/

If you disagree, then please let me know.

This particular patch has been marked as Superseded in patchwork.

Regards,

	Hans

> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
>> ---
>>  drivers/media/platform/verisilicon/hantro_v4l2.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
>> index 835518534e3b..ec37d2646fde 100644
>> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
>> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
>> @@ -313,17 +313,20 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
>>  		/* Fill remaining fields */
>>  		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
>>  				    pix_mp->height);
>> -		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
>> +		if (ctx->vpu_src_fmt &&
>> +		    ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
>>  		    !hantro_needs_postproc(ctx, fmt))
>>  			pix_mp->plane_fmt[0].sizeimage +=
>>  				hantro_h264_mv_size(pix_mp->width,
>>  						    pix_mp->height);
>> -		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
>> +		else if (ctx->vpu_src_fmt &&
>> +			 ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
>>  			 !hantro_needs_postproc(ctx, fmt))
>>  			pix_mp->plane_fmt[0].sizeimage +=
>>  				hantro_vp9_mv_size(pix_mp->width,
>>  						   pix_mp->height);
>> -		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
>> +		else if (ctx->vpu_src_fmt &&
>> +			 ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
>>  			 !hantro_needs_postproc(ctx, fmt))
>>  			pix_mp->plane_fmt[0].sizeimage +=
>>  				hantro_hevc_mv_size(pix_mp->width,
> 

