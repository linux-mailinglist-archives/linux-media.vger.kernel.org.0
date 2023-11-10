Return-Path: <linux-media+bounces-71-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 915057E84EF
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3096E1F20EF4
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DCC3C680;
	Fri, 10 Nov 2023 21:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E73AC3C
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:06:59 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4608BC;
	Fri, 10 Nov 2023 13:06:56 -0800 (PST)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 8072766073EF;
	Fri, 10 Nov 2023 21:06:54 +0000 (GMT)
From: "Daniel Almeida" <daniel.almeida@collabora.com>
In-Reply-To: <20231109201640.340556-2-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 10 Nov 2023 21:06:54 +0000
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Sebastian Fricke" <sebastian.fricke@collabora.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <530d-654e9b80-7-557cd880@203483173>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/4] =?utf-8?q?media=3A?==?utf-8?q?_visl=3A?= Hook 
 the =?utf-8?q?(TRY=5F)DECODER=5FCMD?= stateless ioctls
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable

Hi Paul,

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
> Fixes: 0c078e310b6d ("media: visl: add virtual stateless decoder driv=
er")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/test-drivers/visl/visl-video.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/m=
edia/test-drivers/visl/visl-video.c
> index 7cac6a6456eb..9303a3e118d7 100644
> --- a/drivers/media/test-drivers/visl/visl-video.c
> +++ b/drivers/media/test-drivers/visl/visl-video.c
> @@ -525,6 +525,9 @@ const struct v4l2=5Fioctl=5Fops visl=5Fioctl=5Fop=
s =3D {
>  	.vidioc=5Fstreamon		=3D v4l2=5Fm2m=5Fioctl=5Fstreamon,
>  	.vidioc=5Fstreamoff		=3D v4l2=5Fm2m=5Fioctl=5Fstreamoff,
> =20
> +	.vidioc=5Fdecoder=5Fcmd		=3D v4l2=5Fm2m=5Fioctl=5Fstateless=5Fdecod=
er=5Fcmd,
> +	.vidioc=5Ftry=5Fdecoder=5Fcmd		=3D v4l2=5Fm2m=5Fioctl=5Fstateless=5F=
try=5Fdecoder=5Fcmd,
> +
>  	.vidioc=5Fsubscribe=5Fevent		=3D v4l2=5Fctrl=5Fsubscribe=5Fevent,
>  	.vidioc=5Funsubscribe=5Fevent	=3D v4l2=5Fevent=5Funsubscribe,
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


