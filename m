Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FD269113A
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 20:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjBITXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 14:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjBITXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 14:23:01 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30BC26CE4
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 11:22:59 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id v3so2253754pgh.4
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 11:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gwRUBosF6+zHUe32TCEiQOoJLB3tPC+/Yj8zORKJIQ=;
        b=MostiNcye65H4vWhuSjUXCH6bxJh+RgXZfyaBTw6pWfrHp6QnW8zl+B4U4qfhm9WMt
         TEQLbxI7q6er7/ws+UiJWb0huU2xxcVxwsulH+IxpPRzOtOdqZ3HI8f11CWnpC/H2R+n
         +PaCtV0NaHftC5Ey2NEJ7m4gRO8NR42WuUGhkbFrGjryn5HyJ10ttMh/EbK2C50mk7ao
         10qd+/7jpYF7IuEeN0oP8Wvak1rfAIGLfoelCdh2MrYODk8r5H3KDg2dD3RBp4oGzdbO
         TUlqrhB7JUqJgNRYNca2GY6Qhr2wGyzaoIAiulkFI3a18EiMEUV7pKTuRCxcGFpodxxq
         Ha4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gwRUBosF6+zHUe32TCEiQOoJLB3tPC+/Yj8zORKJIQ=;
        b=ZJbOJ8d3dxJnXLO9uXAudYRHrOhqJTRDIwgdK03Fh+vs6oiGWv8Vtwt8eXwOIROzwu
         dadEuaOS+3MnwKNYPl++BZApkJ3gdEuVD+P/VeRWvrlqQQcZDOJgpKcaU2n9l93rwZkB
         xYb7VJkRaKGAG7xcuddnK4C88ghVpCmk83YUbq4X5YMqf2RpZQe2gvj9BI4hZUcz2nxh
         oP7yDd4ddE7NZuB2ggY/3qenzNG5hOK77sJjz2ejEoxwK1XkMOri87aeo2/f0XFPauB6
         l4ltVd/7/kz1HmcMs/9QJCrrILBVGiuAx1XHz31yaovmsEoCMbOG9B91xeo4t1nss0Yh
         78jA==
X-Gm-Message-State: AO0yUKWjCf0+K+oZ5ATZt9E+ergZ5ftK+SkEAO/4X4ITcyQhEGVZSlQ6
        sXO/ob2TykYtouWQHuYgXi7M74gzzxmGu5j0y1SjBA==
X-Google-Smtp-Source: AK7set/DqnHqNhKBjezdM+WRHf2+H9SbD1OgpmziTiQd2cATStMBMXSL7s7HlGb0sg1lTA4gUh0DIVQSrv8/WIZr/mU=
X-Received: by 2002:aa7:9419:0:b0:58b:c6d6:d8fb with SMTP id
 x25-20020aa79419000000b0058bc6d6d8fbmr2696685pfo.15.1675970579165; Thu, 09
 Feb 2023 11:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20230127153415.83126-1-jc@kynesim.co.uk> <20230127153415.83126-3-jc@kynesim.co.uk>
 <7bfc88eee5c8194c16fea4332b4710763e084b2f.camel@ndufresne.ca> <0oeauhhaqbbmn1l9ea2dlk62bvbli5i325@4ax.com>
In-Reply-To: <0oeauhhaqbbmn1l9ea2dlk62bvbli5i325@4ax.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 9 Feb 2023 19:22:42 +0000
Message-ID: <CAPY8ntCKRWomcWaBLTy7VD7j4k9VBTc6dEeJOWzA2xMyor0=Dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: v4l: Add documentation for Broadcom sand formats
To:     John Cox <jc@kynesim.co.uk>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas (and John)

On Thu, 9 Feb 2023 at 18:54, John Cox <jc@kynesim.co.uk> wrote:
>
> >Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =C3=A9crit :
> >> Add documentation for for the Broadcom sand formats to pixfmt-yuv-plan=
ar.
> >
> >Not a review comment, but does SAND stand for anything you can share ?
>
> Honestly I don't know - I got the term from Broadcom's MMAL definitions.

