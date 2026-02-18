Return-Path: <linux-media+bounces-53026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E6PL9YwlWmeMwIAu9opvQ
	(envelope-from <linux-media+bounces-53026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 04:24:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A5152D77
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 04:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D357E300B44E
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 03:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A001C2EC553;
	Wed, 18 Feb 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qjQgakFi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E12D738E;
	Wed, 18 Feb 2026 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771385038; cv=none; b=Dr5eGh+att5ZVhx3yOmIdT4KvwqRKtTvU0LtKp5srJQbHPY/lUXJcnEOtPOXdytraiDqPwrdqH0DHMCpnR6z9NV+rD/KRn7fxqvHFRbkPQhM4iQNUQpBjPBaPZNfCUTzH5InBebATMrLUu8f//4skNi1bwZMPRGshxcVZm7Gzns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771385038; c=relaxed/simple;
	bh=XATtTewez/t8FFgr/Q7a3oAK/bpwADOb4HhHCmUxTR4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QN6/0YvVUDNiWKnPkfthJp4cGwa/LyNVNgES2pVL3PQW0mHvViX2eY1DBl8DcqNyiU1gFXPxwkOBdgbLVlv4nL0KD0NjVJqmxY0q+XOn+2SR7dlv/aoiPL+rkBOgGbt9pjTWZRzirBfYy3jnCl9qUwNV3U9bnLhTQqvEEyz8WEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qjQgakFi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:e39a:e0d4:739a:978])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 425A166B;
	Wed, 18 Feb 2026 04:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771384982;
	bh=XATtTewez/t8FFgr/Q7a3oAK/bpwADOb4HhHCmUxTR4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qjQgakFimSjo+7hVS83lyznzRBzJ0wGgos8/mczeTo4OWWaGziEKi8WmzdwLOj6l3
	 zaaSV+S2q447z69uWL2HwUQH82Y4TNYgD9LxMajb9ODdF4Z4aGS1CHRwWrbh7l7stu
	 O92zjCg78vyhneBHkYq/+kv7XlZ0mejUHnISLgSw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <23791918-8fed-404d-ad51-d97966ff58c1@collabora.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com> <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com> <23791918-8fed-404d-ad51-d97966ff58c1@collabora.com>
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: comply with minimum number of buffers requirement
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael Riesch <michael.riesch@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 18 Feb 2026 12:23:48 +0900
Message-ID: <177138502835.607498.8225991057811144969@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email,neptunite.rasen.tech:mid];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53026-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+]
X-Rspamd-Queue-Id: E51A5152D77
X-Rspamd-Action: no action

Hi Michael,

Thanks for the patch.

Quoting Michael Riesch (2026-02-17 21:25:10)
> Hi all,
>=20
> On 2/16/26 14:49, Michael Riesch via B4 Relay wrote:
> > From: Michael Riesch <michael.riesch@collabora.com>
> >=20
> > Each stream requires CIF_REQ_BUFS_MIN=3D1 buffers to enable streaming.
> > However, it failed with only one buffer provided.
> >=20
> > Comply with the minimum number of buffers requirement and accept
> > exactly one buffer.
> >=20
> > Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma b=
locks")
> > Cc: stable@kernel.org
> > Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> > ---
> >  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++---=
--------
> >  1 file changed, 21 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/dri=
vers/media/platform/rockchip/rkcif/rkcif-stream.c
> > index e00010a91e8b..5a5ab9e7e86e 100644
> > --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> > +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> > @@ -106,19 +106,6 @@ static int rkcif_stream_init_buffers(struct rkcif_=
stream *stream)
> >  {
> >       struct v4l2_pix_format_mplane *pix =3D &stream->pix;
> > =20
> > -     stream->buffers[0] =3D rkcif_stream_pop_buffer(stream);
> > -     if (!stream->buffers[0])
> > -             goto err_buff_0;
> > -
> > -     stream->buffers[1] =3D rkcif_stream_pop_buffer(stream);
> > -     if (!stream->buffers[1])
> > -             goto err_buff_1;
> > -
> > -     if (stream->queue_buffer) {
> > -             stream->queue_buffer(stream, 0);
> > -             stream->queue_buffer(stream, 1);
> > -     }
> > -
> >       stream->dummy.size =3D pix->num_planes * pix->plane_fmt[0].sizeim=
age;
> >       stream->dummy.vaddr =3D
> >               dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> > @@ -132,16 +119,30 @@ static int rkcif_stream_init_buffers(struct rkcif=
_stream *stream)
> >                       stream->dummy.buffer.buff_addr[i - 1] +
> >                       pix->plane_fmt[i - 1].bytesperline * pix->height;
> > =20
> > -     return 0;
> > +     stream->buffers[0] =3D rkcif_stream_pop_buffer(stream);
> > +     if (!stream->buffers[0])
> > +             goto err_buff_0;
> > =20
> > -err_dummy:
> > -     rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEU=
ED);
> > -     stream->buffers[1] =3D NULL;
> > +     stream->buffers[1] =3D rkcif_stream_pop_buffer(stream);
> > +     if (!stream->buffers[1]) {
> > +             stream->buffers[stream->frame_phase] =3D &stream->dummy.b=
uffer;
> > +             stream->buffers[stream->frame_phase]->is_dummy =3D true;
>=20
> Apparently I was too quick on the trigger here. This should read
> "stream->buffers[1]" in both lines *facepalm*. Will wait for other
> responses and send a v2.

With this fix I've tested that it works, and it looks good to me :)


Paul

>=20
> Best regards,
> Michael
>=20
> > +     }
> > +
> > +     if (stream->queue_buffer) {
> > +             stream->queue_buffer(stream, 0);
> > +             stream->queue_buffer(stream, 1);
> > +     }
> > +
> > +     return 0;
> > =20
> > -err_buff_1:
> > -     rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEU=
ED);
> > -     stream->buffers[0] =3D NULL;
> >  err_buff_0:
> > +     dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> > +                    stream->dummy.vaddr,
> > +                    stream->dummy.buffer.buff_addr[0],
> > +                    DMA_ATTR_NO_KERNEL_MAPPING);
> > +     stream->dummy.vaddr =3D NULL;
> > +err_dummy:
> >       return -EINVAL;
> >  }
> > =20
> >=20
>

