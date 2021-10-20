Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A5D434BCC
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 15:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhJTNJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 09:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhJTNJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 09:09:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A15C061746;
        Wed, 20 Oct 2021 06:07:16 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 4645D1F43A1E
Subject: Re: [PATCH v7 07/11] media: rkvdec: Add the VP9 backend
To:     Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>
References: <20210929160439.6601-1-andrzej.p@collabora.com>
 <20210929160439.6601-8-andrzej.p@collabora.com>
 <966b04a7-421a-a592-2e17-ea5ecdb76b00@gmail.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <91ba5098-2528-1e63-3a1a-b908db8d6f2a@collabora.com>
Date:   Wed, 20 Oct 2021 15:07:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <966b04a7-421a-a592-2e17-ea5ecdb76b00@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

W dniu 20.10.2021 o 01:24, Alex Bee pisze:
> Hi Andrzej,
> 
> Am 29.09.21 um 18:04 schrieb Andrzej Pietrasiewicz:
>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> The Rockchip VDEC supports VP9 profile 0 up to 4096x2304@30fps. Add
>> a backend for this new format.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> Co-developed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   drivers/staging/media/rkvdec/Kconfig      |    1 +
>>   drivers/staging/media/rkvdec/Makefile     |    2 +-
>>   drivers/staging/media/rkvdec/rkvdec-vp9.c | 1078 +++++++++++++++++++++
>>   drivers/staging/media/rkvdec/rkvdec.c     |   52 +-
>>   drivers/staging/media/rkvdec/rkvdec.h     |   12 +-
>>   5 files changed, 1137 insertions(+), 8 deletions(-)
>>   create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c

<snip>

>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c 
>> b/drivers/staging/media/rkvdec/rkvdec.c
>> index 7131156c1f2c..6aa8aca66547 100644
>> --- a/drivers/staging/media/rkvdec/rkvdec.c
>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
>> @@ -99,10 +99,30 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
>>       .num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
>>   };
>> -static const u32 rkvdec_h264_decoded_fmts[] = {
>> +static const u32 rkvdec_h264_vp9_decoded_fmts[] = {
>>       V4L2_PIX_FMT_NV12,
> 
> For H.264 rkvdec HW supports additional formats: V4L2_PIX_FMT_NV15, 
> V4L2_PIX_FMT_NV16 and V4L2_PIX_FMT_NV20. Not all of those are upstreamed yet and 
> thus not supported by rkvdec driver - but I think we should introduce a seperate 
> rkvdec_vp9_decoded_fmts already a this point. (To avoid unnecessary diff 
> afterwards)

I will do it if I get to re-spinning the series for other reasons.

> 
>>   };
>> +static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
>> +    {
>> +        .cfg.id = V4L2_CID_STATELESS_VP9_FRAME,
>> +    },
>> +    {
>> +        .cfg.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
>> +    },
>> +    {
>> +        .cfg.id = V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
>> +        .cfg.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>> +        .cfg.max = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>> +        .cfg.def = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>> +    },
>> +};
>> +
>> +static const struct rkvdec_ctrls rkvdec_vp9_ctrls = {
>> +    .ctrls = rkvdec_vp9_ctrl_descs,
>> +    .num_ctrls = ARRAY_SIZE(rkvdec_vp9_ctrl_descs),
>> +};
>> +
>>   static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>       {
>>           .fourcc = V4L2_PIX_FMT_H264_SLICE,
>> @@ -116,8 +136,23 @@ static const struct rkvdec_coded_fmt_desc 
>> rkvdec_coded_fmts[] = {
>>           },
>>           .ctrls = &rkvdec_h264_ctrls,
>>           .ops = &rkvdec_h264_fmt_ops,
>> -        .num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>> -        .decoded_fmts = rkvdec_h264_decoded_fmts,
>> +        .num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_vp9_decoded_fmts),
>> +        .decoded_fmts = rkvdec_h264_vp9_decoded_fmts,
>> +    },
>> +    {
>> +        .fourcc = V4L2_PIX_FMT_VP9_FRAME,
>> +        .frmsize = {
>> +            .min_width = 64,
>> +            .max_width = 4096,
>> +            .step_width = 64,
>> +            .min_height = 64,
>> +            .max_height = 2304,
>> +            .step_height = 64,
>> +        },
> I checked (available) documentation and couldn't find any hint to the 
> .step_width and .step_height, but I'm not sure that's correct: taking
> this values here neither framesize of 3840x2160 nor 1280x720 would be possible - 
> but the HW seems to have no problem with those, i.e. decoding works fine.
> Given the output format is the same as the (only) currently supported H.264 
> output format (NV12) and those steps are usually for alignment purposes need by 
> the HW , I strongly guess .step_height and .step_width are the same as 
> V4L2_PIX_FMT_H264_SLICE has.
> 

Aren't these used primarily by v4l2_apply_frmsize_constraints()? Doesn't
this merely mean that even though userspace requests, say, 48x48,
it will get 64x64 instead?

I tried decoding a 720p video with gstreamer and it worked fine
(I got a properly sized 1280x720 output).

Regards,

Andrzej
