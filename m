Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733F069396F
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 19:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjBLStd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 13:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjBLStc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 13:49:32 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E1610ABB
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 10:49:31 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso2142958wmo.3
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U8VxFVlnr1dSmNKtjlq8YgJMEgTc5/WAcuQ2sHlzYKo=;
        b=VuEzHYklYJBoCu5v9B6xXsvhMtryxjHRs5kngSA4c2dunIHPiZD0yFjo5xIPo8WfIe
         7GcQQ815V65aBgIBX9dTYe7QJOyOikJUuKPlgspE4WmjKKmKkXW0U47kAxbmaQCNxagq
         /E9dme1D8OAbzCoxleZiJW0hscYB0V3VlM3xZMvsm0gTw7kzUZfjFpVs2sATNnL5P1ur
         aLfgxlLOPKgjTLjMrARfKaHYyF8NCSIZy/v0DgU0sbqMbIl/geTZlC1fl/y6r/c3vfqm
         TaspqicSfvd3QpBkHQ8oDBI3b90mAhxXI8Ns6qMTXXTmYEBg7RCrSr3v63UfdeQmqpas
         7tBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U8VxFVlnr1dSmNKtjlq8YgJMEgTc5/WAcuQ2sHlzYKo=;
        b=7M3Haypj96zWWKBL1dsFr8ggd/r+RKjVYEPeK7WRApYJYQ2sxY+CS2/+W1Ntxp5yYv
         BezEZgHBqWqKTnYaigTyPAD22GAQJxC7LUeSnFEUNBAEHEghHRwy3jHtbCHaKteG0G6z
         7uxkjZ3xvXEsemuHgyUxijjzK3gaKQPCAj1+RJdZ+Xk4eaDjBdOapRIkAYsVnFEuktLA
         WoDVMMpHiCCM+UiO07BBflYJLoaVm8Dqf+p8Zfh4+cxmQF9JmKjVx0ZJZcFyI0Z0HOHM
         E13fHSouHqTsSBP+8g4kS9NJyCPZpDd5oQWYbW2RlYxKzBcryDvHkQM7leiPBkiChcUm
         JV1A==
X-Gm-Message-State: AO0yUKUsvgM7sQRemNe5e5HhvkS3V05Cbhqug2lpAWrcRY8Olz4SrMHK
        h2mFzRNEgnykkdI4sc4aoaAFs6wGVhbvWA7+
X-Google-Smtp-Source: AK7set+gBrMAlcVr1KyQkAwbXtWCNN1iscHc+0eIGkICiRU0/MQYf6rvLg0KMnH0MZdhfvzaKpfCFQ==
X-Received: by 2002:a05:600c:5028:b0:3dd:1bd3:4f6d with SMTP id n40-20020a05600c502800b003dd1bd34f6dmr17538910wmr.32.1676227769590;
        Sun, 12 Feb 2023 10:49:29 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id i16-20020a05600c4b1000b003dc4fd6e624sm11213225wmp.19.2023.02.12.10.49.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Sun, 12 Feb 2023 10:49:29 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 1/2] media: v4l: Add Broadcom sand formats to videodev2.h
Date:   Sun, 12 Feb 2023 18:49:29 +0000
Message-ID: <olciuh9k2f6qsirql2oh450tiashbo62im@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk> <20230127153415.83126-2-jc@kynesim.co.uk> <4c9eef106e893b633ab83a792d97cc5e36f408fe.camel@ndufresne.ca> <1ogauh5ro652so8vtc2fsgor5g3pj6ns3e@4ax.com> <04dd55039d1c66d382dc9086500e5b8037ed6598.camel@ndufresne.ca>
In-Reply-To: <04dd55039d1c66d382dc9086500e5b8037ed6598.camel@ndufresne.ca>
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

Hi

>Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 19:06 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> Hi
>>=20
>> > Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =
=C3=A9crit=C2=A0:
>> > > Add fourccs for Broadcom 8 and 10-bit packed 128 byte column =
formats to
>> > > videodev2.h
>> > >=20
>> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
>> > > ---
>> > >  include/uapi/linux/videodev2.h | 2 ++
>> > >  1 file changed, 2 insertions(+)
>> > >=20
>> > > diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>> > > index 1befd181a4cc..a836322ae5d8 100644
>> > > --- a/include/uapi/linux/videodev2.h
>> > > +++ b/include/uapi/linux/videodev2.h
>> > > @@ -656,6 +656,8 @@ struct v4l2_pix_format {
>> > >  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* =
12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
>> > >  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', =
'2') /* Y/CbCr 4:2:0 8x128 tiles */
>> > >  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', =
'1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>> > > +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', =
'2') /* Y/CbCr 4:2:0 128 byte columns */
>> > > +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', =
'0') /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
>> > > =20
>> > >  /* Tiled YUV formats, non contiguous planes */
>> > >  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* =
12  Y/CbCr 4:2:0 64x32 tiles */
>> >=20
>> > I would expect updates to v4l2-common.c and v4l2-ioctl.c to be in =
the same
>> > patch. And then the driver should be using the helpers there =
whenever possible.
>>=20
>> Fair point - I'll fix that.
>>=20
>> What is the correct .bpp for 3 10-bit pixels packed into 4 bytes in =
the
>> v4l2_format_info?
>
>Good question, maybe this can be done with the fractional bpp support. I=
 must
>admit, I didn't think about padded cases, I was handling 10bit fully =
packed over
>5 bytes.
>
>https://lore.kernel.org/linux-arm-kernel/20230103170058.810597-3-benjami=
n.gaignard@collabora.com/
>My case ended working with:
>
> { .format =3D V4L2_PIX_FMT_NV12_10LE40_4L4, .pixel_enc =3D =
V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, =
10, 0, 0 }, .bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>
>Question is what do we do about comp_planes, if we kind of fake it to be=
 2, then maybe this would work.
>
> { .format =3D V4L2_PIX_FMT_P030_C128, .pixel_enc =3D =
V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 4, =
8, 0, 0 }, .bpp_div =3D { 3, 3, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>
>For weird format, this is a bit of hacky, all we want is to get the =
right
>stride, and the offset part is not used for mem_planes =3D 1 formats.

I'm happy with whatever the consensus says is "right".

What tree/branch should I be patching against? Code to support the above
doesn't seem to be in git://linuxtv.org/media_tree:master which is what
I was using.

Thanks

John Cox

>let me know,
>Nicolas
>
>>=20
>> Regards
>>=20
>> John Cox
