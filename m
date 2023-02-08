Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD2F68E5A0
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 02:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjBHByD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 20:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjBHByC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 20:54:02 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1549724CB1;
        Tue,  7 Feb 2023 17:54:01 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id bx22so13999591pjb.3;
        Tue, 07 Feb 2023 17:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNa4A16DhgRDYxoWWKprL/mSTYNhCOiQkyFeU51R3oI=;
        b=gWCM6Mz34SJGOPSup/XSJpcL1i71atWNx+x43gaSeiWgoMfOKyUaHv9TKr260EpLnn
         xuNdH0aPU8Mwfoa1ggKAefMzWF3YoAUhiDz8nmIIVKqxragLzzL+bVUcMjazSoCXDfZb
         4RmthYmNGpeOZ9yd1jsn5M5UCa0on2SUUVFf0DH3h2zTaS3vtRLQ4thv2OhABkUCHcXN
         fhrrJ274Iai1sJCcstr4mFFoOBxji++0QecYD3HKL4qdKGVEDLAfhIw6cd64PUbfhF4t
         5OyoatMIhQmFvW+7GT6efuGz2NmW93/FnfuE3NaRDbQS8U96V3ZiviZ9HH2V0XgmhWpq
         CxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNa4A16DhgRDYxoWWKprL/mSTYNhCOiQkyFeU51R3oI=;
        b=ZUL1MkDVfb5+KyhD/a7sv+sLhat5XEhUFSnSfwPL5hp97R9FP6R/szvaAbg97BQx4N
         N127yl29HCbpCGsnwnTJgwKqFX/nZ6V6w0MJV/O1hktrC2jvz9yzEC3qYWk0pvPsMtCs
         axLRUSAfwCl6duZv76C9hNwyohWD1Rb3SUCK5lGkVSNWV4E7E02018N1z1H5KN7ybyIw
         hTnyaX3lxkBt9bMkRsYCbGV12jzG7wDcoQ4VZ5043nQUzvcJNYcvn0cllBTrwziWu0Gg
         t0xQLe+KH9mLwbxrc8dzKcTSQDZKWSSdzfxWFZ7EJzWwyGMqVa1Z2JLJORe7AJrx6Q9U
         TCVw==
X-Gm-Message-State: AO0yUKXXmes/sk1V/kZwxTukl8/kWsWvOIhbqV6tPZKpWshry8ueoA3v
        es6n5TFV8z0FftmdH8R/q2s=
X-Google-Smtp-Source: AK7set+Qtt2AjyV20J+XZuy6V8EtMbyEEeEBIV97rFjH6jNZgvDeMI4o0AYUY6z4ORaJcbPiIrOnhQ==
X-Received: by 2002:a05:6a20:3d11:b0:b9:6932:7d71 with SMTP id y17-20020a056a203d1100b000b969327d71mr6740984pzi.26.1675821240488;
        Tue, 07 Feb 2023 17:54:00 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id v5-20020a63b645000000b004b1fef0bf16sm8567563pgt.73.2023.02.07.17.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 17:54:00 -0800 (PST)
Message-ID: <12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com>
Date:   Wed, 8 Feb 2023 10:53:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To:     tomi.valkeinen+renesas@ideasonboard.com
Cc:     dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
        kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        nicolas@ndufresne.ca, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Akira Yokosawa <akiyks@gmail.com>
References: <20221221092448.741294-2-tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 1/7] media: Add 2-10-10-10 RGB formats
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221221092448.741294-2-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[+CC: Maruo and Hans, who are listed in the SOB area of offending commit]

Hi Tomi,

I'm observing build failure of "make pdfdocs" against linux-next due to
this change whose commitid is 8d0e3fc61abd.

> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   3 +
>  include/uapi/linux/videodev2.h                |   3 +
>  3 files changed, 200 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> index 30f51cd33f99..d330aeb4d3eb 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> @@ -763,6 +763,200 @@ nomenclature that instead use the order of components as seen in a 24- or
>      \normalsize
>  
>  
> +10 Bits Per Component
> +=====================
> +
> +These formats store a 30-bit RGB triplet with an optional 2 bit alpha in four
> +bytes. They are named based on the order of the RGB components as seen in a
> +32-bit word, which is then stored in memory in little endian byte order
> +(unless otherwise noted by the presence of bit 31 in the 4CC value), and on the
> +number of bits for each component.
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \tiny
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. tabularcolumns:: |p{2.8cm}|p{2.0cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +
> +
> +.. flat-table:: RGB Formats 10 Bits Per Color Component
> +    :header-rows:  2
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - :cspan:`7` Byte 0 in memory
> +      - :cspan:`7` Byte 1
> +      - :cspan:`7` Byte 2
> +      - :cspan:`7` Byte 3
> +    * -
> +      -
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * .. _V4L2-PIX-FMT-RGBX1010102:
> +
> +      - ``V4L2_PIX_FMT_RGBX1010102``
> +      - 'RX30'
> +
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - x
> +      - x
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      -

This extra "-"

> +    * .. _V4L2-PIX-FMT-RGBA1010102:
> +
> +      - ``V4L2_PIX_FMT_RGBA1010102``
> +      - 'RA30'
> +
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      -

, this one

> +    * .. _V4L2-PIX-FMT-ARGB2101010:
> +
> +      - ``V4L2_PIX_FMT_ARGB2101010``
> +      - 'AR30'
> +
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +
> +      - a\ :sub:`1`
> +      - a\ :sub:`0`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      -

, and this one causes the Sphinx LaTeX builder emits userspace-api.tex
which causes latexmk error saying:

---------------
Latexmk: Getting log file 'userspace-api.log'
Latexmk: Examining 'userspace-api.fls'
Latexmk: Examining 'userspace-api.log'
Latexmk: Index file 'userspace-api.idx' was written
Latexmk: References changed.
Latexmk: Missing input file 'userspace-api.ind' (or dependence on it) from following:
  'No file userspace-api.ind.'
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to 'userspace-api.xdv'
Latexmk: Errors, so I did not complete making targets
Collected error summary (may duplicate other messages):
  xelatex: Command for 'xelatex' gave return code 1
      Refer to 'userspace-api.log' for details
------------

There looks to be no useful info in userspace-api.log.

Tomi, can you remove those extra "-"s I mentioned above?

Hopefully, this can be fixed before the v6.3 merge window.

        Thanks, Akira

> +
> +.. raw:: latex
> +
> +    \endgroup
> +
> +
>  Deprecated RGB Formats
>  ======================
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index fddba75d9074..875b9a95e3c8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1304,6 +1304,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX-10-10-10-2"; break;
> +	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA-10-10-10-2"; break;
> +	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB-2-10-10-10"; break;
>  	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 29da1f4b4578..51d6a8aa4e17 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -576,6 +576,9 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_RGBX32  v4l2_fourcc('X', 'B', '2', '4') /* 32  RGBX-8-8-8-8  */
>  #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB-8-8-8-8  */
>  #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB-8-8-8-8  */
> +#define V4L2_PIX_FMT_RGBX1010102 v4l2_fourcc('R', 'X', '3', '0') /* 32  RGBX-10-10-10-2 */
> +#define V4L2_PIX_FMT_RGBA1010102 v4l2_fourcc('R', 'A', '3', '0') /* 32  RGBA-10-10-10-2 */
> +#define V4L2_PIX_FMT_ARGB2101010 v4l2_fourcc('A', 'R', '3', '0') /* 32  ARGB-2-10-10-10 */
>  
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
> -- 
> 2.34.1
