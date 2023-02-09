Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8918A6910CF
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 19:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjBISyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 13:54:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjBISyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 13:54:45 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088C52F781
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 10:54:41 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bu23so2776357wrb.8
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 10:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L02Xps6JzCQM4a2X5rRNBqP4O+2rdVL+cBpoAjit7Yk=;
        b=VF4hsFmQZpwplggTNWj2nP0CPQBr5BBSWzSWJBcCTUO43GLhLkagzVAarTeIWf71pL
         5YS2glP1VwPLy6R/c3+rhhBK2CG96k1KVAbeoHX3jtKrGaXjDWqQcUihP9Evb2mkYhC1
         i678bDDKxDXbc6Se7iTV/O5Zz7w8rHiB7PnEPRERG/ll6ZTXtbjVcVpCHqDAlUofKvzu
         QpVUbunI9QreiWji9kFF1ioPCt2uPYuxl0q6Ss9nMr64nQ5vCeWViOzRzAyendlmOLxU
         Ir5XiVn8uJCZxnTmcB0AZFeOj71ns/fra2n7Vbu7kpP69aV1xScQIoVCbHpFj7EK5Fo8
         CHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L02Xps6JzCQM4a2X5rRNBqP4O+2rdVL+cBpoAjit7Yk=;
        b=W5gkTVkoZ/w0ZLRQCj8o7EyHZo+yENyorcFbHPz78qhMnfp3CTUnr9LTeZkP+ibKf8
         4NDkqNaQIcBKofeutIFaHhgFGW22cF0Hj3DldrSzbfy9XrTlAcKdJ9ij6InwxEwwuIIQ
         l2QfANI+WCNlm6Z0KWmgRR2D3zRGu+eatgNtovuHv+nv9oJH/PM3hWaYI2Cduon0sSLu
         kdF0/6fopypZIjHggt8swoOks2SFUgedzBURBW93ByCqvHGqNJwBHubjdWLbADpiEOAB
         8mYrtlwnt18whhCeMngbm8OtwZbzDCOFvtWElZZkIgxNrlBygSrv7yDlk2SIADnrx3Lb
         Agkg==
X-Gm-Message-State: AO0yUKVu0q/hEoNbdply0gzzSI7rk96/6/srvihG/SSmgL8glt6Bbf9B
        YoRd7Ln+mdfXwMYPxrw2t6UUHw==
X-Google-Smtp-Source: AK7set9J4pC6voTvREKRukzreAi3OVK5wZ0AMG8gK4brnEEvsF+pxM6AzGI8MsQ9O1PcCnJEnft6EA==
X-Received: by 2002:adf:dc90:0:b0:2c3:f026:907f with SMTP id r16-20020adfdc90000000b002c3f026907fmr11600332wrj.9.1675968879393;
        Thu, 09 Feb 2023 10:54:39 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d540c000000b002bff1de8d4bsm1864372wrv.49.2023.02.09.10.54.38
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 09 Feb 2023 10:54:39 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 2/2] media: v4l: Add documentation for Broadcom sand formats
Date:   Thu, 09 Feb 2023 18:54:38 +0000
Message-ID: <0oeauhhaqbbmn1l9ea2dlk62bvbli5i325@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk> <20230127153415.83126-3-jc@kynesim.co.uk> <7bfc88eee5c8194c16fea4332b4710763e084b2f.camel@ndufresne.ca>
In-Reply-To: <7bfc88eee5c8194c16fea4332b4710763e084b2f.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> Add documentation for for the Broadcom sand formats to =
pixfmt-yuv-planar.
>
>Not a review comment, but does SAND stand for anything you can share ?

Honestly I don't know - I got the term from Broadcom's MMAL definitions.
=20
>> Signed-off-by: John Cox <jc@kynesim.co.uk>
>> ---
>>  .../media/v4l/pixfmt-yuv-planar.rst           | 192 =
++++++++++++++++++
>>  1 file changed, 192 insertions(+)
>>=20
>> diff --git =
a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> index f1d5bb7b806d..c1dd0856f497 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
>> @@ -123,6 +123,20 @@ All components are stored with the same number of=
 bits per component.
>>        - Cb, Cr
>>        - Yes
>>        - 4x4 tiles
>> +    * - V4L2_PIX_FMT_NV12_C128
>> +      - 'CN12'
>> +      - 8
>> +      - 4:2:0
>> +      - Cb, Cr
>> +      - Yes
>> +      - 128 byte columns
>> +    * - V4L2_PIX_FMT_P030_C128
>> +      - 'CN30'
>> +      - 10
>> +      - 4:2:0
>> +      - Cb, Cr
>> +      - Yes
>> +      - 128 byte columns
>>      * - V4L2_PIX_FMT_NV16
>>        - 'NV16'
>>        - 8
>> @@ -277,6 +291,8 @@ of the luma plane.
>>  .. _V4L2-PIX-FMT-NV12M-10BE-8L128:
>>  .. _V4L2-PIX-FMT-NV12-10BE-8L128:
>>  .. _V4L2-PIX-FMT-MM21:
>> +.. _V4L2-PIX-FMT-NV12-C128:
>> +.. _V4L2-PIX-FMT-P030-C128:
>> =20
>>  Tiled NV12
>>  ----------
>> @@ -364,6 +380,182 @@ two non-contiguous planes.
>> =20
>>      Example V4L2_PIX_FMT_NV12MT memory layout of tiles
>> =20
>> +``V4L2_PIX_FMT_NV21_C128`` store 8 bit luma and chroma data in 128 =
byte
>
>I think you meant V4L2_PIX_FMT_NV12_C128 ?
Yes - will fix

>> +columns. Chroma data follows luma in each column. Height, which must =
be
>> +a multiple of 2 (h in the table below) determines the offset to the =
start
>> +of chroma data. Overall (luma + chroma)
>> +column height (ch in the table below) is also required and this is =
obtained
>> +by dividing the sizeimage by bytesperline. bytesperline is width =
rounded up
>> +to the next multiple of the column width (128).
>
>Assuming I understood the description, unlike any other tiled formats, =
the Y and
>UV columns are not being split in two plane, but instead Y and UV =
columns are
>being interleaved. Am I understanding correctly ? I think the text could=
 be
>improved in this regard.

I'll see what I can do

Its a somewhat confusing format. You get a 128-byte wide, full picture Y
height column of luma, optional padding, followed by a 128-byte wide,
full chroma height column of interleaved CrCb, more optional padding,
then the start of the next luma column.

The thing that makes it uniqely annoying as far as representation is
concerned is that in conventional terms it effectively has a fixed pitch
or bytesperline of 128 (i.e. you always add 128 to get from x,y to
x,y+1) and it has a "vertical pitch" to go between columns which doesn't
fit into any normal picture description.

>Note, I totally agree on using NV12 as reference, I see lower that CbCr =
is
>effectively interleaved.
>
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths: 15 10 10 10 10 4 10 10 10 10
>> +
>> +    * - start + 0:
>> +      - Y'\ :sub:`0,0`
>> +      - Y'\ :sub:`0,1`
>> +      - Y'\ :sub:`0,2`
>> +      - Y'\ :sub:`0,3`
>> +      - ...
>> +      - Y'\ :sub:`0,124`
>> +      - Y'\ :sub:`0,125`
>> +      - Y'\ :sub:`0,126`
>> +      - Y'\ :sub:`0,127`
>> +    * - start + 128:
>> +      - Y'\ :sub:`1,0`
>> +      - Y'\ :sub:`1,1`
>> +      - Y'\ :sub:`1,2`
>> +      - Y'\ :sub:`1,3`
>> +      - ...
>> +      - Y'\ :sub:`1,124`
>> +      - Y'\ :sub:`1,125`
>> +      - Y'\ :sub:`1,126`
>> +      - Y'\ :sub:`1,127`
>> +    * - start + 256:
>> +      - Y'\ :sub:`2,0`
>> +      - Y'\ :sub:`2,1`
>> +      - Y'\ :sub:`2,2`
>> +      - Y'\ :sub:`2,3`
>> +      - ...
>> +      - Y'\ :sub:`2,124`
>> +      - Y'\ :sub:`2,125`
>> +      - Y'\ :sub:`2,126`
>> +      - Y'\ :sub:`2,127`
>> +    * - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +    * - start + ((h-1) * 128):
>> +      - Y'\ :sub:`h-1,0`
>> +      - Y'\ :sub:`h-1,1`
>> +      - Y'\ :sub:`h-1,2`
>> +      - Y'\ :sub:`h-1,3`
>> +      - ...
>> +      - Y'\ :sub:`h-1,124`
>> +      - Y'\ :sub:`h-1,125`
>> +      - Y'\ :sub:`h-1,126`
>> +      - Y'\ :sub:`h-1,127`
>> +    * - start + ((h) * 128):
>> +      - Cb\ :sub:`0,0`
>> +      - Cr\ :sub:`0,0`
>> +      - Cb\ :sub:`0,1`
>> +      - Cr\ :sub:`0,1`
>> +      - ...
>> +      - Cb\ :sub:`0,62`
>> +      - Cr\ :sub:`0,62`
>> +      - Cb\ :sub:`0,63`
>> +      - Cr\ :sub:`0,63`
>> +    * - start + ((h+1) * 128):
>> +      - Cb\ :sub:`1,0`
>> +      - Cr\ :sub:`1,0`
>> +      - Cb\ :sub:`1,1`
>> +      - Cr\ :sub:`1,1`
>> +      - ...
>> +      - Cb\ :sub:`1,62`
>> +      - Cr\ :sub:`1,62`
>> +      - Cb\ :sub:`1,63`
>> +      - Cr\ :sub:`1,63`
>> +    * - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +    * - start + ((h+(h/2)-1) * 128):
>> +      - Cb\ :sub:`(h/2)-1,0`
>> +      - Cr\ :sub:`(h/2)-1,0`
>> +      - Cb\ :sub:`(h/2)-1,1`
>> +      - Cr\ :sub:`(h/2)-1,1`
>> +      - ...
>> +      - Cb\ :sub:`(h/2)-1,62`
>> +      - Cr\ :sub:`(h/2)-1,62`
>> +      - Cb\ :sub:`(h/2)-1,63`
>> +      - Cr\ :sub:`(h/2)-1,63`
>> +    * - start + (ch * 128):
>> +      - Y'\ :sub:`0,128`
>> +      - Y'\ :sub:`0,129`
>> +      - Y'\ :sub:`0,130`
>> +      - Y'\ :sub:`0,131`
>> +      - ...
>> +      - Y'\ :sub:`0,252`
>> +      - Y'\ :sub:`0,253`
>> +      - Y'\ :sub:`0,254`
>> +      - Y'\ :sub:`0,255`
>> +    * - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +      - ...
>> +
>> +``V4L2_PIX_FMT_P030_C128`` uses the same 128 byte column structure as
>> +``V4L2_PIX_FMT_NV12_C128``, but encodes 10-bit YUV.
>> +3 10-bit values are packed into 4 bytes as bits 9:0, 19:10, and =
29:20, with
>> +bits 30 & 31 unused. For the luma plane, bits 9:0 are Y0, 19:10 are =
Y1, and
>> +29:20 are Y2. For the chroma plane the samples always come in pairs =
of Cr
>> +and Cb, so it needs to be considered 6 values packed in 8 bytes. =
bytesperline
>> +is ((width + 95)/96)*128
>
>Maybe insert a phrase related to the use of the same columns pattern as
>NV12_C128 ? Then from there, its easier to understand why this =
bytesperline
>formula. I'm guessing that 96 is the number of pixels that fits 1 row of=
 128
>bytes (128 / 4 * 3). I could not guess why you need 128 times that size =
though ?
>Maybe I'm missing something ?

96 is indeed the number of pixels that fits in one 128 byte column.

(width+95)/96 is the number of columns required, mutiplying it by 128
gets you a "pitch" that when mutiplied by height gives you the number of
bytes occupied by the luma plane. This is mostly to keep software that
expects width <=3D bytesperline happy.

>> +
>> +Bit-packed representation - Luma:
>> +
>> +.. flat-table::
>> +    :header-rows:  1
>> +    :stub-columns: 0
>> +
>> +    * - byte
>> +      - value(s)
>> +    * - 0
>> +      - Y'\ :sub:`00[7:0]`
>> +    * - 1
>> +      - Y'\ :sub:`01[5:0]`\  (bits 7--2)
>> +      - Y'\ :sub:`00[9:8]`\  (bits 1--0)
>> +    * - 2
>> +      - Y'\ :sub:`02[3:0]`\  (bits 7--4)
>> +      - Y'\ :sub:`01[9:6]`\  (bits 3--0)
>> +    * - 3
>> +      - unused (bits 7--6)
>> +      - Y'\ :sub:`02[9:4]`\  (bits 5--0)
>> +
>> +Bit-packed representation - Chroma:
>> +
>> +.. flat-table::
>> +    :header-rows:  1
>> +    :stub-columns: 0
>> +
>> +    * - byte
>> +      - value(s)
>> +    * - 0
>> +      - Cb\ :sub:`00[7:0]`
>> +    * - 1
>> +      - Cr\ :sub:`00[5:0]`\  (bits 7--2)
>> +      - Cb\ :sub:`00[9:8]`\  (bits 1--0)
>> +    * - 2
>> +      - Cb\ :sub:`01[3:0]`\  (bits 7--4)
>> +      - Cr\ :sub:`00[9:6]`\  (bits 3--0)
>> +    * - 3
>> +      - unused (bits 7--6)
>> +      - Cb\ :sub:`02[9:4]`\  (bits 5--0)
>> +    * - 4
>> +      - Cr\ :sub:`01[7:0]`
>> +    * - 5
>> +      - Cb\ :sub:`02[5:0]`\  (bits 7--2)
>> +      - Cr\ :sub:`01[9:8]`\  (bits 1--0)
>> +    * - 6
>> +      - Cr\ :sub:`02[3:0]`\  (bits 7--4)
>> +      - Cb\ :sub:`02[9:6]`\  (bits 3--0)
>> +    * - 7
>> +      - unused (bits 7--6)
>> +      - Cr\ :sub:`02[9:4]`\  (bits 5--0)
>> =20
>>  .. _V4L2-PIX-FMT-NV16:
>>  .. _V4L2-PIX-FMT-NV61:
