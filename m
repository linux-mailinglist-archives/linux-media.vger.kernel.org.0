Return-Path: <linux-media+bounces-21269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B33E9C45FF
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 20:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B390B254CD
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 19:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4431A76DD;
	Mon, 11 Nov 2024 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hciuQT28"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B7139597
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731353895; cv=none; b=bWDQXHMQAVF88dqtauetM1kMcTeHWMaluEWyP+IUi39VQmuF7IOgTJ6MrsFa1RE5XVdDMMHmK6lMXnYT/6a3wdL8qa/cNzBGnfjOiRa0OOaSR/liNVvWTaS4FReaa0Ybk5L/Au86dD6XmLO551scBNEt5NUOg+To/hCsFqlqBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731353895; c=relaxed/simple;
	bh=zIDq+wn2ZjN9W8VtepbTyHymh6yI0tWnPC0D5hNEgIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1tHk4xJbSHoZYbmNdSYqbiWygbg21fZaUKDFWp7lbBtJVF3uBJCg35v8+zzjOLtG3jXrDsQiNeFO4GnZu1UokSIGfb0olA2FmcFXQTfcQAe1mUh6kHv4VE500xoSRLoqvYFTJMhKwTkEvpZAA95DbxYyTszbQg9yoEeTxaKTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hciuQT28; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2e444e355fso4469741276.1
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731353892; x=1731958692; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zIDq+wn2ZjN9W8VtepbTyHymh6yI0tWnPC0D5hNEgIo=;
        b=hciuQT28+QOnYsvn/LUSYUfO6phmOgIbF2GiAE1kYTmenT/CY2FW/P8mFQCkS/PPOf
         HJA0+aFFB1iYEfHkeop57Zz23gZpKpRqwKINBTfLyF9HvgovQlVJ470NQYPkUIv11Ur3
         PspVsc5xDAF7g3bIjpeWrPzROXI/RA81g7JUwUPprKZaJJRlqJC4ZJdutw9SEKESFNl8
         +pqAtEAeYUR7v0ilBypc1CAZbkpCKVFueMjKR36QFeTMjpCoXIdnzWN/YR3V0rS5FJBV
         AnB/NyOJnL5RdBuj5lKqrxYcfN7yMpqDcTXyR5DM1725F7gq6U9yyG/Vz7u0EkDxwVGr
         ChUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353892; x=1731958692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zIDq+wn2ZjN9W8VtepbTyHymh6yI0tWnPC0D5hNEgIo=;
        b=pED8kEfop3qp/hW/O2q66W9PhmfUtAp6458gAmM7BYbB5QZtOk+Re+ojsAjEwIfTXS
         Af/nyn4dVrUsJR0NNfHQLb9rZ69Nraq2e3d3CJ4GqrjM3IfmDx7aSAu5/vAgRk/rCPHT
         Lu60L3TVGqbfOe+CJIgfLHzzro2pvlhSJFfM3cqU7cVXuxWQ7t+QqwHxHRj2gcQOCPsk
         H3gqVTnN974ZNIVO2ZL9wtvTyPmcluVT+XB577PyUJiMem6JC1j1JtnGhxzA3pT0zmir
         cipl+B4DC+wl7dwXgWQbkvaYapBjCq1d2SGwgj1hDBZoMMXa7z982l1W+KZ52I8g7VFV
         G4jg==
X-Forwarded-Encrypted: i=1; AJvYcCWnWNWmqfT/fR9Rf681DGj4I9pi3LWnp9vKIdm0E/LI6SFIiJGUn42etQj+NIPwLc5Hgf4Xk3IT7MrxCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+oX01YNzEP0SElcfTEKp4heaeEr18ahMFqy0NmNq5CEKDB5Ja
	y5WGV/hp0TueOhdo65xZQ5a9H+FAuA7ntdrbQ3cHY/lwoz5hWr7lDJUCoijGC4zjpkdQ4AuZkeB
	nb6pLbrI/nNUPoXMc9lGvHMuT1pzLpxM+bfPR5g==
