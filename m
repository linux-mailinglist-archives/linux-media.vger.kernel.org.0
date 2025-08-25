Return-Path: <linux-media+bounces-41036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65CB34534
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 17:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84D787AA357
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 15:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5B62FC867;
	Mon, 25 Aug 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CDFlG2p4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C060259C83
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134503; cv=none; b=I6VDr/dANg3LQiT26ghW82RCh7+FR6Z6Q8l3zRR+KwGJU16QQ1C+c1uQbkKyChY2kgt18gssjcaiddBHQ3wUG3OWtJsk9UaI0jXKwHQONdr0L8CfBw+XQD+A/hKxcwmaFtQTqwxDwXzvK/lbYxBET5DQAar6Ca7v6yyvm4NyHxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134503; c=relaxed/simple;
	bh=S/VG8tCfeSW/ZzspyTh3T9Ob4Izsu75n3KOb8iwoQWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGffk48Y8bNfQO1gKAhIbS9UPH0Criz03Pt+LuWOBjXv1lopzkTTQ6cni8FUBQndFv3uI5HTsDV4GCpdEybg1A41JAcyqKk8t6ToS4S6PfyPU8glW/ViYa3MU6SGVTR+osMeaCjx2KerKquNIWN7lVvSwRz5DbEXgCEzaSR42JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CDFlG2p4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso665754766b.3
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756134500; x=1756739300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Omikb0GsiRNAla8HKNcwJLY2uhW1I/CfC2GAsB/V6IY=;
        b=CDFlG2p47UCVPVcrpfRVkLNoK2BEMHltQwkbIW7OpnlmqHD8Pnh62apNOD59i6eKPc
         62+CGjxjnsy8b/XRg4E73YHKpzb6uSIR2I42GUpL4H2F648sSy9E5nPXrC5tr8GfgMvW
         1B1YfWnsw+nl2fnoZJXSOXfAwrD3mi5dhYrfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134500; x=1756739300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omikb0GsiRNAla8HKNcwJLY2uhW1I/CfC2GAsB/V6IY=;
        b=HuM9g3PxjQy+RLgqaLywe7fUrnO7EU8VNNlgfVsAYtXEYcmoGGrZ+49zp/cnNEhR+U
         AzhGqxOoId/AG/rs2R/ciK9tK5Ecgz3yI7742l/5HtHn9poLCxu2f9bTH6idkl7L8z6c
         ZxQfSwfmJ1VpSLlJWwRh5wyz2LXtik99nWIO9oWKw2OYbmi50EWY7VqaPC6U9B0d+4De
         mUWJl7U65NP1WuL7/h76l0lc5Iry3bPoCNK3CNje/mIWVmuyvZIkX+H3SqvB3Y0u+8Iz
         SQ5QutzbXVKpS+zPzK9K6nk47bLLvAQE5JJ3p9qewLuX1WCoRZSZqoTcQWeOPEBKUvbG
         KXjg==
X-Forwarded-Encrypted: i=1; AJvYcCUoWR/DPOiJy+46MndaGhKByZPPq7AK9jkHUEI0AkZyRNlQiTVYujfPnCJt6GrvX7eHNvEcmxZwkoJEZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcFKaDlRCTyGYoz8Upmq9vW9KSSxVjqEb1QEMY8lfFMEZ9mk9
	c8Q9hAIT66gtivSUPIf68hurH60MY0FKmthggpHHylg18LiV911hDgALiXPkZl0PTFuOCTHmZD2
	XDWxG5TxeVaH1Om/k9Fl8CVeYT9goGsS/ZZTfZXL/
X-Gm-Gg: ASbGncu8N6b6nUeXQgkqE2sJviP33bTlRjr0Wx3+cDus2ZUo/W/7/cqDEGw5umavEA4
	40lrcNRnPly/w1DPrwTMJ7brAWJ1MTksyBxqOcV/nQ2xwVNWtVA60G8+WZzViKSzMaYRo8CqVyk
	A/fhkxfwmbJ+uVFKDejZGn5jJfpP1j40wgGXezCWd1+6Mz2//IMX/S5fZybtYMuRdYXg1a2ZSMl
	72oT+I=
X-Google-Smtp-Source: AGHT+IHXgFMATHSbaalQDjOX1vp31Ziz4UgnKYQ8pu/Ue5WZF+Wt1koG8AKkJEybrR3BHEyOZWG0cw3aGDEQZQNDyJo=
X-Received: by 2002:a17:906:1c4a:b0:afe:9172:b8cb with SMTP id
 a640c23a62f3a-afe9172bc73mr155986766b.30.1756134500324; Mon, 25 Aug 2025
 08:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-mode_configure-v1-1-5ea35052a01f@chromium.org>
 <20250723154753.GH6719@pendragon.ideasonboard.com> <CAEs41JCctnTgwY-ePrB+kwY7nUvJuMAttZ894PzhL-b_SF7uNQ@mail.gmail.com>
 <20250723170237.GE14576@pendragon.ideasonboard.com> <aKwWzQGY_dsP8hg0@kekkonen.localdomain>
