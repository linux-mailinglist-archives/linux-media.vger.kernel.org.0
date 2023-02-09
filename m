Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10CEC69103A
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 19:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjBISVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 13:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjBISVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 13:21:06 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567CA2DE77
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 10:21:04 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id w3so2971698qts.7
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 10:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IEpFFGGYhcBdF80ZtyGFhdW8e/msMRCl1aaDsSMM69w=;
        b=p+Hozn2WzgTxYAmduVvdJJMrpjRkI8u3SHVxfp88uksZtR6WO3QsJnb74TDPTzXp6Q
         E1AuXWgtId9h3RDWhmalXz9NpKkYocBaA2aKss4hPyFXg8+zH0UUXI6DAObd/2vEfjrP
         UOMB71o8I+kNGy82hWSrFXClEoJ/K0iLwZS1MhhIdymvroJuNTj6aizt8H4qwrFGZ9ee
         OLivR56BBfRg1XPnZCal1cnrgOP7CTojPcYu2kuZX9Bxxv3q2IbVAHf2Q65hptwleBwT
         V3S2ANgKJrsF0OLqcsyGV9gNlqHzTuZI2aN1Yz9M7JGL4uDMg4n1nC+aDZxNo4RUhi4m
         2Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEpFFGGYhcBdF80ZtyGFhdW8e/msMRCl1aaDsSMM69w=;
        b=smw1E51JCrzO7umT8gvz6w3AHSqEYO/XWW6abENnXjlHUh4CuqhMr7cqJUGnzjbi+x
         xPfnPPUjtkEt3dudgPyJK7j1bDKCZS/GKV1KbvmYrmEt80E7DRI0AqhpgWrWFPEAN6Om
         JUj5oqx53nXnWiry3TrQzHGil9ue1DVu1Jp9/mN/hmFMoQIwI5ILa065nD7ZIpHqDyGx
         0kXML5ZGF6+lQxtCLy3Ktx2Pz+0CVpCHqzzzeKPmet4HTUM1ZHiZOiXRk5Ebf6T5fD1E
         8JdxT+7W0UEDTuaGCPgOIhUlUDg/wESBtgLtxu/BfkX3fWT5mVuax9MzwSj65QWCUhKW
         Dcjg==
X-Gm-Message-State: AO0yUKVYf5YVhdtpa4+Zv9oR/WjB4hCSV1LhIaunLuA8ewAFMm0pXMZ+
        zHtUUY+q/QfepofinjJELwdRyw==
X-Google-Smtp-Source: AK7set8NmkiXh27TJ/e6/PhWc6ApnqWmQ2/F7UDRPICzCgAtfPepKvNlwRKqS33a878lRjgtHUli8w==
X-Received: by 2002:a05:622a:1183:b0:3b6:2c3b:8c00 with SMTP id m3-20020a05622a118300b003b62c3b8c00mr22132696qtk.66.1675966863430;
        Thu, 09 Feb 2023 10:21:03 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id 79-20020a370852000000b007296805f607sm1847617qki.17.2023.02.09.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:21:02 -0800 (PST)
Message-ID: <7bfc88eee5c8194c16fea4332b4710763e084b2f.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: v4l: Add documentation for Broadcom sand
 formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl
Date:   Thu, 09 Feb 2023 13:21:01 -0500
In-Reply-To: <20230127153415.83126-3-jc@kynesim.co.uk>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
         <20230127153415.83126-3-jc@kynesim.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =C3=A9crit=C2=A0=
:
> Add documentation for for the Broadcom sand formats to pixfmt-yuv-planar.

Not a review comment, but does SAND stand for anything you can share ?

>=20
> Signed-off-by: John Cox <jc@kynesim.co.uk>
> ---
>  .../media/v4l/pixfmt-yuv-planar.rst           | 192 ++++++++++++++++++
>  1 file changed, 192 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index f1d5bb7b806d..c1dd0856f497 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -123,6 +123,20 @@ All components are stored with the same number of bi=
ts per component.
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
> =20
>  Tiled NV12
>  ----------
> @@ -364,6 +380,182 @@ two non-contiguous planes.
> =20
>      Example V4L2_PIX_FMT_NV12MT memory layout of tiles
> =20
> +``V4L2_PIX_FMT_NV21_C128`` store 8 bit luma and chroma data in 128 byte

I think you meant V4L2_PIX_FMT_NV12_C128 ?

> +columns. Chroma data follows luma in each column. Height, which must be
> +a multiple of 2 (h in the table below) determines the offset to the star=
t
> +of chroma data. Overall (luma + chroma)
> +column height (ch in the table below) is also required and this is obtai=
ned
> +by dividing the sizeimage by bytesperline. bytesperline is width rounded=
 up
> +to the next multiple of the column width (128).

Assuming I understood the description, unlike any other tiled formats, the =
Y and
UV columns are not being split in two plane, but instead Y and UV columns a=
re
being interleaved. Am I understanding correctly ? I think the text could be
improved in this regard.

Note, I totally agree on using NV12 as reference, I see lower that CbCr is
effectively interleaved.

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
> +3 10-bit values are packed into 4 bytes as bits 9:0, 19:10, and 29:20, w=
ith
> +bits 30 & 31 unused. For the luma plane, bits 9:0 are Y0, 19:10 are Y1, =
and
> +29:20 are Y2. For the chroma plane the samples always come in pairs of C=
r
> +and Cb, so it needs to be considered 6 values packed in 8 bytes. bytespe=
rline
> +is ((width + 95)/96)*128

Maybe insert a phrase related to the use of the same columns pattern as
NV12_C128 ? Then from there, its easier to understand why this bytesperline
formula. I'm guessing that 96 is the number of pixels that fits 1 row of 12=
8
bytes (128 / 4 * 3). I could not guess why you need 128 times that size tho=
ugh ?
Maybe I'm missing something ?

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
> =20
>  .. _V4L2-PIX-FMT-NV16:
>  .. _V4L2-PIX-FMT-NV61:

