Return-Path: <linux-media+bounces-59827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IZwAjGE8GlwUQEAu9opvQ
	(envelope-from <linux-media+bounces-59827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:56:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D74481FA8
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39B173068485
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242683DBD74;
	Tue, 28 Apr 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMo4D1EG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A7243951
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369897; cv=pass; b=VRak8NV+5LtccKsNF5Y+BFpS2M3HWSamwPZesDgvT6FL0DfCqO1qiBB27QoYAcogJic7uHY5JYdQUWeWFrt/uerwMc/1qcSYnx7aePBiX4g45GsxVBys8BImt507GhlnWcuJvIDhvguxuPVhyJtzO4Mcggerq3NJPwNkj31hUsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369897; c=relaxed/simple;
	bh=HHZLOZVqGTiLtGbnjw/B+krnfDHc/n5BAtW1E2tz/DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvFqnNCnnFQk/wopoH+i+uQ30Sg81ysCY1IdWm/pLrsAamzmEU2624zaz5GlbKgRx0mWl0s1MeNfsHTWsTIXlVMFwm4e1xV/mAO1VgM1uMpzyf72+Vdz1SAoGOp+DL+GVowrrMiPvadw4+cM5U0OGeFQiNauqlYzOoQFcwBawBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMo4D1EG; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so9185574f8f.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369894; cv=none;
        d=google.com; s=arc-20240605;
        b=iWl5KYnyVaOvELN//kknhB7m5HDpQ5OkN05XsC1d9MbIN/0muXBMVFDsQ2tEnZ4e7K
         GjSR/F6xZj1qKmrDq1f3RJ5zssQyBJUawkFiGVOWi1Cwm47iSeMpiRJ8//z3Cl0nZUxX
         OZuaLw0RRo2QdMtRCAIOSns8o+0yrzMVIKn/Qhney9Xd8Seedy7S3pPrWoTlrCg9OOP6
         LV5Lt1ULEZucdNM2I5yhqSg6gruQXGh6nhzkGx4itLv2H/9cvX0wTnDOEMWegQR/gECD
         VLsUU2waADfIkHH8JufUAz0MIrNbKvUT+89/TbZWmIlrn5RrfaxySyJoES3xk+Fps5Yd
         uYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agvhiAexccbYaKkjsA4uW5TI1LE0/88pcpNfbT7Pcsk=;
        fh=BdpcR/sIlV4Vy3ua0p3vqgOHdPgjIP/rJcHCyygsMo0=;
        b=H22m/b3q9EB2BtZ3ZCkewS8aY14HJ/NfecAB6IR4VlpplCOrTaXmxaGrS2tuZ7lAKG
         b2ueWQlouYt+7R0LZdAI+p2hveJW/xb5t4qIz0JVR+QNTgYI8ynLwwkrdrCY+J1H1LgR
         52r0eAKX4lTlKkvc2TX6kiJcGjfjC0Luep7LQ26IhTI7AXCBZ8Gui4i/2xx9uT/opIkc
         SzSqkhfhNMfbWqYT+ObbfsL97iTN9QEyn1s5xW3AZSA+NdH6rbF8mLLI0/YgaGT2V0aq
         Y0KfO1+Ou/fNuXdeAy37XNDTNW/O3GO3vgshSGEDyUlkSY2Yiec3P1Dc6eiIYfPxrB59
         eK5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369894; x=1777974694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agvhiAexccbYaKkjsA4uW5TI1LE0/88pcpNfbT7Pcsk=;
        b=cMo4D1EGB4IQ5QyKDWbQgF/UHOZda9TPb6zDbur6vpZMiObQYe5jf/HONu2IyzamDo
         mZVgywHH3W9xG+sKZpb693N8WklrM89236TahYnD6FAxQjqIftjdiA2zj3IU/k9HP966
         SaEOXf4e38ZSsLSb6M5RAEeDyDQIs15TvHH6wKvzoTCDI4peji7JC/U5y1257z5a9A3t
         Ac4tRrKG52rVnyWuIwbiKgLprw9YJX3GY/5NkqDay32Mm1LlQ4V7gvdXirt78Cvp7U3e
         lh6pagwZdai8nuJMQXQZ1XWBSkvHp1p4UyXaI/UfpA2txycbIS2TtPr/SViK5QHR1+oc
         Cmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369894; x=1777974694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agvhiAexccbYaKkjsA4uW5TI1LE0/88pcpNfbT7Pcsk=;
        b=NqTDdFQFr/Ee4lKbTVLDraOUPQfAGLgNIeawl++Lk+xLSp5mAvHRBgA1RNGmizDn66
         kvvSX03SGqpy2vMo8gdJURp5b0nls0NmNZ9Ia3rqEAUVAlwqa2nonH2Bmu6jsMvu8j0t
         DsApVE3x0JJukB4g+r1qBsd6wVnuRNwwH/nhEL994QRCRAEmlihn1ndO9gkcOtRJiU/A
         58ya4y0MmuMIlYLKJAdECR2iLqVupZKmsdDbHEDeeTuurTjQh67TsXbcrsBLU78hYHI9
         qwtxSXEcixJwn5P/s8UkdGoA+7pQA2ezfCfDLmZis9Qb5ZMH5+sXU18wqxpXRxu5gVv3
         2KIg==
X-Gm-Message-State: AOJu0YxvUqpsPHxOG0ORYF3jpfdkKSBQpC2LtFKWTmvboVLdgjtM2e+3
	/kIARFonjhNKg/Y/m0kUOL6DVBRp3QJxzrwex19ungzdAv1DsZ94oHQfg7M8ypzHMr2n0sFqU+H
	IZRZI4ArT0HfxsgsgK/sORLTsKKZZf4E=
X-Gm-Gg: AeBDieuHQS5FjPetUlY+qe4Qr4lHWzblptEj/FoHJmFcvU/K9K6tlfOskLsrXXdCUGq
	5CO91D8Itm9Zyl8EC/r52cmIgdFkpfTs8KozQvTtifFwc0BgyXpRWrkpRV+CTwEX19OCw3PQEnW
	er9+hN46C1zAQdv4vxVQXC4tXpXU4vn+U5xaCYpvaNbPVMNAdEQlW/9lcqmUcpVAcfvokTsOfX7
	jABOm0Z0FDkqF/KMvJPvODvG0aqmjj9NgNvYWnSt2e7+PkgEBRk7birPfzPQJN/UZwY10xG/UaL
	Opnx5Z74GDJ8vyukBSbb+FSZXdN4O3BsRuYY0eaTEkFprRsK4KRzvGshqbcvIH7fdluzAZgDzC+
	GoSpC
X-Received: by 2002:a05:6000:2509:b0:43e:a69b:d818 with SMTP id
 ffacd0b85a97d-4464a071087mr4410646f8f.38.1777369894124; Tue, 28 Apr 2026
 02:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
 <CA+V-a8uL7PAkSSvK+Qj3N3Z9LXe_B-nGJdfn9qG9rA6sXo34aQ@mail.gmail.com> <20260428093400.GB4076452@killaraus.ideasonboard.com>
In-Reply-To: <20260428093400.GB4076452@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Apr 2026 10:51:07 +0100
X-Gm-Features: AVHnY4Lm1pvgMBk2LeiHjbEbvN42F7IkxdYjzZ_hmgHgnOaYeHd_8dlUgAElh7M
Message-ID: <CA+V-a8sTfb-ed9PiPEyk-XFR+mtSzydddS7BM-MV5+DWq6zZ3g@mail.gmail.com>
Subject: Re: [PATCH] Revert "media: renesas: vsp1: brx: Fix format propagation"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 72D74481FA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59827-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kms-test-plane-position.py:url,renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]

