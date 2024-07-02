Return-Path: <linux-media+bounces-14537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58321924138
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 16:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F08228585C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 14:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ED01BA08B;
	Tue,  2 Jul 2024 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="sb/2Vtzr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E77F19EED5
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719931619; cv=none; b=Y1i22aPbS3RUYi71YHKWfpi+OUK2hwT9pITSaurDZq1mkYUqgST3jmUSKpVlVFiM/VyCxjBDOJ/lNKqjuGpH8zo/5b74YsnjNhJx7vfc2gNpw/Ub70q/VO0ciZ8o/MD+DSvK2DQu7VOOWGD38j3khvndQUHE0jY4O2GesC31Ya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719931619; c=relaxed/simple;
	bh=Ne6rZ2kdu0uyQXZI1ynaoDI8gxYZt7tzIbKr3AEC95U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0aypIgBHUpmBG6PIseUVc8nr7htHEz0sM7Rb+JjKmjesQKE0kkcf32ARl3Vx/lSndv/uAkGzlHamESvPj6QTcCkaLZGSB2IPT0Io3OW8cfAkne2vFvtuB1CG/R14DKs0ipeXZkUJj1HSxI7j07BK7EjkfpdFhuT3xh+SXSFFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=sb/2Vtzr; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e03a6c1741eso153377276.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1719931616; x=1720536416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g+/UpO/b/o2fUSPqVVlMXsxk32um97pG7VYMuwBM/74=;
        b=sb/2VtzrWvW6ZdkYzucw0MDRfv+3FqVPufeh5k/SNm1PLTVD+S94Dz+y6Uckkmh1JS
         dABWXjLPY2pUgBI0oqPORHWIjoNNNlsupaITaISwggVSEnVoH7zJpKepsAp2nJREJyVp
         CjD29dP9euhqrgIPdyKDZy1/Lm4buUaaiOn8tLdGUtMFYC3fRzRx4/Znr39P9Wky3QwO
         86QQpFCBBYb+Me6L/meyxk1WhfRDfihN1kk2ETeId5Xt0OuAhoFLn6VVf7/rj6cH7g/j
         yZdhyND2Uh1hW/Zp2LaS7VDp17YkdlHoaAyrIjHG6tV8JdOn6YyKzxEevHDSNOZl5RyV
         z7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719931616; x=1720536416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+/UpO/b/o2fUSPqVVlMXsxk32um97pG7VYMuwBM/74=;
        b=sriMMVowPY+48jdvIiMJuBLFAXihvpqSTReUydRTKRA1elWAaPk5Zp7etjNq1luL88
         PaWKgc7E09ak2IyxRJDBOuO/h7Cyjg9IjaCs2EhznBhC6oebhzDJYv3yzwea8RRfrTOR
         1pH84iZ74623TjQcwqfr+WJRgtwN5oivD2m/FA34VLiKxJ3zVSxb60ZU1sq477XeGYEP
         RV91W6APCf7CiA9pVsbncovKq8DmutTovB0MsyaZa8/68GxP/vv3EXf3A/xDzT7hLzaU
         rpUgz6GuARgQ9lgoVtYN4Mi+seypIUW8Sc23fJjVdceeKW9Orq4ZEonj+/GMJoaAXIi0
         Hmnw==
X-Forwarded-Encrypted: i=1; AJvYcCXifzdLT00E8yufe2A5n/l7q36EK+D9ZhBSpY47X9WGOlbIqy6p0W2gfvFpL/FYgtlg0+4CUwG/aSH7v9NKbDhTlalQN27530H7pqU=
X-Gm-Message-State: AOJu0Yy6gAMLhERDa2FKRbFOCu2RJ/OQzoschwVxURmeFgt8DC5Naviu
	NJaC5BJ8ivx7OOigSkHVHTrOmUaJyzRaejYzaC2xaHW/AvVCA98m58UYT14TEPWKl+WmOX0l0Mv
	HCeWux9sCF6+R1bl//Hi7J1ps3jIZb76bgweiLpcojdSNlnr6lZE=
X-Google-Smtp-Source: AGHT+IFf9viN2UFqe/MgjoflCu7dpiBWpz+uNg4xh68cYTUNKlYNAntwfI8GUVb9sQmUDF0CnKVO8p5Rm0GXT4OutaA=
X-Received: by 2002:a25:8a08:0:b0:e03:6020:4708 with SMTP id
 3f1490d57ef6-e036e6c4c52mr9697927276.0.1719931616273; Tue, 02 Jul 2024
 07:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-stoic-bettong-of-fortitude-e25611@houat>
 <f780e747-0159-48d5-aef9-2ed324feeae2@xs4all.nl> <20240702-certain-lion-of-focus-692c12@houat>
In-Reply-To: <20240702-certain-lion-of-focus-692c12@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Jul 2024 15:46:39 +0100
Message-ID: <CAPY8ntDQLiAspoNY6+HMw22xQ2eQ5FxV=QNgEhANUWnBBCcDQw@mail.gmail.com>
Subject: Re: tc358743 EDID / hotplug bug?
To: Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, 2 Jul 2024 at 15:23, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, Jul 01, 2024 at 10:29:55AM GMT, Hans Verkuil wrote:
> > Hi Maxime,
> >
> > On 28/06/2024 10:50, Maxime Ripard wrote:
> > > Hi Hans,
> > >
> > > I've been playing with the unicam driver and the TC358743 HDMI -> CSI
> > > bridge recently.
> > >
> > > The program I was testing it with had a (arguably suboptimal) pattern
> > > where it would (in a non-blocking way):
> > >
> > > In a loop:
> > >   - set EDID
> > >   - In a loop:
> > >     - call query_dv_timings
> > >     - if we have a timing matching the mode we expect:
> > >       - break the loop
> > >
> > >   - Call s_dv_timings
> > >   - Call s_fmt
> > >   - Call reqbufs
> > >   - Query and Queue all requested buffers
> > >   - Call streamon
> > >   - In a loop:
> > >     - Dequeue the events
> > >     - If there's a resolution change:
> > >       - Call streamoff
> > >       - Call reqbufs with 0 buffers to clear all buffers
> > >       - Restart the entire sequence
> > >     - Dequeue a buffer
> > >     - Queue it again
> > >
> > > This works mostly fine, but when trying to capture the boot of a device
> > > connected on the other end, I'm always getting at some point an
> > > resolution change event in the very first iteration.
> > >
> > > The event itself looks fine: there's no remaining events at any point,
> > > the sequence is correct, etc. However, this puts the s_edid call super
> > > close to streamoff and the next s_edid call.
> > >
> > > And it looks like the tc358743 driver doesn't like that very much and
> > > the HPD pin ends up in the wrong state on the next iteration: both the
> > > driver itself and the device at the other reports the hotplug pin as
> > > being low, and thus, not connected.
> > >
> > > I'm not entirely sure what is the reason, but I suspect a race in:
> > > https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/i2c/tc358743.c#L403
> > >
> > > Possibly due to the 100ms delay?
> > >
> > > I've attached a kernel log with debug logs from both v4l2 and the driver
> > > enabled.
> >
> > You forgot to attach the logs :-)
>
> Of course I did :)
>
> It should be attached this time
>
> > I don't off-hand see a race condition.
>
> Yeah, me neither. The code looked sane to me, hence that mail.
>
> > But there is an important thing to remember: the HPD is only pulled
> > high if the 5V line from the source is also high. I.e., if no source
> > is detected, then the HPD remains low.
> >
> > I don't think you state what the source device is, but make sure it
> > has 5V high. If it is low, or it toggles the 5V for some reason, then
> > that might be related to the problem. But without logs it is hard to
> > tell.
>
> It's a RaspberryPi. I was looking at the register and it doesn't detect
> HPD being high, but I'll try to see if I can find a testpoint to read
> the level.

FWIW The Pi has the HDMI 5V connected to the main 5V rail via an
RT9742SNGV [1] or AP2331W [2] for over-current protection.
It should never get dropped under normal conditions.

If you're using an Auvidea B10x board for the TC358743, then the
recent revisions have "cable detect" available on the 8pin header pin
3 [3]. I'm not aware of a point where you can probe the HPD output
easily.

  Dave

[1] https://www.richtek.com/assets/product_file/RT9742/DS9742-10.pdf
[2] https://www.diodes.com/assets/Datasheets/AP2331.pdf
[3] https://auvidea.eu/download/manual/B10x_technical_reference_1.4.pdf

> Maxime

