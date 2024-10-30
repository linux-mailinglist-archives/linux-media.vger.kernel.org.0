Return-Path: <linux-media+bounces-20612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0E9B6F38
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 22:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 152771C224A6
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 21:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B9C228B68;
	Wed, 30 Oct 2024 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Q6w5j7Ab"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C959218331
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730324118; cv=pass; b=AmuJmeFj2oUlqbC+XT2TQEGDdpPmdq7jhmUci9pEw9sZdZUMOry+/l539gRLkUyglM6He6h3BCOTbS70Ig2hj/ZqsmyAPZLHFo9k+OgpjZjhmimAEV2XIpUbukopUd1/PeAgUo4jUZcBilb6Mw2oJWAv5FGY63ambd76AC/PPdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730324118; c=relaxed/simple;
	bh=ec/zyw2RklpzRPgI7A+gAsAowuwsPoOVehHEEaI0Uec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ4Gn/sFJtiECLVDWouB9Ydt3CtnzoMXriN6fk5Xv5txu+JekvMluBiIfSWOVGYYfsAny31uESnCuVk1ROxi+hAcYqnV/JTJvBZMGq0Tgt4sZWlIVMJxuhSSrgM1IoSO5btCfndwttQCAe0jua1/DfFexetvW9InUBBNrsHiYXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Q6w5j7Ab; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Xf0lg4JBQz49Pyc;
	Wed, 30 Oct 2024 23:35:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1730324111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nOUadWB/TNOlylcyIr/NaKzSOfHsjwF0FMQlpUOiq4Y=;
	b=Q6w5j7Ab1AYfDK2oaRvmw0YWgndRY+2igNQVbqsE40FVNaH8AHb/HarUoMrXYXq2eoRy5q
	LSN7SowbMfsPei1B4wNYR9sS0ITIAwgbYGSvgkfFzC6SWCBzb1+hsl4t4RFnP7zVdpjdqN
	bOvzUr7wRvlyWvFed4gCa5tVxu6stDDiitCBSgfTNnte6o8wk06DTUf7fTH3kENhj1m3i0
	yqMKy3WU5SRX4R1NDAzzuiwnCMZ2GnQzlF+G0ut2XT9hAuOXIQzhe4TgQCi7gidvNymgdp
	QrpTVwby9GDdZGpUaX7oXwJRGt3w8UtbJ0yaWgqkVgogq7AT2zT9JIDSbt8TYQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1730324111; a=rsa-sha256;
	cv=none;
	b=lo356woVm3tHnDBXU1q94CmO+3LxhcECrbxnvbAaXIR5HxKlBOW6BXxIDDF2dpDo60coFh
	m9x7xR+Dn0ya8oRE+Ox8vxrHRjjwHRwxecwjT9KmJ8zGJGM9V3a3JRAQWmnbUfTXEEYONk
	Mvgfg7TvnrqI4SjizeEq8SnFRQbysNSCsws+f7vdfWOeI3vKVHilEic1C8OUfUofFOwil/
	4iCpvMSD2bW9H/MKHv8dN/B+Wn71YoHY0LB/TvNm2CIXZq8Tod7MXk4W10K8L7n1hqfZy8
	2uXXLKIdtKxkDlA5akpJiQEGPFkUGbJ2JLqauoQ/sQ8RPNnHSIWyBgOGXZTPhw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1730324111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nOUadWB/TNOlylcyIr/NaKzSOfHsjwF0FMQlpUOiq4Y=;
	b=ODovZatnj7wDlii2trMhTZKkTaWQuE/XWYb/eI/7Z9d75nyATvseNHNt3JPdIgI8j4d5Jk
	MeTSEM2Kis5Z/6gXwoWya4PIbevYcEFVB02ybOmGEUYJS+BcmDMQG/OujbRo5F5G7xfLea
	RyH/DinjsI3Yw9k56g6b5Y3lG1cVEbI8ibe83DBPkUmQsJKqbqH0RXr1xVFCVkHkXc9dBf
	qcNfAFpxnldV9sPPvao3PjR/Q0tKiT8ZpPz6413+/NOghT/LCQXV205+BHA8zvV8n2dvPg
	WwcYhGAFNmJUZVtpsElJVE8I2u2VxUXZlH25s0SkBkJRKBQbrQcWyIK7LqRwTQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7A5F7634C93;
	Wed, 30 Oct 2024 23:35:10 +0200 (EET)
