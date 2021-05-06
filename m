Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87AE375417
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhEFMvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:51:24 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51061 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229584AbhEFMvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:51:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id edSMlv6XlyEWwedSPl13Vh; Thu, 06 May 2021 14:50:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620305423; bh=K3TQ5Oicz5+r8i9gQQfd6zKGle8y9tYgH8kJCMW3wQA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=upNhIkExWaYt/ZamhrevHvQuMgs1byprylVgRr/tpAjFlnWoMd/AUlWiumNKVyvnR
         e/0U+1ITfU8dgewhUOB1d2PLI8a10stFl40PVAIVInApepr3fkPtl83nE66oOW7Hog
         WktGd6eSQT2OyNwCdMrKf8Xt7BMbpa03sK8XqtQSqaLo/WpBsuFRGlWalFX2NFCwfM
         1aqAAKG+fJ4aZiKgJdXP9+V4CS4lItqpCP3V64dDIpMmLI7BZ+i0ED1JpMvYMfIGM5
         dL3K593JiMe3UTT2RgVpeOZxvv4TzqpSRD9BvVggbVPiI3PNlcVeSgI4fxc6DPgDm0
         1/D/S3UBgeGCg==
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
 <20210420121046.181889-7-benjamin.gaignard@collabora.com>
 <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
 <1cf94540-7f4d-0179-dd1e-0b82ee30f6d2@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <815a4bd6-599b-cfb8-9ddc-efa4b7092c23@xs4all.nl>
Date:   Thu, 6 May 2021 14:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1cf94540-7f4d-0179-dd1e-0b82ee30f6d2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfA5gObUZRMJwL5EnKYVFy/jiVJqnngBoF/9iy18Nv4sm6KyMRzVLHtlecWB6vedDmmkD3Hr/vNGWrhY35jPviUP/UOOQ3CTEQc9eiXjLz87VRCfw3XYS
 aisdRTuwTDonFmIVnD8MDEqTEAMRefT0fMVvjWfTXQCMM/s/ups6+CuHvRznpoT1CYHWlo4BtF2OgRufynbJke4G6FbtBZJ35V1wVHaB0x7EwkX3h7v7qIkJ
 OXAa7bTbcmfEM4XwYKOyiGCpVrIbRK4J5EPlf3VKpg5ifNNRLKT8SFey8J7TV+YqTOTKApEFc98vS64sQW9XPiMSNf/JEVu3qP5ZksSMXHAYTDmx5sc9JEkK
 U2CMVkK3cdx04U8881cyMiFyHf5azKxXem1fTfzrcf3Kf59A5CdVmLJbp+JwaXdEJv+KKk7GzNPMT3MUKBqbewHNP8SKopS7DPB6bPGC+6VNFKlu29W+mEMb
 JIg57vF1qWcb09EHvwgPuoope1dqi4F15/W+hRLUklkPi7xF3xlo9+wBJ06LrTC4LmkqGxd9UC7XQiROP+EI92KXJDCkLTMlwjqqtD80XzdN+QtIB1Fe+mqh
 N7+JRS8nD2BUpqY3mOiK+jiRCeNP2LpECcRan2Twt2rvt7ISlglW2Y5WPda0Dl29nAmJXqGHbHM/2wr0geSxUIOB3BL7RcRJ6reeNYKowgLDW+shUpBqSMMP
 KhAluwQ88AJGoRmx4/P0T9Iiuny8T8tMtBeC0c9ZAlz23COKxM8jUaj/dfNYK7q/eNUrHWlbzaMJQygDb4/0aoQBTMqkzrmf/TR5glBRjGN0J/1p3zUz/ytp
 WrrU/WPemDB7AtqmR0wWyPl9zv8S5vHB9EH6cXrZ+tILSvCLYTn8htfJha43b9UmyPUEkgPUDfoEQHgOirXel62JfV7tLYzhBx/FtghjuCKWcX6oq+pp7R44
 zIMcdKwO2/aPI98nfCG3r16uXELuczGuaew4ogdZ+Ls05h6xy3KWsjbO+uQSSQcWCOQO1DUFCum8i3ytDtJZAvkPG+5t2Ybped0+urU0i+M4UdqN
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2021 17:20, Benjamin Gaignard wrote:
> 
> Le 05/05/2021 à 16:55, Hans Verkuil a écrit :
>> On 20/04/2021 14:10, Benjamin Gaignard wrote:
>>> The HEVC HANTRO driver needs to know the number of bits to skip at
>>> the beginning of the slice header.
>>> That is a hardware specific requirement so create a dedicated control
>>> for this purpose.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>   .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
>>>   .../userspace-api/media/drivers/index.rst     |  1 +
>>>   include/media/hevc-ctrls.h                    | 13 +++++++++++++
>>>   3 files changed, 33 insertions(+)
>>>   create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
>>>
>>> diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
>>> new file mode 100644
>>> index 000000000000..cd9754b4e005
>>> --- /dev/null
>>> +++ b/Documentation/userspace-api/media/drivers/hantro.rst
>>> @@ -0,0 +1,19 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +Hantro video decoder driver
>>> +===========================
>>> +
>>> +The Hantro video decoder driver implements the following driver-specific controls:
>>> +
>>> +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
>>> +    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
>>> +    skip in the slice segment header.
>>> +    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
>>> +    to before syntax element "slice_temporal_mvp_enabled_flag".
>>> +    If IDR, the skipped bits are just "pic_output_flag"
>>> +    (separate_colour_plane_flag is not supported).
>> I'm not very keen on this. Without this information the video data cannot be
>> decoded, or will it just be suboptimal?
> 
> Without that information the video can't be decoded.
> 
>>
>> The problem is that a generic decoder would have to know that the HW is a hantro,
>> and then call this control. If they don't (and are testing on non-hantro HW), then
>> it won't work, thus defeating the purpose of the HW independent decoder API.
>>
>> Since hantro is widely used, and if there is no other way to do this beside explitely
>> setting this control, then perhaps this should be part of the standard HEVC API.
>> Non-hantro drivers that do not need this can just skip it.
> 
> Even if I put this parameter in decode_params structure that would means that a generic
> userland decoder will have to know how the compute this value for hantro HW since it
> isn't something that could be done on kernel side.

But since hantro is very common, any userland decoder will need to calculate this anyway.
So perhaps it is better to have this as part of the decode_params?

I'd like to know what others think about this.

Regards,

	Hans

> 
> 
> Regards,
> Benjamin
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +
>>> +.. note::
>>> +
>>> +        This control is not yet part of the public kernel API and
>>> +        it is expected to change.
>>> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
>>> index 1a9038f5f9fa..12e3c512d718 100644
>>> --- a/Documentation/userspace-api/media/drivers/index.rst
>>> +++ b/Documentation/userspace-api/media/drivers/index.rst
>>> @@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
>>>   
>>>   	ccs
>>>   	cx2341x-uapi
>>> +        hantro
>>>   	imx-uapi
>>>   	max2175
>>>   	meye-uapi
>>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>>> index 8e0109eea454..b713eeed1915 100644
>>> --- a/include/media/hevc-ctrls.h
>>> +++ b/include/media/hevc-ctrls.h
>>> @@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
>>>   	__u64	flags;
>>>   };
>>>   
>>> +/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */
>>> +#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
>>> +/*
>>> + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
>>> + * the number of data (in bits) to skip in the
>>> + * slice segment header.
>>> + * If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
>>> + * to before syntax element "slice_temporal_mvp_enabled_flag".
>>> + * If IDR, the skipped bits are just "pic_output_flag"
>>> + * (separate_colour_plane_flag is not supported).
>>> + */
>>> +#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	(V4L2_CID_CODEC_HANTRO_BASE + 0)
>>> +
>>>   #endif
>>>
>>

