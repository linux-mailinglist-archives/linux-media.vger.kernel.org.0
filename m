Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBA4321D08
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhBVQaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:30:55 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59502 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhBVQ3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:29:20 -0500
Received: from [IPv6:2a01:e0a:4cb:a870:5956:412c:4850:9073] (unknown [IPv6:2a01:e0a:4cb:a870:5956:412c:4850:9073])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E845C1F450A3;
        Mon, 22 Feb 2021 16:28:33 +0000 (GMT)
Subject: Re: [PATCH v2 4/9] media: uapi: Add a control for HANTRO driver
To:     John Cox <jc@kynesim.co.uk>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20210218191844.297869-1-benjamin.gaignard@collabora.com>
 <20210218191844.297869-5-benjamin.gaignard@collabora.com>
 <9ql73glgbnjaqqsp8ulqenae5n82kfk0o3@4ax.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <6364fa8a-db6a-af43-3660-7f0a7a3e0b79@collabora.com>
Date:   Mon, 22 Feb 2021 17:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9ql73glgbnjaqqsp8ulqenae5n82kfk0o3@4ax.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 22/02/2021 à 17:16, John Cox a écrit :
>> The HEVC HANTRO driver needs to know the number of bits to skip at
>> the beginning of the slice header.
>> That is a hardware specific requirement so create a dedicated control
>> that this purpose.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> include/uapi/linux/hantro-v4l2-controls.h | 20 ++++++++++++++++++++
>> include/uapi/linux/v4l2-controls.h        |  5 +++++
>> 2 files changed, 25 insertions(+)
>> create mode 100644 include/uapi/linux/hantro-v4l2-controls.h
>>
>> diff --git a/include/uapi/linux/hantro-v4l2-controls.h b/include/uapi/linux/hantro-v4l2-controls.h
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
>> +#define V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS	(V4L2_CID_USER_HANTRO_BASE + 0)
>> +
>> +/**
>> + * struct hantro_hevc_extra_decode_params - extra decode parameters for hantro driver
>> + * @hevc_hdr_skip_lenght:	header first bits offset
>> + */
>> +struct hantro_hevc_extra_decode_params {
>> +	__u32	hevc_hdr_skip_lenght;
>> +	__u8	padding[4];
>> +};
> Can you clarify how hevc_hdr_skip_length differs from
> v4l2_ctrl_hevc_slice_params.data_bit_offset?  At first sight they would
> appear to be very similar.

hevc_hdr_skip_length is the difference between the start positions of 2 nals.
v4l2_ctrl_hevc_slice_params.data_bit_offset is the offset of the data in the nal.


Benjamin

>
> Regards
>
> John Cox
>
>> +#endif
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 039c0d7add1b..ced7486c7f46 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -209,6 +209,11 @@ enum v4l2_colorfx {
>>   * We reserve 128 controls for this driver.
>>   */
>> #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 0x10f0)
>> +/*
>> + * The base for HANTRO driver controls.
>> + * We reserve 32 controls for this driver.
>> + */
>> +#define V4L2_CID_USER_HANTRO_BASE		(V4L2_CID_USER_BASE + 0x1170)
>>
>> /* MPEG-class control IDs */
>> /* The MPEG controls are applicable to all codec controls
