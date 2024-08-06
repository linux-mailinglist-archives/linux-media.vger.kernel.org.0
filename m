Return-Path: <linux-media+bounces-15837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E906F948C99
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 12:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 033071C22722
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 10:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E8A1BE22F;
	Tue,  6 Aug 2024 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YwBeNnJA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C031BDA86
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722938898; cv=none; b=kFtxdnUhSa5d9CNhqfp9blo9B+deis0X+jgfIYBmv2NdJaZ95GBtq4HR6XK34LaQ+EzSHs6HsBNqwcfJtRf97zZYHm3abCffD/qUlpLSx9Kkk/EzE3N6awA9umths3ahXoLqwtdllTuN8j55VvuKvCV/97Rtr53SPcW8FPAcJAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722938898; c=relaxed/simple;
	bh=zXaZ1gfwR3Iuw/XjY5d8LCQShNkNAaUpyHpiUtc7x8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bi2D2aH0ySABYbgSJG1vQXbwGa/4GUv8ZW9eo9RSYi3Lql6eV6NUq99kXqG2gnlSzhg9g7dufIsROVvnl6bMy4fEzRTLRx/WTtO3tAHvgToOQ7YzKjWOAenLZgNs9heQ945dyftRWoPw1KvlNZAODT80Wi5Jp8UCg2t4ED6D3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YwBeNnJA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a81bd549eso39231366b.3
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722938894; x=1723543694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUzbL5EJZOzbj6FEc1JxgIPVYfRo2pgZmFORdCDI5s8=;
        b=YwBeNnJAlibtKJzJVq28TUQuegsp+HHtypPWf0h6ybD1RbyCIaEXZY/fFLCQ88fYw4
         EvMiWrOtx9JwuTwa7noKrcXTwd8v0rnxfk7PnpnH56jVq6HjdtcaclksotPA5b/ImWe9
         ZLfSthNrfwj/OHUzAgpRPwRnqrtIF8OFnKhCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722938894; x=1723543694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUzbL5EJZOzbj6FEc1JxgIPVYfRo2pgZmFORdCDI5s8=;
        b=VdsUHn/MK+3p3F2PBDjhTQ/hb8U62IT938i2TYU4jfWUubcNYY7TUi4yIje6s5c3NZ
         99yoM/X4wEhki3pT+0EPAqnzw8nqTAcgPRDoTzDDf6g5qFRZ4z6oPU7cbBSMoGNJ/gL4
         ZPrXY0J8U9vvLBA7XR/0lWcnGJAnWRdUl0dRnmSBx0IeW/c4Bx3nVvnZvcBe5T3UMYdL
         3DhoyT3b614+UaPU24ole38rHKsfs6r9wJxgixKAI/nQ69hOx/dRKkDsBbz1+LM6XnEr
         j1huhBKEvSsffL0FJJDxTJfQjA06FO760NZvguPuvb2xuHvw5iDIJTyz7LnaCZOm5LXf
         btmQ==
X-Gm-Message-State: AOJu0YxGPYoFRBETIVwNq3xO1yVxZZkgxbBS4oS6GMwjW7CvZRaFa/Le
	sa1bYojXaUlXyZOEAwNskzjLnTNs6E9PGq/c52DerBIw6y0RdNUpby/TYZSshfNA1gWS0fuTyCO
	sPkDq
X-Google-Smtp-Source: AGHT+IGNAAIgpl1HruZTFu9Pkifs5uCE1wJshClqQob7ttoNbR0iFBNCUogAqacXYyr7vOhq4nhPMA==
X-Received: by 2002:a17:907:2ce3:b0:a7a:a138:dbd4 with SMTP id a640c23a62f3a-a7dc5103c09mr1003131466b.64.1722938893773;
        Tue, 06 Aug 2024 03:08:13 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcad43sm542056666b.19.2024.08.06.03.08.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 03:08:13 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7d26c2297eso68015666b.2
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 03:08:13 -0700 (PDT)
X-Received: by 2002:a17:907:97cf:b0:a77:e1fb:7de9 with SMTP id
 a640c23a62f3a-a7dc4dc4f69mr961561766b.5.1722938494046; Tue, 06 Aug 2024
 03:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <24b19434-5556-4f5a-a6fe-ce7538644404@xs4all.nl>
