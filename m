Return-Path: <linux-media+bounces-52162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JbwLZTkgmnXeAMAu9opvQ
	(envelope-from <linux-media+bounces-52162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 07:17:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B546E2438
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 07:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE14E3027124
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 06:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DFE365A03;
	Wed,  4 Feb 2026 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btbqjOHc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F5630DEDC
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770185748; cv=pass; b=VS9LPCp0qYJhhl+BHpkC1DRoCqP52wExdV5sY7Y/1Ex+4bTSFAew+fSSEKomMnQm9S2LWKJHDEz95VnhaehdKdfiIt/YuLaaIsNV9Dv3RRwSlp2W+/s9Ect+qxvlBL9FXEh1JAnMSfcYKL7tLj0yIwbT3pYfD7dQIXs946cUedg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770185748; c=relaxed/simple;
	bh=O8Bgm+PU8NEwTnn56VFmltoyrQYXuuS4HnAhQ5pG5rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJ+2D3pMliswmQdrGC9C/ZukwFtSVBOQSFtAJdJPN8i/8yC8VQZmcllo+fDhQqIlQes/92rTdKkGukSMZ/I51KApx79ACMF5PcGehICBfTe0z/MFieakmx3r0EMmkrD53PFdUhbRKd8tB525EWskuZdQ4QyEZxaFjtgx4qTvTD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btbqjOHc; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3545d66bb3aso1820094a91.0
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 22:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770185747; cv=none;
        d=google.com; s=arc-20240605;
        b=ccevHZ2kUKUYBH7GImr9+SMEyET0cej7TYbe3RLo8fT41cIZd/K1rNLBVPmvGrM0KM
         WNaaGW2RnN66YBGjYa/J+K4geKUJG3Vb6lYJJFkLrtdhxhYcmtfoUbPBj3mwaYCQtZy4
         gyp3lDEr1/EywrHJAB+jc2b/6J7fxJUMc7ZDae7nQwOTaVxbvgwCHq9TAxK29q9+YIKo
         H6wfHO3L0vyNVpSjn/YtgRxP9tt8XQZWB0gHI+HbYaps6fsNfUVMFDpIOY8rJddIrg1N
         hwstDfPyrlSiloGPHzmhsRqSEMf0wUh+0JHtJINey53QOTu+1x7mvgGwwf9KDbiOLL2Y
         Zg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1Ulw7MvS/Ox4lmHUrtosohiucmr3Rh2tszw/cgBa80=;
        fh=pxWxKXl+K1X0L9sjVUvpxLpSTr3g7egnuNq1ZUee3dM=;
        b=KoyPdGzuf3MVew6FhiIV6KXntmluIxCpBXklygmFnogoFvjwFydVWkbPx455NchZZI
         Zx89igULt4V5EYZtmUVJOp47HKkENVPn2aEtXu3+3T+QMSBs9DlcawfufJfeWItIGrnv
         xhw2bf3Nre8Zmhvp8jtw2tl1mdhxLamoyVYokrKP8WMIMlf42AtH3M2a36hTYDBDIUw1
         9FgkGrN169FDXk3N7Wq74H+oygm/JWr37Iim/bVIj/KbBGnBIVjPwrYubBUP4cbJ6HCw
         424BPE5HlJW/Hc4sXBOuyTV4nfk7fHRc7L1FIl/O7LWMfkYQwZfv10WH5PRxSEdT00Y9
         e6kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770185747; x=1770790547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1Ulw7MvS/Ox4lmHUrtosohiucmr3Rh2tszw/cgBa80=;
        b=btbqjOHcHyZ8QgwwZ/uxQyT8jgAc9P3QWXWEIZQ+9CMoX+Wz+CEQxGkCTsX7SHDP4L
         +ckfpqUUi/4YA+ZuQb/+ACifnW/Phluhcs2nIBC35Hb7i6LdqdR3piPZP7YFPBJhsjWR
         SoQeRBkmEX3Tgj4Yn68ki0oWWKbxPHCM3jgeH5mtQxNlos7KZrAdA24CW35ETMIZT5rO
         Lx2vcxGymAJTxpqCCJCc6ub9cXZ09+jwTdPQIDD7A6P1SLnXedWKXFaxJ8msMo0mFfgx
         TOP5oGLauwR0Ang5ZjEiOepzlCngW8aEG99idlPOar/qoJh0jiywdf7afdehFzY7EqFy
         b64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770185747; x=1770790547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H1Ulw7MvS/Ox4lmHUrtosohiucmr3Rh2tszw/cgBa80=;
        b=YQtZDydxKwiVv2VHpiSBJP5Cr+Qffrngb6RH3x3SPfkOjy+w7ygVzergG+WQT1ZAhI
         6XQTcyZMXnCRJI1cB/Zp2Nwsmf9t1jkUQ259k2GDI8eVAMmk45sSUB3UOxDK5FxbykYI
         KIyDzUm5wr+P0Gqu9wDd1vNaHcTpwhWceJkLztq79YPQP01/SRqTEsncGz3sHuKsXbpl
         UXZKMdnuUVn2XUBLoXapMqGpAZQ7lldBhOB+B0BymhjIqkdPKRFjQQ8IXt841IJoS0YT
         7xu1pYyahzbdyxA4e+/S8YShOcY5cFskX/R/Zs53AsxxSkAXw3fZjJTYA3piO+cTupOr
         OG5w==
X-Gm-Message-State: AOJu0YyzsT4Zxgtmp11UT8G4xxUmPwtKjwCCP4lQFMnSpBN8knePB6ch
	9I2ZjcnEksb5SrXUe5/RsDqDwyTIXkZKwaOwi4s6ujJKs/3H0kDEBtbB9HBEYpwZRFYq+CoKCS9
	LCE3eZ10U8yhMu8Ho/Bbu3xoRleCX1J0=
X-Gm-Gg: AZuq6aKXaxMf4heoppex2tKgrwxhf3Rk3/GtQw/f44yE6C1DXWO1S3syZ1B8xEsvmVn
	TMUxuc+ZE0AxD8caSLgqAFDtPMG8p5bxno46orwp7I45TUnnZjhpuwuE8PmWmb6BQraf7NM96VP
	DMGNP/l8X/hP5nhGyQmmv/Pll1ju7f3Z3rfU++DMQKKfDeCWxQR6wE0GDCjqf0tzn71ekf7kmuA
	9ffn54pGXVzaJ7nf+h89zjWcgmHVtY/3Ls3v/b7ff8PQUtSS2j2NfgO1N3aV8vjacuIOXILOXIb
	uv9M62E4+9NdU9nNYy+Vo2b59EeOlEYvREhhUj8ofew+FC53lmt0f9o=
X-Received: by 2002:a17:90b:510d:b0:33f:eca0:47c6 with SMTP id
 98e67ed59e1d1-35487207d93mr1644811a91.30.1770185747171; Tue, 03 Feb 2026
 22:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126102149.39563-1-arash.golgol@gmail.com> <20260204000228.GA154910@killaraus>
In-Reply-To: <20260204000228.GA154910@killaraus>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 4 Feb 2026 09:45:34 +0330
X-Gm-Features: AZwV_QiOLyyyqZYi36b9zwJo_kRswaAExFQWcQM5OlLMLY28cazkE4nljSwiVI8
Message-ID: <CAMxPZkgXjusgapPSUvJCaCuMrR5xPsKiooJ+ZczzsF7x-pSH-Q@mail.gmail.com>
Subject: Re: [PATCH] media: sun6i-mipi-csi2: Propagate format to source pad in
 TRY mode
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52162-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: 2B546E2438
X-Rspamd-Action: no action

Hi Laurent,

Thanks for the review and the detailed feedback.

On Wed, Feb 4, 2026 at 3:32=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Arash,
>
> Thank you for the patch.
>
> On Mon, Jan 26, 2026 at 01:51:49PM +0330, Arash Golgol wrote:
> > sun6i-mipi-csi2 does not support any format conversion. So the format
> > on sink and source pad must always match. This limitation is handled fo=
r
> > ACTIVE state via mbus_format member of bridge private structure.
>
> It's not even handled correctly though, the sun6i_mipi_csi2_set_fmt()
> function will accept setting the ACTIVE format on the source pad, when
> it shouldn't. You also fix this in your patch. This should be explained
> in the commit message.
>

Yes, you're right.

> > To enforce this limitation in TRY state, user space should only be able
> > to set format on sink pad. The sink format must be propagated to source
> > pad to ensure consistent behavior.
> >
> > This also aligns the driver with userspace relying on media controller
> > based format negotiation.
> >
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > ---
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > index b06cb73015cd..6ee0f6685663 100644
> > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > @@ -369,15 +369,26 @@ static int sun6i_mipi_csi2_set_fmt(struct v4l2_su=
bdev *subdev,
> >       struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> >       struct mutex *lock =3D &csi2_dev->bridge.lock;
> >
> > +     /* The format on the source pad always matches the sink pad. */
> > +     if (format->pad !=3D SUN6I_MIPI_CSI2_PAD_SINK)
> > +             return v4l2_subdev_get_fmt(subdev, state, format);
> > +
> >       mutex_lock(lock);
> >
> >       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> >
> > -     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> > -             *v4l2_subdev_state_get_format(state, format->pad) =3D
> > -                     *mbus_format;
> > -     else
> > +     if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             struct v4l2_mbus_framefmt *fmt;
> > +
> > +             fmt =3D v4l2_subdev_state_get_format(state, format->pad);
> > +             *fmt =3D *mbus_format;
> > +
> > +             /* Propagate the format to the source pad. */
> > +             fmt =3D v4l2_subdev_state_get_format(state, SUN6I_MIPI_CS=
I2_PAD_SOURCE);
> > +             *fmt =3D *mbus_format;
> > +     } else {
> >               csi2_dev->bridge.mbus_format =3D *mbus_format;
> > +     }
>
> If you have a bit more time, could I ask you to take it one step further
> and convert the driver to framework-managed V4L2 subdev active ? This
> will simplify the implementation by dropping bridge.mbus_format.
>

Sure, I'll do that and submit a new patch converting the driver
to framework-managed V4L2 subdev.

> You can find an example of the conversion in commit a2514b9a634a
> ("media: i2c: imx290: Use V4L2 subdev active state"). In a nutshell, you
> need to
>
> - Call v4l2_subdev_init_finalize() at probe time and
>   v4l2_subdev_cleanup() at remove time
> - Drop the mutex (locking is now handled by the framework)
> - Use v4l2_subdev_get_fmt() as the .get_fmt() handler
> - Drop bridge.mbus_format and always use v4l2_subdev_get_pad_format() on
>   the state passed to the subdev functions (which will be the ACTIVE or
>   TRY state depending on the .which argument passed by userspace)
> - In .s_stream(), access the state with
>   v4l2_subdev_lock_and_get_active_state() as it's the only subdev
>   operation that doesn't get the state as a parameter
>
> You can ignore the control handler changes in commit a2514b9a634a, and
> you can leave subdev.state_lock NULL (the framework will then use an
> internal lock).
>

Thanks a lot for the example and roadmap of the changes.

> >
> >       mutex_unlock(lock);
> >
>
> --
> Regards,
>
> Laurent Pinchart

--
Regards,

Arash Golgol

