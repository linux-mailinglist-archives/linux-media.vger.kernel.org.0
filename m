Return-Path: <linux-media+bounces-18002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D318C971C2A
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 689E5B223E1
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBEA1BA26A;
	Mon,  9 Sep 2024 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MIQ16EwI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1989B1B3F23
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725891104; cv=none; b=lVyubD9dQc6SfhRFU1E32pXwGVHN78G6tBCP8QuBDVxfcq4eSF3Sxh/dRz6fmjU6jClraU8/lYm9WWLEhK7W6m/188rx6d4jX1AXn0liZufVGIYqdnWoeUO8jfyVYxF2coPDLT4act3RfXEGjjGX2rUfExgNjENXvRk9jkcbngM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725891104; c=relaxed/simple;
	bh=TTTecKf5gRK4VxE6OYKcDH+HRqhiEfhTuxzVslvugKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWZpJy/rZVmD2WhcD5kZfVLYadX8JuflgzVU4YodRWcRElIpmGR9QREuXk4gynkk+D+85Pn2t6hfQ4gJapB8I3MKeKHzI7uCHyiq80lrlNSCS0kfnKyZ0XrqVTxyX1YfQ5tuaHyRZ5NwZrPGo4/vsIcOuDqc0+tiGnhxkGlfl0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MIQ16EwI; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a9ac0092d9so128479485a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2024 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1725891101; x=1726495901; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TTTecKf5gRK4VxE6OYKcDH+HRqhiEfhTuxzVslvugKQ=;
        b=MIQ16EwInrfEzitE+7UuXMLHmR2OEsnPozvi492aRpuwqMJcpFmArcHxM92mYGZGnq
         8toN3W1OTlz71DfT/UutnpSdGn9eJCsjW7ThabUYeEfFKJwuKVF+0bVo4tAMERR8giy2
         AxuP5w572sTMXGbSRobzMX7v1e60GVgFCypwsZx5ZHoFMvEjR3Sdab/C5SByI/QIuGvc
         72GyjmYsBQ/t541jAXi6rfRnBhJP6NAESwDVmayM6cOaXfrR7cFwOUGoIp4k9EpSxqeo
         q/k2eyumm5t9zf9+fXZ23ZQcuw8cJ1+JTq8Yv1BP5teezd3DnwbcMvOK1sysLZIHFwQn
         eX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725891101; x=1726495901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTTecKf5gRK4VxE6OYKcDH+HRqhiEfhTuxzVslvugKQ=;
        b=Q4uUGWp1zWmDYbsBFQwGKkcHXVDrZ9Km60h46Q05pUrx3ctsI84L08a1KfWJbJfzcg
         U3GN2waB0Y1t8zqI5MdOkNQ8lutqwmIwXaSy7h5JADV0VQdp+VucsX6eDgLFZjMFd0e+
         RssokZR9a7Iz1RuiaVok3Pgc/Mi+A1sfh0vLtZXjusqy+seNtnwDKYSFS2yACf8HNrnC
         Z45byWnQzR/klfuPKLwwKUT2tXtBbPj8tLP3d92Lmcnuwi7BVWTdX6EbU0zt2LU2jRj9
         Dztre7Tc2D4ypzKICaMuZcoOR3z68GjX0xJnr/nLt+pngUZjPHIzv7ee4kGJmToFUs8S
         Z5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfbEGd1MggJn4RLBPyjswaS3Npp6qKsosnOnDp2Fbn35hmywrhot50AoDjMZFYaItduWy4NXtSohouBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxUJYH+IRMG2IF0LB+SpRif+24yVjmWz6Bn792tij1+FRcMbf
	CiWvnZOZczUB91VVOyObixWjSxR7w13J8ikg/mnJSOYnp+Yy7qSyeBa7COHhfdcS1c5sec0bZFb
	0wPccTfIwaKr3YKCkrW3JCpCHyLkKStKKQK+FdA==
X-Google-Smtp-Source: AGHT+IEtCvDSgBbCObnXmRlK9UqSMVbUaq87wHHqbLyuFwlUPu/vHanhpqCju32S2htvqHKFhc4Hf9/7rD03Epv2/BE=
X-Received: by 2002:a05:620a:244a:b0:7a9:bd11:38d with SMTP id
 af79cd13be357-7a9bd110478mr185126785a.27.1725891100859; Mon, 09 Sep 2024
 07:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729090042.GA2725@pendragon.ideasonboard.com> <CAEmqJPoHUXpX3F7dDKAYCr59YKCWz9rggKD5C6hTyyOSr=EiaQ@mail.gmail.com>
In-Reply-To: <CAEmqJPoHUXpX3F7dDKAYCr59YKCWz9rggKD5C6hTyyOSr=EiaQ@mail.gmail.com>
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 9 Sep 2024 15:11:29 +0100
Message-ID: <CAHW6GYLD_Dxbw0k_BG5n40bGmOCecGs2Obgud=f8RMnN=qgTXw@mail.gmail.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, libcamera-devel@lists.libcamera.org, 
	linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi everyone

On Fri, 30 Aug 2024 at 10:34, Naushir Patuck <naush@raspberrypi.com> wrote:
>
> Hi Laurent,
>
> Here are a few agenda items that RPi would like to include in the discussions:
>
> 1) Raw reprocessing API
> 2) Per-stream control RFC
> 3) Non-image data streams

I'd like to add

4) Passing IPA tuning parameters (i.e. our tuning file, or its
contents) to the camera when it is acquired/opened.

This would enable us to run two instances of the same camera at the
same time, but with different tuning parameters. Particularly with Pi
5, which has two camera connectors, we're getting bashed over this
repeatedly.

Unfortunately, I'm not able to attend the workshop, but please
consider me there in spirit!

Thanks
David

>
> Thanks,
> Naush
>
> On Mon, 29 Jul 2024 at 10:01, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello everybody,
> >
> > Following the success of our workshop in Brussels in February, we would
> > like to host another event in September.
> >
> > We have evaluated different options, and opted for week 38 in Vienna.
> > The city will host during that week the Linux Media Summit (Monday the
> > 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
> > the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
> > [3]), and we expect that co-locating with those events will ease travel
> > for attendees of the libcamera workshop.
> >
> > The week is already busy with camera-related events on Monday with the
> > Linux Media Summit, and on Thursday afternoon with the Complex Camera
> > micro-conference at LPC ([4]). We have therefore selected Tuesday the
> > 17th for libcamera.
> >
> > To help us plan the venue, could you please register your interest by
> > replying to this e-mail, either publicly, or in private to Kieran and me
> > ? The event will be free of charge for attendees.
> >
> > Please also let us know if you have any preferred discussion topics you
> > would like to include. We will draft and circulate an agenda in the next
> > few weeks.
> >
> > [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
> > [2] https://events.linuxfoundation.org/open-source-summit-europe/
> > [3] https://lpc.events/
> > [4] https://lpc.events/event/18/sessions/193/
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

