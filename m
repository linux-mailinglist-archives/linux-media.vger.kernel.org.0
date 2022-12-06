Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7138B644A81
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 18:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235563AbiLFRlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 12:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbiLFRk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 12:40:27 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B00C2B3
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 09:39:28 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id o12so10916247qvn.3
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 09:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vwJXO2yIwIyTaL+wwfhKV21EcpVahkX9Yfn9dWn2Vc=;
        b=EhNAx5d9kMUIKcYYW+d8SXABmCt5R36tbZqyhF3O/Hazlk/DPLdbQr50v0gLuS5Vs0
         Kzj+8ci3fMgF2xrUv0YIOeyUEzxtRtnkFWm3KtkxAAWTpTnhJaCkPlAlOZw5lDmMaTZd
         k8rkow6SokiZAgPltcfwMW/XqMjIMLGhu9qMllZwMf0tPLtuHN70/qj62e1ZHNg/BOiO
         LwmUhizn8qxhCXgBwi9HPXZAn3+NqiWuhZS5+o9pPHepERFFNXObPgovOF10+zjfbjzB
         EwiQlTHhcxOjLEmuNRqAFEjfsI0+QyKGev8FPTOzkNqOOR/mDwd2J86j8hToEuaHd9ve
         nsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vwJXO2yIwIyTaL+wwfhKV21EcpVahkX9Yfn9dWn2Vc=;
        b=RiXigjXuZ1Z8iJ2fAllHU/qV6/1Dem2rbM+zmB7+QFWSqPJmXkl9hG+GiEtzIaHy1Q
         8NrdZb0+2hBlDK+pKIkg46nqxFXmlenMcp1TDA6+L8iD3VCKZbIliOPh/1Y5p/WT92nQ
         E1f2D3KsUcvDa4l4XDtza3yHkkwDdQ88kQv9y/utpS1H3x52kziNRhiFhFa5PH/VCJdP
         k6ROM9l2qCBF8J+P+2LywagsAC6KbeIiOXknTH7F1dszCQm46oF3/2wswyD4DiuNfgbm
         h7u0sgM/hgHQNeHPBgvtFWYa960mZUKsNvGz45qQcG85oWVAubg5DB/8wTbiklUw/cOd
         gITg==
X-Gm-Message-State: ANoB5pl9oNCGfMANi0PN1b18Ttg5uoHnYKRbsGp9nvPoMvWT1k8PJfMw
        NJUWXQbRYnS54RCddMMSyl6ndA==
X-Google-Smtp-Source: AA0mqf6kleqKRKauKukPH3nwqFrvrvx5HvV2ehp0YH2KTji20rCiwQJvXf/N0MX/9UJD/aYwc2m/8A==
X-Received: by 2002:a05:6214:3588:b0:4bb:6c92:378c with SMTP id nn8-20020a056214358800b004bb6c92378cmr78735052qvb.117.1670348367676;
        Tue, 06 Dec 2022 09:39:27 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id dm54-20020a05620a1d7600b006fcc437c2e8sm6749646qkb.44.2022.12.06.09.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 09:39:27 -0800 (PST)
Message-ID: <228a5a9416a891895ce0e108719ba0badbbd0ad8.camel@ndufresne.ca>
Subject: Re: [PATCH 1/7] media: Add 2-10-10-10 RGB formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Tue, 06 Dec 2022 12:39:24 -0500
In-Reply-To: <20221206133954.397098-2-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
         <20221206133954.397098-2-tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mardi 06 d=C3=A9cembre 2022 =C3=A0 15:39 +0200, Tomi Valkeinen a =C3=A9c=
rit=C2=A0:
> Add XBGR2101010, ABGR2101010 and BGRA1010102 formats.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

This patch is simply missing an update to

Documentation/userspace-api/media/v4l/pixfmt-rgb.rst

regards,
Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index fddba75d9074..964300deaf62 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1304,6 +1304,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  	case V4L2_PIX_FMT_BGRX32:	descr =3D "32-bit XBGR 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBA32:	descr =3D "32-bit RGBA 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_RGBX32:	descr =3D "32-bit RGBX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_XBGR2101010:	descr =3D "32-bit XBGR 2-10-10-10"; brea=
k;
> +	case V4L2_PIX_FMT_ABGR2101010:	descr =3D "32-bit ABGR 2-10-10-10"; brea=
k;
> +	case V4L2_PIX_FMT_BGRA1010102:	descr =3D "32-bit BGRA 10-10-10-2"; brea=
k;
>  	case V4L2_PIX_FMT_GREY:		descr =3D "8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y4:		descr =3D "4-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_Y6:		descr =3D "6-bit Greyscale"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 29da1f4b4578..877fd61693b8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -576,6 +576,9 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_RGBX32  v4l2_fourcc('X', 'B', '2', '4') /* 32  RGBX=
-8-8-8-8  */
>  #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB=
-8-8-8-8  */
>  #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB=
-8-8-8-8  */
> +#define V4L2_PIX_FMT_XBGR2101010 v4l2_fourcc('R', 'X', '3', '0') /* 32  =
XBGR-2-10-10-10  */
> +#define V4L2_PIX_FMT_ABGR2101010 v4l2_fourcc('R', 'A', '3', '0') /* 32  =
ABGR-2-10-10-10  */
> +#define V4L2_PIX_FMT_BGRA1010102 v4l2_fourcc('A', 'R', '3', '0') /* 32  =
BGRA-10-10-10-2  */
> =20
>  /* Grey formats */
>  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Grey=
scale     */

