Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F42C42EF6E
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 13:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233881AbhJOLPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 07:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhJOLPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 07:15:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9B5C061570;
        Fri, 15 Oct 2021 04:13:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D09C92E3;
        Fri, 15 Oct 2021 13:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634296407;
        bh=tWD9NVmhN9DuN457X3NoNn6LabUJ9LwUAwP/i5PEFtw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iQ08DwkZqTD3TFA0XcfpaoqY/qM7OvFGnyex5XYdZBgbRjc3Mr4r4g9g5iEBUzHxy
         a3Gz4njG/l85k7t0hvCAANtiDs0aMgs/zrKgg99Hev78EVGKr0fRVKTFyFic2amb2L
         gb6bYlGZMeZZ72mCMhgw2gKvIpnC82e203yyi9kU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211012214703.25433-1-rikard.falkeborn@gmail.com>
References: <20211012214703.25433-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] media: imx: Constify static struct v4l2_m2m_ops
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Date:   Fri, 15 Oct 2021 12:13:25 +0100
Message-ID: <163429640538.4171071.8827493049115866396@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Rikard Falkeborn (2021-10-12 22:47:03)
> The only usage of m2m_ops is to pass its address to v4l2_m2m_init(),
> which  takes a pointer to const v4l2_m2m_ops as argument. Make it const
> to allow the compiler to put it in read-only memory.
>=20
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/s=
taging/media/imx/imx-media-csc-scaler.c
> index eb6da9b9d8ba..1fd39a2fca98 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -820,7 +820,7 @@ static const struct v4l2_file_operations ipu_csc_scal=
er_fops =3D {
>         .mmap           =3D v4l2_m2m_fop_mmap,
>  };
> =20
> -static struct v4l2_m2m_ops m2m_ops =3D {
> +static const struct v4l2_m2m_ops m2m_ops =3D {
>         .device_run     =3D device_run,
>         .job_abort      =3D job_abort,
>  };
> --=20
> 2.33.0
>
