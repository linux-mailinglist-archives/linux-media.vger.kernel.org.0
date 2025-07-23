Return-Path: <linux-media+bounces-38285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42370B0F84D
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 18:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E603E1C26D0C
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 16:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF030201278;
	Wed, 23 Jul 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O/kcirrU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586371FF1C7
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753288857; cv=none; b=tFdeTVU3QQ0ZC4AmtFBpMO1BbNeSqUeTY9PBGM/Y3NYQSb37nvw0rli17ebY2HpP31Xglo/4fZkpImjVeFjKP3oAyn0l5LIiSVYtqqIMkOSzpuXUOwaRmwSD26MQi8cCjQdBBCL1ivIC6732Csr5x/07bs1WN3bleuUkTP+Gqv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753288857; c=relaxed/simple;
	bh=x2Z9Ofugmtv1ZLf7A1bMOExnP9dDU/my4qyf04hhc6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXjgmuL3Oti+1QJpvd6qWTRdd01jSBLXB4DjZZWRq8Po9vjP67QAK8TW19gIl62tBPPxH+c7DLFdUuA/RRqZPkx9pTHwMG0gkKbKi5O79L2H12tJ33/ILjczp2PyO9LMAS8vkQ0mxtXtCGEt43UTOV6qXmlx5DvGChqBYjUWr+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O/kcirrU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0c571f137so6629766b.0
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753288854; x=1753893654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RAiEvEvnxrfRkfiZMR4jkviv2a4M7w9dyZ6FzbGBR4=;
        b=O/kcirrUDD1cb86fJtArwcytAT22N/xaANBpdVu1+5SAszEud4q15B5vJ4Aw4SEw3i
         vVObpPgx0MiOQnaDuE1uUn1qkfBL/YtJBkyPUG46JmjaQx56lb1xtF9Y1EdAmbjbhrj1
         BIAcY34tFKPxczgj4brO7ZKeSmGeQMkTpXzbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753288854; x=1753893654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RAiEvEvnxrfRkfiZMR4jkviv2a4M7w9dyZ6FzbGBR4=;
        b=TcHGrB/y1UGbaXCj08zbxR6mX4SvZtztjNcctWDLxCT9nZBfMVHIok1GOsOWvhNTMW
         lc0wt8P+zhJATQ6EE7JGvyTSCtGl73a7lmdZZZ65ZFVl5ubA5izsPFkAjt09GTsVYvLT
         yvRRbeffjOA04GvP4QdlqZHfVR1b/k//YH+EpwU+PGSD7o4Bjbhjr8s3+hWOCDZT8yze
         /sJve7I+fqCkfyGqAN72SGIf20jy35CdHE+DFbK6oQ0fkMSqPFTNjKgMBWuT/A9POn4s
         6uWhswTWM4TzSCpE9MVK4exx8Z4eF3LZEv5yyqGQ97AHlfuI+vubM2zYHcxKEnBviyA2
         V+bw==
X-Forwarded-Encrypted: i=1; AJvYcCWIUQURTBa4w7HdJWRYdsWWvkylmkYW6M33CSQ3UHG9UgHlelzCsQ5SZpDmBbOjt8Qk4qZ8CrjkoduRpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQeQEzyaeXi9F8r8dlN4Nsuz2UTei/nWx48HIXYqt2s59WtzT
	ekEzlucIlVXo/z4GVjBjraGmiD9fjjHvwC8QN8LYVRzdrRDxyQGa/urKbc5qcoME/o3WJhSWxvV
	Y0x/QZdNNV5PFHhHIu93opt3/KuHjLF5qAOcNq58D
X-Gm-Gg: ASbGncu9lnwvn5QZfr+p2YDOyiwxRYF8MjIY8URWi+9PtXPY82hD3vL1DXV9MP9SUdb
	JcevjmETQvFF+BQu7kCyrr7lpUI7H24YO1KEBGLjRUKRUc2l6pTiOPHDLpBABDaUlkJxKo0OgTJ
	LZEaIQBCiAp9lJo43NsHTZYHkQcCx4E/6+z6t6qe+tFFZwTaZ+Km5cDkp/OCw377KUQeEQZZumU
	yMXHNs=
