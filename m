Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D8868E963
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 08:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjBHH4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 02:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjBHH4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 02:56:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C931C1F4AD;
        Tue,  7 Feb 2023 23:56:31 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FCD3496;
        Wed,  8 Feb 2023 08:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675842988;
        bh=8RcMGxETIxw0FC6jrw5xpxdFe6lSfy/9ZdTOFaZqE6Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YHW1EQCYyW3ZhIadphPFRz1KCphY7AmSzSD9akz5yjgrhpb5+P2X/rW2BtPcdBAC/
         Qruz1FTZiyRxxUZUMyr6iqUbXqpN2ekCmiSlhrGMtS056dSkL0oR/lh4x9UAg8mVnl
         yb3GM7iNuJKpd2XtjRTsPMFSYz2nBOBECKa35hC4=
Message-ID: <234cee3f-3902-16d8-8fb7-6d79749d9379@ideasonboard.com>
Date:   Wed, 8 Feb 2023 09:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/7] media: Add 2-10-10-10 RGB formats
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
        kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        nicolas@ndufresne.ca, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221221092448.741294-2-tomi.valkeinen+renesas@ideasonboard.com>
 <12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/02/2023 03:53, Akira Yokosawa wrote:
> [+CC: Maruo and Hans, who are listed in the SOB area of offending commit]
> 
> Hi Tomi,
> 
> I'm observing build failure of "make pdfdocs" against linux-next due to
> this change whose commitid is 8d0e3fc61abd.
> 
>> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   3 +
>>   include/uapi/linux/videodev2.h                |   3 +
>>   3 files changed, 200 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>> index 30f51cd33f99..d330aeb4d3eb 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>> @@ -763,6 +763,200 @@ nomenclature that instead use the order of components as seen in a 24- or
>>       \normalsize
>>   
>>   
>> +10 Bits Per Component
>> +=====================
>> +
>> +These formats store a 30-bit RGB triplet with an optional 2 bit alpha in four
>> +bytes. They are named based on the order of the RGB components as seen in a
>> +32-bit word, which is then stored in memory in little endian byte order
>> +(unless otherwise noted by the presence of bit 31 in the 4CC value), and on the
>> +number of bits for each component.
>> +
>> +.. raw:: latex
>> +
>> +    \begingroup
>> +    \tiny
>> +    \setlength{\tabcolsep}{2pt}
>> +
>> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
>> +
>> +
>> +.. flat-table:: RGB Formats 10 Bits Per Color Component
>> +    :header-rows:  2
>> +    :stub-columns: 0
>> +
>> +    * - Identifier
>> +      - Code
>> +      - :cspan:`7` Byte 0 in memory
>> +      - :cspan:`7` Byte 1
>> +      - :cspan:`7` Byte 2
>> +      - :cspan:`7` Byte 3
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
>> +
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
>> +    * .. _V4L2-PIX-FMT-RGBX1010102:
>> +
>> +      - ``V4L2_PIX_FMT_RGBX1010102``
>> +      - 'RX30'
>> +
>> +      - b\ :sub:`5`
>> +      - b\ :sub:`4`
>> +      - b\ :sub:`3`
>> +      - b\ :sub:`2`
>> +      - b\ :sub:`1`
>> +      - b\ :sub:`0`
>> +      - x
>> +      - x
>> +
>> +      - g\ :sub:`3`
>> +      - g\ :sub:`2`
>> +      - g\ :sub:`1`
>> +      - g\ :sub:`0`
>> +      - b\ :sub:`9`
>> +      - b\ :sub:`8`
>> +      - b\ :sub:`7`
>> +      - b\ :sub:`6`
>> +
>> +      - r\ :sub:`1`
>> +      - r\ :sub:`0`
>> +      - g\ :sub:`9`
>> +      - g\ :sub:`8`
>> +      - g\ :sub:`7`
>> +      - g\ :sub:`6`
>> +      - g\ :sub:`5`
>> +      - g\ :sub:`4`
>> +
>> +      - r\ :sub:`9`
>> +      - r\ :sub:`8`
>> +      - r\ :sub:`7`
>> +      - r\ :sub:`6`
>> +      - r\ :sub:`5`
>> +      - r\ :sub:`4`
>> +      - r\ :sub:`3`
>> +      - r\ :sub:`2`
>> +      -
> 
> This extra "-"
> 
>> +    * .. _V4L2-PIX-FMT-RGBA1010102:
>> +
>> +      - ``V4L2_PIX_FMT_RGBA1010102``
>> +      - 'RA30'
>> +
>> +      - b\ :sub:`5`
>> +      - b\ :sub:`4`
>> +      - b\ :sub:`3`
>> +      - b\ :sub:`2`
>> +      - b\ :sub:`1`
>> +      - b\ :sub:`0`
>> +      - a\ :sub:`1`
>> +      - a\ :sub:`0`
>> +
>> +      - g\ :sub:`3`
>> +      - g\ :sub:`2`
>> +      - g\ :sub:`1`
>> +      - g\ :sub:`0`
>> +      - b\ :sub:`9`
>> +      - b\ :sub:`8`
>> +      - b\ :sub:`7`
>> +      - b\ :sub:`6`
>> +
>> +      - r\ :sub:`1`
>> +      - r\ :sub:`0`
>> +      - g\ :sub:`9`
>> +      - g\ :sub:`8`
>> +      - g\ :sub:`7`
>> +      - g\ :sub:`6`
>> +      - g\ :sub:`5`
>> +      - g\ :sub:`4`
>> +
>> +      - r\ :sub:`9`
>> +      - r\ :sub:`8`
>> +      - r\ :sub:`7`
>> +      - r\ :sub:`6`
>> +      - r\ :sub:`5`
>> +      - r\ :sub:`4`
>> +      - r\ :sub:`3`
>> +      - r\ :sub:`2`
>> +      -
> 
> , this one
> 
>> +    * .. _V4L2-PIX-FMT-ARGB2101010:
>> +
>> +      - ``V4L2_PIX_FMT_ARGB2101010``
>> +      - 'AR30'
>> +
>> +      - b\ :sub:`7`
>> +      - b\ :sub:`6`
>> +      - b\ :sub:`5`
>> +      - b\ :sub:`4`
>> +      - b\ :sub:`3`
>> +      - b\ :sub:`2`
>> +      - b\ :sub:`1`
>> +      - b\ :sub:`0`
>> +
>> +      - g\ :sub:`5`
>> +      - g\ :sub:`4`
>> +      - g\ :sub:`3`
>> +      - g\ :sub:`2`
>> +      - g\ :sub:`1`
>> +      - g\ :sub:`0`
>> +      - b\ :sub:`9`
>> +      - b\ :sub:`8`
>> +
>> +      - r\ :sub:`3`
>> +      - r\ :sub:`2`
>> +      - r\ :sub:`1`
>> +      - r\ :sub:`0`
>> +      - g\ :sub:`9`
>> +      - g\ :sub:`8`
>> +      - g\ :sub:`7`
>> +      - g\ :sub:`6`
>> +
>> +      - a\ :sub:`1`
>> +      - a\ :sub:`0`
>> +      - r\ :sub:`9`
>> +      - r\ :sub:`8`
>> +      - r\ :sub:`7`
>> +      - r\ :sub:`6`
>> +      - r\ :sub:`5`
>> +      - r\ :sub:`4`
>> +      -
> 
> , and this one causes the Sphinx LaTeX builder emits userspace-api.tex
> which causes latexmk error saying:
> 
> ---------------
> Latexmk: Getting log file 'userspace-api.log'
> Latexmk: Examining 'userspace-api.fls'
> Latexmk: Examining 'userspace-api.log'
> Latexmk: Index file 'userspace-api.idx' was written
> Latexmk: References changed.
> Latexmk: Missing input file 'userspace-api.ind' (or dependence on it) from following:
>    'No file userspace-api.ind.'
> Latexmk: References changed.
> Latexmk: References changed.
> Latexmk: Log file says output to 'userspace-api.xdv'
> Latexmk: Errors, so I did not complete making targets
> Collected error summary (may duplicate other messages):
>    xelatex: Command for 'xelatex' gave return code 1
>        Refer to 'userspace-api.log' for details
> ------------
> 
> There looks to be no useful info in userspace-api.log.
> 
> Tomi, can you remove those extra "-"s I mentioned above?
> 
> Hopefully, this can be fixed before the v6.3 merge window.

This is all black magics to me... Why does the same format work 
elsewhere in the file, but not here (I just copy pasted it)?

Oh well... I can send a fix, although I don't know why it's broken =).

  Tomi

