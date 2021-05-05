Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B92E373E64
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 17:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbhEEPVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 11:21:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbhEEPVs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 11:21:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 77D441F42D0C
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, ezequiel@collabora.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
 <20210420121046.181889-7-benjamin.gaignard@collabora.com>
 <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <1cf94540-7f4d-0179-dd1e-0b82ee30f6d2@collabora.com>
Date:   Wed, 5 May 2021 17:20:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 05/05/2021 à 16:55, Hans Verkuil a écrit :
> On 20/04/2021 14:10, Benjamin Gaignard wrote:
>> The HEVC HANTRO driver needs to know the number of bits to skip at
>> the beginning of the slice header.
>> That is a hardware specific requirement so create a dedicated control
>> for this purpose.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
>>   .../userspace-api/media/drivers/index.rst     |  1 +
>>   include/media/hevc-ctrls.h                    | 13 +++++++++++++
>>   3 files changed, 33 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
>>
>> diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
>> new file mode 100644
>> index 000000000000..cd9754b4e005
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/drivers/hantro.rst
>> @@ -0,0 +1,19 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Hantro video decoder driver
>> +===========================
>> +
>> +The Hantro video decoder driver implements the following driver-specific controls:
>> +
>> +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
>> +    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
>> +    skip in the slice segment header.
>> +    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
>> +    to before syntax element "slice_temporal_mvp_enabled_flag".
>> +    If IDR, the skipped bits are just "pic_output_flag"
>> +    (separate_colour_plane_flag is not supported).
> I'm not very keen on this. Without this information the video data cannot be
> decoded, or will it just be suboptimal?

Without that information the video can't be decoded.

>
> The problem is that a generic decoder would have to know that the HW is a hantro,
> and then call this control. If they don't (and are testing on non-hantro HW), then
> it won't work, thus defeating the purpose of the HW independent decoder API.
>
> Since hantro is widely used, and if there is no other way to do this beside explitely
> setting this control, then perhaps this should be part of the standard HEVC API.
> Non-hantro drivers that do not need this can just skip it.

Even if I put this parameter in decode_params structure that would means that a generic
userland decoder will have to know how the compute this value for hantro HW since it
isn't something that could be done on kernel side.


Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>> +
>> +.. note::
>> +
>> +        This control is not yet part of the public kernel API and
>> +        it is expected to change.
>> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
>> index 1a9038f5f9fa..12e3c512d718 100644
>> --- a/Documentation/userspace-api/media/drivers/index.rst
>> +++ b/Documentation/userspace-api/media/drivers/index.rst
>> @@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
>>   
>>   	ccs
>>   	cx2341x-uapi
>> +        hantro
>>   	imx-uapi
>>   	max2175
>>   	meye-uapi
>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>> index 8e0109eea454..b713eeed1915 100644
>> --- a/include/media/hevc-ctrls.h
>> +++ b/include/media/hevc-ctrls.h
>> @@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
>>   	__u64	flags;
>>   };
>>   
>> +/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */
>> +#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
>> +/*
>> + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
>> + * the number of data (in bits) to skip in the
>> + * slice segment header.
>> + * If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
>> + * to before syntax element "slice_temporal_mvp_enabled_flag".
>> + * If IDR, the skipped bits are just "pic_output_flag"
>> + * (separate_colour_plane_flag is not supported).
>> + */
>> +#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	(V4L2_CID_CODEC_HANTRO_BASE + 0)
>> +
>>   #endif
>>
>
