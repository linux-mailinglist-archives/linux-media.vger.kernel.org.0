Return-Path: <linux-media+bounces-432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D927EDF04
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 11:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 654A128108D
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 10:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E455E2D029;
	Thu, 16 Nov 2023 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw/Q2zkH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550809A;
	Thu, 16 Nov 2023 02:57:46 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53e3b8f906fso993003a12.2;
        Thu, 16 Nov 2023 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700132264; x=1700737064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c0Alq2NnZvkG1wKEvu5ji7SOJ948PkV/pj0sqQJJs20=;
        b=Mw/Q2zkHij8kdGaZk3qSktYRUVW5vQRFGN374N1BPCnhXQ6e3OEVZuM6uRFoImVITY
         lIwYCVxhY63ITOgUq4JT4SOXxHmvXXfOpcTA0sjzMN30PuC+WhSEzHBADFmYR5aGhkGJ
         4jslfVvbroBEEHyOXzUsBB1WkPEJfONHWx4eHND8B6xQg1Q3hdOQYZnxNSuP/W9Z1dpj
         PJihOrhY22qptFV8Y3Ru8TW2H9BoPQiN++W1wn8xDuJnji1d0hz4A8gQHShorJv9n0+K
         K02j3At5ys03GBL/Y0IqAv6Ur9LOQtaZiQjUcdutXfylarJgXYrx4NFgp2RVHWJKIZtR
         09hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700132264; x=1700737064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0Alq2NnZvkG1wKEvu5ji7SOJ948PkV/pj0sqQJJs20=;
        b=NiA8kSMk0QGWkYeISFwkf7vHQSlfPvzlr32m95DML6sq199wUBwRmBxeLe3H0fvcOO
         F5ZKCLP9yO9Kq3HAQtvE3Xr4+xlOnxiexZMgIldmKQ9YP3vNFoZFuorLxnnqMX07/hVj
         5d+zsrtGZMS9lMtUd4XkRzV1cie3NnayM0kD7Sf2GAxW2m22ZU4c5xUzH+V2bKe5i7of
         yz3KzKB51HrkZnWUT39lKPJTeqmH5jw82uB9+n738OCMm7+wIWZduCry0G4vuk60JXu5
         VeD4SDhQDC0V9RE05kP04ZEjE/fyd+gXnM5vboW3evqy7j+FMPyoTb38IH6Y9PrxruLd
         y8Hg==
X-Gm-Message-State: AOJu0YwfgArfP0YCsURxB4X0XS2GU8qfIH0Gr8IcTVopy0vwB7h9IsXt
	PodwnjaSXGFyj8fHu7ObinDcRs0uh217gBows98=
X-Google-Smtp-Source: AGHT+IEMyccX384cGXsYncIxNvNPWdps8uNibi1oGYh6tKgDwE4EswQCIBmJhnNXhS3SZ/wXaYBunJmToyOvaJ1n0O4=
X-Received: by 2002:aa7:dd56:0:b0:53e:7781:2279 with SMTP id
 o22-20020aa7dd56000000b0053e77812279mr11735675edw.36.1700132264420; Thu, 16
 Nov 2023 02:57:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231115195947.GD29486@pendragon.ideasonboard.com> <58fe01b9-5fb6-451c-a759-c6a5afd695e3@gmx.net>
 <20231116005030.GA21041@pendragon.ideasonboard.com> <45c0e7bbb2ed91ec559cdbf2d19ad80e@suse.de>
In-Reply-To: <45c0e7bbb2ed91ec559cdbf2d19ad80e@suse.de>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 16 Nov 2023 10:57:32 +0000
Message-ID: <CALeDE9PuquwZs3ou_RksH41LCYgVtMmQt6KbK7CnBq5S8_yp6g@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] staging: vc04_services: bcm2835-isp support
To: "Ivan T. Ivanov" <iivanov@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org, 
	kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	"Ricardo B . Marliere" <ricardo@marliere.net>, Dan Carpenter <error27@gmail.com>, 
	Guillaume GARDET <guillaume.gardet@opensuse.org>
Content-Type: text/plain; charset="UTF-8"

> >> > On Thu, Nov 09, 2023 at 04:02:52PM -0500, Umang Jain wrote:
> >> >> This series aims to upport bcm2835-isp from the RPi kernel.
> >> >> It is developed on top of staging-next which comprises many
> >> >> VC04 changes for it's de-staging. Hence, the merge of this
> >> >> driver is targeted when VC04 is de-staged completely (which I
> >> >> have been pushing), but it can be helped getting reviewed meanwhile.
> >> >> Hence, the reason for posting the series.
> >> >
> >> > Related question, what do people think about dropping the legacy
> >> > firmware-based bcm2385-camera driver once this gets merged ?
> >> > firmware-based camera operation is deprecated by Raspberry Pi, and
> >> > doesn't work on the Pi 5
> >>
> >> i don't remember exactly, but wasn't the bcm2835-camera required for
> >> Pi
> >> Camera V1.3?
> >
> > If I'm not mistaken (Dave can correct me), the legacy camera stack
> > works
> > only with the Raspberry Pi official camera v1, v2 and HQ modules.
> > Raspberry Pi has switched to a new camera stack based on libcamera,
> > which works on the Pi Zero 2, Pi 3, Pi 4 and Pi 5. This new stack
> > supports the same camera modules as the legacy stack, and many more.
> > The
> > legacy stack doesn't work on Pi 5 at all.
> >
> >> At the end cannot speak for the users. AFAIK OpenSuSE and Fedora use
> >> the
> >> driver.
>
> Guillaume (in CC) is more authoritative about this topic, but as long we
> have
> smooth migration plan I am more than happy to switch to proper camera
> driver.

From a Fedora PoV I am more than happy to move to the new libcamera
based stack for the RPi camera, IMO sooner the better :)