In-Reply-To: <aKwWzQGY_dsP8hg0@kekkonen.localdomain>
From: Allen Ballway <ballway@chromium.org>
Date: Mon, 25 Aug 2025 08:08:09 -0700
X-Gm-Features: Ac12FXwufVyw0HYB3wo5t_J9ACjERyV2c6pxw9Pml5QKrLEp57owt-1Xu42X_Zo
Message-ID: <CAEs41JCZ0ab_HVZ=NiZbC_52pc+yhXcgOBECDN7sy8DsaBD6rA@mail.gmail.com>
Subject: Re: [PATCH] media: ov8865: move mode_configure out of state_configure
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

I sent out a v2 some time ago
(https://lore.kernel.org/all/20250723-mode_configure-v2-1-7fb0f6ba1194@chro=
mium.org).
It seems I used b4 incorrectly and it didn't add to this chain as I
expected, apologies for the confusion.

Thanks,
Allen

On Mon, Aug 25, 2025 at 12:55=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Allen, Laurent,
>
> On Wed, Jul 23, 2025 at 08:02:37PM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 23, 2025 at 09:40:42AM -0700, Allen Ballway wrote:
> > > On Wed, Jul 23, 2025 at 8:47=E2=80=AFAM Laurent Pinchart wrote:
> > > > On Tue, Jul 22, 2025 at 01:35:43PM -0700, Allen Ballway wrote:
> > > > > ov8865_mode_configure() only needs to be called on sensor init, b=
ut it can
> > > > > be called multiple times from ov8865_state_configure(). Move
> > > > > ov8865_mode_configure() to ov8865_sensor_init().
> > > > >
> > > > > Signed-off-by: Allen Ballway <ballway@chromium.org>
> > > > > ---
> > > > >  drivers/media/i2c/ov8865.c | 15 +++++++--------
> > > > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov886=
5.c
> > > > > index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..1d1a1f261bf4ab5c0=
9848402dc057e2f572504e7 100644
> > > > > --- a/drivers/media/i2c/ov8865.c
> > > > > +++ b/drivers/media/i2c/ov8865.c
> > > > > @@ -2304,14 +2304,6 @@ static int ov8865_state_configure(struct o=
v8865_sensor *sensor,
> > > > >       if (sensor->state.streaming)
> > > > >               return -EBUSY;
> > > > >
> > > > > -     /* State will be configured at first power on otherwise. */
> > > > > -     if (pm_runtime_enabled(sensor->dev) &&
> > > > > -         !pm_runtime_suspended(sensor->dev)) {
> > > > > -             ret =3D ov8865_mode_configure(sensor, mode, mbus_co=
de);
> > > > > -             if (ret)
> > > > > -                     return ret;
> > > > > -     }
> > > > > -
> > > > >       ret =3D ov8865_state_mipi_configure(sensor, mode, mbus_code=
);
> > > > >       if (ret)
> > > > >               return ret;
> > > > > @@ -2384,6 +2376,13 @@ static int ov8865_sensor_init(struct ov886=
5_sensor *sensor)
> > > > >       }
> > > > >
> > > > >       /* Configure current mode. */
> > > > > +     ret =3D ov8865_mode_configure(sensor, sensor->state.mode,
> > > > > +                                  sensor->state.mbus_code);
> > > >
> > > > How about the implication on ov8865_set_fmt() that will not update =
the
> > > > link freq and pixel rate controls anymore ?
> > >
> > > I believe those will be unaffected by this change, they are updated i=
n
> > > ov8865_state_mipi_configure() which is still called from
> > > ov8865_set_fmt() via ov8865_state_configure().
> >
> > You're right, my bad.
> >
> > > > > +     if (ret) {
> > > > > +             dev_err(sensor->dev, "failed to configure mode\n");
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > >       ret =3D ov8865_state_configure(sensor, sensor->state.mode,
> > > > >                                    sensor->state.mbus_code);
> >
> > Can't we drop this now ? The remaining code in ov8865_state_configure()
> > updates the link frequency and pixel rate controls, and sets
> > sensor->state.mode and sensor->state.mbus_code. The latter is a no-op
> > here as they're set to their current value, and the controls shouldn't
> > need an update in this function as it's only called from
> > ov8865_resume().
>
> Any comments on this? Will there be v2?
>
> --
> Sakari Ailus