Hi Laurent,

On Tue, Apr 28, 2026 at 10:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 10:03:00AM +0100, Lad, Prabhakar wrote:
> > On Sat, Apr 25, 2026 at 10:50=E2=80=AFPM Laurent Pinchart wrote:
> > >
> > > This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.
> > >
> > > The change to format propagation in the BRx broke configuration of th=
e
> > > DRM pipeline. Revert it to fix the regression.
> > >
> > > The original commit was meant to fix a v4l2-compliance failure, with =
no
> > > known userspace applications being affected beside test tools. Revert=
ing
> > > is the simplest option, a more comprehensive fix can be developed (an=
d
> > > tested more thoroughly) later.
> > >
> > > Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Closes: https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9C=
UPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
> > > Fixes: 937f3e6b51f1 ("media: renesas: vsp1: brx: Fix format propagati=
on")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboar=
d.com>
> > > ---
> > > This is a fix for a v7.1 regression.
> > >
> > > Prabhakar, I have test this on R-Car Gen3 with
> > > kms-test-plane-position.py and it fixes the regression I reproduced. =
The
> > > symptoms were not identical to the ones you reported on RZ/V2H, so I
> > > would appreciated if you could confirm that the patch fixes the
> > > regression for you too.
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
> > >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thank you. I however noticed that this revert introduces a vsp-tests
> failure :-( I'll post a v2 that reverts a second patch as well.
>
Aha on the V2H the VSP doesn't create a media pipeline so I didn't
trigger the vsp-tests.

Cheers,
Prabhakar


> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers=
/media/platform/renesas/vsp1/vsp1_brx.c
> > > index b1a2c68e9944..9d93cb8b8e82 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > @@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *s=
ubdev,
> > >                 compose->height =3D format->height;
> > >         }
> > >
> > > -       /*
> > > -        * Propagate the format code to all pads, and the whole forma=
t to the
> > > -        * source pad.
> > > -        */
> > > +       /* Propagate the format code to all pads. */
> > >         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
> > >                 unsigned int i;
> > >
> > > -               for (i =3D 0; i < brx->entity.source_pad; ++i) {
> > > +               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
> > >                         format =3D v4l2_subdev_state_get_format(state=
, i);
> > >                         format->code =3D fmt->format.code;
> > >                 }
> > > -
> > > -               format =3D v4l2_subdev_state_get_format(state, i);
> > > -               *format =3D fmt->format;
> > >         }
> > >
> > >  done:
>
> --
> Regards,
>
> Laurent Pinchart

