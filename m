Return-Path: <linux-media+bounces-23471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E79F30D9
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7CE18855F1
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9155204C3A;
	Mon, 16 Dec 2024 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brettrd.com header.i=@brettrd.com header.b="BOJ70ECv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CCE201253
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734353399; cv=none; b=EXEYB2Aj6TrPbIKETP3A4WliqSrNxe0pwGB8eoMB2OLMU33fP/lD1tEYJwQ5ijQzHFAY/XA8mYTEB5LnJ24KJOTamtLgmHJbF2t/DPGEJ1qgG0HIbPQepr5f5SwWsBAV6jbGC8Y6MQzplgcP4kBPON7O9VRUq2gxl2fF8g9QSKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734353399; c=relaxed/simple;
	bh=aCgOJOhqH1XxQdLcdLvja/0Ca2v+sNzqk4cdvALXf34=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nw7zim3cUP2znFzjxk84Y9RVZZW439xTjW2BiAb6Z2YjW3uYe22VD27DEV8o+KgqS5AUcVsBKT2xm9LPHIkRuEmmdcTfXGy9vK4R2XakBThjlYcUTOczbMPHgDpJKlxSYtTroDx/6NwviA8/2CJpgObaalbbwjHAq36AnrETXsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=brettrd.com; spf=pass smtp.mailfrom=brettrd.com; dkim=pass (2048-bit key) header.d=brettrd.com header.i=@brettrd.com header.b=BOJ70ECv; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=brettrd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brettrd.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brettrd.com;
	s=protonmail3; t=1734353393; x=1734612593;
	bh=aCgOJOhqH1XxQdLcdLvja/0Ca2v+sNzqk4cdvALXf34=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BOJ70ECvisyAW7cjLzeBO6ka0nqL2jmd1nYm+cEd2Rt1/Xjwn/zyddSPyhmUWXWRR
	 Q75pjMljyIufVNi7YNSynkl8ngMNgCcf5VoSkU37C88hqRTrOnTOdC05D3VjnAWmav
	 4l2KDYJ2t4dYGWq2ftChsZSG5m1jJVcF0b/oX8mfORCHtJBzzZ5Fz9iNJhR2MhzrU6
	 oj5JsGaOh3t3ChCM9FQbniPUkpzteL44ObTw1hFNIy0j5IkOZB0yutmrLLzgCbEM3g
	 9guaawbfSdxeYgVhOMaO2xsw3DcUOpsk2zaMp4m8SVxgZ2PHou5LXF8L41p4FTxiGu
	 DnjY4Q/OfFJGQ==
Date: Mon, 16 Dec 2024 12:49:24 +0000
To: Ricardo Ribalda <ribalda@chromium.org>
From: BrettRD <brett@brettrd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: new UVC thermal camera vid:pid and quirk
Message-ID: <2gLJ1GFY4lqGOI89FNSzY1W2GK3DxficwvGTOrUq9XvD3ylcaizngXTreToZwVBYedhI970yNSfQ28QFTHb5ZZS7lkV0X6QXUzU7UdxuAZ8=@brettrd.com>
In-Reply-To: <CANiDSCspg89eRXB__MA9ZgxeweHku15UbbYvZxp-M51i8fy+bw@mail.gmail.com>
References: <qiDpaTpmUiihs32PnSJ5OBrVm201qlAyraYycyW8Fo72UIcSkWQ2FgQPnddO_56Euepf508o_SsViFu1cQiSHlgD06m2rdnoqQvEeLe7NZo=@brettrd.com> <CANiDSCv+Gh3E5TuJkxbqWnJ8fcM=WhJbh+hJjNbM=D2ZwSwf=Q@mail.gmail.com> <QZMkPVqtorkeIbj5BHOKAfQE7IJHh6Shg3K9xKeg4d6t4wPI7o94SkiH7znorWctNAqQ4Pr4jZhq6nPQjAk0GprUjcYqknpmVXwne8-H094=@brettrd.com> <CANiDSCspg89eRXB__MA9ZgxeweHku15UbbYvZxp-M51i8fy+bw@mail.gmail.com>
Feedback-ID: 43762550:user:proton
X-Pm-Message-ID: 5fafe309536b403589c5c9135c883ec40bc33741
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Ricardo,

Thanks for following up, the patch did compile and work correctly.

Unfortunately my mail provider doesn't get along with git, so the attachmen=
t on the July 26th email is as close as I can get to submitting it.

Cheers,
Brett


On Monday, December 16th, 2024 at 11:41 PM, Ricardo Ribalda <ribalda@chromi=
um.org> wrote:

>
>
> Hi
>
> I was going through old emails... have you made any progress preparing
> the patch?
>
> Regards!
>
> On Fri, 26 Jul 2024 at 07:24, BrettRD brett@brettrd.com wrote:
>
> > Hi Ricardo,
> >
> > On Monday, July 22nd, 2024 at 6:15 PM, Ricardo Ribalda ribalda@chromium=
.org wrote:
> >
> > > Hi BrettRD
> > >
> > > Thanks for your report.
> > >
> > > Do you want to give it a try at sending a patch for the device?
> > >
> > > It looks something like this:
> > > https://lore.kernel.org/linux-media/20221101-easycam-v3-1-2c9881a7a4f=
7@chromium.org/
> >
> > I'd love to, I'm still reading up on how to build modules under Debian
> > A first attempt is attached, I'll send it standalone once I've tested i=
t.
> >
> > > Make sure the vid:pids are alphabetically ordered.
> >
> > Thanks! I wouldn't have noticed that, the struct is inserted in vid:pid=
 order
> >
> > > Regards!
> > >
> > > On Fri, 19 Jul 2024 at 07:55, BrettRD brett@brettrd.com wrote:
> > >
> > > > Hello,
> > > >
> > > > I have a device not listed among the UVC supported devices, '2bdf:0=
102 HIK Camera', It's sold as a "mini640" thermal camera.
> > > >
> > > > It needs the quirk 'UVC_QUIRK_PROBE_MINMAX' before it runs happily =
under gstreamer using v4l2src, no errors for all reported resolutions.
> > > >
> > > > Attached is the libusb output from it, and the v4l2_compliance repo=
rt generated without the quirk applied. (with quirk=3D2 it reports no failu=
res)
> > > >
> > > > Thanks for a great driver and documentation
> > > > Brett
> > >
> > > --
> > > Ricardo Ribalda
> >
> > Cheers,
> > Brett
>
>
>
>
> --
> Ricardo Ribalda

