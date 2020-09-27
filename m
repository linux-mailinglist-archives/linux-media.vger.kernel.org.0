Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3987027A045
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 11:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgI0Jd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 05:33:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34574 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0Jd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 05:33:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1BC2D265BB2
Subject: Re: [PATCH v4 02/10] media: staging: rkisp1: cap: remove unsupported
 formats
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-3-dafna.hirschfeld@collabora.com>
 <20200926131708.GE3781977@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <86b5262f-6bb3-7c02-f49e-cbe8edab3490@collabora.com>
Date:   Sun, 27 Sep 2020 11:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926131708.GE3781977@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 26.09.20 um 15:17 schrieb Tomasz Figa:
> Hi Dafna,
> 
> On Tue, Sep 01, 2020 at 01:16:04PM +0200, Dafna Hirschfeld wrote:
>> For Ycbcr packed formats only YUYV can be supported by
>> the driver. This patch removes the other formats.
> 
> I can see the driver already setting the
> RKISP1_CIF_MI_XTD_FMT_CTRL_*_CB_CR_SWAP register according to the
> uv_swap flag, but it currently does it so only if comp_planes is 2.
> Wouldn't just doing the same if the number of planes is 1 fix the
> support for at least the YVYU format?

Hi, Laurent already suggested it and I found out it does not
work, see: https://patchwork.kernel.org/patch/11471301/

Thanks,
Dafna

> 
> Best regards,
> Tomasz
> 
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 17 -----------------
>>   1 file changed, 17 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index f4d5cc3e2f12..79195e74d995 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -88,13 +88,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>>   		.fourcc = V4L2_PIX_FMT_YUYV,
>>   		.uv_swap = 0,
>>   		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>> -	}, {
>> -		.fourcc = V4L2_PIX_FMT_YVYU,
>> -		.uv_swap = 1,
>> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>> -	}, {
>> -		.fourcc = V4L2_PIX_FMT_VYUY,
>> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_YUV422P,
>>   		.uv_swap = 0,
>> @@ -197,16 +190,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>   		.uv_swap = 0,
>>   		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>>   		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>> -	}, {
>> -		.fourcc = V4L2_PIX_FMT_YVYU,
>> -		.uv_swap = 1,
>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>> -	}, {
>> -		.fourcc = V4L2_PIX_FMT_VYUY,
>> -		.uv_swap = 1,
>> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>   	}, {
>>   		.fourcc = V4L2_PIX_FMT_YUV422P,
>>   		.uv_swap = 0,
>> -- 
>> 2.17.1
>>
