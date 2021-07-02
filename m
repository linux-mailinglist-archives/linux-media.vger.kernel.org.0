Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC113B9FD8
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 13:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhGBLgF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 07:36:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231802AbhGBLgD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 07:36:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81AAD6141C;
        Fri,  2 Jul 2021 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625225611;
        bh=KggnPXlADk0Sri+GbjI84HMBoxXRskdKAdKUlNpKUY4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=reS5zfq5Ll2jxgzFKzJqN7MEX+qE8zibQn1+uewU9Av9gO0n7AJyZSXSXFVlwsw+V
         Ce3gaCt7EOtmgSz8LNk47Apf24v+xG2kBTsQjGGVGp/CdAiTRH+GZRfuuD0p4/go6a
         An3EjSTl4rsCtb5iZ/0f7P+2dgg1ICtqJTuHGuWSEeOry7Ir40HSojA9aj2PzrHGxj
         QFXR+DwtvOo79uzkkq4CJz/uinW/QlQuoMMVBFOlCLm3l9YDDPjWN7U/X6rk9/e59w
         Im+/C4REceVup/MU7o00U3z/BFw557YvMWcZCWNA/kAeVRx/nz9Rbmtpp3UwBPpeE+
         PLKFW+Hu7JSaQ==
Date:   Fri, 2 Jul 2021 13:33:26 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     YP WU <yp.wu@mediatek.com>
Cc:     <leo.hsiao@mediatek.com>, <Lecopzer.Chen@mediatek.com>,
        <gustavoars@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Jason-BF.Huang@mediatek.com>, <francis.lee@mediatek.com>
Subject: Re: DVBS Blind scan implementation of Linux DVB
Message-ID: <20210702133326.654ac68d@coco.lan>
In-Reply-To: <20210702101649.12668-1-yp.wu@mediatek.com>
References: <20210702101649.12668-1-yp.wu@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi YP,

Em Fri, 2 Jul 2021 18:16:49 +0800
YP WU <yp.wu@mediatek.com> escreveu:

> Hello, dvb frontend maintainer:
> 	We have an internal discussion about how to implement DVBS blind scan.
> Currently, we can't see any structs and IOCTL commands related to DVBS blind scan in Linux-dvb framework.
> So we want to confirm if Linux-dvb framework have inherent flow of DVBS blind scan or not.
> If the answer is yes, could you tell us how to work in Linux-dvb.
> If the answer is no, do you have any suggestions or design scenario for DVBS blind scan?

Right now, the DVB core lacks support for doing blind scan, basically
because no driver currently implements it.

Right now, a couple of userspace programs implement blind scan, but
at the hard way.

I discussed that in the past with another developer that wanted to 
implement blind scans, but he ended working with something else.

-

There is an API on V4L2 that it is somewhat similar to blind
scan. It is meant to auto-tune FM radio channels:

	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-s-hw-freq-seek.html

The way it works there is that the tuning parameters are set
at the ioctl, together with the scan direction. When this ioctl
is called, the tuner starts seeking the next channel on a given
frequency range.

I suspect that a similar way could be implemented at DTV side,
using dvbv5 API. This would work by adding a new DTV command
that would start to blind scan a single channel. Something like:

	DTV_BLIND_SCAN_UP

Subsequent calls would find the next channels.

On other words, userspace would send a series of properties to setup 
the initial frequency and the digital TV standard, and, instead of
using DTV_TUNE, the parameters will end with DTV_BLIND_SCAN_UP.

So, a blind scan properties would be something like:

	DTV_FREQUENCY = 573000000
	DTV_DELIVERY_SYSTEM = SYS_DVBC
	... # other properties if needed
	DTV_BLIND_SCAN_UP

	ioctl(FE_SET_PROPERTY)

The frontend will then seek for valid frequency >= DTV_FREQUENCY.

While a new channel is found and the frequency is below to the
highest FE frequency, it would keep doing:

	DTV_FREQUENCY = <previous freq> + <previous_channel_bandwidth)
	DTV_DELIVERY_SYSTEM = SYS_DVBC
	... # other properties if needed
	DTV_BLIND_SCAN_UP

	ioctl(FE_SET_PROPERTY)

-

Now, the userspace application needs to know when the blind
scan finds the next channel, or if it finished without finding
anything.

The normal way the DVB subsystem works is that FE_SET_PROPERTY
is an async operation: it shouldn't block until a command is
completed.

So, making userspace to simply wait for it to complete is not
a good idea.

So, the best is to use the poll() ioctl, E.g.:

Userspace (or userspace thread) can call poll() system call, which is 
meant    to make userspace to sleep until an async event 
(read/write/error) happens.

Right now, the core already implements poll() support: it returns
EPOLLIN | EPOLLRDNORM | EPOLLPRI if the frontend status changes.

As we have empty flags, all the DVB core need is to add some
flags that are specific to the blind scan.

So, let's say we add two new flags at fe_status:

	FE_SCAN_FOUND_CHANNEL
	FE_SCAN_DONE

The userspace will then call poll() waiting for the 

Once userspace gets aware that a blind scan happened, as a
call to poll() waiting for a POLLIN event. it will then
read the FE status. If it returns FE_SCAN_DONE, the blind
scan finished. Otherwise, it can call FE_GET_PROPERTY in order to 
get the tuned frequencies and the the modulation parameters for
the detected channel.

-

So, in summary, I guess we just need to add a new DTV property,
and two flags to fe_status to make such functionality supported
by the DVB core.

Thanks,
Mauro
