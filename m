Return-Path: <linux-media+bounces-16272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB5C9514C1
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 08:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4CD1C21A11
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 06:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7678E131E2D;
	Wed, 14 Aug 2024 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PcBbpqHB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE38488
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723617570; cv=none; b=dyMxc8Ton5PodvsDv2XDKAtjW41iBpyMQE+vpeZu4ATOuz5ReY8bOL03sxaCbfSJgreOYxcxEoaWWQUHH7WRr3qmVOXNUyP9TRkE+yq3qRZCnoE9ILs4UKUyWdtP4BhEmWo+VnLkNLaklwTes1ePGpNuZtKSzeRGCVlzqHnJReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723617570; c=relaxed/simple;
	bh=HEYM+PsDAvASaiZpZ0XqykZESzW4oQY/KjdPw2a0JNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccbLBHPNMib2Q/8Tdo9SsZukEiK43vPmfeVzDFUJrGmYlHLjyOOzQIa+LAH946GmCj9t5zy+ACvCscpZ3tCegFFx05ubZYXIHzYN/ZM36ZwpeU5RmnMaUUhv64yVyuuNco+O9qfvASudEu7DZJZaJZsbd49yeAxGuDdILyljWp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PcBbpqHB; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a1d066a5daso395752185a.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 23:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723617568; x=1724222368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEYM+PsDAvASaiZpZ0XqykZESzW4oQY/KjdPw2a0JNA=;
        b=PcBbpqHBG8iX4e5fOSyJyhnPuL8GPcx8itW1rX8ZkAyf2P+kQs4IETFu+zGf+vnRyn
         jBtXXLO3+jAn7F4HK+UYv2vv01uVv5rmdQA2w8vndPfMHiCyQTWl4rqXibDXH8+oc+vN
         g/4dYLESLHhxx8/+1VYZQskUTR+ZfSX+VC0FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723617568; x=1724222368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEYM+PsDAvASaiZpZ0XqykZESzW4oQY/KjdPw2a0JNA=;
        b=OF9rq2Q3SgGJNroUqGiwSipani59mgD71iPqeScKUhOaQIxu3i5jz/BjJ1jkehHkpi
         BMQexO8l8elTJWipINY3MlwR3N3CakzGvtPO6hvmNAL+MW+OEJKJZdw6jpBBcCdTeEpJ
         ZqR1V6FqLaL1PXJ/M+wR8FUdsXy7HXdjlw/VEaGUusUs1lpWKpSvpt/Zr6cS+r2ulDJU
         18rSuBzIZIsJOkdoW8geG620Mm6UTFvcEH50azHuSvXzYHoxU89OSDYURjsqhIC3157E
         ZgqwtvCoKiNm0/FvUv8jM9omL0uMdReTh/F4MkJEzmV3BVoYupWOJURQkrQ03E39nt/G
         NIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT8rvOTBWvy4XRH9ByXLH5fQLQs6uI8/fKyGooi8V+bIBYzkhU8o4ijEjdqZwhzOdMDYOYuvguPfIz5XQUvOzgrFy943e3xTNGAEY=
X-Gm-Message-State: AOJu0YxOKrvUWmm/nNyoAEZb97PtpI0iY/QrRLe5+sorx/eK8ok72tpa
	fa/IuYVkSfOPIDTQvbzuhjOy68RZzkjsNZ6XIbTOpyBeDoFJXY15Et02Mvbm4HH4MPl72psGmlx
	9+g==
X-Google-Smtp-Source: AGHT+IGGKYrwbs5VnMYJ5GYcQk/rmyQ0eIs+wOAxPb2Xcgz2FHO/yfO+GSQ9x3Z/URPkZHNiiKOl0w==
X-Received: by 2002:a05:620a:1903:b0:7a2:d64:14ff with SMTP id af79cd13be357-7a4ee31ec19mr217607785a.9.1723617567916;
        Tue, 13 Aug 2024 23:39:27 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7dee013sm404137485a.84.2024.08.13.23.39.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 23:39:27 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6bb96ef0e96so34539196d6.2
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 23:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1tcOwuFeIwzGwII5GcN6oX6hAOh3SFwQ5fU3bBTUWxDoby/dfoHD/gsRS7fk6/BA+Fhbj+RI9nqGEFbMtuotAQC31aJP/Bp4pFQ0=
X-Received: by 2002:a05:6214:398f:b0:6b5:213e:c30e with SMTP id
 6a1803df08f44-6bf5d26b041mr16560376d6.45.1723617567349; Tue, 13 Aug 2024
 23:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <24b19434-5556-4f5a-a6fe-ce7538644404@xs4all.nl>
 <CAAFQd5BL2xOSbLOnJnJX7fgacgDHZhHq5VRzOW5hJoB0TsDwZA@mail.gmail.com> <20240811190210.GE9403@pendragon.ideasonboard.com>
In-Reply-To: <20240811190210.GE9403@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 14 Aug 2024 15:39:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CzjJqEW0dZQ6fBC48sfzeef0hwcTSa5C5rG_zKCVwkaw@mail.gmail.com>
Message-ID: <CAAFQd5CzjJqEW0dZQ6fBC48sfzeef0hwcTSa5C5rG_zKCVwkaw@mail.gmail.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v1)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Martin Hecht <martin.hecht@avnet.eu>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, jerry.w.hu@intel.com, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sean Young <sean@mess.org>, Steve Cho <stevecho@chromium.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Hidenori Kobayashi <hidenorik@chromium.org>, 
	Jai Luthra <j-luthra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 4:02=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Tomasz,
