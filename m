Return-Path: <linux-media+bounces-72-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60A7E84F4
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908EA28136E
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E093C3C682;
	Fri, 10 Nov 2023 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B33B2B1
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:07:50 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707D19F;
	Fri, 10 Nov 2023 13:07:49 -0800 (PST)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 44D0F66073EF;
	Fri, 10 Nov 2023 21:07:47 +0000 (GMT)
From: "Daniel Almeida" <daniel.almeida@collabora.com>
In-Reply-To: <20231109201640.340556-3-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 10 Nov 2023 21:07:46 +0000
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Sebastian Fricke" <sebastian.fricke@collabora.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <530d-654e9b80-9-557cd880@203483206>
Subject: =?utf-8?q?Re=3A?= [PATCH 3/4] =?utf-8?q?media=3A?=
 =?utf-8?q?_verisilicon=3A?= Hook the =?utf-8?q?(TRY=5F)DECODER=5FCMD?= 
 stateless ioctls
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable

On Thursday, November 09, 2023 17:16 -03, Paul Kocialkowski <paul.kocia=
lkowski@bootlin.com> wrote:

> The (TRY=5F)DECODER=5FCMD ioctls are used to support flushing when ho=
lding capture
> buffers is supported. This is the case of this driver but the ioctls =
were never
> hooked to the ioctl ops.
>=20
> Add them to correctly support flushing.
>=20
> Fixes: 340ce50f75a6 ("media: hantro: Enable HOLD=5FCAPTURE=5FBUF for =
H.264")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/verisilicon/hantro=5Fdrv.c  | 2 ++
>  drivers/media/platform/verisilicon/hantro=5Fv4l2.c | 3 +++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro=5Fdrv.c b/driv=
ers/media/platform/verisilicon/hantro=5Fdrv.c
> index a9fa05ac56a9..3a2a0f28cbfe 100644
> --- a/drivers/media/platform/verisilicon/hantro=5Fdrv.c
> +++ b/drivers/media/platform/verisilicon/hantro=5Fdrv.c
> @@ -905,6 +905,8 @@ static int hantro=5Fadd=5Ffunc(struct hantro=5Fde=
v *vpu, unsigned int funcid)
> =20
>  	if (funcid =3D=3D MEDIA=5FENT=5FF=5FPROC=5FVIDEO=5FENCODER) {
>  		vpu->encoder =3D func;
> +		v4l2=5Fdisable=5Fioctl(vfd, VIDIOC=5FTRY=5FDECODER=5FCMD);
> +		v4l2=5Fdisable=5Fioctl(vfd, VIDIOC=5FDECODER=5FCMD);
>  	} else {
>  		vpu->decoder =3D func;
>  		v4l2=5Fdisable=5Fioctl(vfd, VIDIOC=5FTRY=5FENCODER=5FCMD);
> diff --git a/drivers/media/platform/verisilicon/hantro=5Fv4l2.c b/dri=
vers/media/platform/verisilicon/hantro=5Fv4l2.c
> index b3ae037a50f6..db145519fc5d 100644
> --- a/drivers/media/platform/verisilicon/hantro=5Fv4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro=5Fv4l2.c
> @@ -785,6 +785,9 @@ const struct v4l2=5Fioctl=5Fops hantro=5Fioctl=5F=
ops =3D {
>  	.vidioc=5Fg=5Fselection =3D vidioc=5Fg=5Fselection,
>  	.vidioc=5Fs=5Fselection =3D vidioc=5Fs=5Fselection,
> =20
> +	.vidioc=5Fdecoder=5Fcmd =3D v4l2=5Fm2m=5Fioctl=5Fstateless=5Fdecode=
r=5Fcmd,
> +	.vidioc=5Ftry=5Fdecoder=5Fcmd =3D v4l2=5Fm2m=5Fioctl=5Fstateless=5F=
try=5Fdecoder=5Fcmd,
> +
>  	.vidioc=5Ftry=5Fencoder=5Fcmd =3D v4l2=5Fm2m=5Fioctl=5Ftry=5Fencode=
r=5Fcmd,
>  	.vidioc=5Fencoder=5Fcmd =3D vidioc=5Fencoder=5Fcmd,
>  };
> --=20
> 2.42.1
>=20
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>


