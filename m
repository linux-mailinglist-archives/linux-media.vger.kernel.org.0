Return-Path: <linux-media+bounces-18151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6C974DDD
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 11:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39AF11C21C49
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 09:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4138154C05;
	Wed, 11 Sep 2024 09:03:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDA415381A
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726045412; cv=none; b=Mmd+deEy+NliSA9Wwc4gE5k4CESer/qJyoeow9f8FxzxIJSCCRKpw9DQb8J8HyLmKMH2IrEpQ2rVheRCBz7vjoTYwUK9AanNlY3xnMRI/QNY+QEXT1/CNr5l8nfRgmGzaXfWb9s2kGDJthWLu2s/6R/8exL+3tEmKbN/aUDXEBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726045412; c=relaxed/simple;
	bh=Td/aSLnZG1wTQz54WvROErS3bCm1Y0+IKZDoHapVEgA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=E8/SDw8/BI/Gd3JT//PD1zaW1uM84UAuMZp0WEF8CwaXGKAenHC+E+p+vGHhLBa9zkgBuCXB0IbWoTH5I4p1/5hfXWRxtfuved+27YVz0ObAfrQ+GUoqBDjwtK75lD6JSt+FQ9q8K2I2sYynMmaxDmcaZ//8GtCNymGlMXFAlIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B118C4CEC5;
	Wed, 11 Sep 2024 09:03:28 +0000 (UTC)
Message-ID: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
Date: Wed, 11 Sep 2024 11:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Media Summit September 16th: Final Agenda (v7)
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Martin Hecht <martin.hecht@avnet.eu>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
 Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Hidenori Kobayashi <hidenorik@chromium.org>,
 "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

Here is my seventh and final version of the agenda for the media summit. As always,
all times (except lunch time) are guesstimates!

The media summit will be held on Monday September 16th. Avnet Silica has very
kindly offered to host this summit at their Vienna office, which is about 35
minutes by public transport from the Open Source Summit Europe venue
(https://events.linuxfoundation.org/open-source-summit-europe/OSSE).

Avnet Silica Office Location:

Schönbrunner Str. 297/307, 1120 Vienna, Austria

https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu

Refreshments are available during the day.

Lunch is held at Schönbrunner Stöckl (https://www.schoenbrunnerstoeckl.com/), close
to the Avnet Silica office. The lunch is sponsored by Ideas on Board and Cisco Systems
Norway.

Regarding the face mask policy: we will follow the same guidance that the
Linux Foundation gives for the EOSS conference:

https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety


In-Person Attendees:

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
Salahaldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera AG)
Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel Maintainer)
Steve Cho <stevecho@chromium.org> (Google)
Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
Martin Hecht <martin.hecht@avnet.eu> (Avnet)
Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
Sean Young <sean@mess.org>
Jerry W Hu <jerry.w.hu@intel.com> (Intel)

Remote Attendees (using MS Teams):

Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
Rishikesh Donadkar <r-donadkar@ti.com> (TI)
Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora)
Tomasz Figa <tfiga@chromium.org> (Google)
Hidenori Kobayashi <hidenorik@chromium.org> (Google)
Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
Devarsh Thakkar <devarsht@ti.com> (TI)

All remote participants listed above should have received an invite with connection details.
If not, please contact Martin Hecht <martin.hecht@avnet.eu> asap.

If any information above is incorrect, or if I missed someone, then please let me know.

We have 18 confirmed in-person participants, so we're full.
If you want to join remotely, then contact me and I'll add you to that list.

Draft agenda:

8:45-9:15: Get settled :-)

9:15-9:25: Hans: Quick introduction

9:25-11:00: Ricardo: multi-committer model using gitlab

11:00-11:15: break

11:15-12:15: Jacopo: Multi-context support in V4L2

12:15-13:30: Lunch at Schönbrunner Stöckl

13:30-14:00: Tomasz: Current state of videobuf2, its limitations and the paths forward.

14:00-14:45: Laurent: subdevs, state, and usage of the media controller device to submit requests.

14:45-15:00: break

15:00-15:30: Sean: new tooling for infrared:

- What it is and what it can do (love to hear any feedback of course)
- Where it should be hosted? (I hope gitlab fdo, who do I ask)
- What needs to be in place for a release?
- This tool replaces ir-ctl and ir-keytable. How we phase them out?

15:30-16:00: Daniel: Rust in the media subsystem

16:00-16:15: break

16:15-16:30: Hans: UVC maintenance

16:30-17:00: Steve Cho:

- V4L2 testing on Chromium using virtual video decode driver (visl)
- V4L2 video decoding testing with KernelCI

17:00-17:30: Laurent: Should media drivers depend on CONFIG_PM?
See here for more info:
https://lore.kernel.org/linux-media/20240825222455.GA24390@pendragon.ideasonboard.com/

17:30-18:00: Any other topics and feedback on what can be improved next media summit.

Hope to see you all on Monday!

Regards,

	Hans



