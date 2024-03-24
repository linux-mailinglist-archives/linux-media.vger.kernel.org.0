Return-Path: <linux-media+bounces-7689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B21887CBF
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 13:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35025281807
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 12:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F19EBA55;
	Sun, 24 Mar 2024 12:36:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BED963D
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711283770; cv=none; b=IQ72IueyHB2gg6SYIDddxiZ1hd5uuOXfUZlNqt8R8KwSr1N808Ex0GzWbz/yKBFh/cs3of7eWnwVD0lk9VxIR+DLdb3R5jAXR5hxJ38oG2bvO/b8EIHHj2La50cZ3pAWcW5AEQsPvhqQgaq2OLCrfLJhkoR9DI/i2Z5mFx/llqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711283770; c=relaxed/simple;
	bh=EC7xYylJesOK7jjapk/iajewr1LbWRC4/DWaMDdnPf8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=o2WOxDi8Ef/+NcGGgI7eQCtQUJfmoklmPYTgSmNYUhvRxbO1S5ier2RSk4giBjlSg9msfYsrRloj0jeuzV08OuoEb6HYY53oz1vZRwLoxXqdHrYdXanIbdRpigVhVz5AkuiD+R6IHxhu9v/Bdh5GMZXWJZU0t+/MJvtx4/EAaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
	by mail.rmail.be (Postfix) with ESMTP id 455D74EC89;
	Sun, 24 Mar 2024 13:35:57 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 24 Mar 2024 13:35:57 +0100
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
In-Reply-To: <5d3ba5f177bfbaaafe31f456e940a92fe94f62d2.camel@ndufresne.ca>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-14-maarten@rmail.be>
 <5ddf8ee84e59595900cd27ca11bc7c762d327d39.camel@ndufresne.ca>
 <2123e328554f39764540aa429d2b86b8@rmail.be>
 <5d3ba5f177bfbaaafe31f456e940a92fe94f62d2.camel@ndufresne.ca>
Message-ID: <fe0f9269c9f21441b2d3166e68837cdd@rmail.be>
X-Sender: maarten@rmail.be
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Nicolas Dufresne schreef op 2024-03-06 22:14:

<snip>

>> > > +	/* vb2 timestamps in nsecs, mmal in usecs */
>> > > +	vb2->vb2_buf.timestamp = mmal_buf->pts * 1000;
>> >
>> > M2M drivers are not allowed to "interpret" the timesamp field. They can
>> > only
>> > copy it over. This scaling of the timestamp seems problematic and may
>> > possibly
>> > impair some userspace ability to match in and out buffers. Is there
>> > some other
>> > user data that could be use to maintain the lower bits ?
>> >
>> > I realized that it should not have worked for GStreamer, since it uses
>> > a frame
>> > counter as timestamp (and no real timestamp), but accidentally, it only
>> > uses
>> > tv_sec member (with a implicit cast from signed to unsigned, but lets
>> > not grab
>> > other projects issues in, unlike stateless, there is a single
>> > representation of
>> > it, so its less of an issue).
>> >
>> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/gst-plugins-good/sys/v4l2/gstv4l2bufferpool.c?ref_type=heads#L1179
>> >
>> > There is no requirement in the spec that tells userspace using forward
>> > counters
>> > to only use the seconds, so I suppose this is far from ideal.
>> 
>> You mean that vb2_buf.timestamp is not necessarily a time-based
>> timestamp? I'll have to see how mmal is using the pts.
> 
> Correct, its opaque data from user, the spec only defines the transfer 
> rules for
> that data in the case that a frame is duplicated or merged.

So, I asked downstream to (if possible) handle mmal timestamps opaquely, 
which would simplify this code a lot and fix your GStreamer issues: 
https://github.com/raspberrypi/firmware/issues/1883 . We'll see if it's 
possible or not; if not I'll have to look for a way to present a time to 
mmal while keeping the opaque data intact.

Maarten

