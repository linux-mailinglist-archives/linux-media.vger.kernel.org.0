Return-Path: <linux-media+bounces-43352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C3BA9FF5
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 18:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F2D3C36D2
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 16:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED65130CB2C;
	Mon, 29 Sep 2025 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dzIxGWOW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0F30C0ED;
	Mon, 29 Sep 2025 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162624; cv=none; b=LltVf9mdH9XlIMsSKbz1cKoJVcP/aXfEcNYZl4U6rTrogTKaFNfSZ2x4mkFRmIePyfuIuGVV1cPMwxKz7prudsJgzyJW1yKXNRwYFxS63ac9Rs0wqpjWJWkol7G30xkky4+9NtH/P0RtbV1OISzRrWS19++Jk4Yfo5gQTo5OA64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162624; c=relaxed/simple;
	bh=MC7XMn4A6xZgiLPR6VYlallBuZPYbk5T10hFk2Ymfec=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Wr51VErc473iC3yPnmxA8sPs4BhZ80sKVt+bbtYQmgI2AsJfBc3jxYNax4qgjKVKJlRWaAmsKwTy+zeQ7cGpL1xho2ngwFJGkwVSB17SokELtetIEaT79WfdEXg3To1XpuIGRAkJ/OtZsWaFbVanZiz92RoEgovjNnvCWyM72pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dzIxGWOW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.87.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09B98346;
	Mon, 29 Sep 2025 18:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759162533;
	bh=MC7XMn4A6xZgiLPR6VYlallBuZPYbk5T10hFk2Ymfec=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dzIxGWOWtpBdXMsa9uiiuzMlvQyonCJM1DVootgDg5tKGqCa4LdJQ24lNpUI+48ky
	 s7T0olveMdCCYbQZL3koXVgieUG4fdrP+PyjmbIVcgR7dlifq1ubdvRRkiuO+nI38A
	 UjqWVxtwjK6IqayGek85c2XMcooRGpY+/GfbRUws=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f2178b2d-d8ea-470f-8f8f-8ffc0380cee5@kernel.org>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com> <20250919-vdev-state-v2-4-b2c42426965c@ideasonboard.com> <f2178b2d-d8ea-470f-8f8f-8ffc0380cee5@kernel.org>
Subject: Re: [PATCH v2 04/10] media: v4l2-dev: Add helpers to get current format from the state
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ma Ke <make24@iscas.ac.cn>, linux-kernel@vger.kernel.org
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 29 Sep 2025 21:46:46 +0530
Message-ID: <175916260699.2234821.1165575981573312212@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Quoting Hans Verkuil (2025-09-22 13:36:59)
> On 19/09/2025 11:55, Jai Luthra wrote:
> > Add a helper function that drivers can call to retrieve the current
> > v4l2_format stored in a video device state for internal use.
> >=20
> > Additionally, provide a G_FMT ioctl implementation that drivers can use
> > instead of writing their own when the format is stored in the active
> > state.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > --
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Hans Verkuil <hverkuil@kernel.org>
> > Cc: Jai Luthra <jai.luthra@ideasonboard.com>
> > Cc: Ricardo Ribalda <ribalda@chromium.org>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Ma Ke <make24@iscas.ac.cn>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/media/v4l2-core/v4l2-dev.c | 23 +++++++++++++++++++++++
> >  include/media/v4l2-dev.h           | 18 ++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-co=
re/v4l2-dev.c
> > index dff23c6a0b56fb3d29e1c04e386bb445fa8773bb..2606077538be0e83032c6ae=
8956c1d67da0d0c5d 100644
> > --- a/drivers/media/v4l2-core/v4l2-dev.c
> > +++ b/drivers/media/v4l2-core/v4l2-dev.c
> > @@ -199,6 +199,29 @@ void __video_device_state_free(struct video_device=
_state *state)
> >  }
> >  EXPORT_SYMBOL_GPL(__video_device_state_free);
> > =20
> > +struct v4l2_format *video_device_state_get_fmt(struct video_device_sta=
te *state)
> > +{
> > +     if (WARN_ON_ONCE(!state))
> > +             return NULL;
> > +
> > +     return &state->fmt;
> > +}
> > +EXPORT_SYMBOL_GPL(video_device_state_get_fmt);
> > +
> > +int video_device_g_fmt(struct file *file, void *priv, struct v4l2_form=
at *fmt)
> > +{
> > +     struct video_device_state *state =3D priv;
> > +     struct v4l2_format *vfmt =3D video_device_state_get_fmt(state);
>=20
> Obviously, if multiple format types are stored in state (e.g. video captu=
re and
> output), then this code needs to pick the right format based on fmt->type.
>=20
> I would also suggest moving this to v4l2-common.c and renaming it to v4l2=
_g_fmt,
> consistent with other helpers there (v4l2_g/s_parm_cap).

Good catch, will fix in next revision.

>=20
> Regards,
>=20
>         Hans
>=20
> > +
> > +     if (!vfmt)
> > +             return -EINVAL;
> > +
> > +     *fmt =3D *vfmt;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(video_device_g_fmt);
> > +

Thanks,
Jai

[snip]