In-Reply-To: <24b19434-5556-4f5a-a6fe-ce7538644404@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 6 Aug 2024 19:00:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ABVG7nsf4xRZzYPjF-r4zT1w8K5Uum6zo22xLLMw1rmA@mail.gmail.com>
Message-ID: <CAAFQd5ABVG7nsf4xRZzYPjF-r4zT1w8K5Uum6zo22xLLMw1rmA@mail.gmail.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v1)
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Martin Hecht <martin.hecht@avnet.eu>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, jerry.w.hu@intel.com, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sean Young <sean@mess.org>, Steve Cho <stevecho@chromium.org>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Hidenori Kobayashi <hidenorik@chromium.org>, 
	Jai Luthra <j-luthra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

[Resending in plain text; sorry for the noise... Gmail doesn't love me toda=
y]

On Fri, Aug 2, 2024 at 10:13=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Hi all,
>
> Here is my initial stab at an agenda for the media summit. As always, it
> is subject to change and all times are guesstimates!

Thanks a lot Hans for organizing and Avnet for the venue!

Any chance that we could somehow stuff the `Multi-context support in
V4L2` session from Jacopo before 15:00? I'm not sure if it's exactly
what I'm thinking, but it sounds like something that we have also
considered in ChromeOS for some of the ISP drivers that we had to
bring up.

Best,
Tomasz

>
> The media summit will be held on Monday September 16th. Avnet Silica has =
very
> kindly offered to host this summit at their Vienna office, which is about=
 35
> minutes by public transport from the Open Source Summit Europe venue
> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
>
> Avnet Silica Office Location:
>
> Sch=C3=B6nbrunner Str. 297/307, 1120 Vienna, Austria
>
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(=
Silica)/@48.183203,16.3100937,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:0x2c=
5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3Dttu
>
> Refreshments are available during the day.
>
> The meeting room is sponsored by Avnet Silica. Much appreciated!
>
> Regarding the face mask policy: we will follow the same guidance that the
> Linux Foundation gives for the EOSS conference:
>
> https://events.linuxfoundation.org/open-source-summit-europe/attend/healt=
h-and-safety/#onsite-health-and-safety
>
>
> In-Person Attendees:
>
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics) (TBC)
> Sean Young <sean@mess.org>
>
> Remote Attendees (using MS Teams):
>
> Steve Cho <stevecho@chromium.org> (Google)
> Nas Chung <nas.chung@chipsnmedia.com> (Chips & Media)
> Tomasz Figa <tfiga@chromium.org> (Google)
> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> Jai Luthra <j-luthra@ti.com> (TI)
>
> Note: information on how to connect remotely will come later.
>
> If any information above is incorrect, or if I missed someone, then pleas=
e let me know.
>
> We are currently 14 confirmed in-person participants and one TBC. I prefe=
r to limit the total
> to 16 people, so if you want to join in-person, then contact me and I'll =
put you on a waitlist.
> The attendee list should be finalized by the end of August.
>
> Draft agenda:
>
> 8:45-9:15: get settled :-)
>
> 9:15-9:25: Hans: Quick introduction
>
> 9:25-9:55: Steve Cho:
>
> - V4L2 testing on Chromium using virtual video decode driver (VISL)
> - V4L2 video decoding testing with KernelCI
>
> 10:00-11:00: Ricardo: multi-committer model using gitlab
>
> 11:00-11:15: break
>
> 11:15-11:45: Sean: new tooling for infrared:
>
> - What it is and what it can do (love to hear any feedback of course)
> - Where it should be hosted? (I hope gitlab fdo, who do I ask)
> - What needs to be in place for a release?
> - This tool replaces ir-ctl and ir-keytable. How we phase them out?
>
> 11:45-12:15: Daniel: Rust in the media subsystem
>
> 12:15-13:30: Lunch
>
> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and the =
paths forward.
>
> 14:00-14:45: Laurent: subdevs, state, and usage of the media controller d=
evice to submit requests.
>
> 14:45-15:00: break
>
> 15:00-15:30: Tommaso/Martin: TBD
>
> 15:30-16:30: Jacopo: Multi-context support in V4L2
>
> 16:30-16:45: break
>
> 16:45-17:00: Hans: UVC maintenance
>
> 17:00-18:00: TBD
>
> Please reply with corrections, questions, etc. to this email. I'll update=
 the agenda
> over time. Again, these times are very preliminary.
>
> Regards,
>
>         Hans

