Return-Path: <linux-media+bounces-33252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DEBAC21BB
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 245511669B9
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 11:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD8022A814;
	Fri, 23 May 2025 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G/y3vF7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6CE183CC3;
	Fri, 23 May 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747998343; cv=none; b=FQf1YnL7ux9NGhhkQXOrZ6cB4rgHyzo5FuWQLJjqldFSWwkROZJJxutVBRx8CHaIDJ+oD8MyXFoEvBzI7C5jUqhSUOxelX0y9zEqPeEqi2mzcwBM6XHJbmJyjbc1x/LYPHZC4fjPLK1RWGn99Uzse5VzrF5nwCM67PtCbduRpS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747998343; c=relaxed/simple;
	bh=Ye3uQC7xrBPg3aUxgsBw7tGbGkMZh87SKpNk54FKl/g=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hPXrX8eb9E5MLuRfra3fP8G7AETe64H5DD4M6eit/nPK8qaSgNppay1q6/S4AhUXo0glcf2cVmfvCA3lJZFbMuJYRbP8Z5+jxM+eMdoLO35WjZmCHXXTab5vx6+V+Yik+HGVa8eDE156Gz0LrqzOpSmlPLKhJp5TUON5Eu18LMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G/y3vF7Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (fp76f176b6.tkyc001.ap.nuro.jp [118.241.118.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0A916B5;
	Fri, 23 May 2025 13:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747998316;
	bh=Ye3uQC7xrBPg3aUxgsBw7tGbGkMZh87SKpNk54FKl/g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=G/y3vF7YOUJLFITEcHDpZCtnC7qocDabh33hZac6L8UjnXI1jLccP/ZETvK3upVRV
	 gQLqvFzXJXlGCU+zTkAwgehOnCQIgfX/xQCO34L6dNj7jlOkXtcvmsV5hEUvzqKmJ5
	 2Cl9zbuhwDoSvmda14WqVX2ZaK3Lcs48tRgAlXng=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m3tt5b7kvc.fsf@t19.piap.pl>
References: <m3tt5b7kvc.fsf@t19.piap.pl>
Subject: Re: [PATCH] media: rkisp1: correct histogram window size
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Fri, 23 May 2025 20:05:32 +0900
Message-ID: <174799833258.43941.7457628037394806572@pyrite.rasen.tech>
User-Agent: alot/0.0.0

Hi Krzysztof,

Thanks for the new version.

My bad, I should've mentioned in the review of the previous version; I think
you should have a paragraph in the beginning briefly explaining the problem=
 in
english.

"The histogram window dimensions are unnecessarily decremented. This can be
seen in the following example, where when all pixels are of maximum intensi=
ty
there are pixels that we expect to be counted but are missing from the high=
est
bin. Fix this by removing the unnecessary decrement."

I think would be good enough.

Quoting Krzysztof Ha=C5=82asa (2025-05-23 18:10:47)
> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
> HIST_STEPSIZE =3D 3 (lowest permitted), all weights are set to 1:
>=20
> isp_hist_h_size: 383 (=3D 1920 / 5 - 1)
> isp_hist_v_size: 215 (=3D 1080 / 5 - 1)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
>=20
> Apparently the histogram is missing the last column (3-pixel wide,
> though only single pixels count) and the last (same idea) row
> of the input image: 1917 * 1077 / 3 / 3 =3D 229401.
>=20
> E.g. without the patch, the pixels counted in lines are:
> 0, 3, ... 1914 (which makes 1917/3), and patched:
> 0, 3, ... 1914, 1917 (which makes 1920/3).
> The same is true for rows.

I like this clarification.


With the above paragraph added,

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

(I suppose if you approve it then it could simply be added when it's applied
and you wouldn't need to send a new version, but I don't have permissions f=
or
that so uh...)

>=20
> With the patch applied:
> isp_hist_h_size: 384 (=3D 1920 / 5)
> isp_hist_v_size: 216 (=3D 1080 / 5)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 230400
>=20
> 1920 * 1080 / 3 / 3 =3D 230400
>=20
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..ca9b3e711e5f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -819,8 +819,8 @@ static void rkisp1_hst_config_v10(struct rkisp1_param=
s *params,
>                      arg->meas_window.v_offs);
> =20
>         block_hsize =3D arg->meas_window.h_size /
> -                     RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
> -       block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW=
_NUM_V10 - 1;
> +                     RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10;
> +       block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW=
_NUM_V10;
> =20
>         rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_SIZE_V10,
>                      block_hsize);
>=20
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

