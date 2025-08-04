Return-Path: <linux-media+bounces-38877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC605B1AAB6
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 00:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A02962247D
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 22:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BC423C4E9;
	Mon,  4 Aug 2025 22:00:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B54C1552FA;
	Mon,  4 Aug 2025 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754344836; cv=none; b=uykE8BQPN8aephsshyXxgCuhbsToJextdpx/7tP5nSZdNmGoQQVtUTU0NQtQQacwxz1bne6LCbQO+tgKL0JlrtTnstRz05KunJmLSln2uIeYKyGy2awTI6611fwYCFv4BzIXQGauwzfSeB44PHLXp8/FLN1xAu3txvXatW2XBlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754344836; c=relaxed/simple;
	bh=OkqY7SFjrArg66oQlEL4f7x/72BougKos8SuncqmGO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMvDuUviYz8tB2i6hOasdGobIdIkoaQuLygNV8lrP1qI69GGHGpXHQFcyu3H/n/8z1lTYn2nE3Y1GS1wuIN3tiaK9XaD7rriRtxYN+frEYItve2l1+y/UenY0oz0oiqZDFdHNHUKDe+tPQzoFCu6Dk9thGoyd6w85woDuKo+vEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 496D91F00078;
	Mon,  4 Aug 2025 21:59:48 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id ACAE6B0118D; Mon,  4 Aug 2025 21:59:39 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 02B54B01170;
	Mon,  4 Aug 2025 21:59:27 +0000 (UTC)
Date: Mon, 4 Aug 2025 23:59:25 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 54/65] media: hantro: Access v4l2_fh from
 file->private_data
Message-ID: <aJEtPd_-IzQZVBfl@shepard>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-54-eb140ddd6a9d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/6X2y1A/1uo421sv"
Content-Disposition: inline
In-Reply-To: <20250802-media-private-data-v1-54-eb140ddd6a9d@ideasonboard.com>


--/6X2y1A/1uo421sv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Very nice cleanup, glad to see this abstracted away from drivers!

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

On Sat 02 Aug 25, 11:23, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> To prepare for the introduction of video_device_state as second argument
> of the v4l2_ioctl_ops handler, access the v4l2_fh from
> file->private_data instead of using void *priv.
>=20
> The file->private_data is initialized to point to the v4l2_fh
> by the usage of v4l2_fh_init() in the v4l2_file_operations.open()
> handler.
>=20
> While at it remove the only left user of fh_to_ctx() and remove
> the macro completely.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/verisilicon/hantro.h      |  5 -----
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 22 +++++++++++-------=
----
>  2 files changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 0f10714f1953945472e11d8c8ad87f8ec009b39f..e0fdc4535b2d73c5260057b0a=
89aee67a4732dd2 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -382,11 +382,6 @@ extern int hantro_debug;
>  	pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
> =20
>  /* Structure access helpers. */
> -static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct hantro_ctx, fh);
> -}
> -
>  static __always_inline struct hantro_ctx *file_to_ctx(struct file *filp)
>  {
>  	return container_of(file_to_v4l2_fh(filp), struct hantro_ctx, fh);
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 7c3515cf7d64a090adfb8d8aff368f9a617f8c8a..6bcd892e7bb49c654aae58416=
64d68c1692064bd 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -185,7 +185,7 @@ static int vidioc_querycap(struct file *file, void *p=
riv,
>  static int vidioc_enum_framesizes(struct file *file, void *priv,
>  				  struct v4l2_frmsizeenum *fsize)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	const struct hantro_fmt *fmt;
> =20
>  	fmt =3D hantro_find_format(ctx, fsize->pixel_format);
> @@ -217,7 +217,7 @@ static int vidioc_enum_fmt(struct file *file, void *p=
riv,
>  			   struct v4l2_fmtdesc *f, bool capture)
> =20
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	const struct hantro_fmt *fmt, *formats;
>  	unsigned int num_fmts, i, j =3D 0;
>  	bool skip_mode_none, enum_all_formats;
> @@ -297,7 +297,7 @@ static int vidioc_g_fmt_out_mplane(struct file *file,=
 void *priv,
>  				   struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =20
>  	vpu_debug(4, "f->type =3D %d\n", f->type);
> =20
> @@ -310,7 +310,7 @@ static int vidioc_g_fmt_cap_mplane(struct file *file,=
 void *priv,
>  				   struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =20
>  	vpu_debug(4, "f->type =3D %d\n", f->type);
> =20
> @@ -398,13 +398,13 @@ static int hantro_try_fmt(const struct hantro_ctx *=
ctx,
>  static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
>  				     struct v4l2_format *f)
>  {
> -	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
> +	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
>  }
> =20
>  static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
>  				     struct v4l2_format *f)
>  {
> -	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
> +	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
>  }
> =20
>  static void
> @@ -648,19 +648,19 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ct=
x,
>  static int
>  vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_forma=
t *f)
>  {
> -	return hantro_set_fmt_out(fh_to_ctx(priv), &f->fmt.pix_mp, HANTRO_AUTO_=
POSTPROC);
> +	return hantro_set_fmt_out(file_to_ctx(file), &f->fmt.pix_mp, HANTRO_AUT=
O_POSTPROC);
>  }
> =20
>  static int
>  vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_forma=
t *f)
>  {
> -	return hantro_set_fmt_cap(fh_to_ctx(priv), &f->fmt.pix_mp);
> +	return hantro_set_fmt_cap(file_to_ctx(file), &f->fmt.pix_mp);
>  }
> =20
>  static int vidioc_g_selection(struct file *file, void *priv,
>  			      struct v4l2_selection *sel)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =20
>  	/* Crop only supported on source. */
>  	if (!ctx->is_encoder ||
> @@ -691,7 +691,7 @@ static int vidioc_g_selection(struct file *file, void=
 *priv,
>  static int vidioc_s_selection(struct file *file, void *priv,
>  			      struct v4l2_selection *sel)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	struct v4l2_rect *rect =3D &sel->r;
>  	struct vb2_queue *vq;
> =20
> @@ -738,7 +738,7 @@ static const struct v4l2_event hantro_eos_event =3D {
>  static int vidioc_encoder_cmd(struct file *file, void *priv,
>  			      struct v4l2_encoder_cmd *ec)
>  {
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
>  	int ret;
> =20
>  	ret =3D v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
>=20
> --=20
> 2.49.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--/6X2y1A/1uo421sv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiRLT0ACgkQhP3B6o/u
lQzrNQ//exzkeWe4akWNjtSBn1Bl653EfO7v/aMS3Y3CCAKwErQrOulake7C7uWp
FWmge5iMC9U/bJjnJn6lW9WfRnVUXmp5akqOeWHMSQNTJOKjpKKu2vbmpqvYuw8/
EZ2UXBGtg72QjRVuzMJ+SE6pK4JPFM8d4TgJxzk49W5ABja+ipgEbdccHOOiSC6+
uFVnPmJI1kOcxLhh4CLeJsq2rbT56LiAWFj/BcsoRnz0+2o3/E8FL3f2KG5T4/Hj
6hZjsZySX3X+bwDVFBhMXv1d/ecgXPjUrdhj2kM+v50DMAu1jbz9aNM1kFzxA01q
9uh4AeSC65gQ8YnjC8mUo9BH/9JWzvf8SsGLTqLfDxkaHZcs5dIfqvNkmTs+sAM9
syJ2hplhAYUk20Pn/AAda2drxoqYYnUjt6R+UOaVcaJMLIr2z8CS60rWr2+Uwhpd
njA1mv/Zih/rq8uNN8l+j4DAQabNh8g/LPeroTO0/eF5WsPTvZM/BKtKrJgoy3Rv
E+C0EwaEiCNxZH9vUSmqw/DkWRX2CBe6NoDzUGwjWGJeSAjSCgbklwdyUuhKaJq0
MTDz/VZ2xLIMFm8RRFfYBjKohUK+RXA2OHHst4bQGq0rvjqtJo9yd3UzIFz+ww+L
VpD0vh+lndjqAQHcpftyzMcgB6AVADDZydaRUFdLGm9OHaeZA5k=
=4/Uq
-----END PGP SIGNATURE-----

--/6X2y1A/1uo421sv--

