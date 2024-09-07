Return-Path: <linux-media+bounces-17877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 425FC970329
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 18:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ADC31C2165C
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 16:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4950215ECD7;
	Sat,  7 Sep 2024 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bGOMl3Tv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366828FC
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725726585; cv=none; b=mj1M0bMk80wuAB1X0XUDrhAXVxOZD1mYFu0enHDAayFSQQpR7CwxD+16Wwa0kYkdhpk4Ew3A2A7hNs43hHLmBOOrmqFqW1B4aCUJZwWJsQNbOvSFiLaO5Nrf+zRCkRbuXy254owryV+noy9f6xjzMXMdljebbbKbPWiYiY1R1fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725726585; c=relaxed/simple;
	bh=E9W2fKcWdKooFnQMixS6yyxiOdRuH1rfI3hZbCelnfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOCEjizqamMFCLRBo28FUow/BeUggESv21+Z9waTp8t9w6qlxGUE0DVSvT6/NouMHbflb1C9l6veGPq9+N21C/BGa39iTsFsUmqG+zzXx3GypFiaec1ful2cRFVhmDSFdfTwEbOFnyx6FCyvI68f2mVehJPwHPm/Nf6xBpXtRa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bGOMl3Tv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C126A593;
	Sat,  7 Sep 2024 18:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725726504;
	bh=E9W2fKcWdKooFnQMixS6yyxiOdRuH1rfI3hZbCelnfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGOMl3Tv79Z5e1+LTYAe1GIw4gGc0/rt1PD5q9UKmmz5sF3joHZVj/dS2YxVoRETW
	 HGQUUWhi8d2oVnSYQ7SUINAXFv3VndYS73RsFEzQ1zw+VGYLw5kvRcalQXLBlmtWG+
	 45J77ETFeZno3dZ/nVeORtAmhvG08vVcm12dHQOw=
Date: Sat, 7 Sep 2024 19:29:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
Message-ID: <20240907162936.GD15491@pendragon.ideasonboard.com>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
 <20240906101141.451db4f4@foz.lan>
 <12c1a383-83ef-4989-85b4-ae696da9ba5d@xs4all.nl>
 <20240907114602.GB15491@pendragon.ideasonboard.com>
 <0a282bd5-d70a-436d-b00f-5710872bfc60@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a282bd5-d70a-436d-b00f-5710872bfc60@xs4all.nl>

On Sat, Sep 07, 2024 at 01:55:47PM +0200, Hans Verkuil wrote:
> On 07/09/2024 13:46, Laurent Pinchart wrote:
> > On Sat, Sep 07, 2024 at 10:02:07AM +0200, Hans Verkuil wrote:
> >> On 06/09/2024 10:11, Mauro Carvalho Chehab wrote:
> >>> Em Thu, 5 Sep 2024 09:16:27 +0200 Hans Verkuil escreveu:
> >>>
> >>>> Hi all,
> >>>>
> >>>> Here is my fifth (and likely final) stab at an agenda for the media summit. As always,
> >>>> it is subject to change and all times are guesstimates!
> >>>>
> >>>> The media summit will be held on Monday September 16th. Avnet Silica has very
> >>>> kindly offered to host this summit at their Vienna office, which is about 35
> >>>> minutes by public transport from the Open Source Summit Europe venue
> >>>> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> >>>>
> >>>> Avnet Silica Office Location:
> >>>>
> >>>> Schönbrunner Str. 297/307, 1120 Vienna, Austria
> >>>>
> >>>> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> >>>>
> >>>> Refreshments are available during the day.
> >>>>
> >>>> Lunch is held at Schönbrunner Stöckl (https://www.schoenbrunnerstoeckl.com/), close
> >>>> to the Avnet Silica office. The lunch is sponsored by Ideas on Board and Cisco Systems
> >>>> Norway.
> >>>>
> >>>> Regarding the face mask policy: we will follow the same guidance that the
> >>>> Linux Foundation gives for the EOSS conference:
> >>>>
> >>>> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
> >>>>
> >>>>
> >>>> In-Person Attendees:
> >>>>
> >>>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> >>>> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> >>>> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel Maintainer)
> >>>> Steve Cho <stevecho@chromium.org> (Google)
> >>>> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> >>>> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> >>>> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> >>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> >>>> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> >>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> >>>> Ricardo Ribalda <ribalda@chromium.org> (Google)
> >>>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> >>>> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
> >>>> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> >>>> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
> >>>> Sean Young <sean@mess.org>
> >>>> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
> >>>>
> >>>> Remote Attendees (using MS Teams):
> >>>>
> >>>> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
> >>>> Tomasz Figa <tfiga@chromium.org> (Google)
> >>>> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> >>>> Devarsh Thakkar <devarsht@ti.com> (TI)
> >>>>
> >>>> Note: information on how to connect remotely will come later.
> >>>>
> >>>> If any information above is incorrect, or if I missed someone, then please let me know.
> >>>>
> >>>> We are currently 17 confirmed in-person participants, so we're pretty much full.
> >>>> If you want to join remotely, then contact me and I'll add you to that list.
> >>>>
> >>>> Draft agenda:
> >>>>
> >>>> 8:45-9:15: get settled :-)
> >>>>
> >>>> 9:15-9:25: Hans: Quick introduction
> >>>>
> >>>> 9:25-11:00: Ricardo: multi-committer model using gitlab
> >>>
> >>> As part of such discussion, IMO some topics that should be covered:
> >>>
> >>> 1. All committers shall use a common procedure for all merges.
> >>>
> >>>    This is easy said than done. So, IMO, it is needed some common scripts
> >>>    to be used by all committers. On my tests when merging two PRs there,
> >>>    those seems to be the minimal set of scripts that are needed:
> >>>
> >>>    a) script to create a new topic branch at linux-media/users/<user>
> >>>       The input parameter is the message-ID, e. g. something like:
> >>>
> >>> 	create_media_staging_topic <topic_name> <message_id>
> >>>
> >>>       (eventually with an extra parameter with the name of the tree)
> >>>
> >>>       It shall use patchwork REST interface to get the patches - or at least
> >>>       to check if all patches are there (and then use b4).
> >>>
> >>>       such script needs to work with a single patch, a patch series and a
> >>>       pull request.
> >>>
> >>>       the message ID of every patch, including the PR should be stored at
> >>>       the MR, as this will be needed to later update patchwork.
> >>>
> >>>    b) once gitlab CI runs, there are two possible outcomes: patches may
> >>>       pass or not. If they pass, a MR will be created and eventually be
> >>>       merged.
> >>>
> >>>       Either merged or not (because something failed or the patches require
> >>>       more work), the patchwork status of the patch require changes to
> >>>       reflect what happened. IMO, another script is needed to update the
> >>>       patch/patch series/PR on patchwork on a consistent way.
> >>>
> >>>       This is actually a *big* gap we have here. I have a script that 
> >>>       manually check patchwork status and the gap is huge. currently,
> >>>       there are 73 patches that seems to be merged, but patchwork was not
> >>>       updated.
> >>>
> >>>       From what I noticed, some PR submitters almost never update patchwork
> >>>       after the merges.
> >>>
> >>>       So another script to solve this gap is needed, doing updates on all 
> >>>       patches that were picked by the first script. Something like:
> >>>
> >>>       update_patchwork_from_topic <topic_name> <new_status>
> >>>
> >>>       This would likely need to use some logic to pick the message IDs
> >>>       of the patch inside the MR.
> >>>
> >>>       Such script could also check for previous versions of the patch
> >>>       and for identical patches (it is somewhat common to receive identical
> >>>       patches with trivial fixes from different developers).
> >>>
> >>>    Someone needs to work on such script, as otherwise the multi committers
> >>>    model may fail, and we risk needing to return back to the current model.
> >>>
> >>> 2. The mailbomb script that notifies when a patch is merged at media-stage
> >>>    we're using right now doesn't work with well with multiple committers.
> >>>
> >>>    Right now, the tree at linuxtv runs it, but it might end sending patches
> >>>    to the author and to linuxtv-commits ML that reached upstream from other
> >>>    trees. It has some logic to prevent that, but it is not bulletproof.
> >>>  
> >>>    A replacement script is needed. Perhaps this can be executed together
> >>>    with the patchwork script (1B) at the committer's machine.
> >>>
> >>> 3. Staging require different rules, as smatch/spatch/sparse/checkpatch
> >>>    warnings and errors can be acceptable.
> >>>
> >>> 4. We need to have some sort of "honour code": if undesired behavior
> >>>    is noticed, maintainers may temporarily (or permanently) revoke
> >>>    committer rights.
> >>>
> >>>    Hopefully, this will never happen, but, if it happens, a rebase
> >>>    of media-staging tree may be needed.
> >>>
> >>> 5. The procedure for fixes wil remain the same. We'll have already enough
> >>>    things to make it work. Let's not add fixes complexity just yet.
> >>>    Depending on how well the new multi-committers experimental model
> >>>    works, we may think using it for fixes as well.
> >>
> >> 6. Since now the committer has to collect the necessary A-by/R-by tags,
> >>    how do we handle that? Today it is implicit by posting a PR: the patches
> >>    will be signed off by me or Mauro when we process the PR. Now you need
> >>    to collect the tags by asking others. I'd like to formalize this in some
> >>    way.
> > 
> > Tags should be sent to the list as part of the review process, right ?
> > In that case they can be collected from there. b4 does so automatically.
> > We also sometimes give Rb tags in IRC as a shortcut, they can be added
> > manually, or we can decide that tags always have to be posted to the
> > list.
> > 
> > I don't really see the issue, am I missing something ?
> 
> It's not the collecting of given tags, it is knowing that I need to review
> a patch so it can be given a A-by or R-by tag. Today a PR implies that I
> will look at it (to varying degrees) and sign off on it, but now you need
> to actively request that I look at e.g. a v4l2-core patch so you can have
> the required minimum number A/R-by tags.

All the pull requests I've sent so far that included V4L2 core changes
were assuming that you had reviewed the patches already, or had a chance
to review them and decided not to. I don't recall a case where you
refused such a pull request (but my memory may fail me).

I think we need to give any interested party a chance to review the
changes they're interested in. As far as I'm concerned, you review my
patches on the list in a timely manner, and when some fall through the
cracks, if I think you would be interested in reviewing them, I ping
you. That has worked quite well so far.

I'm all for discussing the review process as part of the overall multi
committer model, the two are not independent.

> There is no clear process for that.

-- 
Regards,

Laurent Pinchart

