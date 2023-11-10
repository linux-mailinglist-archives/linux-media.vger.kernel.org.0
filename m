Return-Path: <linux-media+bounces-73-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C07E84F7
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5A9281049
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303983C684;
	Fri, 10 Nov 2023 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479A33C08E
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:08:31 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3814C4;
	Fri, 10 Nov 2023 13:08:29 -0800 (PST)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id D3FAD66073EF;
	Fri, 10 Nov 2023 21:08:27 +0000 (GMT)
From: "Daniel Almeida" <daniel.almeida@collabora.com>
In-Reply-To: <20231109201640.340556-4-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 10 Nov 2023 21:08:27 +0000
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Sebastian Fricke" <sebastian.fricke@collabora.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <667d-654e9c00-5-40e97880@22375169>
Subject: =?utf-8?q?Re=3A?= [PATCH 4/4] =?utf-8?q?media=3A?==?utf-8?q?_rkvdec=3A?= 
 Hook the =?utf-8?q?(TRY=5F)DECODER=5FCMD?= stateless ioctls
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
> Fixes: ed7bb87d3d03 ("media: rkvdec: Enable capture buffer holding fo=
r H264")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/=
media/rkvdec/rkvdec.c
> index 84a41792cb4b..ac398b5a9736 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -461,6 +461,9 @@ static const struct v4l2=5Fioctl=5Fops rkvdec=5Fi=
octl=5Fops =3D {
> =20
>  	.vidioc=5Fstreamon =3D v4l2=5Fm2m=5Fioctl=5Fstreamon,
>  	.vidioc=5Fstreamoff =3D v4l2=5Fm2m=5Fioctl=5Fstreamoff,
> +
> +	.vidioc=5Fdecoder=5Fcmd =3D v4l2=5Fm2m=5Fioctl=5Fstateless=5Fdecode=
r=5Fcmd,
> +	.vidioc=5Ftry=5Fdecoder=5Fcmd =3D v4l2=5Fm2m=5Fioctl=5Fstateless=5F=
try=5Fdecoder=5Fcmd,
>  };
> =20
>  static int rkvdec=5Fqueue=5Fsetup(struct vb2=5Fqueue *vq, unsigned i=
nt *num=5Fbuffers,
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


