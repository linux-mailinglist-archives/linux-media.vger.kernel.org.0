Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC2A7E4942
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 20:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjKGTgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 14:36:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjKGTgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 14:36:31 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E686910C3
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 11:36:28 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-42033328ad0so11745731cf.0
        for <linux-media@vger.kernel.org>; Tue, 07 Nov 2023 11:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1699385788; x=1699990588; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UiZVNlp4v745T4J+W90r925ahjZE2TeDwN6p0vfr49s=;
        b=oS95YOO+ySjIMFEqhnJ23hjGF9D5l11TYqsfuwDLa6o5cS47EGFa/ebaqQkNZTGqHF
         jqtvITldq+mH+zciSOVMKcOML9nNplnZi2e+b+e/HfbvfSTfuVRUAP4fKDqOSiilclSt
         Wn8tEDWlC/JctTjkNDdMrC5btYptWXiwG+R/7S2Pim+Sf9GYi/4unbMvyZOFSsRX+3TR
         ZPh6kjP2CLJxCbdPTgf3jTNO70zcbXxlMFo9s6Al6GG06rdyOrAK/5S9CllTyDGom2Zw
         5uH+bmRliW1JSkqGqEQQ28OVPC60xiJomDJ6Zw1cqKjryn86GEjC61Got4M7hVRmv/Br
         ATfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699385788; x=1699990588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiZVNlp4v745T4J+W90r925ahjZE2TeDwN6p0vfr49s=;
        b=X/GluxO7CkAz/cPHSWYbGc0Q0SFItl6ev0CTR1Ghz/jBgYEqr1vU7AGshI25sCf8OA
         Qn4H8pyxpmbTjWdU/vX8gSBo0x2VV5H2nBc1Oog63teaOJ369C5fInVl4T9FfcJLhixJ
         He0//Ap9v4CVFOErJ18Vxmgw5nc+EY58Lu04Y+fQaIkcWtEqjIl36lJZQBQ8xSLrHhgK
         5TF0aDwRRnMPD5jSQYxpiBbleN5k0w235C8Ea3YH44QXqa2JbCd0C/Mu69D+wD6kuZ3b
         sTIUDEHrDcYWDg5rOqluzROC7KwSyAazMsMV++1LB1pX5EG3E5YUisGywZVsoWSmY/7t
         5oXQ==
X-Gm-Message-State: AOJu0YwZKzCAB3D2B5zON6EWDzCHqEUYGrzllW2kZDUXOvMkcV3q/K1g
        X9Fd/MqC++o3ATcJ57nSDJpq7g==
X-Google-Smtp-Source: AGHT+IHwsuwa8ThAQeOF6opq77pL61Bl43oeagm7e+h2JLbWnAym/RpWLluCo8QlUePQsgwI9zMfYw==
X-Received: by 2002:a05:622a:247:b0:415:2623:d8df with SMTP id c7-20020a05622a024700b004152623d8dfmr38191830qtx.7.1699385788086;
        Tue, 07 Nov 2023 11:36:28 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:6dc0::c73? ([2606:6d00:17:6dc0::c73])
        by smtp.gmail.com with ESMTPSA id jz9-20020a05622a81c900b0041ce9ebaad2sm215277qtb.43.2023.11.07.11.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 11:36:27 -0800 (PST)
Message-ID: <0c98e11e4b3fe84f74e746f44f39480594246154.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-common: Add 10bpp RGB formats info
From:   nicolas@ndufresne.ca
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Date:   Tue, 07 Nov 2023 14:36:27 -0500
In-Reply-To: <20231107172916.78095-1-jacopo.mondi@ideasonboard.com>
References: <20231107172916.78095-1-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mardi 07 novembre 2023 =C3=A0 18:29 +0100, Jacopo Mondi a =C3=A9crit=C2=
=A0:
> Video4Linux2 defines 3 RGB formats with 10 bits per color components
> plus two optional alpha bits such that a pixel is then stored in a 4
> bytes word.
>=20
> Add a format info for the 3 10-bits RGB formats to the
> v4l2_format_info() table in v4l2-common.c.
>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 3a4b15a98e02..e9e7e70fa24e 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -254,6 +254,9 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_BGR666,  .pixel_enc =3D V4L2_PIXEL_ENC_RGB,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_BGR48_12, .pixel_enc =3D V4L2_PIXEL_ENC_RGB=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_ABGR64_12, .pixel_enc =3D V4L2_PIXEL_ENC_RG=
B, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8, 0, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGBA1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_RGBX1010102, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_ARGB2101010, .pixel_enc =3D V4L2_PIXEL_ENC_=
RGB, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>=20
>  		/* YUV packed formats */
>  		{ .format =3D V4L2_PIX_FMT_YUYV,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> --
> 2.41.0
>=20