Date: Wed, 30 Oct 2024 21:35:10 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>
Subject: Re: UVC: Privacy gpio as subdevice
Message-ID: <ZyKmjq0PnjwzS46z@valkosipuli.retiisi.eu>
References: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
 <ZyJB4Kxn3Gm79_MH@valkosipuli.retiisi.eu>
 <CANiDSCvGTGo+O14Z=pL=CaZo-9DrzVJ-JwD5GG0Z=cJDTcUG4w@mail.gmail.com>
 <CANiDSCvMyp-13=4DUbau-2K5F2kURy3Mgvf-ZQxSqoAJ3yU93g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvMyp-13=4DUbau-2K5F2kURy3Mgvf-ZQxSqoAJ3yU93g@mail.gmail.com>

Hi Ricardo,

On Wed, Oct 30, 2024 at 09:47:17PM +0100, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Wed, 30 Oct 2024 at 16:04, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi Sakari
> >
> > On Wed, 30 Oct 2024 at 15:25, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Wed, Oct 30, 2024 at 02:03:18PM +0100, Ricardo Ribalda wrote:
> > > > Hi Hans (de Goede, but others are welcome as well :) )
> > > >
> > > > Some notebooks have a button to disable the camera (not to be mistaken
> > > > with the mechanical cover). This is a standard GPIO linked to the
> > > > camera via the ACPI table.
> > > >
> > > > 4 years ago we added support for this button in UVC via the Privacy control.
> > > > This has two issues:
> > > > - If the camera has its own privacy control, it will be masked
> > > > - We need to power-up the camera to read the privacy control gpio.
> > > >
> > > > We tried to fix the power-up issues implementing "granular power
> > > > saving" but it has been more complicated than anticipated....
> > > >
> > > > Last year, we proposed a patchset to implement the privacy gpio as a
> > > > subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> > > >
> > > > I think it is a pretty clean solution and makes sense to use a
> > > > subdevice for something that is a sub device of the camera :).
> > > >
> > > > Before moving forward, Laurent and I would like to hear your opinion.
> > >
> > > I remember we discussed this and I wasn't very enthusiastic about the
> > > proposal but thinking about it again, there are situations where this is
> > > the only feasible solution, including on raw cameras with a privacy GPIO,
> > > besides the first issue you brought up above.
> > >
> > > Regarding the second one, why would you need to power on the camera to get
> > > the GPIO's value?
> >
> > In order to read the control, you need to open the device, and once
> > you open the device the device is powered up:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_v4l2.c#n621
> >
> > In a perfect world it would only be powered up during streamon(), but
> > uvc is a complicated monster:
> > - We have delayed controls
> > - We have buttons
> > If we only power up the device during streamon those things would not
> > work properly.
> >
> > I think I have a solution for delayed controls...assuming the device
> > implements the standard properly.
> > I have no solution to support buttons :(. Luckily not that many
> > cameras have that today
> >
> > Regards!
> >
> >
> > >
> > > I'll review the set.
> 
> If you have time to review something, please take a look instead at:
> https://gitlab.freedesktop.org/linux-media/users/ribalda/-/tree/uvc-subdevice?ref_type=heads
> 
> Once I test that on real hardware is what I plan to send to the ML.
> 
> It has support for the ancillary link and it is a bit cleaner.

Could you post that to the list, with a note it's not been tested?

-- 
Regards,

Sakari Ailus

