Return-Path: <linux-media+bounces-8294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 612018939CF
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 11:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C4C1F22446
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 09:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA8710A3E;
	Mon,  1 Apr 2024 09:54:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C096610A09
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711965257; cv=none; b=tOKd8yN/eihL09y/qDL49MaAuce0f1tzpE71T01Tdy+xvaYROzJkjdom34Sq7s7xco9gsqeTZJC+0H7ZhyrgXvtHApytJTctLiYYE0BazGtcVbWfcuLOwgcuTuVZGYwsEXUMSUEAhHOjtYhb4lTKZKAWXWw4o0bOaNssypBSVbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711965257; c=relaxed/simple;
	bh=1NBRAtXARS9GnlM8/tROzge5CMAT9g5C6SHJzj4SLYM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Kb4SR/lb0Kz22CdyuBbV7bHZpSqkern+jLjLCieZmmsZJOmZxF5ICP3gsWAYFMWLXMxJElJXNec/2b0qYgn1nN2PWshL7NmVbz/Upqb8Rf2lQoK/gmTuxV8Dwe9N9Xba1yiaV8gbDPqA4KYTvgb7yVefagDm9SEKCjvxM+u/hM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
	by mail.rmail.be (Postfix) with ESMTP id E048C4FF1F;
	Mon,  1 Apr 2024 11:45:56 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 01 Apr 2024 11:45:56 +0200
From: Maarten <maarten@rmail.be>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, John Cox <jc@kynesim.co.uk>, Dom Cobley
 <popcornmix@gmail.com>, David Plowman <david.plowman@raspberrypi.com>, Maxim
 Devaev <mdevaev@gmail.com>
Subject: Re: [RFC PATCH 13/13] staging: vc04_services: Add a V4L2 M2M codec
 driver
In-Reply-To: <fe0f9269c9f21441b2d3166e68837cdd@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-14-maarten@rmail.be>
 <5ddf8ee84e59595900cd27ca11bc7c762d327d39.camel@ndufresne.ca>
 <2123e328554f39764540aa429d2b86b8@rmail.be>
 <5d3ba5f177bfbaaafe31f456e940a92fe94f62d2.camel@ndufresne.ca>
 <fe0f9269c9f21441b2d3166e68837cdd@rmail.be>
Message-ID: <38f934b9422d82893337cd7b07c63db6@rmail.be>
X-Sender: maarten@rmail.be
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Maarten schreef op 2024-03-24 13:35:
> Nicolas Dufresne schreef op 2024-03-06 22:14:
> 
> <snip>
> 
>>> > > +	/* vb2 timestamps in nsecs, mmal in usecs */
>>> > > +	vb2->vb2_buf.timestamp = mmal_buf->pts * 1000;
>>> >
>>> > M2M drivers are not allowed to "interpret" the timesamp field. They can
>>> > only
>>> > copy it over. This scaling of the timestamp seems problematic and may
>>> > possibly
>>> > impair some userspace ability to match in and out buffers. Is there
>>> > some other
>>> > user data that could be use to maintain the lower bits ?
>>> >
>>> > I realized that it should not have worked for GStreamer, since it uses
>>> > a frame
>>> > counter as timestamp (and no real timestamp), but accidentally, it only
>>> > uses
>>> > tv_sec member (with a implicit cast from signed to unsigned, but lets
>>> > not grab
>>> > other projects issues in, unlike stateless, there is a single
>>> > representation of
>>> > it, so its less of an issue).
>>> >
>>> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/gst-plugins-good/sys/v4l2/gstv4l2bufferpool.c?ref_type=heads#L1179
>>> >
>>> > There is no requirement in the spec that tells userspace using forward
>>> > counters
>>> > to only use the seconds, so I suppose this is far from ideal.
>>> 
>>> You mean that vb2_buf.timestamp is not necessarily a time-based
>>> timestamp? I'll have to see how mmal is using the pts.
>> 
>> Correct, its opaque data from user, the spec only defines the transfer 
>> rules for
>> that data in the case that a frame is duplicated or merged.
> 
> So, I asked downstream to (if possible) handle mmal timestamps
> opaquely, which would simplify this code a lot and fix your GStreamer
> issues: https://github.com/raspberrypi/firmware/issues/1883 . We'll
> see if it's possible or not; if not I'll have to look for a way to
> present a time to mmal while keeping the opaque data intact.

Good news, it looks like the firmware is not actually using the 
timestamp, so, we can drop that part of it :-)

Maarten

