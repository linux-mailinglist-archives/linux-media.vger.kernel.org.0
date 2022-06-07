Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25BF53AAD8
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 18:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354560AbiFAQRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 12:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240224AbiFAQRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 12:17:10 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4842BB3E;
        Wed,  1 Jun 2022 09:17:09 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id f9so4887104ejc.0;
        Wed, 01 Jun 2022 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pWC762eypj2bjNl4hQW+7FNPu195AwmDMFJhzzFNCpM=;
        b=G3f5RaE8elRiEIhW7E9mRL9MCs3ZC4+jrYnG816uzfgX2ibjozqeMY/uXuI4lIos4x
         y+haneV4Vg0pwa3FJZiUB7B1Z0sS146wVEUHjctJCEIx/1Zyty50DgZgc4gZrkO26e2W
         xTRPwkOT9metOf3XxWdUBjq+ruxGbqY0aELegGMHqPfPl78LnR6QX6fYP1+aCP7cRf6D
         sqMR+wATpGqL64B15POXcxgVMhdkzRpiLk6RLpOCw3Kn7OrGmAnmyD/ANhJbvqnl5zJE
         upjkNhx9QBAx3RXsdWNzXVegLrbhKEEBvT7/KaxZ3voxIs6xWDx7oX4t16xJ2NQXZXqk
         vjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pWC762eypj2bjNl4hQW+7FNPu195AwmDMFJhzzFNCpM=;
        b=b1imjn19ZPDa9MIgV1a9SYah+thy3iAkqYp7mockARpifzrGzeiqQ1D3zEvdYZJanc
         D0NXZef7hzAEpIbiqpHjCbQJ12cLij8hNL7psIgrSD/qR+IGBvNfh8gmd/SK8j7uOfrP
         as6zYMv9nZMo92C+BO+XJkZWrlN0N9Ln5goxwghV10ysAvASfIHIjOGnUBxhsOxszCHP
         NfJ6TnrRneGkV35Z7MEw09qlQlQuNBUDiXpXziP7hf34VidwYb6QzewdJo563S9LGHvV
         3i73ye7AlH5R3sY3c1i3u3cEWkFuqvBTC9MAgdKYMCPhQelijry10bhuKugXprok+xfm
         6fbg==
X-Gm-Message-State: AOAM53329mXf8bptC35lJBemO+T2ATsKyEuVLsWUeJy1lBQcTOH5pWfD
        F0lIgO9bxBRH/akE0+dRSbI=
X-Google-Smtp-Source: ABdhPJxUrWuyQnIx8N3FchlVvwbKdGrhbP5RG/Nnspz9UY5pBWWqSdVuyXoKdi3JoFOTDlmH5LOARg==
X-Received: by 2002:a17:906:7948:b0:6f7:d5a3:3b91 with SMTP id l8-20020a170906794800b006f7d5a33b91mr292819ejo.354.1654100227631;
        Wed, 01 Jun 2022 09:17:07 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id f1-20020a056402160100b0042de839eb2csm1164086edv.27.2022.06.01.09.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 09:17:07 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: Re: [PATCH v6 16/17] media: uapi: Change data_bit_offset definition
Date:   Wed, 01 Jun 2022 18:17:05 +0200
Message-ID: <7385576.EvYhyI6sBW@kista>
In-Reply-To: <3175529.44csPzL39Z@kista>
References: <20220527143134.3360174-1-benjamin.gaignard@collabora.com> <20220527143134.3360174-17-benjamin.gaignard@collabora.com> <3175529.44csPzL39Z@kista>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne nedelja, 29. maj 2022 ob 08:45:57 CEST je Jernej =C5=A0krabec napisal(a=
):
> Dne petek, 27. maj 2022 ob 16:31:33 CEST je Benjamin Gaignard napisal(a):
> > 'F.7.3.6.1 General slice segment header syntax' section of HEVC
> > specification describes that a slice header always end aligned on
> > byte boundary, therefore we only need to provide the data offset in byt=
es.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> >  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 ++--
> >  drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
> >  include/media/hevc-ctrls.h                                | 4 ++--
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/
> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index 48a8825a001b..37079581c661 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -3008,8 +3008,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> >        - ``bit_size``
> >        - Size (in bits) of the current slice data.
> >      * - __u32
> > -      - ``data_bit_offset``
> > -      - Offset (in bits) to the video data in the current slice data.
> > +      - ``data_byte_offset``
> > +      - Offset (in bytes) to the video data in the current slice data.
> >      * - __u32
> >        - ``num_entry_point_offsets``
> >        - Specifies the number of entry point offset syntax elements in =
the=20
> slice header.
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/
> staging/media/sunxi/cedrus/cedrus_h265.c
> > index 411601975124..835454239f73 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > @@ -405,7 +405,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ct=
x,
> >  	/* Initialize bitstream access. */
> >  	cedrus_write(dev, VE_DEC_H265_TRIGGER,=20
> VE_DEC_H265_TRIGGER_INIT_SWDEC);
> > =20
> > -	cedrus_h265_skip_bits(dev, slice_params->data_bit_offset);
> > +	cedrus_h265_skip_bits(dev, slice_params->data_byte_offset * 8);
>=20
> While it's true that actual data starts on 8-bit aligned address, Cedrus =
for=20
> some reason needs offset which points at the end of the header, before=20
> alignment. There is very simple way to determine that, but unfortunately=
=20
this=20
> means reading source buffer.
>=20
> In short, above code won't work. I'll provide a fix.

Please include following fix http://ix.io/3Z8x otherwise Cedrus will fail t=
o=20
decode slice.

Other than fix in previous e-mail and this one, code looks good and I'll be=
=20
able to add missing functionality to Cedrus without much trouble in follow =
up=20
series.

Best regards,
Jernej

>=20
> > =20
> >  	/* Bitstream parameters. */
> > =20
> > diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> > index 9abca1a75bd4..936ff693967b 100644
> > --- a/include/media/hevc-ctrls.h
> > +++ b/include/media/hevc-ctrls.h
> > @@ -312,7 +312,7 @@ struct v4l2_hevc_pred_weight_table {
> >   * V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
> >   *
> >   * @bit_size: size (in bits) of the current slice data
> > - * @data_bit_offset: offset (in bits) to the video data in the current=
=20
slice=20
> data
> > + * @data_byte_offset: offset (in bytes) to the video data in the curre=
nt=20
> slice data
> >   * @num_entry_point_offsets: specifies the number of entry point offse=
t=20
syntax
> >   *			     elements in the slice header.
> >   * @nal_unit_type: specifies the coding type of the slice (B, P or I)
> > @@ -356,7 +356,7 @@ struct v4l2_hevc_pred_weight_table {
> >   */
> >  struct v4l2_ctrl_hevc_slice_params {
> >  	__u32	bit_size;
> > -	__u32	data_bit_offset;
> > +	__u32	data_byte_offset;
> >  	__u32	num_entry_point_offsets;
> >  	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
> >  	__u8	nal_unit_type;
> > --=20
> > 2.32.0
> >=20
> >=20
>=20
>=20
>=20