Broadcom acquired Sand Video back in 2004, and it was the format that
they used in their video codec IP that was then integrated into
VideoCore. Internally it was always referred to as "Sand Video
Format", or just Sand.

  Dave

https://www.eetimes.com/broadcom-pays-77-5-million-for-sand-video/

> >> Signed-off-by: John Cox <jc@kynesim.co.uk>
> >> ---
> >>  .../media/v4l/pixfmt-yuv-planar.rst           | 192 +++++++++++++++++=
+
> >>  1 file changed, 192 insertions(+)
> >>
> >> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.r=
st b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> >> index f1d5bb7b806d..c1dd0856f497 100644
> >> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> >> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> >> @@ -123,6 +123,20 @@ All components are stored with the same number of=
 bits per component.
> >>        - Cb, Cr
> >>        - Yes
> >>        - 4x4 tiles
> >> +    * - V4L2_PIX_FMT_NV12_C128
> >> +      - 'CN12'
> >> +      - 8
> >> +      - 4:2:0
> >> +      - Cb, Cr
> >> +      - Yes
> >> +      - 128 byte columns
> >> +    * - V4L2_PIX_FMT_P030_C128
> >> +      - 'CN30'
> >> +      - 10
> >> +      - 4:2:0
> >> +      - Cb, Cr
> >> +      - Yes
> >> +      - 128 byte columns
> >>      * - V4L2_PIX_FMT_NV16
> >>        - 'NV16'
> >>        - 8
> >> @@ -277,6 +291,8 @@ of the luma plane.
> >>  .. _V4L2-PIX-FMT-NV12M-10BE-8L128:
> >>  .. _V4L2-PIX-FMT-NV12-10BE-8L128:
> >>  .. _V4L2-PIX-FMT-MM21:
> >> +.. _V4L2-PIX-FMT-NV12-C128:
> >> +.. _V4L2-PIX-FMT-P030-C128:
> >>
> >>  Tiled NV12
> >>  ----------
> >> @@ -364,6 +380,182 @@ two non-contiguous planes.
> >>
> >>      Example V4L2_PIX_FMT_NV12MT memory layout of tiles
> >>
> >> +``V4L2_PIX_FMT_NV21_C128`` store 8 bit luma and chroma data in 128 by=
te
> >
> >I think you meant V4L2_PIX_FMT_NV12_C128 ?
> Yes - will fix
>
> >> +columns. Chroma data follows luma in each column. Height, which must =
be
> >> +a multiple of 2 (h in the table below) determines the offset to the s=
tart
> >> +of chroma data. Overall (luma + chroma)
> >> +column height (ch in the table below) is also required and this is ob=
tained
> >> +by dividing the sizeimage by bytesperline. bytesperline is width roun=
ded up
> >> +to the next multiple of the column width (128).
> >
> >Assuming I understood the description, unlike any other tiled formats, t=
he Y and
> >UV columns are not being split in two plane, but instead Y and UV column=
s are
> >being interleaved. Am I understanding correctly ? I think the text could=
 be
