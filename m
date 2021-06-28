Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506913B5F2C
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 15:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhF1NkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 09:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbhF1NkF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 09:40:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362B3C0617AE;
        Mon, 28 Jun 2021 06:37:39 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:fc14:fe1d:1736:64c2] (unknown [IPv6:2a01:e0a:4cb:a870:fc14:fe1d:1736:64c2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8493F1F42794;
        Mon, 28 Jun 2021 14:37:36 +0100 (BST)
Subject: Re: [PATCH v3 4/8] media: Add P010 video format
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, hverkuil@xs4all.nl,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, jernej.skrabec@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
 <20210618131526.566762-5-benjamin.gaignard@collabora.com>
 <d6925e114f142b8844b6e112f837b9ef32566212.camel@ndufresne.ca>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <e81bd766-fa5b-ba79-69e3-ef6b88a0da79@collabora.com>
Date:   Mon, 28 Jun 2021 15:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d6925e114f142b8844b6e112f837b9ef32566212.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 25/06/2021 à 21:33, Nicolas Dufresne a écrit :
> Le vendredi 18 juin 2021 à 15:15 +0200, Benjamin Gaignard a écrit :
>> P010 is a YUV format with 10-bits per pixel with interleaved UV.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Hi Nicolas,
Thanks for the ack and, since it is the same patch, we could applied on v4 serie.

Benjamin

>> ---
>> version 2:
>>   - Add documentation about P010 padding
>>   - Fix the number of bits per component (16)
>>
>>   .../media/v4l/pixfmt-yuv-planar.rst           | 78 ++++++++++++++++++-
>>   drivers/media/v4l2-core/v4l2-common.c         |  1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>>   include/uapi/linux/videodev2.h                |  1 +
>>   4 files changed, 79 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> index 090c091affd2..af400d37c8fd 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> @@ -100,8 +100,13 @@ All components are stored with the same number of bits per component.
>>         - Cb, Cr
>>         - No
>>         - 64x32 macroblocks
>> -
>> -        Horizontal Z order
>> +    * - V4L2_PIX_FMT_P010
>> +      - 'P010'
>> +      - 16
>> +      - 4:2:0
>> +      - Cb, Cr
>> +      - No
>> +      - Linear
>>       * - V4L2_PIX_FMT_NV12MT_16X16
>>         - 'VM12'
>>         - 8
>> @@ -171,6 +176,7 @@ horizontally.
>>   .. _V4L2-PIX-FMT-NV21:
>>   .. _V4L2-PIX-FMT-NV12M:
>>   .. _V4L2-PIX-FMT-NV21M:
>> +.. _V4L2-PIX-FMT-P010:
>>   
>>   NV12, NV21, NV12M and NV21M
>>   ---------------------------
>> @@ -470,6 +476,74 @@ number of lines as the luma plane.
>>         - Cb\ :sub:`33`
>>         - Cr\ :sub:`33`
>>   
>> +.. _V4L2_PIX_FMT_P010:
>> +
>> +P010
>> +----
>> +
>> +The number of bytes in one luminance row must be divisible by 16,
>> +which means there will be padded 0 in the right edge when necessary.
>> +
>> +.. raw:: latex
>> +
>> +    \begingroup
>> +    \small
>> +    \setlength{\tabcolsep}{2pt}
>> +
>> +.. tabularcolumns:: |p{2.6cm}|p{0.70cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
>> +
>> +.. flat-table:: P010 16 Bits per component
>> +    :header-rows:  2
>> +    :stub-columns: 0
>> +
>> +    * - Identifier
>> +      - Code
>> +      - :cspan:`7` Byte 0 in memory
>> +
>> +      - :cspan:`7` Byte 1
>> +    * -
>> +      -
>> +      - 7
>> +      - 6
>> +      - 5
>> +      - 4
>> +      - 3
>> +      - 2
>> +      - 1
>> +      - 0
>> +
>> +      - 7
>> +      - 6
>> +      - 5
>> +      - 4
>> +      - 3
>> +      - 2
>> +      - 1
>> +      - 0
>> +    * - ``V4L2_PIX_FMT_P010``
>> +      - 'P010'
>> +
>> +      - Y\ :sub:`9`
>> +      - Y\ :sub:`8`
>> +      - Y\ :sub:`7`
>> +      - Y\ :sub:`6`
>> +      - Y\ :sub:`5`
>> +      - Y\ :sub:`4`
>> +      - Y\ :sub:`3`
>> +      - Y\ :sub:`2`
>> +
>> +      - Y\ :sub:`1`
>> +      - Y\ :sub:`0`
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +
>> +.. raw:: latex
>> +
>> +    \endgroup
>>   
>>   Fully Planar YUV Formats
>>   ========================
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index 04af03285a20..37b5d82359dd 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -266,6 +266,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>   		{ .format = V4L2_PIX_FMT_NV61,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
>>   
>>   		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
>>   		{ .format = V4L2_PIX_FMT_YVU410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 2673f51aafa4..6404d5b6e350 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1282,6 +1282,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>   	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
>>   	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
>>   	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
>> +	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CrCb 4:2:0"; break;
>>   	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
>>   	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
>>   	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 9260791b8438..e5f7acde0730 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -602,6 +602,7 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
>>   #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
>>   #define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8  YUV 4:2:0 16x16 macroblocks */
>> +#define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 15  Y/CbCr 4:2:0 10-bit per pixel*/
>>   
>>   /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
>>   #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */
>
