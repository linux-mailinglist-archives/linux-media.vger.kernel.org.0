Return-Path: <linux-media+bounces-31062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB95A9C90B
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 14:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913D79C5060
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DFA24BD04;
	Fri, 25 Apr 2025 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ags7qOgf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0325695;
	Fri, 25 Apr 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584626; cv=none; b=XCn6igoU76yDEPRmRNUPcUJPcjC21fxpzXDgxtsM+wwbqoDpTq6XJkCTrG1GhSC8gQAiZTsn56MN3sk+/qvnmtzcEYNa7dP6XekQubb4tUi3XDjyGo2PODvZhjg/zI8cFZaczY8aNtNtWy9kvgrbz6oAApBAiov7gcpUxYB9tSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584626; c=relaxed/simple;
	bh=wQKMs1Q383E4DCa/GJSb7YJisKrgGs3Z3IM1JTKPSz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6j1TtAPJnhR4i3Sics4QnUOMRo4FqLZZKPh2poceGtnK/0CzGLoryoZjT3CkWMP/avcPsNSm5LevHjkSQKjxsidOIVIGVbXEu2lQPbU6hcT7lJAxgcosoO/9uAJ/vRFc0Kp2KQ8Cv5RZMgD+5XyCiqvLjPfoW2lOaM3na2KLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ags7qOgf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301302a328bso2957272a91.2;
        Fri, 25 Apr 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745584624; x=1746189424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/57iCSzPZz9lmb8cnuwvMg4/VJ+5z5nV92ke/d2qrv4=;
        b=ags7qOgfQCNaMIGNGylhsPhY6l4UJRq96W9S6se34Z17MFRfqzznHtSLYvjmXbSuss
         D1VqCDEZHRQ9Cri2jRCanP4HNSVM/7AOU0ONUxmwVFD13KLqRHgpxNB4ioLbZhDub6T1
         KzD7Fl0CfQI4B5AcZw9cm6fZRm8kk71aJ1vUmop2kUWsgL5/2iEawxenzrq77p4NF9Da
         uvb8aDDgHsVKCFnu+aqDe+ONkxfm9EPq3WReSoIj0lYwPinJBcPKlvWBgVmpP/kEUBXr
         PgLcr8H7mLfYcbIJe0zQDRkNFIX5eS1MjIPw8YbvOpzkeHGjkX2EGJr9e3eiiVP1y1Sq
         I7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745584624; x=1746189424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/57iCSzPZz9lmb8cnuwvMg4/VJ+5z5nV92ke/d2qrv4=;
        b=AadanC5jQqpf2xu9ee/Plf1N9345uWt5+XqZ2H4wvfop3zdqRUCPivHkcjgC0/XhFs
         E6aHxr94mCbUH+wSWUOao9e5cJgLCKLnGzu83XAu66aF/O4WhJqp/owESt2FSP+OwODk
         qzpEih1ug03OLppfROP7EOpqZx8dm2E2RN+FNMkNI7CWLetY7cQsAQ0Rs2yKJ0Ie/CZz
         3zQjixrJR+uyK8lfQTM3Llwmr3iJH6OINkfUYzPgGmA2iFzVONKT4En4Ai29B4G1AFBo
         zq0TDcZf2NThgUDve3sB5DTmrzaLgiAr3GUK5RAkJvdZf5nJ3RFJ3vsdSqct0CyDxBlS
         8W3w==
X-Forwarded-Encrypted: i=1; AJvYcCVotHrnz/OGcpo0mfYm8gdyLjX5h97avm04SdHqdApJQhYyQ8loxzJH+GERQDfQ/MSzMe71wnCT184LQ9k=@vger.kernel.org, AJvYcCW1Y4oI1WpO3x7wcWi46vM0UNGNtR9s9uWrMOKHQzTS+ERBA22wcz5VAKGItxN+b0xT10tE0+NYWwBLJnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAN4BUe59XCI7uqRvYfWY/LewXmXW5XvSSSTeOe2tSJLbo7vd/
	v13Y1Z3m8d2DoWxcwkjsR2NBdslZ6y6WqiMMB1BS0N1FRzqfigXK6QlHlwMWNeefeFHyS2BKBSw
	+tPkJJ3uNGVLJLtdQva2MFsmNkXo=
X-Gm-Gg: ASbGncvUqoN9z/tW7S2l5UCzKeD5wTfxffVtg4Y6lxk64AIsACTU6CvUeRSwMj7Mw7i
	xbZUTU9Q+8M1QpbrXWD+dEmI2wYjJkptdmSxnV34kY2C37A1xh39yqPlue3yh3SU00tVNf3LSEn
	X8EJ/zCcGkfNMR3VTKjGZDJQ==
X-Google-Smtp-Source: AGHT+IHrZKSy9HnTH+mCEVFkPApiHf33jSDgbWuJcy2WpYPblvzFC3AtdlLf658oHgbgBeN2mhj60hOxIo9mC19fh5w=
X-Received: by 2002:a17:90a:7142:b0:2f6:be57:49d2 with SMTP id
 98e67ed59e1d1-309f7df3069mr3065139a91.17.1745584624192; Fri, 25 Apr 2025
 05:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
 <20250425121451.GP18085@pendragon.ideasonboard.com>
In-Reply-To: <20250425121451.GP18085@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 25 Apr 2025 07:36:52 -0500
X-Gm-Features: ATxdqUFspzEpPOPXt6QqvjLf6nDyAf7s4FR1KV8XPWjCOXF28L_HNZsVbYcD0QI
Message-ID: <CAHCN7xL=vgZO7TW5uZr+OBPX1EKcw2zQhYwjRokTUOHpVq_Wbw@mail.gmail.com>
Subject: Re: i.MX8M Nano ISI Channel Question
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media <linux-media@vger.kernel.org>, imx@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:14=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> (CC'ing Frank Li)
>
> On Thu, Apr 24, 2025 at 08:59:18PM -0500, Adam Ford wrote:
> > NXP-
> >
> > I am trying use Libcamera to capture video on an i.MX8M Nano.
> > (Hopefully, this makes Laurent smile)
> >
> > I noticed that it has a maximum capture of 1080 lines when I query it
> > with Libcamera, but the same camera on the Mini can capture at higher
> > rates.  The multimedia overview states it can handle 1 unprocessed
> > camera stream at 4kp30 without scaling.  The Nano's Ref manual later
> > states that each processing channel has one line buffer, and each line
> > buffer can store up to 2048 pixels.  It continues to describe when
> > processing higher resolution images like 4k, the line buffer from
> > other channels can be combined.
> >
> > Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
> > explicitly goes into detail on how to capture up to 4k image
> > resolution by combining channel 'n' with channel 'n+1' which implies
> > there are at least two channels.
> >
> > Section 13.4.5.1 states the registers are dedicated for each channel
> > and spaced 64KB apart, but then the following table only shows the
> > base address for one, and Table 2-6 shows the ISI size is 64KB.
> >
> > The driver is currently written to only support 1 channel.  When
> > reading through the driver, it appears to require one IRQ per channel,
> > so I looked through the Nano's IRQ table (7-1), and found there are
> > three:
> > ISI Camera Channel 0 Interrupt - 16
> > ISI Camera Channel 1 Interrupt - 42
> > ISI Camera Channel 2 Interrupt - 43
> >
> > I attempted to enable a second channel by modifying the .num_channels
> > =3D 2 value in the driver, and I modified my device tree to assign a
> > second IRQ (42), but when I query the pipeline with libcamera, it
> > still doesn't show an available resolution ov 2592x1944 that is
> > supported by the camera and work on the Mini without the ISI system.
> >
> > Can someone tell me how many channels are actually available, and
> > whether or not  4Kp30 video is really available on the Nano?
>
> My understanding, based on the i.MX8MN reference manual, is that the ISI
> has a single channel. The ISI features list (13.4.1.2) reports
>
> =E2=80=A2 Supports up to 2K resolution at 30 or 60 fps (24bpp) on each ch=
annel.

I saw that which is why I was really confused when they listed 4K in
other section.
>
> If you look at the i.MX8MP reference manual, the same features list
> reports
>
> =E2=80=A2 Supports one source of 4K resolution at 30 fps (24bpp).
> =E2=80=A2 Supports up to 2K resolution at 30 or 60 fps (24bpp) on each ch=
annel.

I didn't look there, but that makes sense.

>
> There's no mention of 4K in the i.MX8MN ISI features. I expect that the
> documentation about 4K support by combining pixel buffers comes from the
> generic ISI documentation, and is not applicable to the i.MX8MN.

I suspect you're right, but the documentation is very confusing. If
that's true, maybe Frank can get the NXP people to remove the
references to the 4K capture from future documents.

Any idea is the CSI on Nano is really capable of 4-channel virtual
channels as listed in section "13.5.1.2 Features" because I believe
it's the same, or similar CSI as what is in 8M Plus and Mini, and I
don't think those are capable of virtual channels.

thanks,

adam
>
> --
> Regards,
>
> Laurent Pinchart

