Return-Path: <linux-media+bounces-18003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E2971C5E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B250E1F247D3
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2981BA28F;
	Mon,  9 Sep 2024 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pn3g7K0H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A813AF9
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725891721; cv=none; b=KyDivF7PHgtWAwi3V9kvuIAsh6uVhFXleOqTr9fVnF29QPA/A4L6RT1+SrLZ3Kyxl2+WWfeKicbumZ+jFaiTiyiLQYHBLHx8YB9toz0QERz24CE9/TopDIXx48CafY2N/Twbukk4fxYyYJHz3xw2xj4NmfvK1EQ6Uq9RoA44OnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725891721; c=relaxed/simple;
	bh=2CRhy6w1+t0lkGcb1i8lIwjKAxCV3PtF1ivJt4Q5KXU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GXVZVJi2sYSqbtWtfqDxJkCd4NCq7UyEqM8TQnA32BtyPEiFp++LxOJIte7t0Rrr1TJrkj9B0Ve66tlQE9i9vTWZ0BNxt4tDGdG+vYX+RRB/47tv7M6v7dqs+XU01paBSIn9MUZpaJXdPUxDE6hlez34oEgg5bFqXHXfZwly5vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pn3g7K0H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D87845A4;
	Mon,  9 Sep 2024 16:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725891641;
	bh=2CRhy6w1+t0lkGcb1i8lIwjKAxCV3PtF1ivJt4Q5KXU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Pn3g7K0HT8qht9fysyXDmfJ3TJJXKxLY4+I2Pr46x7BDyL7L3oSWWjXD6WORdR7G7
	 46pRU/n/JcgSSq11/c+27qgKkXXkJg9K4FhlEfgn/K9Hu/eQIjJjNtVQnOUNFIE41Z
	 d47pQl4hvRvdxptzcC92CdJZ0H9MPuMajDj/0oDY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHW6GYLD_Dxbw0k_BG5n40bGmOCecGs2Obgud=f8RMnN=qgTXw@mail.gmail.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com> <CAEmqJPoHUXpX3F7dDKAYCr59YKCWz9rggKD5C6hTyyOSr=EiaQ@mail.gmail.com> <CAHW6GYLD_Dxbw0k_BG5n40bGmOCecGs2Obgud=f8RMnN=qgTXw@mail.gmail.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
To: David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 09 Sep 2024 15:21:54 +0100
Message-ID: <172589171470.2319503.7055305680210152753@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting David Plowman (2024-09-09 15:11:29)
> Hi everyone
>=20
> On Fri, 30 Aug 2024 at 10:34, Naushir Patuck <naush@raspberrypi.com> wrot=
e:
> >
> > Hi Laurent,
> >
> > Here are a few agenda items that RPi would like to include in the discu=
ssions:
> >
> > 1) Raw reprocessing API
> > 2) Per-stream control RFC
> > 3) Non-image data streams
>=20
> I'd like to add
>=20
> 4) Passing IPA tuning parameters (i.e. our tuning file, or its
> contents) to the camera when it is acquired/opened.
>=20
> This would enable us to run two instances of the same camera at the
> same time, but with different tuning parameters. Particularly with Pi
> 5, which has two camera connectors, we're getting bashed over this
> repeatedly.

Added, I'm keen to see this one progress too.

--
Kieran


>=20
> Unfortunately, I'm not able to attend the workshop, but please
> consider me there in spirit!
>=20
> Thanks
> David
>=20
> >
> > Thanks,
> > Naush
> >
> > On Mon, 29 Jul 2024 at 10:01, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hello everybody,
> > >
> > > Following the success of our workshop in Brussels in February, we wou=
ld
> > > like to host another event in September.
> > >
> > > We have evaluated different options, and opted for week 38 in Vienna.
> > > The city will host during that week the Linux Media Summit (Monday the
> > > 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) a=
nd
> > > the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
> > > [3]), and we expect that co-locating with those events will ease trav=
el
> > > for attendees of the libcamera workshop.
> > >
> > > The week is already busy with camera-related events on Monday with the
> > > Linux Media Summit, and on Thursday afternoon with the Complex Camera
> > > micro-conference at LPC ([4]). We have therefore selected Tuesday the
> > > 17th for libcamera.
> > >
> > > To help us plan the venue, could you please register your interest by
> > > replying to this e-mail, either publicly, or in private to Kieran and=
 me
> > > ? The event will be free of charge for attendees.
> > >
> > > Please also let us know if you have any preferred discussion topics y=
ou
> > > would like to include. We will draft and circulate an agenda in the n=
ext
> > > few weeks.
> > >
> > > [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@=
xs4all.nl/
> > > [2] https://events.linuxfoundation.org/open-source-summit-europe/
> > > [3] https://lpc.events/
> > > [4] https://lpc.events/event/18/sessions/193/
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart

