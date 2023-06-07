Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9217D725B32
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 12:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239980AbjFGKA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 06:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbjFGKA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 06:00:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FC21735
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 03:00:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2C2763D3F
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 10:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962CDC4339B;
        Wed,  7 Jun 2023 10:00:23 +0000 (UTC)
Message-ID: <767acf49-587a-aeba-b599-bd1e606c6cc0@xs4all.nl>
Date:   Wed, 7 Jun 2023 12:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/5] media: v4l: Add documentation for Broadcom sand
 formats
Content-Language: en-US
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
        nicolas@ndufresne.ca
References: <20230310194121.61928-1-jc@kynesim.co.uk>
 <20230310194121.61928-4-jc@kynesim.co.uk>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230310194121.61928-4-jc@kynesim.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/2023 20:41, John Cox wrote:
> Add documentation for for the Broadcom sand formats to pixfmt-yuv-planar.

Small typo:

for for -> for

Regards,

	Hans

> 
> Signed-off-by: John Cox <jc@kynesim.co.uk>
> ---
>  .../media/v4l/pixfmt-yuv-planar.rst           | 195 ++++++++++++++++++
>  1 file changed, 195 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index f1d5bb7b806d..753e05beddc8 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -123,6 +123,20 @@ All components are stored with the same number of bits per component.
>        - Cb, Cr
>        - Yes
>        - 4x4 tiles
> +    * - V4L2_PIX_FMT_NV12_C128
> +      - 'CN12'
> +      - 8
> +      - 4:2:0
> +      - Cb, Cr
> +      - Yes
> +      - 128 byte columns
> +    * - V4L2_PIX_FMT_P030_C128
> +      - 'CN30'
> +      - 10
> +      - 4:2:0
> +      - Cb, Cr
> +      - Yes
> +      - 128 byte columns
>      * - V4L2_PIX_FMT_NV16
>        - 'NV16'
>        - 8
> @@ -277,6 +291,8 @@ of the luma plane.
>  .. _V4L2-PIX-FMT-NV12M-10BE-8L128:
>  .. _V4L2-PIX-FMT-NV12-10BE-8L128:
>  .. _V4L2-PIX-FMT-MM21:
> +.. _V4L2-PIX-FMT-NV12-C128:
> +.. _V4L2-PIX-FMT-P030-C128:
>  
>  Tiled NV12
>  ----------
> @@ -364,6 +380,185 @@ two non-contiguous planes.
>  
>      Example V4L2_PIX_FMT_NV12MT memory layout of tiles
>  
> +``V4L2_PIX_FMT_NV12_C128`` stores 8 bit luma and chroma data in 128 byte
> +columns. Chroma data follows luma in each column so in effect this format
> +consists of a sequence of NV12 pictures 128 pixels wide which are displayed
> +side by side. Height, which must be a multiple of 2 (h in the table below)
> +determines the offset to the start of chroma data. Overall (luma + chroma)
> +column height (ch in the table below) is also required and this is obtained
> +by dividing the sizeimage by bytesperline. Set bytesperline equal to number
> +of columns times column width i.e. bytesperline is width rounded up
> +to the next multiple of the column width (128).
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 15 10 10 10 10 4 10 10 10 10
> +
> +    * - start + 0:
> +      - Y'\ :sub:`0,0`
> +      - Y'\ :sub:`0,1`
> +      - Y'\ :sub:`0,2`
> +      - Y'\ :sub:`0,3`
> +      - ...
> +      - Y'\ :sub:`0,124`
> +      - Y'\ :sub:`0,125`
> +      - Y'\ :sub:`0,126`
> +      - Y'\ :sub:`0,127`
> +    * - start + 128:
> +      - Y'\ :sub:`1,0`
> +      - Y'\ :sub:`1,1`
> +      - Y'\ :sub:`1,2`
> +      - Y'\ :sub:`1,3`
> +      - ...
> +      - Y'\ :sub:`1,124`
> +      - Y'\ :sub:`1,125`
> +      - Y'\ :sub:`1,126`
> +      - Y'\ :sub:`1,127`
> +    * - start + 256:
> +      - Y'\ :sub:`2,0`
> +      - Y'\ :sub:`2,1`
> +      - Y'\ :sub:`2,2`
> +      - Y'\ :sub:`2,3`
> +      - ...
> +      - Y'\ :sub:`2,124`
> +      - Y'\ :sub:`2,125`
> +      - Y'\ :sub:`2,126`
> +      - Y'\ :sub:`2,127`
> +    * - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +    * - start + ((h-1) * 128):
> +      - Y'\ :sub:`h-1,0`
> +      - Y'\ :sub:`h-1,1`
> +      - Y'\ :sub:`h-1,2`
> +      - Y'\ :sub:`h-1,3`
> +      - ...
> +      - Y'\ :sub:`h-1,124`
> +      - Y'\ :sub:`h-1,125`
> +      - Y'\ :sub:`h-1,126`
> +      - Y'\ :sub:`h-1,127`
> +    * - start + ((h) * 128):
> +      - Cb\ :sub:`0,0`
> +      - Cr\ :sub:`0,0`
> +      - Cb\ :sub:`0,1`
> +      - Cr\ :sub:`0,1`
> +      - ...
> +      - Cb\ :sub:`0,62`
> +      - Cr\ :sub:`0,62`
> +      - Cb\ :sub:`0,63`
> +      - Cr\ :sub:`0,63`
> +    * - start + ((h+1) * 128):
> +      - Cb\ :sub:`1,0`
> +      - Cr\ :sub:`1,0`
> +      - Cb\ :sub:`1,1`
> +      - Cr\ :sub:`1,1`
> +      - ...
> +      - Cb\ :sub:`1,62`
> +      - Cr\ :sub:`1,62`
> +      - Cb\ :sub:`1,63`
> +      - Cr\ :sub:`1,63`
> +    * - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +    * - start + ((h+(h/2)-1) * 128):
> +      - Cb\ :sub:`(h/2)-1,0`
> +      - Cr\ :sub:`(h/2)-1,0`
> +      - Cb\ :sub:`(h/2)-1,1`
> +      - Cr\ :sub:`(h/2)-1,1`
> +      - ...
> +      - Cb\ :sub:`(h/2)-1,62`
> +      - Cr\ :sub:`(h/2)-1,62`
> +      - Cb\ :sub:`(h/2)-1,63`
> +      - Cr\ :sub:`(h/2)-1,63`
> +    * - start + (ch * 128):
> +      - Y'\ :sub:`0,128`
> +      - Y'\ :sub:`0,129`
> +      - Y'\ :sub:`0,130`
> +      - Y'\ :sub:`0,131`
> +      - ...
> +      - Y'\ :sub:`0,252`
> +      - Y'\ :sub:`0,253`
> +      - Y'\ :sub:`0,254`
> +      - Y'\ :sub:`0,255`
> +    * - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +
> +``V4L2_PIX_FMT_P030_C128`` uses the same 128 byte column structure as
> +``V4L2_PIX_FMT_NV12_C128``, but encodes 10-bit YUV.
> +3 10-bit values are packed into 4 bytes as bits 9:0, 19:10, and 29:20, with
> +bits 30 & 31 unused. For the luma plane, bits 9:0 are Y0, 19:10 are Y1, and
> +29:20 are Y2. For the chroma plane the samples always come in pairs of Cr
> +and Cb, so it needs to be considered 6 values packed in 8 bytes.
> +This gives 96 pixels per 128 byte column so bytesperline
> +is ((width + 95)/96)*128
> +
> +Bit-packed representation - Luma:
> +
> +.. flat-table::
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - byte
> +      - value(s)
> +    * - 0
> +      - Y'\ :sub:`00[7:0]`
> +    * - 1
> +      - Y'\ :sub:`01[5:0]`\  (bits 7--2)
> +      - Y'\ :sub:`00[9:8]`\  (bits 1--0)
> +    * - 2
> +      - Y'\ :sub:`02[3:0]`\  (bits 7--4)
> +      - Y'\ :sub:`01[9:6]`\  (bits 3--0)
> +    * - 3
> +      - unused (bits 7--6)
> +      - Y'\ :sub:`02[9:4]`\  (bits 5--0)
> +
> +Bit-packed representation - Chroma:
> +
> +.. flat-table::
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - byte
> +      - value(s)
> +    * - 0
> +      - Cb\ :sub:`00[7:0]`
> +    * - 1
> +      - Cr\ :sub:`00[5:0]`\  (bits 7--2)
> +      - Cb\ :sub:`00[9:8]`\  (bits 1--0)
> +    * - 2
> +      - Cb\ :sub:`01[3:0]`\  (bits 7--4)
> +      - Cr\ :sub:`00[9:6]`\  (bits 3--0)
> +    * - 3
> +      - unused (bits 7--6)
> +      - Cb\ :sub:`02[9:4]`\  (bits 5--0)
> +    * - 4
> +      - Cr\ :sub:`01[7:0]`
> +    * - 5
> +      - Cb\ :sub:`02[5:0]`\  (bits 7--2)
> +      - Cr\ :sub:`01[9:8]`\  (bits 1--0)
> +    * - 6
> +      - Cr\ :sub:`02[3:0]`\  (bits 7--4)
> +      - Cb\ :sub:`02[9:6]`\  (bits 3--0)
> +    * - 7
> +      - unused (bits 7--6)
> +      - Cr\ :sub:`02[9:4]`\  (bits 5--0)
>  
>  .. _V4L2-PIX-FMT-NV16:
>  .. _V4L2-PIX-FMT-NV61:

