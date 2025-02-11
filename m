Return-Path: <linux-media+bounces-26009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E85ABA31089
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4616B169378
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B77B253F07;
	Tue, 11 Feb 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fCtXUhTB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881F2220686
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289638; cv=none; b=FYOopjx/cWlpaiWFAp+6FG+R7U7WvT8m9usBrrgekvjKAs6dau3aKyO4Eau7oW7Z/dLZClHoiA/U88xiM5MUzkonyn/Eq4j4eWyYfYyyL8CkXRmY4l2ciYuV13szOfHDDH6SqaHr6TFs3WtRi7r/FdY0sF8etsCzJQH7Yzv8a1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289638; c=relaxed/simple;
	bh=DWdJ3FfA6+ThEygSWgAK/cQniMefWtIyVJQn/ukGOdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozJdnEjiGc+x3eJJXaCiHPF+02JE4dLdAsnPkoGiJhGKPgrz34kM7coy0PA0Eqd8GVXEqSrVXdVuE+1/4/x2svHjU6Vx7LeC3Du2sYd4jqtmwfFiuuYHKXoFtqhvJpJbnM2vSdh/WuxD7CNYt3NHTIHYb4IRul0CB6nVhjqVdHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fCtXUhTB; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f9c2d2dbc2so33894577b3.0
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 08:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739289635; x=1739894435; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0EFr104D87EOV2t+ffUgvpS4hK7wPG6WjP5JszMVYlk=;
        b=fCtXUhTBab0wllpG0crc0pMHGIHhV99ZG/S9ne0qQxx+mJ/ZZrknYlPXpoWUUzssfb
         GmdydYu43f+g09hnRcsjAQnMH8c/QZwbyAVaVym39vUNQW9mR2ThdtV38c3VR0bYRSyZ
         GTRZSU943mDAB+6Dds++4zESubi1f8SPWBpi4IRHiyg98I0ZCdLZzDElq0K6/EXvOwgu
         L0zADNfLzgzGGDwzvYYf/uQ6wqRJtnim+GZ+2c1Z5jQJi2wlWXzSosrPyPpOdIVv5h/T
         ZahqRc32JdVkb1V4p+RM3i8/wOgC/uofhK3a5HDZp/D/qKH5LNqYscPxsKEca+Or/9Yf
         uVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289635; x=1739894435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EFr104D87EOV2t+ffUgvpS4hK7wPG6WjP5JszMVYlk=;
        b=gXfcl+L49cJ1Z1nVqiWWOUQD2ZfzEvjAzD2QXScj5ZQy6NmuUKo2HJatXv0m+lDigc
         IxyQ1d/1FBFJ8wN+DPmugw0e47hPiC8vsqpqKFwzqXn6I8SfRyyo1goiyFJ6THxu22YQ
         ZHWlDzcAfDMK1oqOGATyOdDtKgiQaGeRipXa5qpR8ZhnboRnkKfpF/L5cVhZB5YIoAMz
         cr+6u6fRwTrTSOwje3hta/dUR5/3eO1E8Yo66CQK1Wb8EZQ+Kzu7XFGLeGD8x95o9Cnl
         w6+A19IH+Y3Ur8EMMQd5CuCBXZgltoUqksC4IpTK4KnJyPSg41JKhSQO+5f7d+Bjyl2F
         fVXg==
X-Forwarded-Encrypted: i=1; AJvYcCWWtPp9JnKtuxrQtvkGmC1sT8SbIrhF7UPK3LdDqYDr95SxvHAxzaxTVnpZvriobgv80CChb+7pU51cRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6FV0jJbLfMtJYO+zSJ/jIkIYCbWKeVyP0nM8kAKQDWYnV2Jx3
	Tho2WP1xRPKN30IrtS9dUj3l4uz8RhjGD2t1O8662w03m+HhbbOOGLFKI1YKOVqVTg7LN211Dl5
	hfib0QxG9PNikNT4DfcMpSt9C4kg7ycutVuhd8A==
X-Gm-Gg: ASbGnctFzQnA52B/pth6hha3VvvgJxP5JV4MTzEsT8rmlt3jctHOAlXG8o1uXaAnUPN
	Je45fYTPHOf8PKn8VHdJoixNEn3KIgajDMzt/P4wlFssRqYN8jSeZX8QqmuGc82u1Z66BFfxFF+
	yhCTO50qMIxQgqpsZLIJTZAujAp9vK
X-Google-Smtp-Source: AGHT+IFjYJ3mUWT3Kpyg1QSgA17gVn7goxkL7dDXrGQVPWbJ+e68dwIRtn46R5X1MN7OC5eKtGPerQMF0PFMikPdRpQ=
X-Received: by 2002:a05:690c:7309:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6fb1f1b1399mr497617b3.15.1739289635001; Tue, 11 Feb 2025
 08:00:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-11-sakari.ailus@linux.intel.com> <e82b0079-bf52-4b04-b33b-4f3495fffa75@nxp.com>
 <Z6oEyeX2lcK023KW@kekkonen.localdomain>
In-Reply-To: <Z6oEyeX2lcK023KW@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 11 Feb 2025 16:00:13 +0000
X-Gm-Features: AWEUYZkVPWsCXlH76ECL5IPowuQQlFDxklRv-1gQTV_uRhI9QjUrmOn0SNojHfk
Message-ID: <CAPY8ntD39jmO6qq1ERK0apCfnXTrH7jsLVO=O2soj1OnR=vgNA@mail.gmail.com>
Subject: Re: [RFC v5 10/15] media: v4l: uapi: Add a control for colour pattern
 flipping effect
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mirela and Sakari

On Mon, 10 Feb 2025 at 13:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Mirela,
>
> On Sun, Feb 09, 2025 at 07:23:10PM +0200, Mirela Rabulea wrote:
> > Hi Sakari,
> >
> > On 03.02.2025 10:58, Sakari Ailus wrote:
> > > Add a bitmask control (V4L2_CID_COLOUR_PATTERN_FLIP) to tell whether
> > > flipping results in a change in the sensor's colour pattern, separately
> > > horizontally and vertically. The information is essential for raw formats
> > > when using generic raw mbus codes.
> >
> > Is this control really necessary? Are there cases when V4L2_CID_HFLIP or/and
> > V4L2_CID_VFLIP is enabled and the CFA pattern does not change?
>
> Some sensors have some tricks in firmware to avoid changing the pattern (I
> suppose in reality they crop one line / column) but this may not be
> controllable by the driver, so this possibility should be taken into
> account.

To give examples of sensors I've encountered that do this.
Sony IMX327, IMX290, IMX462, IMX415 and probably most of the Starvis range.
OnSemi AR0144 and AR0234.

Sony's datasheets do explicitly show the pixel array as being an odd
number of pixels in each direction, and that it therefore has the same
colour pixel (generally red) in each of the 4 corners. The flip
registers will be shifting readout by 1 pixel.
Readout mode restrictions generally say that the width and height must
be at least a multiple of 4, and offsets must be even, so there is no
way to read out that extra border pixel.

  Dave

> >
> > Could a raw sensor driver be capable of reporting the
> > V4L2_CID_COLOUR_PATTERN based on current values of the HFLIP/VFLIP? I'm not
> > sure I understood all the aspects of patch #7 (V4L2_CID_COLOUR_PATTERN).
>
> In principle it could. The two were originally made independent also
> because there was an inconvenient dependency between mbus codes and
> controls. If the pattern control does not specify the native pattern but an
> active pattern (whatever has an effect on it), the userspace also must
> check that configuration to determine the native pattern. My understanding
> is the preference on that side is the native pattern.
>
> --
> Regards,
>
> Sakari Ailus