> >improved in this regard.
>
> I'll see what I can do
>
> Its a somewhat confusing format. You get a 128-byte wide, full picture Y
> height column of luma, optional padding, followed by a 128-byte wide,
> full chroma height column of interleaved CrCb, more optional padding,
> then the start of the next luma column.
>
> The thing that makes it uniqely annoying as far as representation is
> concerned is that in conventional terms it effectively has a fixed pitch
> or bytesperline of 128 (i.e. you always add 128 to get from x,y to
> x,y+1) and it has a "vertical pitch" to go between columns which doesn't
> fit into any normal picture description.
>
> >Note, I totally agree on using NV12 as reference, I see lower that CbCr =
is
> >effectively interleaved.
> >
> >> +
> >> +.. flat-table::
> >> +    :header-rows:  0
> >> +    :stub-columns: 0
> >> +    :widths: 15 10 10 10 10 4 10 10 10 10
> >> +
> >> +    * - start + 0:
> >> +      - Y'\ :sub:`0,0`
> >> +      - Y'\ :sub:`0,1`
> >> +      - Y'\ :sub:`0,2`
> >> +      - Y'\ :sub:`0,3`
> >> +      - ...
> >> +      - Y'\ :sub:`0,124`
> >> +      - Y'\ :sub:`0,125`
> >> +      - Y'\ :sub:`0,126`
> >> +      - Y'\ :sub:`0,127`
> >> +    * - start + 128:
> >> +      - Y'\ :sub:`1,0`
> >> +      - Y'\ :sub:`1,1`
> >> +      - Y'\ :sub:`1,2`
> >> +      - Y'\ :sub:`1,3`
> >> +      - ...
> >> +      - Y'\ :sub:`1,124`
> >> +      - Y'\ :sub:`1,125`
> >> +      - Y'\ :sub:`1,126`
> >> +      - Y'\ :sub:`1,127`
> >> +    * - start + 256:
> >> +      - Y'\ :sub:`2,0`
> >> +      - Y'\ :sub:`2,1`
> >> +      - Y'\ :sub:`2,2`
> >> +      - Y'\ :sub:`2,3`
> >> +      - ...
> >> +      - Y'\ :sub:`2,124`
> >> +      - Y'\ :sub:`2,125`
> >> +      - Y'\ :sub:`2,126`
> >> +      - Y'\ :sub:`2,127`
> >> +    * - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +    * - start + ((h-1) * 128):
> >> +      - Y'\ :sub:`h-1,0`
> >> +      - Y'\ :sub:`h-1,1`
> >> +      - Y'\ :sub:`h-1,2`
> >> +      - Y'\ :sub:`h-1,3`
> >> +      - ...
> >> +      - Y'\ :sub:`h-1,124`
> >> +      - Y'\ :sub:`h-1,125`
> >> +      - Y'\ :sub:`h-1,126`
> >> +      - Y'\ :sub:`h-1,127`
> >> +    * - start + ((h) * 128):
> >> +      - Cb\ :sub:`0,0`
> >> +      - Cr\ :sub:`0,0`
> >> +      - Cb\ :sub:`0,1`
> >> +      - Cr\ :sub:`0,1`
> >> +      - ...
> >> +      - Cb\ :sub:`0,62`
> >> +      - Cr\ :sub:`0,62`
> >> +      - Cb\ :sub:`0,63`
> >> +      - Cr\ :sub:`0,63`
> >> +    * - start + ((h+1) * 128):
> >> +      - Cb\ :sub:`1,0`
> >> +      - Cr\ :sub:`1,0`
> >> +      - Cb\ :sub:`1,1`
> >> +      - Cr\ :sub:`1,1`
> >> +      - ...
> >> +      - Cb\ :sub:`1,62`
> >> +      - Cr\ :sub:`1,62`
> >> +      - Cb\ :sub:`1,63`
> >> +      - Cr\ :sub:`1,63`
> >> +    * - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +    * - start + ((h+(h/2)-1) * 128):
> >> +      - Cb\ :sub:`(h/2)-1,0`
> >> +      - Cr\ :sub:`(h/2)-1,0`
> >> +      - Cb\ :sub:`(h/2)-1,1`
> >> +      - Cr\ :sub:`(h/2)-1,1`
> >> +      - ...
> >> +      - Cb\ :sub:`(h/2)-1,62`
> >> +      - Cr\ :sub:`(h/2)-1,62`
> >> +      - Cb\ :sub:`(h/2)-1,63`
> >> +      - Cr\ :sub:`(h/2)-1,63`
> >> +    * - start + (ch * 128):
> >> +      - Y'\ :sub:`0,128`
> >> +      - Y'\ :sub:`0,129`
> >> +      - Y'\ :sub:`0,130`
> >> +      - Y'\ :sub:`0,131`
> >> +      - ...
> >> +      - Y'\ :sub:`0,252`
> >> +      - Y'\ :sub:`0,253`
> >> +      - Y'\ :sub:`0,254`
> >> +      - Y'\ :sub:`0,255`
> >> +    * - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +      - ...
> >> +
> >> +``V4L2_PIX_FMT_P030_C128`` uses the same 128 byte column structure as
> >> +``V4L2_PIX_FMT_NV12_C128``, but encodes 10-bit YUV.
> >> +3 10-bit values are packed into 4 bytes as bits 9:0, 19:10, and 29:20=
, with
> >> +bits 30 & 31 unused. For the luma plane, bits 9:0 are Y0, 19:10 are Y=
1, and
> >> +29:20 are Y2. For the chroma plane the samples always come in pairs o=
f Cr
> >> +and Cb, so it needs to be considered 6 values packed in 8 bytes. byte=
sperline
> >> +is ((width + 95)/96)*128
> >
> >Maybe insert a phrase related to the use of the same columns pattern as
> >NV12_C128 ? Then from there, its easier to understand why this bytesperl=
ine
> >formula. I'm guessing that 96 is the number of pixels that fits 1 row of=
 128
