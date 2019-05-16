Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D7920070
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 09:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfEPHk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 03:40:58 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.161]:18942 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfEPHk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 03:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557992452;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gwYvO4k327mI04KozrOom6+kpBbf2TC4A2GGYD4amwI=;
        b=ODk/hubnXtVwPxuGrQOqQNbvv7WecQVWTA+hgDtu2Gn1Y+dgiHsyaIDJw8ab1K11qO
        vXmeeTrcnjoY94cDyt96OhY59rmD1flpfAucZbE63ggDW+qT3QF7Vh2pvy46I/tEhUNZ
        8h7ngwmjA7iKuRPmM/l5qoa2vmpsxUcejLukiwW9PDXJgNcfGJAsIaQk5Qe9+syczL7V
        LuRgnGfkcb6FWAZ5pAujW9PJXM9eqHQV/3ibatSA+AoQMUEd2aYTYztgLpuoiG2buh1u
        ewpGg8zGjZSBGsimPpNBMpjQwfSTx2g0Me4qKOJV/GoCrjTlJS/IIhUFwlti/FrN8RcM
        bHFA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id y08c83v4G7eqs8H
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 16 May 2019 09:40:52 +0200 (CEST)
Date:   Thu, 16 May 2019 09:40:52 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <983002694.66657.1557992452357@webmail.strato.com>
In-Reply-To: <20190516011417.10590-7-niklas.soderlund+renesas@ragnatech.se>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-7-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 6/8] rcar-vin: Merge helpers dealing with powering
 the parallel subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev57
X-Originating-IP: 85.212.214.135
X-Originating-Client: open-xchange-appsuite
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On May 16, 2019 at 3:14 AM Niklas S=C3=B6derlund <niklas.soderlund+renesa=
s@ragnatech.se> wrote:
>=20
>=20
> The two power helpers are now only dealing with the parallel subdevice,
> merge them into a single rvin_power_parallel() helper to reduce code
> duplication.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/=
platform/rcar-vin/rcar-v4l2.c
> index 5a9658b7d848fc86..7c8ba4b310706ceb 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -749,23 +749,13 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_op=
s =3D {
>   * File Operations
>   */
> =20
> -static int rvin_power_on(struct rvin_dev *vin)
> +static int rvin_power_parallel(struct rvin_dev *vin, bool on)
>  {
> -=09int ret;
>  =09struct v4l2_subdev *sd =3D vin_to_source(vin);
> -
> -=09ret =3D v4l2_subdev_call(sd, core, s_power, 1);
> -=09if (ret < 0 && ret !=3D -ENOIOCTLCMD && ret !=3D -ENODEV)
> -=09=09return ret;
> -=09return 0;
> -}
> -
> -static int rvin_power_off(struct rvin_dev *vin)
> -{
> +=09int power =3D on ? 1 : 0;
>  =09int ret;
> -=09struct v4l2_subdev *sd =3D vin_to_source(vin);
> =20
> -=09ret =3D v4l2_subdev_call(sd, core, s_power, 0);
> +=09ret =3D v4l2_subdev_call(sd, core, s_power, power);
>  =09if (ret < 0 && ret !=3D -ENOIOCTLCMD && ret !=3D -ENODEV)
>  =09=09return ret;
> =20
> @@ -777,7 +767,7 @@ static int rvin_initialize_device(struct file *file)
>  =09struct rvin_dev *vin =3D video_drvdata(file);
>  =09int ret;
> =20
> -=09ret =3D rvin_power_on(vin);
> +=09ret =3D rvin_power_parallel(vin, true);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> @@ -844,7 +834,7 @@ static int rvin_release(struct file *file)
>  =09 * Then de-initialize hw module.
>  =09 */
>  =09if (fh_singular)
> -=09=09rvin_power_off(vin);
> +=09=09rvin_power_parallel(vin, false);
> =20
>  =09pm_runtime_put(vin->dev);
> =20
> --=20
> 2.21.0
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
