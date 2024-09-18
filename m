Return-Path: <linux-media+bounces-18384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C997BA2B
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 11:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08506B27496
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 09:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFAF17838A;
	Wed, 18 Sep 2024 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="B9ovl7na"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB1282E5
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726651870; cv=pass; b=WxHHLHNYR5iaj5L4ho8QMcAGxI/zNekMrZ2Rd3Q/+pyMKyLxal5zSrZZkeJWXsO+rZMo9sOnoQY3DtVjAVVms6gNq47r5eVEUnZiGPF0/OF5AEQeWtkeLjG9twozwbLMD1cEws2LH8XOe3MgiwFR10bLx3VzGCbdICR2R3tpLpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726651870; c=relaxed/simple;
	bh=GBgwBB8rUyVLR8/BgnHV5wlDoUv7IULroUa7Gi5u4y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjgOUXrbOYv+/x2JtIdhTaWN1ZfBZnDqxlG/t6Nw3/0UmCUW6VAzES5Mq/h5qV0S3PVP84B48AT6GIyd/6uMzLQFjy7QrGemeV84cvCmDUA67jBEs5QG4jbL8XIf95jIP0c01Oy4AKHGmRKYaAH7w5zp7weCYpeAEPjlPuDhX1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=B9ovl7na; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1726651829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SUVGGsMQZ52COQd9V9x20LcUTrpfTRi2Q4tDtgwDmpzBuS7H0CwHUqk1ZZqY0yqnrhLz2hUJQT9XIDaz2eBH49XNTdRxcXfaahnURvg2dUcvTAdGnSmEplT8fpPtim+Ar5JsP4CulwAMgaUaHaavAw5V4lKKO27QIjVe+cDXqk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1726651829; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cQY7y7sG5cEMuDClNa2UjiGsfGtacRkDJTJ5vBBjqLc=; 
	b=XF82i9WSTIL4y9zFSX2Jt7X7gZ4C2rH2C5HyLhKcD/xdHDQVb3L1UITUPnbu9sXKiHO+5ry7oHq3fTvxcFLI1aQAxryn/J5rQNyUQf2R4hY9TfgEcTplY0RajwRkpQcNCnBzn9ipG+H8rnv+yxOHgvUlS6iSoMybVLjQB6oXDQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726651829;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=cQY7y7sG5cEMuDClNa2UjiGsfGtacRkDJTJ5vBBjqLc=;
	b=B9ovl7nasZ8odJ+u/XhRku+IohGMhOAWw34xCOcMfp6BDQWxscIa4s2i9As6kV71
	H9dF2+0jlW0HLXC9blgYMZE8tZii8LCAdLdIcOT5hdxSV1273ij8hccTsQreytp8bra
	n4XPPkl6ZtW+vVAMUZZjtSTB1rA1KS5Z/Cj4cWLc=
Received: by mx.zohomail.com with SMTPS id 1726651826978177.927707380504;
	Wed, 18 Sep 2024 02:30:26 -0700 (PDT)
Date: Wed, 18 Sep 2024 11:30:20 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918092454.21884920@sal.lan>
X-ZohoMailClient: External

Hey Hans & Mauro,

On 18.09.2024 09:24, Mauro Carvalho Chehab wrote:
>Em Tue, 17 Sep 2024 14:52:19 +0200
>Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>
>> Hi Sebastian,
>>
>> On 9/17/24 11:17 AM, Sebastian Fricke wrote:
>> > Greetings,
>> >
>> > I remember that we wanted to still define a couple of processes for the
>> > multi-committer model for which we hadn't have the time on the media
>> > summit. Just would like to gather who would be interested to meet for
>> > that, where we meet (probably LPC venue) and when (Laurent just told me
>> > that Friday is probably a good slot for that).
>>
>> Can you refresh my memory which processes need more work?

Well I basically remember that we had a bunch of topics in our meetings
that we wanted to skip in order to talk about them here.
We looked at the documentation from DRM and wanted to think about
equivalent policies for media.
https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html#where-do-i-apply-my-patch

Also there were topics like how to handle backports. 

>
>I have the same doubt. As discussed during the summit, Hans and I had some
>discussions yesterday, to address a few details. For both of us the process
>sounds well defined.

I know that we scraped a lot of topics in the meeting at the media
summit and I am not sure about the scope you discussed with Ricardo
yesterday. So, we don't have to meet if you feel like we covered
everything, just wanted to use the opportunity as long as we are all in
the same place.

Regards,
Sebastian

>
>From my personal notes, this will be the new process:
>
>- committers will merge patches at media-committers.git tree at fdo,
>  provided that they'll follow the rules defined on a committers agreement
>  and (partially?) enforced by media-ci checks;
>- core committers follow the same rules, with a broader privilege of
>  changing kernel API/ABI;
>- committers will ensure that patchwork will reflect the review process of
>  the patches;
>- maintainers will double-check if everything is ok and, if ok, merge the
>  changes at linuxtv.org. We intend to rename the tree there to "media.git",
>  being the main tree to be used for development;
>- pull requests will keep using the same process as currently. The only
>  change is that the media-stage.git tree will be renamed to "media.git";
>- maintainers will periodically send patches upstream.
>
>The media-commiters.git tree at fdo might be rebased if needed; the
>media.git tree at linuxtv.org is stable. A large effort will be taken to
>avoid rebasing it.
>
>We may need some helper scripts and/or use pwclient to keep patchwork
>updated after committers reviews.
>
>Such process will start after -rc1.
>
>We intend to rename media-state to media at linuxtv after -rc1.
>
>It is up to maintainers to invite and decide who will be a committer.
>
>All committers/core-committers need to explicitly accept a committers
>agreement. We may end starting without it at the beginning, but as soon
>as a final version of such agreement is written, everyone with access to
>the media-committers tree have to explicitly accept to keep their
>commit rights on such tree.
>
>The only part that still require some work is the committers
>agreement. I'm working on it together with Hans. As soon as we have
>a version, we'll submit a patch to the kernel, to add it to the
>media developer's profile[1].
>
>[1] Documentation/driver-api/media/maintainer-entry-profile.rst
>
>>
>> For me I think Friday afternoon (probably after 14:00) is the only
>> option, or perhaps Thursday after the Camera MC.
>
>I can't meet on Friday afternoon. I probably will be on another
>event on Thursday (Openeuler MC).
>
>>
>> Regards,
>>
>> 	Hans
>>
>> >
>> > Regards,
>> > Sebastian
>> >
>> > On 11.09.2024 11:03, Hans Verkuil wrote:
>> >> Hi all,
>> >>
>> >> Here is my seventh and final version of the agenda for the media
>> >> summit. As always,
>> >> all times (except lunch time) are guesstimates!
>> >>
>> >> The media summit will be held on Monday September 16th. Avnet Silica
>> >> has very
>> >> kindly offered to host this summit at their Vienna office, which is
>> >> about 35
>> >> minutes by public transport from the Open Source Summit Europe venue
>> >> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
>> >>
>> >> Avnet Silica Office Location:
>> >>
>> >> Schönbrunner Str. 297/307, 1120 Vienna, Austria
>> >>
>> >> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
>> >>
>> >> Refreshments are available during the day.
>> >>
>> >> Lunch is held at Schönbrunner Stöckl
>> >> (https://www.schoenbrunnerstoeckl.com/), close
>> >> to the Avnet Silica office. The lunch is sponsored by Ideas on Board
>> >> and Cisco Systems
>> >> Norway.
>> >>
>> >> Regarding the face mask policy: we will follow the same guidance that the
>> >> Linux Foundation gives for the EOSS conference:
>> >>
>> >> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
>> >>
>> >>
>> >> In-Person Attendees:
>> >>
>> >> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>> >> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
>> >> Salahaldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera
>> >> AG)
>> >> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel
>> >> Maintainer)
>> >> Steve Cho <stevecho@chromium.org> (Google)
>> >> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
>> >> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
>> >> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
>> >> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
>> >> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
>> >> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
>> >> Ricardo Ribalda <ribalda@chromium.org> (Google)
>> >> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>> >> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
>> >> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
>> >> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
>> >> Sean Young <sean@mess.org>
>> >> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
>> >>
>> >> Remote Attendees (using MS Teams):
>> >>
>> >> Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
>> >> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
>> >> Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora)
>> >> Tomasz Figa <tfiga@chromium.org> (Google)
>> >> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
>> >> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
>> >> Devarsh Thakkar <devarsht@ti.com> (TI)
>> >>
>> >> All remote participants listed above should have received an invite
>> >> with connection details.
>> >> If not, please contact Martin Hecht <martin.hecht@avnet.eu> asap.
>> >>
>> >> If any information above is incorrect, or if I missed someone, then
>> >> please let me know.
>> >>
>> >> We have 18 confirmed in-person participants, so we're full.
>> >> If you want to join remotely, then contact me and I'll add you to that
>> >> list.
>> >>
>> >> Draft agenda:
>> >>
>> >> 8:45-9:15: Get settled :-)
>> >>
>> >> 9:15-9:25: Hans: Quick introduction
>> >>
>> >> 9:25-11:00: Ricardo: multi-committer model using gitlab
>> >>
>> >> 11:00-11:15: break
>> >>
>> >> 11:15-12:15: Jacopo: Multi-context support in V4L2
>> >>
>> >> 12:15-13:30: Lunch at Schönbrunner Stöckl
>> >>
>> >> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and
>> >> the paths forward.
>> >>
>> >> 14:00-14:45: Laurent: subdevs, state, and usage of the media
>> >> controller device to submit requests.
>> >>
>> >> 14:45-15:00: break
>> >>
>> >> 15:00-15:30: Sean: new tooling for infrared:
>> >>
>> >> - What it is and what it can do (love to hear any feedback of course)
>> >> - Where it should be hosted? (I hope gitlab fdo, who do I ask)
>> >> - What needs to be in place for a release?
>> >> - This tool replaces ir-ctl and ir-keytable. How we phase them out?
>> >>
>> >> 15:30-16:00: Daniel: Rust in the media subsystem
>> >>
>> >> 16:00-16:15: break
>> >>
>> >> 16:15-16:30: Hans: UVC maintenance
>> >>
>> >> 16:30-17:00: Steve Cho:
>> >>
>> >> - V4L2 testing on Chromium using virtual video decode driver (visl)
>> >> - V4L2 video decoding testing with KernelCI
>> >>
>> >> 17:00-17:30: Laurent: Should media drivers depend on CONFIG_PM?
>> >> See here for more info:
>> >> https://lore.kernel.org/linux-media/20240825222455.GA24390@pendragon.ideasonboard.com/
>> >>
>> >> 17:30-18:00: Any other topics and feedback on what can be improved
>> >> next media summit.
>> >>
>> >> Hope to see you all on Monday!
>> >>
>> >> Regards,
>> >>
>> >>     Hans
>> >>
>> >>
>> >>
>> > Sebastian Fricke
>> > Consultant Software Engineer
>> >
>> > Collabora Ltd
>> > Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
>> > Registered in England & Wales no 5513718.
>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