X-Google-Smtp-Source: AGHT+IGrzE9YOTJL8kh9UHgOa4K+djVvshiDKaOhVhkh2nkzaovFe2fUmA1QrMwh0iRipVpdfEjceCefaOy8bml9H5s=
X-Received: by 2002:a05:690c:4c11:b0:6e2:fcb5:52fa with SMTP id
 00721157ae682-6eade448b92mr111732767b3.9.1731353892217; Mon, 11 Nov 2024
 11:38:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>
 <ZySV3KKXSyIreRI4@kekkonen.localdomain> <CAPY8ntDF8W+xRBXbe=LYpg21LL7-svhCySTSJHRNiDzQs4Xw5Q@mail.gmail.com>
 <Zy3oKnHBiGOq8Uoj@kekkonen.localdomain>
In-Reply-To: <Zy3oKnHBiGOq8Uoj@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 11 Nov 2024 19:37:56 +0000
Message-ID: <CAPY8ntD4Q4f5fSC+xW=j-5T38_Zb5x7pGQM4RYVzrz+NJMGtUQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer exposures
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 8 Nov 2024 at 10:30, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Nov 07, 2024 at 12:43:52PM +0000, Dave Stevenson wrote:
> > Hi Sakari
> >
> > On Fri, 1 Nov 2024 at 08:48, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Jai,
> > >
> > > On Tue, Oct 29, 2024 at 02:27:36PM +0530, Jai Luthra wrote:
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >
> > > > The HBLANK control was read-only, and always configured such
> > > > that the sensor HTS register was 3448. This limited the maximum
> > > > exposure time that could be achieved to around 1.26 secs.
> > > >
> > > > Make HBLANK read/write so that the line time can be extended,
> > > > and thereby allow longer exposures (and slower frame rates).
> > > > Retain the overall HTS setting when changing modes rather than
> > > > resetting it to a default.
> > >
> > > It looks like this changes horizontal blanking at least in some cases. Does
> > > this also work as expected in binned modes, for instance?
> > >
> > > Many sensors have image quality related issues on untested albeit
> > > functional line length values.
> > >
> > > So my question is: how has this been validated?
> >
> > Validated by Sony, or others?
> > I've tested a range of values in all modes and not observed any image
> > quality issues.
>
> Somehow at least. :-)
>
> >
> > From previous discussions with Sony, they always provide their big
> > spreadsheet of register values for the specific mode and frame rate
> > requested. I don't think they even officially state that changing
> > VTS/FRM_LENGTH_LINES to change the framerate is permitted.
> > There are some Sony datasheets (eg imx258) that state "set to X. Any
> > other value please confirm with Sony", but that isn't the case for the
> > imx219 datasheet. I take that as it is permitted within the defined
> > ranges.
>
> I'm not that much concerned of vertical blanking, changing that within the
> valid range has effects on the image itself very seldom. Horizontal
> blanking is different though and this is what the patch makes changeable,
> including a change in the default value. Of course there are big
> differences between sensors here.

The intention was that the default value shouldn't change, and as the
overall PIXELS_PER_LINE value was meant to be retained on a mode
change the value used should only change if an application changes
V4L2_CID_HBLANK. If I blundered in the implementation of that, then
that should be fixed (I know Jacopo made comments, but I haven't had a
chance to investigate).

I doubt we'd get validation from Sony beyond the contents of the
datasheet. Potentially as the sensor is so old they don't have the
information or engineers involved.
I'm happy to set up a test system and capture a set of images with
HBLANK from min to max at some increment. With the same exposure and
gain they should all be identical as long as there isn't any movement
(rolling shutter with longer readout times and all that). Would that
be satisfactory?

For contrast, the IMX290 datasheet states that VMAX shall be fixed at
0x465 for all-pixel mode / 0x2ee for 720p mode, and HMAX should be
changed for frame rate control. As you say, sensors differ.

 Dave

> --
> Kind regards,
>
> Sakari Ailus