X-Google-Smtp-Source: AGHT+IF/0g35h3qQewcwrSzDafvLfsIhg0pwEx4vwq7T1GI2RvJgPbtZkO51w89O688eiPHzH1EkZtescnmAGlVOWb8=
X-Received: by 2002:a17:907:9281:b0:adb:469d:2246 with SMTP id
 a640c23a62f3a-af2f6c0325dmr360022566b.17.1753288853605; Wed, 23 Jul 2025
 09:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-mode_configure-v1-1-5ea35052a01f@chromium.org> <20250723154753.GH6719@pendragon.ideasonboard.com>
In-Reply-To: <20250723154753.GH6719@pendragon.ideasonboard.com>
From: Allen Ballway <ballway@chromium.org>
Date: Wed, 23 Jul 2025 09:40:42 -0700
X-Gm-Features: Ac12FXxiLQqinwzqSzL8fawBUkGnmXCW_iN3cpR3nIZo_rm4tl4Eujlr-4r6Pbs
Message-ID: <CAEs41JCctnTgwY-ePrB+kwY7nUvJuMAttZ894PzhL-b_SF7uNQ@mail.gmail.com>
Subject: Re: [PATCH] media: ov8865: move mode_configure out of state_configure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 8:47=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 22, 2025 at 01:35:43PM -0700, Allen Ballway wrote:
> > ov8865_mode_configure() only needs to be called on sensor init, but it =
can
> > be called multiple times from ov8865_state_configure(). Move
> > ov8865_mode_configure() to ov8865_sensor_init().
> >
> > Signed-off-by: Allen Ballway <ballway@chromium.org>
> > ---
> >  drivers/media/i2c/ov8865.c | 15 +++++++--------
> >  1 file changed, 7 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> > index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..1d1a1f261bf4ab5c0984840=
2dc057e2f572504e7 100644
> > --- a/drivers/media/i2c/ov8865.c
> > +++ b/drivers/media/i2c/ov8865.c
> > @@ -2304,14 +2304,6 @@ static int ov8865_state_configure(struct ov8865_=
sensor *sensor,
> >       if (sensor->state.streaming)
> >               return -EBUSY;
> >
> > -     /* State will be configured at first power on otherwise. */
> > -     if (pm_runtime_enabled(sensor->dev) &&
> > -         !pm_runtime_suspended(sensor->dev)) {
> > -             ret =3D ov8865_mode_configure(sensor, mode, mbus_code);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > -
> >       ret =3D ov8865_state_mipi_configure(sensor, mode, mbus_code);
> >       if (ret)
> >               return ret;
> > @@ -2384,6 +2376,13 @@ static int ov8865_sensor_init(struct ov8865_sens=
or *sensor)
> >       }
> >
> >       /* Configure current mode. */
> > +     ret =3D ov8865_mode_configure(sensor, sensor->state.mode,
> > +                                  sensor->state.mbus_code);
>
> How about the implication on ov8865_set_fmt() that will not update the
> link freq and pixel rate controls anymore ?
>
I believe those will be unaffected by this change, they are updated in
ov8865_state_mipi_configure() which is still called from
ov8865_set_fmt() via ov8865_state_configure().

Thanks,
Allen
> > +     if (ret) {
> > +             dev_err(sensor->dev, "failed to configure mode\n");
> > +             return ret;
> > +     }
> > +
> >       ret =3D ov8865_state_configure(sensor, sensor->state.mode,
> >                                    sensor->state.mbus_code);
> >       if (ret) {
> >
> > ---
> > base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> > change-id: 20250722-mode_configure-80105fbd835d
>
> --
> Regards,
>
> Laurent Pinchart