> >bytes (128 / 4 * 3). I could not guess why you need 128 times that size =
though ?
> >Maybe I'm missing something ?
>
> 96 is indeed the number of pixels that fits in one 128 byte column.
>
> (width+95)/96 is the number of columns required, mutiplying it by 128
> gets you a "pitch" that when mutiplied by height gives you the number of
> bytes occupied by the luma plane. This is mostly to keep software that
> expects width <=3D bytesperline happy.
>
> >> +
> >> +Bit-packed representation - Luma:
> >> +
> >> +.. flat-table::
> >> +    :header-rows:  1
> >> +    :stub-columns: 0
> >> +
> >> +    * - byte
> >> +      - value(s)
> >> +    * - 0
> >> +      - Y'\ :sub:`00[7:0]`
> >> +    * - 1
> >> +      - Y'\ :sub:`01[5:0]`\  (bits 7--2)
> >> +      - Y'\ :sub:`00[9:8]`\  (bits 1--0)
> >> +    * - 2
> >> +      - Y'\ :sub:`02[3:0]`\  (bits 7--4)
> >> +      - Y'\ :sub:`01[9:6]`\  (bits 3--0)
> >> +    * - 3
> >> +      - unused (bits 7--6)
> >> +      - Y'\ :sub:`02[9:4]`\  (bits 5--0)
> >> +
> >> +Bit-packed representation - Chroma:
> >> +
> >> +.. flat-table::
> >> +    :header-rows:  1
> >> +    :stub-columns: 0
> >> +
> >> +    * - byte
> >> +      - value(s)
> >> +    * - 0
> >> +      - Cb\ :sub:`00[7:0]`
> >> +    * - 1
> >> +      - Cr\ :sub:`00[5:0]`\  (bits 7--2)
> >> +      - Cb\ :sub:`00[9:8]`\  (bits 1--0)
> >> +    * - 2
> >> +      - Cb\ :sub:`01[3:0]`\  (bits 7--4)
> >> +      - Cr\ :sub:`00[9:6]`\  (bits 3--0)
> >> +    * - 3
> >> +      - unused (bits 7--6)
> >> +      - Cb\ :sub:`02[9:4]`\  (bits 5--0)
> >> +    * - 4
> >> +      - Cr\ :sub:`01[7:0]`
> >> +    * - 5
> >> +      - Cb\ :sub:`02[5:0]`\  (bits 7--2)
> >> +      - Cr\ :sub:`01[9:8]`\  (bits 1--0)
> >> +    * - 6
> >> +      - Cr\ :sub:`02[3:0]`\  (bits 7--4)
> >> +      - Cb\ :sub:`02[9:6]`\  (bits 3--0)
> >> +    * - 7
> >> +      - unused (bits 7--6)
> >> +      - Cr\ :sub:`02[9:4]`\  (bits 5--0)
> >>
> >>  .. _V4L2-PIX-FMT-NV16:
> >>  .. _V4L2-PIX-FMT-NV61:
