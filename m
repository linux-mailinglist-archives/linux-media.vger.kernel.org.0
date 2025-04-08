Return-Path: <linux-media+bounces-29577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE8A7F42D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 07:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 597B41753DA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 05:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577322116F4;
	Tue,  8 Apr 2025 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMsnsnbN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2622B1EE7BE;
	Tue,  8 Apr 2025 05:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744090567; cv=none; b=NlTmpxKPxcDi72ThNTfrz+ziU+GcVSFcC/lQL44Zi3OhZravr8mVFN6vanUdtqfl4lZUM02Hav8MaP1m72Qz2F/y3IfZG4FwMfsseSZrv9c4C3mrt9mrY6dS63sLV2zqnDxJOre8z9arFMq6Dy3+CH1gIJfDQoOBkyguVot2jbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744090567; c=relaxed/simple;
	bh=bpV5FGMaMPPNBMNGXul9vlBbf0D9HtZpxIRHD5Mb47c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHmPd1PZv8XklYOTYnVqrJkgLktJSW9u/Rn76iTjWq8Pqyj28bjiNYXI6mdM7KO0Hg73CsQ6vWGkCFnqh4tbwrUE7E3jhmxafU68hh3EC0/6xjucLKVYX/68zfcoq06+oDR+KB8R83PGS9Lgi4KxT8/QRXorlmdX5ChwSPLttrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMsnsnbN; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c597760323so462006285a.3;
        Mon, 07 Apr 2025 22:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744090565; x=1744695365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66z8xNX7QfE8/G8d9xcH5NpbXBfUgfRudiKLL4Me/eY=;
        b=XMsnsnbNVOtWnMDi4ZE60AKpNzUYCwaJf/U3p1JyY311FSliLL0I3xTKfJnarWqZyW
         PZkgGBSAtSAjcAGawl5fYTSYODnWMcPYkiwjR/IwIEOeu7vLxDJIPYL040wlEkfnzQpJ
         D3KTKZQkeElwM/P+a+AhEppZ4DNsx7ycTE9h5wx1lDy1afKc7sgn6UzD6pSxIORdTAq2
         lmzk/tCH6mPyROASfSbawbZJvKTSiWQzR3bE6HoEVKYIBw1kYeBJJ6Ro8hNJUSI5TD4G
         auhP6jYrT+WpmzyIuowejYBBtsaNvBjvHx7FytCbk4IVg+fc1rTvs+NLBNhyDDbUHcql
         i8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744090565; x=1744695365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66z8xNX7QfE8/G8d9xcH5NpbXBfUgfRudiKLL4Me/eY=;
        b=R3Ex813dwuD7migflBWe1M25H8NTyWqyFha6TR+bJqA0offKpUdG9LG3kFbtsaxw2d
         jUVNfvomuvm2vcWFnTY/ID85tk8HpRV9jTlBJpmw4XoLmMBDMiHOd7C/0yzYG2tGhdZS
         fiebe5ZJj6uqiL+EMtsqicdls6Zu/32mwyHSXARSFzzC65o/V2tK+6aKxlQnBp1uM+jK
         1mTphI6g2VJHdb47BDLLEPCL1jsWArI6nvL99eRxL44iiCru7/ZZIOHTkb1lR//Cffs7
         VNn9p5lycMVcAmcT7YFhgKScAOqqm9/uPsnM5zjplItzw8e8fIn2x/sSIGbMvJAGdOxl
         EyIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPdEZCYh6kVZxyNIDA0LWNqMSYH7800kyi74hycwchxxVAm2YTMTPga7G9vt5o6CttgQmA6JeJ5Fek5oI=@vger.kernel.org, AJvYcCXiK1kEZX7LAi9ZwraJ+t6Q9KPOOnNXzsC+V9aeb3v5ooZulAWo/u0TLK4C5gPBia9uV1Gddq2uG9vePvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNpo4NMwqEMiPmd8sf6iGGc0Si/eh5ZFob/Xa26q4MDIGREw9B
	JJi5ZTytN2agN5LLaS9IK1zApNl5oQwc73BkNAX56rQzF75F3fHGWm7bPOmegHEEMRSd1j/nyq6
	AvM7pe9FrXCHBxFCqCO1pmRi0va4=
X-Gm-Gg: ASbGncuaiTa8lumWp5AP7b/gu4+VXxfd75hRgL9+lsFeaOLzr7sAy5dCh6GxSogUsmM
	7t2vtgB4DTdKs0bZ/LDTVD8trlCObeTBvawqHYz/lguUfG8Cg/LYE/SVfWXWgfoSWEUCb+FKOcK
	imYY0B/S/o+Q+cgrc6qHX2Lt8Aa9MzOiBdMYf0WywzxdGEGSvjCuK6+49uaQ==
X-Google-Smtp-Source: AGHT+IF3zriAobKyOd+EfxBcRPVpJO7KdHPNEN1iPME2bkhFC2JQsEh6Wt5ZpPCetHwqivdlHTSNYgyvuNmoxmCXhqw=
X-Received: by 2002:a05:620a:70cc:b0:7c7:9349:e468 with SMTP id
 af79cd13be357-7c79349e48fmr395965885a.12.1744090564951; Mon, 07 Apr 2025
 22:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com> <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
 <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com>
 <20250326001336.GA23984@pendragon.ideasonboard.com> <CAKUZ0zKDy47cQ0ZQo-=1c7wmazbutF=VF3qX09DfZFBz01hh-g@mail.gmail.com>
 <20250402002948.GC4845@pendragon.ideasonboard.com>
In-Reply-To: <20250402002948.GC4845@pendragon.ideasonboard.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 8 Apr 2025 01:35:00 -0400
X-Gm-Features: ATxdqUFhO6KYOXY4yVNrKrJ9pclVIZLupMuKBIYL2k0WzLK5KckrSLkKAPiarzg
Message-ID: <CAKUZ0z+V0pBvAf1VRGcWf_QcROZFsTUcHmNM1T1=DpBw56yi8A@mail.gmail.com>
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has 0 pads
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 8:30=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Gabriel,
>
> On Sat, Mar 29, 2025 at 01:50:00PM -0400, Gabriel wrote:
> > Hi Laurent,
> >
> > I=E2=80=99ve analyzed the bug report, and the root cause of the
> > "WARNING-media_create_pad_link" issue is a mismatch in terminal
> > references in the USB descriptor.
> >
> > The format type descriptor references terminal ID 6, while the audio
> > streaming interface descriptor points to terminal ID 5. This
> > discrepancy triggers the warning: "No streaming interface found for
> > terminal 6", followed by the media pad link warning.
>
> Can you share the USB descriptors.
The USB descriptors via the Syzkaller reproducer:
         "\x12\x01\x00\x00\xfb\x5d\x7d\x08\x6d\x04\xc3\x08\x16\x6b\x01\x02\=
x03"
         "\x01\x09\x02\x50\x00\x01\x00\x00\x00\x00\x09\x04\x1f\x00\x00\xff\=
x01"
         "\x00\x00\x0a\x24\x02\x00\x00\x05\x02\x01\x02\x07\x24\x07\x05\x00\=
x00"
         "\x18\xc2\x24\x08\x05\x04\x00\x04\x96\x0d\x24\x06\x01\x01\x03\x02\=
x00"
         "\x01\x00\x06\x00\x06\x09\x24\x03\x05\x05\x03\x06\x05\x81\x09\x24\=
x03"
         "\x06\x01\x01\x04\x05\x05\x07\x24\x04\x05\x01\x00\x9c\xbd\x89"
>
> > I confirmed this by changing the terminal ID in the format descriptor
> > from 6 to 5, which eliminates both warnings. This shows the warning is
> > correctly identifying an invalid descriptor configuration, not a
> > kernel bug.
>
> There's still something not quite right. uvc_entity->num_pads should
> always be equal to the corresponding media_entity->num_pads. That's not
> the case here, and I think it indicates a bug.
Ah ok - the mismatch itself shouldn't happen regardless of the descriptor
>
> > Since the USB descriptor is invalid, I believe the warning is
> > necessary and should remain. The code should stay as is.
>
> There should be a warning, but I think it needs to be caught in a
> different place, earlier.
Got it.
>
> > On Tue, Mar 25, 2025 at 8:13=E2=80=AFPM Laurent Pinchart wrote:
> > >
> > > On Tue, Mar 25, 2025 at 06:05:00PM -0400, Gabriel wrote:
> > > > Hi Ricardo,
> > > >
> > > > > I cannot reach that URL
> > > > I was unable to access the URL from my email client when I initiall=
y
> > > > sent the email, but a couple of hours later, I was able to. Initial=
ly,
> > > > copying and pasting the URL into the browser provided a workaround.
> > > >
> > > > > Shouldn't it be?:
> > > > > Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices for e=
ach entity")
> > > > You're right, I incorrectly referenced the wrong commit. However, I=
=E2=80=99m
> > > > not certain if it should reference a96aa5342d57 (Fixes: a96aa5342d5=
7 -
> > > > '[media] uvcvideo: Ignore entities for terminals with no supported
> > > > format') as it's the latest commit affecting the line I'm changing =
or
> > > > the one you mentioned.
> > > >
> > > > > Shouldn't source->num_pads be the same as remote->num_pads?
> > > > The fuzzer (Syzkaller) that triggered the warning appears to have
> > > > encountered a case where source->num_pads and remote->num_pads were
> > > > different. When analyzing the case in GDB, remote->num_pads was 1,
> > > > while source->num_pads was 0.
> > >
> > > This seems like the real bug that should be fixed.
> > >
> > > > > Are you sure that your kernel does not contain?
> > > > > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/drivers/media/usb/uvc/uvc_entity.c?id=3D41ddb251c68ac75c101d3a=
50a68c4629c9055e4c
> > > > Yes, it should be included since I am running the upstream kernel.
>
> --
> Regards,
>
> Laurent Pinchart

