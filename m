Return-Path: <linux-media+bounces-12343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 257648D6265
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 15:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899AA1F21EEE
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 13:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AF1158A17;
	Fri, 31 May 2024 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="34uRkWd2"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DE1F95A;
	Fri, 31 May 2024 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717160917; cv=none; b=ucd539Lq1XLRI2ER2syHA7Lz9XJ6gy4zCki3eHI4yxiUhYfZyeA/qFmLk03n0AuO47K25aOxslF97WXbkWJ5pzu82xgUMnYzofBwa0WwtOSFA+HYphvAQagxBGIw+O3kQDJp9H6CAYvKU+UUI/QB1fmnJ2mvJIarPcZ/1pmgHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717160917; c=relaxed/simple;
	bh=kJL81lgtIhtVj03x4PGIQjC8rszVUBsb9lNIZjrnrCA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q5m9Jy1RCJ58U6M5rRRAy5px/wdKumI1sfSukb5U9X2MCPc92j5KqQOJ9KIhqUwKaSozm3wELAvG4rCFxx4gkhQOouZntO7+32TWi4LUlvpPcG+2D+QGM9lssMe71aQOmzpWjeQ5W8k777FkbLNE4HQt9n8tV4JRI5s89lriPi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=34uRkWd2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717160914;
	bh=kJL81lgtIhtVj03x4PGIQjC8rszVUBsb9lNIZjrnrCA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=34uRkWd227zQ4v3svcLUIKUry1ObSr3ERNtPGpw/1Nt/OPbLed+tyfAKDO7IfvN7o
	 l289JLhqqGmd0VI44jpbZsRHWodBKpV6BosGnqlJXiajPRJ260/gm3U6pNINlYUcUp
	 /Xj11bDsmiTtHSKfs7ihIWT3ypwcOmTeBbmxXmQ075uin3sIjlhZlNxoVhhkHrfLjS
	 kN4ebHOzsSUqAAhd6ds1IPEPqxppHFW8vWXda6AzmfQlpvndevE/j7bKl2H9XNeHkv
	 4Fx+ubyWdVwiqyvPJcpkmJ6AQzgKPvnoJr5DXTe6uVx3LqhgOeo8xRW7Nz8uhcXCWI
	 f1fnXgcX6YTWQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8DA4137821AD;
	Fri, 31 May 2024 13:08:30 +0000 (UTC)
Message-ID: <e28fa3d62d6c3f5a32aeb25390b8836e5185a993.camel@collabora.com>
Subject: Re: [PATCH v6,15/24] media: mediatek: vcodec: Add one plane format
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Jeffrey Kardatzke
 <jkardatzke@google.com>, =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,  Steve Cho <stevecho@chromium.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 31 May 2024 09:08:24 -0400
In-Reply-To: <20240516122102.16379-16-yunfei.dong@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
	 <20240516122102.16379-16-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 16 mai 2024 =C3=A0 20:20 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> Adding capture formats to support V4L2_PIX_FMT_MS21. This format has
> one plane and only be used for secure video playback at current period.

Please, replace "one plane" with "single allocation". This should disambigu=
ate
the message a little bit, since MS21 remains a semi-planar format with 2 pl=
anes.

Nicolas

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c    | 4 +++-
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 9 ++++++++-
>  2 files changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index 9107707de6c4..192b01ff3ede 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -49,7 +49,9 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_dec_=
ctx *ctx, int format_inde
>  		num_frame_count++;
>  	}
> =20
> -	if (num_frame_count =3D=3D 1 || (!ctx->is_10bit_bitstream && fmt->fourc=
c =3D=3D V4L2_PIX_FMT_MM21))
> +	if ((!ctx->is_10bit_bitstream && fmt->fourcc =3D=3D V4L2_PIX_FMT_MM21) =
||
> +	    (ctx->is_secure_playback && fmt->fourcc =3D=3D V4L2_PIX_FMT_MS21) |=
|
> +	    num_frame_count =3D=3D 1)
>  		return true;
> =20
>  	q_data =3D &ctx->q_data[MTK_Q_DATA_SRC];
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index b903e39fee89..fbea00517565 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -229,7 +229,7 @@ static const struct mtk_stateless_control mtk_statele=
ss_controls[] =3D {
> =20
>  #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
> =20
> -static struct mtk_video_fmt mtk_video_formats[9];
> +static struct mtk_video_fmt mtk_video_formats[10];
> =20
>  static struct mtk_video_fmt default_out_format;
>  static struct mtk_video_fmt default_cap_format;
> @@ -770,6 +770,11 @@ static void mtk_vcodec_add_formats(unsigned int four=
cc,
>  		mtk_video_formats[count_formats].type =3D MTK_FMT_FRAME;
>  		mtk_video_formats[count_formats].num_planes =3D 2;
>  		break;
> +	case V4L2_PIX_FMT_MS21:
> +		mtk_video_formats[count_formats].fourcc =3D fourcc;
> +		mtk_video_formats[count_formats].type =3D MTK_FMT_FRAME;
> +		mtk_video_formats[count_formats].num_planes =3D 1;
> +		break;
>  	default:
>  		mtk_v4l2_vdec_err(ctx, "Can not add unsupported format type");
>  		return;
> @@ -798,6 +803,8 @@ static void mtk_vcodec_get_supported_formats(struct m=
tk_vcodec_dec_ctx *ctx)
>  		cap_format_count++;
>  	}
>  	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
> +		mtk_vcodec_add_formats(V4L2_PIX_FMT_MS21, ctx);
> +		cap_format_count++;
>  		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
>  		cap_format_count++;
>  	}


