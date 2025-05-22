Return-Path: <linux-media+bounces-33171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAFAC110D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA17B4E836A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299E329AAF1;
	Thu, 22 May 2025 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LJoybMKE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EA29AAEC;
	Thu, 22 May 2025 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931431; cv=none; b=AI05TnJsaS9Z7YSTNx0b+GBw/u77lCt2WBvSdV8z9jfYuLGlFgxPYKSb4KnLPYdd7ujUUcagCDIdU2mSzrmYkPpLWHRADsg2Q/4joVk0c8LMKvm4IBjWc4dGSiordNeOo8gslQyAg5OgbwaIm8NSYhUMIjTbW45PjJ6EfhvTsgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931431; c=relaxed/simple;
	bh=9w6AYxG86+ShRJPYPhJz6k6F0yijUzIA6kRpB5v/haw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fgAFpk+YVHUThDOi/2+62FAJA2+UlUXakWnGMt9lYVXw3y5hBhiZ4wcWpIY433bg61n5TKME2F2QESJwGoTIj8SjiGU/Z1rllAD1+F7Mt6QPuuyNPaiJ/o1Bo++2E53lurjdKIqAhPQcjuzrzELaC5l0F56JqP/yiw9OyPc33ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LJoybMKE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:30c3:8bbb:632f:b0c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A740165B;
	Thu, 22 May 2025 18:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747931405;
	bh=9w6AYxG86+ShRJPYPhJz6k6F0yijUzIA6kRpB5v/haw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LJoybMKE0uXs+gwjKFQvbLyn6wocyrg3eCl8WJTj/sXmpHKBUm+AM3k9a5zKRFdSS
	 g5piWZPdx2GI3MLodcLSG5eI6ECcYbSPmoYoMlXJwF51Krs6c4Ju7n4+X65mlQ890g
	 2eaoiPS9Yuhf3RDo+4YYHObk40iw7ZpnAoPXTFJw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250522154210.GT12514@pendragon.ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com> <20250522150944.400046-3-stefan.klug@ideasonboard.com> <20250522154210.GT12514@pendragon.ideasonboard.com>
Subject: Re: [PATCH 1/3] media: rkisp1: Cleanup error handling
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 22 May 2025 18:30:25 +0200
Message-ID: <174793142530.244022.2578213319638259858@localhost>
User-Agent: alot/0.12.dev16+g501a9541e2e6.d20250519

Hi Laurent,

Thank you for the review.

Quoting Laurent Pinchart (2025-05-22 17:42:10)
> Hi Stefan,
>=20
> Thank you for the patch.
>=20
> On Thu, May 22, 2025 at 05:08:38PM +0200, Stefan Klug wrote:
> > Do not call media_entity_cleanup() when media_entity_pads_init() fails.
>=20
> Why is it an issue ? The media_entity_cleanup() documentation clearly
> states
>=20
>  * Calling media_entity_cleanup() on a media_entity whose memory has been
>  * zeroed but that has not been initialized with media_entity_pad_init() =
is
>  * valid and is a no-op.
>=20
> This is by design to simplify error handling in drivers.

Oops. It was simple mechanical thing. I'll remove it in v2.

Regrads,
Stefan

>=20
> > As a drive-by fix handle an (very unlikely) error in
> > rkisp1_params_init_vb2_queue().
> >=20
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > ---
> >  .../media/platform/rockchip/rkisp1/rkisp1-params.c    | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index b28f4140c8a3..918eb06c7465 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *=
rkisp1)
> >       vdev->queue =3D &node->buf_queue;
> >       vdev->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
> >       vdev->vfl_dir =3D VFL_DIR_TX;
> > -     rkisp1_params_init_vb2_queue(vdev->queue, params);
> > +     ret =3D rkisp1_params_init_vb2_queue(vdev->queue, params);
> > +     if (ret)
> > +             goto err_mutex;
> > =20
> >       params->metafmt =3D &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> > =20
> > @@ -2777,19 +2779,20 @@ int rkisp1_params_register(struct rkisp1_device=
 *rkisp1)
> >       node->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&vdev->entity, 1, &node->pad);
> >       if (ret)
> > -             goto error;
> > +             goto err_mutex;
> > =20
> >       ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >       if (ret) {
> >               dev_err(rkisp1->dev,
> >                       "failed to register %s, ret=3D%d\n", vdev->name, =
ret);
> > -             goto error;
> > +             goto err_media;
> >       }
> > =20
> >       return 0;
> > =20
> > -error:
> > +err_media:
> >       media_entity_cleanup(&vdev->entity);
> > +err_mutex:
> >       mutex_destroy(&node->vlock);
> >       return ret;
> >  }
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>