>
> On Tue, Aug 06, 2024 at 06:41:55PM +0900, Tomasz Figa wrote:
> > On Fri, Aug 2, 2024 at 10:13=E2=80=AFPM Hans Verkuil wrote:
> >
> > > Hi all,
> > >
> > > Here is my initial stab at an agenda for the media summit. As always,=
 it
> > > is subject to change and all times are guesstimates!
> >
> > Thanks a lot Hans for organizing and Avnet for the venue!
> >
> > Any chance that we could somehow stuff the `Multi-context support in V4=
L2`
> > session from Jacopo before 15:00? I'm not sure if it's exactly what I'm
> > thinking, but it sounds like something that we have also considered in
> > ChromeOS for some of the ISP drivers that we had to bring up.
>
> I'm not sure what you're thinking it is, but it probably is :-) It's a
> proposal (with an implementation) to extend the concept of context in
> V4L2 M2M devices to cover a media graph with multiple video nodes, to
> allow for easy time multiplexing of more complex memory to memory
> devices such as ISPs.
>

Yes, that's what I was thinking about. Thanks for clarifying!

> > > The media summit will be held on Monday September 16th. Avnet Silica =
has very
> > > kindly offered to host this summit at their Vienna office, which is a=
bout 35
> > > minutes by public transport from the Open Source Summit Europe venue
> > > (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> > >
> > > Avnet Silica Office Location:
> > >
> > > Sch=C3=B6nbrunner Str. 297/307, 1120 Vienna, Austria
> > >
> > >
> > > https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+Gm=
bH+(Silica)/@48.183203,16.3100937,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:=
0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3D=
ttu
> > >
> > > Refreshments are available during the day.
> > >
> > > The meeting room is sponsored by Avnet Silica. Much appreciated!
> > >
> > > Regarding the face mask policy: we will follow the same guidance that=
 the
> > > Linux Foundation gives for the EOSS conference:
> > >
> > >
> > > https://events.linuxfoundation.org/open-source-summit-europe/attend/h=
ealth-and-safety/#onsite-health-and-safety
> > >
> > >
> > > In-Person Attendees:
> > >
> > > Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> > > Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> > > Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
> > > Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> > > Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> > > Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> > > Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> > > Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> > > Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> > > Ricardo Ribalda <ribalda@chromium.org> (Google)
> > > Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> > > Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> > > Alain Volmat <alain.volmat@foss.st.com> (ST Electronics) (TBC)
> > > Sean Young <sean@mess.org>
> > >
> > > Remote Attendees (using MS Teams):
> > >
> > > Steve Cho <stevecho@chromium.org> (Google)
> > > Nas Chung <nas.chung@chipsnmedia.com> (Chips & Media)
> > > Tomasz Figa <tfiga@chromium.org> (Google)
> > > Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> > > Jai Luthra <j-luthra@ti.com> (TI)
> > >
> > > Note: information on how to connect remotely will come later.
> > >
> > > If any information above is incorrect, or if I missed someone, then p=
lease let me know.
> > >
> > > We are currently 14 confirmed in-person participants and one TBC. I p=
refer to limit the total
> > > to 16 people, so if you want to join in-person, then contact me and I=
'll put you on a waitlist.
> > > The attendee list should be finalized by the end of August.
> > >
> > > Draft agenda:
> > >
> > > 8:45-9:15: get settled :-)
> > >
> > > 9:15-9:25: Hans: Quick introduction
> > >
> > > 9:25-9:55: Steve Cho:
> > >
> > > - V4L2 testing on Chromium using virtual video decode driver (VISL)
> > > - V4L2 video decoding testing with KernelCI
> > >
> > > 10:00-11:00: Ricardo: multi-committer model using gitlab
> > >
> > > 11:00-11:15: break
> > >
> > > 11:15-11:45: Sean: new tooling for infrared:
> > >
> > > - What it is and what it can do (love to hear any feedback of course)
> > > - Where it should be hosted? (I hope gitlab fdo, who do I ask)
> > > - What needs to be in place for a release?
> > > - This tool replaces ir-ctl and ir-keytable. How we phase them out?
> > >
> > > 11:45-12:15: Daniel: Rust in the media subsystem
> > >
> > > 12:15-13:30: Lunch
> > >
> > > 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and =
the
> > > paths forward.
> > >
> > > 14:00-14:45: Laurent: subdevs, state, and usage of the media controll=
er
> > > device to submit requests.
> > >
> > > 14:45-15:00: break
> > >
> > > 15:00-15:30: Tommaso/Martin: TBD
> > >
> > > 15:30-16:30: Jacopo: Multi-context support in V4L2
> > >
> > > 16:30-16:45: break
> > >
> > > 16:45-17:00: Hans: UVC maintenance
> > >
> > > 17:00-18:00: TBD
> > >
> > > Please reply with corrections, questions, etc. to this email. I'll up=
date the agenda
> > > over time. Again, these times are very preliminary.
>
> --
> Regards,
>
> Laurent Pinchart

