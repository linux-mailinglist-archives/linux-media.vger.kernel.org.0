Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2656921AD
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 16:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjBJPLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 10:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbjBJPLQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 10:11:16 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DBF75378
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 07:10:49 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so5363224wrv.7
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 07:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1lsojafdg72ij4bM8LLn4SoCPZIeSuyVBjlTn7vKMIk=;
        b=NaLRY6QpQM9AJsFyxp2qxeo9SwtFQAgAeJYs2B8cg7BelTuDcbxr/jbqcQoDQrNoKN
         UBK5V45SoqYsN40Tn67Cl4A0VUTmLdp2wXqQJ288Ul2Vf4XkgCcptGZRCR6ixj7dh0WP
         slsgbk5nkWDUmTIOpLanN6z3qIcBh0Q1W6ZD57+6gpvPecg/g7mzIQ/i5yJ8kO0qYrS1
         kZHYwrp9BgAu5uk77dKLhwTe54pFdDT+9wS/LxWQjEzvMljyfBI7MPb6/9k0TybHKcIs
         CA5JrhG0JMt6agOR8KPrZfkzdmFEYTg0Ee8wYHPm2/OfZ2RwgaX2LXQE7iwCgkXbB/cg
         9M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lsojafdg72ij4bM8LLn4SoCPZIeSuyVBjlTn7vKMIk=;
        b=1hDFtAzWFuHCMjKy1INTLH59KN8j8KuTh/zoHqY8KfSlPDVGLVo427SjkZobW9y3x0
         MPXdFfE5J1leRVZbXXBJYLXpaka3Z6F9j2Jg3E4o0D0RwYN9kLYACGRergd6UrS6gx9F
         gJ3eFqN/s7cWmlNfr0GbuJwtPcr/l9992ZPcW70+dctBeEWdz2438ZGaw24d7uSPx/kI
         QFT1eQW6cOu1M5v0kl1vhpOs6M3TUjuHZGYEoOXoiKUgYapvnTHNsoTzjSk99z3MqtMA
         dJg7Vb4KniH2jJczi6uwoLqVbOA4OP8rucnyoy1QyboqSEZvoT7U0l9ZH56h9QmjwuNZ
         /iNg==
X-Gm-Message-State: AO0yUKXbIrdDDsnxzZVYOjXGrZlTiDW2NDkHK2c/VOdMnviWqjcda6A3
        NgPBYTyel3FKeUqdjq84fxLhlw==
X-Google-Smtp-Source: AK7set/bs8HkEvA0AIDb5VLBUppr71Y4kUaqGG5efH8/397K+Q1mxhDunzVcCMNajxbMH7wl8Cw8hw==
X-Received: by 2002:a5d:5088:0:b0:2c5:4c7c:6aad with SMTP id a8-20020a5d5088000000b002c54c7c6aadmr1503468wrt.8.1676041848291;
        Fri, 10 Feb 2023 07:10:48 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d6691000000b002c549dd0a4bsm1751789wru.37.2023.02.10.07.10.47
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 10 Feb 2023 07:10:47 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 0/2] media: v4l: Add Broadcom sand format to the list of V4L formats
Date:   Fri, 10 Feb 2023 15:10:47 +0000
Message-ID: <ngmcuh5s3mqhsa6mabdb3r754k34e9n85c@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk> <44531f980f771272a8a663c2b2d68dce3bf47456.camel@ndufresne.ca> <qldauht5k6rfa2o2uqvcfh66ul0vf7a036@4ax.com> <1abbb76c060c5e4d1d96c32ec8faacbf9a012fd2.camel@ndufresne.ca>
In-Reply-To: <1abbb76c060c5e4d1d96c32ec8faacbf9a012fd2.camel@ndufresne.ca>
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

>Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 18:21 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> Hi
>>=20
>> > Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> > > This is in preparation for attempting to upstream the Rpi H265 =
decoder
>> > > as these formats are the only ones the hardware can decode to. =
They are
>> > > a column format rather than a tile format but I've added them to =
the
>> > > list of tiled formats as that seems the closest match.
>> > >=20
>> > > V4L2_PIX_FMT_NV12_C128 matches DRM format NV12 with modifier
>> > > DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT(ch) and
>> > > V4L2_PIX_FMT_P030_C128 matches DRM format P030 with the same =
modifier.
>> >=20
>> > Cause pixel format matching is hard, P030 matches GStreamer =
NV12_10LE32, format
>> > also found on Xilinx ZynMP CODECs (but without any modifiers so =
far).
>> >=20
>> > This is just for curiosity, was there any software implementation of=
 these
>> > formats made available publicly ? or have they only been tested in =
conjunction
>> > with an importing HW ?
>>=20
>> I'm unsure exactly what you are asking here.
>>=20
>> I don't think that anyone other than RPi/Broadcom has used these =
formats
>> for anything. I've certainly written code that uses and converts them
>> that has been on my public github and has been used by RPi but I doubt
>> that is what you meant by "Publicly". V4L2_PIX_FMT_NV12_C128 is =
annoying
>> to use in s/w (though I have written s/w parts of a decoder that use
>> it), V4L2_PIX_FMT_P030_C128 is stupidly annoying to use in s/w and all
>> I've ever written is code to convert it to something more useable.
>>=20
>> Does that answer the question?
>
>Well, whatever you have and you can share a link to would be nice, it =
does help
>reviewing your doc. But I think I understand what it is from your doc so=
 far, so
>nothing to worry about.

There are more files including arvm7 & v8 neon converters but this has C
converters out of sand8/30 to YUV420/NV12/VUV420P10:=20

https://github.com/jc-kynesim/rpi-ffmpeg/blob/test/5.1.2/main/libavutil/r=
pi_sand_fns.c

which should give you what you need. V4L2_PIX_FMT_NV12_C128 =3D
AV_PIX_FMT_RPI4_8, V4L2_PIX_FMT_P030_C128 =3D AV_PIX_FMT_RPI4_10.

Ignore code referencing AV_PIX_FMT_SAND64_10, that format is now
obsolete (10 bits in 16, so 64 pixels per col) and was only used by the
Pi3 gpu assisted H265 s/w decode.

>As a side note, for boards that are readily available in KernelCI, I =
often
>implement slow path converter in GStreamer so we can run it through =
fluster and
>catch any regressions. It is very minimal regression tests simply using =
what ITU
>made publicly available.

Oh absolutely. Whilst I admit I haven't done proper fate integration
(yet) I do run a test script against all the ITU conformance streams (+
a few others that had bad cases missed by ITU) on a regular basis.

Regards

John Cox
 =20
>> > > John Cox (2):
>> > >   media: v4l: Add Broadcom sand formats to videodev2.h
>> > >   media: v4l: Add documentation for Broadcom sand formats
>> > >=20
>> > >  .../media/v4l/pixfmt-yuv-planar.rst           | 192 =
++++++++++++++++++
>> > >  include/uapi/linux/videodev2.h                |   2 +
>> > >  2 files changed, 194 insertions(+)
>> > >=20
