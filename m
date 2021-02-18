Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1D931E9FE
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 13:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhBRMnQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 07:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhBRKpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 05:45:41 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B955AC061574;
        Thu, 18 Feb 2021 02:43:49 -0800 (PST)
Received: from [IPv6:2a01:e0a:4cb:a870:fd6e:12cd:95d7:3350] (unknown [IPv6:2a01:e0a:4cb:a870:fd6e:12cd:95d7:3350])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F21B81F45A1F;
        Thu, 18 Feb 2021 10:43:45 +0000 (GMT)
Subject: Re: [PATCH v1 13/18] media: hantro: Introduce G2/HEVC decoder
To:     Ezequiel Garcia <ezequiel@collabora.com>, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <20210217080306.157876-14-benjamin.gaignard@collabora.com>
 <bb410fde0a2f50cc34840e091c3d9c1395601514.camel@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <1fab0734-f1db-21ee-152c-4b289be31e4a@collabora.com>
Date:   Thu, 18 Feb 2021 11:43:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bb410fde0a2f50cc34840e091c3d9c1395601514.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 17/02/2021 à 21:45, Ezequiel Garcia a écrit :
> Hi Benjamin,
>
> Before I review the implementation in detail,
> there's one thing that looks suspicious.
>
> On Wed, 2021-02-17 at 09:03 +0100, Benjamin Gaignard wrote:
>> Implement all the logic to get G2 hardware decoding HEVC frames.
>> It support up level 5.1 HEVC stream.
>> It doesn't support yet 10 bits formats or scaling feature.
>>
>> Add HANTRO HEVC dedicated control to skip some bits at the beginning
>> of the slice header. That is very specific to this hardware so can't
>> go into uapi structures. Compute the needed value is complex and require
>> information from the stream that only the userland knows so let it
>> provide the correct value to the driver.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> ---
>>   drivers/staging/media/hantro/Makefile         |   2 +
>>   drivers/staging/media/hantro/hantro_drv.c     |  41 ++
>>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 637 ++++++++++++++++++
>>   drivers/staging/media/hantro/hantro_g2_regs.h | 198 ++++++
>>   drivers/staging/media/hantro/hantro_hevc.c    | 274 ++++++++
>>   drivers/staging/media/hantro/hantro_hw.h      |  14 +
>>   6 files changed, 1166 insertions(+)
>>   create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>>   create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
>>   create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
>>
>> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
>> index 743ce08eb184..0357f1772267 100644
>> --- a/drivers/staging/media/hantro/Makefile
>> +++ b/drivers/staging/media/hantro/Makefile
>> @@ -9,12 +9,14 @@ hantro-vpu-y += \
>>                  hantro_h1_jpeg_enc.o \
>>                  hantro_g1_h264_dec.o \
>>                  hantro_g1_mpeg2_dec.o \
>> +               hantro_g2_hevc_dec.o \
>>                  hantro_g1_vp8_dec.o \
>>                  rk3399_vpu_hw_jpeg_enc.o \
>>                  rk3399_vpu_hw_mpeg2_dec.o \
>>                  rk3399_vpu_hw_vp8_dec.o \
>>                  hantro_jpeg.o \
>>                  hantro_h264.o \
>> +               hantro_hevc.o \
>>                  hantro_mpeg2.o \
>>                  hantro_vp8.o
>>   
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index e1443c394f62..d171fb80876a 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -280,6 +280,20 @@ static int hantro_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
>>          return 0;
>>   }
>>   
>> +static int hantro_extra_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +       const struct hantro_hevc_extra_decode_params *extra_params;
>> +       struct hantro_ctx *ctx;
>> +
>> +       ctx = container_of(ctrl->handler,
>> +                          struct hantro_ctx, ctrl_handler);
>> +       extra_params = &ctx->hevc_dec.ctrls.extra_params;
>> +
>> +       memcpy((void *)extra_params, ctrl->p_new.p_u8, sizeof(extra_params));
>> +
>> +       return 0;
>> +}
>> +
>>   static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
>>          .try_ctrl = hantro_try_ctrl,
>>   };
>> @@ -288,6 +302,10 @@ static const struct v4l2_ctrl_ops hantro_jpeg_ctrl_ops = {
>>          .s_ctrl = hantro_jpeg_s_ctrl,
>>   };
>>   
>> +static const struct v4l2_ctrl_ops hantro_extra_ctrl_ops = {
>> +       .s_ctrl = hantro_extra_s_ctrl,
>> +};
>> +
>>   static const struct hantro_ctrl controls[] = {
>>          {
>>                  .codec = HANTRO_JPEG_ENCODER,
>> @@ -413,6 +431,29 @@ static const struct hantro_ctrl controls[] = {
>>                  .cfg = {
>>                          .id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
>>                  },
>> +       }, {
>> +               .codec = HANTRO_HEVC_DECODER,
>> +               .cfg = {
>> +                       .id = V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS,
>> +                       .name = "HANTRO extra decode params",
>> +                       .type = V4L2_CTRL_TYPE_U8,
>> +                       .min = 0,
>> +                       .def = 0,
>> +                       .max = 255,
>> +                       .step = 1,
>> +                       .dims = { sizeof(struct hantro_hevc_extra_decode_params) },
>> +                       .ops = &hantro_extra_ctrl_ops,
>> +               },
>> +       }, {
>> +               .codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
>> +                        HANTRO_VP8_DECODER | HANTRO_H264_DECODER |
>> +                        HANTRO_HEVC_DECODER,
>> +               .cfg = {
>> +                       .id = V4L2_CID_USER_CLASS,
> Are you sure you need to expose the V4L2_CID_USER_CLASS?
> Maybe I'm missing something, but this looks odd.

v4l2-compliance complains if this isn't exposed when adding V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS.
Other drivers with dedicated control have duplicated this definition but I prefer use it directly.

Benjamin

>
> Thanks,
> Ezequiel
>
>
