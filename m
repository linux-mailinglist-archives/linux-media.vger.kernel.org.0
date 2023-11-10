Return-Path: <linux-media+bounces-70-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F145D7E84EC
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57FC1F20F3F
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3723C68C;
	Fri, 10 Nov 2023 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C83C689
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:06:19 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF839F;
	Fri, 10 Nov 2023 13:06:18 -0800 (PST)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id F295666073EF;
	Fri, 10 Nov 2023 21:06:15 +0000 (GMT)
From: "Daniel Almeida" <daniel.almeida@collabora.com>
In-Reply-To: <20231109201640.340556-1-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 10 Nov 2023 21:06:15 +0000
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Sebastian Fricke" <sebastian.fricke@collabora.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <667d-654e9b80-1-40e97880@22375103>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/4] =?utf-8?q?media=3A?==?utf-8?q?_vicodec=3A?= 
 Disable =?utf-8?q?(TRY=5F)DECODER=5FCMD?= for the stateless case
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thursday, November 09, 2023 17:16 -03, Paul Kocialkowski <paul.kocia=
lkowski@bootlin.com> wrote:

> The (TRY=5F)DECODER=5FCMD ioctls are only useful for stateful decoder=
s and for
> stateless decoders that support holding capture buffers (which is not=
 the case
> for this driver).
>=20
> Disable them when registering the stateless decoder.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../media/test-drivers/vicodec/vicodec-core.c | 19 +++++++++++++----=
--
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/driv=
ers/media/test-drivers/vicodec/vicodec-core.c
> index 6f0e20df74e9..8f7a2b153ee9 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -1240,6 +1240,12 @@ static int vicodec=5Fdecoder=5Fcmd(struct file=
 *file, void *fh,
>  	struct vicodec=5Fctx *ctx =3D file2ctx(file);
>  	int ret;
> =20
> +	/*
> +	 * This ioctl should not be used with a stateless codec that doesn'=
t
> +	 * support holding buffers and the associated flush command.
> +	 */
> +	WARN=5FON(ctx->is=5Fstateless);
> +
>  	ret =3D v4l2=5Fm2m=5Fioctl=5Ftry=5Fdecoder=5Fcmd(file, fh, dc);
>  	if (ret < 0)
>  		return ret;
> @@ -2025,7 +2031,7 @@ static const struct v4l2=5Fm2m=5Fops m2m=5Fops =
=3D {
> =20
>  static int register=5Finstance(struct vicodec=5Fdev *dev,
>  			     struct vicodec=5Fdev=5Finstance *dev=5Finstance,
> -			     const char *name, bool is=5Fenc)
> +			     const char *name, bool is=5Fenc, bool is=5Fstateless)
>  {
>  	struct video=5Fdevice *vfd;
>  	int ret;
> @@ -2045,10 +2051,11 @@ static int register=5Finstance(struct vicodec=
=5Fdev *dev,
>  	strscpy(vfd->name, name, sizeof(vfd->name));
>  	vfd->device=5Fcaps =3D V4L2=5FCAP=5FSTREAMING |
>  		(multiplanar ? V4L2=5FCAP=5FVIDEO=5FM2M=5FMPLANE : V4L2=5FCAP=5FVI=
DEO=5FM2M);
> -	if (is=5Fenc) {
> +	if (is=5Fenc || is=5Fstateless) {
>  		v4l2=5Fdisable=5Fioctl(vfd, VIDIOC=5FDECODER=5FCMD);
>  		v4l2=5Fdisable=5Fioctl(vfd, VIDIOC=5FTRY=5FDECODER=5FCMD);
> -	} else {
> +	}
> +	if (!is=5Fenc) {
>  		v4l2=5Fdisable=5Fioctl(vfd, VIDIOC=5FENCODER=5FCMD);
>  		v4l2=5Fdisable=5Fioctl(vfd, VIDIOC=5FTRY=5FENCODER=5FCMD);
>  	}
> @@ -2107,17 +2114,17 @@ static int vicodec=5Fprobe(struct platform=5F=
device *pdev)
>  	platform=5Fset=5Fdrvdata(pdev, dev);
> =20
>  	ret =3D register=5Finstance(dev, &dev->stateful=5Fenc, "stateful-en=
coder",
> -				true);
> +				true, false);
>  	if (ret)
>  		goto unreg=5Fdev;
> =20
>  	ret =3D register=5Finstance(dev, &dev->stateful=5Fdec, "stateful-de=
coder",
> -				false);
> +				false, false);
>  	if (ret)
>  		goto unreg=5Fsf=5Fenc;
> =20
>  	ret =3D register=5Finstance(dev, &dev->stateless=5Fdec, "stateless-=
decoder",
> -				false);
> +				false, true);
>  	if (ret)
>  		goto unreg=5Fsf=5Fdec;
> =20
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


