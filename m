Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55AC31FC1C
	for <lists+linux-media@lfdr.de>; Fri, 19 Feb 2021 16:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhBSPgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Feb 2021 10:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhBSPfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Feb 2021 10:35:52 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E14C061574;
        Fri, 19 Feb 2021 07:35:11 -0800 (PST)
Received: from [IPv6:2a01:e0a:4cb:a870:9157:afa6:f219:3c2c] (unknown [IPv6:2a01:e0a:4cb:a870:9157:afa6:f219:3c2c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D16F01F46406;
        Fri, 19 Feb 2021 15:34:54 +0000 (GMT)
Subject: Re: [PATCH v2 4/9] media: uapi: Add a control for HANTRO driver
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20210218191844.297869-1-benjamin.gaignard@collabora.com>
 <20210218191844.297869-5-benjamin.gaignard@collabora.com>
 <2850677.34AhzSeaHW@kista>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <3ec0c7ba-7492-02d1-8beb-fe692ba7d265@collabora.com>
Date:   Fri, 19 Feb 2021 16:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2850677.34AhzSeaHW@kista>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 18/02/2021 à 22:34, Jernej Škrabec a écrit :
> Hi!
>
> Dne četrtek, 18. februar 2021 ob 20:18:39 CET je Benjamin Gaignard napisal(a):
>> The HEVC HANTRO driver needs to know the number of bits to skip at
>> the beginning of the slice header.
>> That is a hardware specific requirement so create a dedicated control
>> that this purpose.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   include/uapi/linux/hantro-v4l2-controls.h | 20 ++++++++++++++++++++
>>   include/uapi/linux/v4l2-controls.h        |  5 +++++
>>   2 files changed, 25 insertions(+)
>>   create mode 100644 include/uapi/linux/hantro-v4l2-controls.h
>>
>> diff --git a/include/uapi/linux/hantro-v4l2-controls.h b/include/uapi/linux/
> hantro-v4l2-controls.h
>> new file mode 100644
>> index 000000000000..30b1999b7af3
>> --- /dev/null
>> +++ b/include/uapi/linux/hantro-v4l2-controls.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +
>> +#ifndef __UAPI_HANTRO_V4L2_CONYTROLS_H__
>> +#define __UAPI_HANTRO_V4L2_CONYTROLS_H__
>> +
>> +#include <linux/v4l2-controls.h>
>> +#include <media/hevc-ctrls.h>
>> +
>> +#define V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS	
> (V4L2_CID_USER_HANTRO_BASE + 0)
>> +
>> +/**
>> + * struct hantro_hevc_extra_decode_params - extra decode parameters for
> hantro driver
>> + * @hevc_hdr_skip_lenght:	header first bits offset
>> + */
>> +struct hantro_hevc_extra_decode_params {
>> +	__u32	hevc_hdr_skip_lenght;
> typo: lenght -> length
>
> Same mistake in description above.

Thanks I will fix that in v3

Benjamin

>
> Best regards,
> Jernej
>
>> +	__u8	padding[4];
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-
> controls.h
>> index 039c0d7add1b..ced7486c7f46 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -209,6 +209,11 @@ enum v4l2_colorfx {
>>    * We reserve 128 controls for this driver.
>>    */
>>   #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE +
> 0x10f0)
>> +/*
>> + * The base for HANTRO driver controls.
>> + * We reserve 32 controls for this driver.
>> + */
>> +#define V4L2_CID_USER_HANTRO_BASE		(V4L2_CID_USER_BASE +
> 0x1170)
>>   
>>   /* MPEG-class control IDs */
>>   /* The MPEG controls are applicable to all codec controls
>> -- 
>> 2.25.1
>>
>>
>
>
