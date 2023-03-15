Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0E56BBD37
	for <lists+linux-media@lfdr.de>; Wed, 15 Mar 2023 20:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjCOTZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 15:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjCOTZd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 15:25:33 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C8058484
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 12:25:16 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id c18so17446006qte.5
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 12:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1678908315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T97q1IFZZoIPIEi7mC9ELASfgPyCNzQTIRdcfrJebjk=;
        b=erN9T4DcYS7K8ujL4Qe8csF73Ze497tGugkVJOIRY8/WN+9O5vuAQuUIQujAFBBL1+
         n5ZsCypAWHNzHIIGOGWz0Y/CoA+0fIncHze4aPAyDjNG8MfqgRPgXsBOgDH18GKGUPrr
         HS8dWEKDewalrVe7EEbYPiLbKU06wDKAzifCCmrvTZk2j57YDLHa4Eal4lPWhHcVF8UU
         RsiYf8W3m7fjgbL91466vXxYd+L4ks10M9jeafVvCxCexfkOPUwVStVczGNXBr6eF+nm
         XlYn+AQzEP6yFCYzd6A+dQBRNSYEVkg1m/WnvzSAqMGFt/m66zni1PagOWjaOZCDOYJC
         HrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678908315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T97q1IFZZoIPIEi7mC9ELASfgPyCNzQTIRdcfrJebjk=;
        b=zPryCQk/FM8AQQVFIwemWuB/VlnBj+7QIqg6XE9VOGBlU2nmK7Kjb2vf8RCKSR0i0R
         Vd8PFnm2UXL6sBYtDGVfWByJMlhgoQOoGz+I7IHWVPRpgm/4YeYwCsKvgDc8vZgqF2gR
         GZLd5yuA7+KLYTNiM8/KwIAlgijE3ZuOJxmTAx6Fz8QGvyGvm7W0v8QhZBDydCCqFKfy
         47DqGp8n4OZo6tCG3UyTrb+ObZXAgcCLwsJH7guqpLtov1FzU8DtkAkUyAqu63U1nL28
         LYChKE+vDJmYqyrkHT3Bkfoxu1kijl0EOM3mHVGrMAvZOFdY3SintYU1gEWunywq5xFW
         978A==
X-Gm-Message-State: AO0yUKVhoYvTx0EWfrpPdbxJwFsWFR72qsr/J/3sX587mKitMum1qjhV
        6X0AFsyrW/dM8vc/Ih/uml/eX+6qUUQ4vVtw0ok=
X-Google-Smtp-Source: AK7set+t+CZ1PdK5B1/p0pfMPIYNODsz1I0THQTXYca1nF58X6bDW8lLnCtGnPYrbrjubVsRQTLCjg==
X-Received: by 2002:a05:622a:15d6:b0:3b8:57a7:7836 with SMTP id d22-20020a05622a15d600b003b857a77836mr1774502qty.46.1678908315362;
        Wed, 15 Mar 2023 12:25:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r7-20020ac85c87000000b003b635a5d56csm4367395qta.30.2023.03.15.12.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 12:25:15 -0700 (PDT)
Message-ID: <4dc6f8734d3455d9af11f10ce15b19c2c72486dd.camel@ndufresne.ca>
Subject: Re: [PATCH v2 5/5] media: v4l: Add Broadcom sand format infos to
 v4l2-common.c
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Date:   Wed, 15 Mar 2023 15:25:14 -0400
In-Reply-To: <20230310194121.61928-6-jc@kynesim.co.uk>
References: <20230310194121.61928-1-jc@kynesim.co.uk>
         <20230310194121.61928-6-jc@kynesim.co.uk>
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

Le vendredi 10 mars 2023 =C3=A0 19:41 +0000, John Cox a =C3=A9crit=C2=A0:
> Add the format information for Broadcom 8 and 10-bit packed 128 byte
> column formats into the format_info array in v4l2-common.c
>=20
> Signed-off-by: John Cox <jc@kynesim.co.uk>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 9cb0895dea1c..51f7d76ce658 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -267,6 +267,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_NV24,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_NV42,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_NV12_C128, .pixel_enc =3D V4L2_PIXEL_ENC_YU=
V, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div=
 =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +		{ .format =3D V4L2_PIX_FMT_P030_C128, .pixel_enc =3D V4L2_PIXEL_ENC_YU=
V, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 4, 8, 0, 0 }, .bpp_div=
 =3D { 3, 3, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =20
>  		{ .format =3D V4L2_PIX_FMT_YUV410,  .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },
>  		{ .format =3D V4L2_PIX_FMT_YVU410,  .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },

