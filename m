Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987AA39DB62
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 13:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhFGLdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 07:33:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39166 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhFGLdW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 07:33:22 -0400
Received: from [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d] (unknown [IPv6:2a01:e0a:4cb:a870:6b79:f23c:29c1:895d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7A9241F4226B;
        Mon,  7 Jun 2021 12:31:29 +0100 (BST)
Subject: Re: [PATCH 4/8] media: Add P010 video format
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, hverkuil@xs4all.nl,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
 <20210604130619.491200-5-benjamin.gaignard@collabora.com>
 <f9fccfc4325e32022fac5f2c7b11c5e6b42e6fc8.camel@ndufresne.ca>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <d7b89e82-4b7a-69ce-74ad-d61934c03764@collabora.com>
Date:   Mon, 7 Jun 2021 13:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f9fccfc4325e32022fac5f2c7b11c5e6b42e6fc8.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 04/06/2021 à 18:17, Nicolas Dufresne a écrit :
> Le vendredi 04 juin 2021 à 15:06 +0200, Benjamin Gaignard a écrit :
>> P010 is a YUV format with 10-bits per pixel with interleaved UV.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../userspace-api/media/v4l/pixfmt-yuv-planar.rst         | 8 ++++++++
>>   drivers/media/v4l2-core/v4l2-common.c                     | 1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>>   include/uapi/linux/videodev2.h                            | 1 +
>>   4 files changed, 11 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> index 090c091affd2..71fed70c03ec 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> @@ -100,6 +100,13 @@ All components are stored with the same number of bits per component.
>>         - Cb, Cr
>>         - No
>>         - 64x32 macroblocks
>> +    * - V4L2_PIX_FMT_P010
>> +      - 'P010'
>> +      - 10
>> +      - 4:2:0
>> +      - Cb, Cr
>> +      - No
>> +      - Linear
>>   
>>           Horizontal Z order
>>       * - V4L2_PIX_FMT_NV12MT_16X16
>> @@ -171,6 +178,7 @@ horizontally.
>>   .. _V4L2-PIX-FMT-NV21:
>>   .. _V4L2-PIX-FMT-NV12M:
>>   .. _V4L2-PIX-FMT-NV21M:
>> +.. _V4L2-PIX-FMT-P010:
> The NV12/21 documentation is not sufficient to describe this format. While it
> shares the layout (two planes Y and interleaved UV), it does not share the
> packing. In this case, assuming this is P010 (and not the P010 the Rockchip
> tried to upstreamed previously), each 10bit worth of pixel data would be pakced
> into 16 bits with the least significant 6 bit being padding bits.

Yes it 10 bits packed in 16 bits. I was think that the 'Bits per component' columns
was referring to the number of encoded bits.
So like this is it fine ? or does something else than the bit per component need to be changed ?
  * - V4L2_PIX_FMT_P010
       - 'P010'
       - 16
       - 4:2:0
       - Cb, Cr
       - No
       - Linear

Regards,
Benjamin

>
>>   
>>   NV12, NV21, NV12M and NV21M
>>   ---------------------------
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
