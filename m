Return-Path: <linux-media+bounces-17758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4D96F1A3
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 037691C218E0
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0AD1C9EC1;
	Fri,  6 Sep 2024 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="eOF/5FL0"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2541C8FD8
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725619057; cv=pass; b=II4maZBvtu0U29bqRKcbfj9ilexIhCrlsm+7EnVrKk0utI6bSDpSLJHW5VBnOWux5t3DokakMoGJtFnqneOeJuBzuQUy7oFZuCfr+eDXoP95KdtBV40ClZ+LKkOik4UognEcNg6pbBNmkG36f9I07d/DwigfqHhguJGLNxfE9dU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725619057; c=relaxed/simple;
	bh=ypmm1azcOxTHVnp02Is2+yBAlFLjEZxsuWvXhxr/Umk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMJVUo5F8RXt9kYcVjGEkNsjus1WY4nlLvjvrLRDrLWP4TU5xLZMnFZ+T7+Rkbn9sjh2Ik4W4NNSDs6Z/IQ0HQYWAr2fF6JeviRdz4tKpl6o6no9+95h1SRryXSp9Yo0OWzi1lPZi808Jd4swLJAdWqzzMh3Dr3xFId/AQwv8x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=eOF/5FL0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: daniel.almeida@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725619027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZgqN85qwvvMmjZeGo4lbjdfUHIEx5ujuRN27vUje0AhB8Sk2GoaWt5yB3PETpaYgvpjhFYSLhNNqgN7aSFWInm7skyh5Wy2IPbje5HUbS7gdfdKultQYYV/7VaVnpUb+tHybsbGEdmR2ou555udM4W+WuuEo4swBANgp2rTlvhc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725619027; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AM5+hG31nq10zDFZqNDuX6SJvuQLMGiJWkAYwsmo91c=; 
	b=TyW0LzTTE/qElwBCVh86l54f99Wj8Ndc/33EyKj3wM16jzQIBkzy1qyVJxjzqxXi8636j88T7z6XIZUkdmoNJkT3p+ItsFQsS75TgTXynnBPjdSAMzxd7RKpV0V1Vru9zzBbVHRNJxg6gCygM7ZIqDvVDSC98gZoBOpE1iCtGBo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725619027;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=AM5+hG31nq10zDFZqNDuX6SJvuQLMGiJWkAYwsmo91c=;
	b=eOF/5FL0HUSODbneCepvs9hAuHFqlo1l0gwB8Tx+IfP6N7E1asWwoGwgNhlqrtNL
	F3d7qKWTPKm9ti9n3PlFBLLRPIy+5vCwHbxwQAiamBTrfwPqNkfR50/b+aY/yM96El7
	27L8eMs0dFfQPnryyb5hCw7j+G0Q+aB2RGLxYiOk=
Received: by mx.zohomail.com with SMTPS id 1725619025295471.30724754509004;
	Fri, 6 Sep 2024 03:37:05 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:36:58 +0200
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
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
Message-ID: <20240906103658.updwgahyisda5yid@basti-XPS-13-9310>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
 <20240906101141.451db4f4@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906101141.451db4f4@foz.lan>
X-ZohoMailClient: External

Hey Mauro,

On 06.09.2024 10:11, Mauro Carvalho Chehab wrote:
>Em Thu, 5 Sep 2024 09:16:27 +0200
>Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>
>> Hi all,
>>
>> Here is my fifth (and likely final) stab at an agenda for the media summit. As always,
>> it is subject to change and all times are guesstimates!
>>
>> The media summit will be held on Monday September 16th. Avnet Silica has very
>> kindly offered to host this summit at their Vienna office, which is about 35
>> minutes by public transport from the Open Source Summit Europe venue
>> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
>>
>> Avnet Silica Office Location:
>>
>> Schönbrunner Str. 297/307, 1120 Vienna, Austria
>>
>> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
>>
>> Refreshments are available during the day.
>>
>> Lunch is held at Schönbrunner Stöckl (https://www.schoenbrunnerstoeckl.com/), close
>> to the Avnet Silica office. The lunch is sponsored by Ideas on Board and Cisco Systems
>> Norway.
>>
>> Regarding the face mask policy: we will follow the same guidance that the
>> Linux Foundation gives for the EOSS conference:
>>
>> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
>>
>>
>> In-Person Attendees:
>>
>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
>> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel Maintainer)
>> Steve Cho <stevecho@chromium.org> (Google)
>> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
>> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
>> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
>> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
>> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
>> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
>> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
>> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
>> Sean Young <sean@mess.org>
>> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
>>
>> Remote Attendees (using MS Teams):
>>
>> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
>> Tomasz Figa <tfiga@chromium.org> (Google)
>> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
>> Devarsh Thakkar <devarsht@ti.com> (TI)
>>
>> Note: information on how to connect remotely will come later.
>>
>> If any information above is incorrect, or if I missed someone, then please let me know.
>>
>> We are currently 17 confirmed in-person participants, so we're pretty much full.
>> If you want to join remotely, then contact me and I'll add you to that list.
>>
>> Draft agenda:
>>
>> 8:45-9:15: get settled :-)
>>
>> 9:15-9:25: Hans: Quick introduction
>>
>> 9:25-11:00: Ricardo: multi-committer model using gitlab
>
>As part of such discussion, IMO some topics that should be covered:
>
>1. All committers shall use a common procedure for all merges.
>
>   This is easy said than done. So, IMO, it is needed some common scripts
>   to be used by all committers. On my tests when merging two PRs there,
>   those seems to be the minimal set of scripts that are needed:
>
>   a) script to create a new topic branch at linux-media/users/<user>
>      The input parameter is the message-ID, e. g. something like:
>
>	create_media_staging_topic <topic_name> <message_id>
>
>      (eventually with an extra parameter with the name of the tree)
>
>      It shall use patchwork REST interface to get the patches - or at least
>      to check if all patches are there (and then use b4).
>
>      such script needs to work with a single patch, a patch series and a
>      pull request.
>
>      the message ID of every patch, including the PR should be stored at
>      the MR, as this will be needed to later update patchwork.
>
>   b) once gitlab CI runs, there are two possible outcomes: patches may
>      pass or not. If they pass, a MR will be created and eventually be
>      merged.
>
>      Either merged or not (because something failed or the patches require
>      more work), the patchwork status of the patch require changes to
>      reflect what happened. IMO, another script is needed to update the
>      patch/patch series/PR on patchwork on a consistent way.
>
>      This is actually a *big* gap we have here. I have a script that
>      manually check patchwork status and the gap is huge. currently,
>      there are 73 patches that seems to be merged, but patchwork was not
>      updated.
>
>      From what I noticed, some PR submitters almost never update patchwork
>      after the merges.

Interesting I thought that is how it should be? I mean if I send a PR,
the one taking the PR must decide whether he wants to pull it, so the
decision whether the set is accepted should be on the one pulling the
changes and not on the one pushing them. Right?

>
>      So another script to solve this gap is needed, doing updates on all
>      patches that were picked by the first script. Something like:

Shouldn't the update happen after the MR has been created instead,
because only after running the CI we know whether the tests fail or
pass? From what you say above it sounds like the first script merely
prepares a topic branch to be tested.

>
>      update_patchwork_from_topic <topic_name> <new_status>
>
>      This would likely need to use some logic to pick the message IDs
>      of the patch inside the MR.
>
>      Such script could also check for previous versions of the patch
>      and for identical patches (it is somewhat common to receive identical
>      patches with trivial fixes from different developers).
>
>   Someone needs to work on such script, as otherwise the multi committers
>   model may fail, and we risk needing to return back to the current model.

Just my personal thought: This sounds a bit extreme to me, I mean we are
currently in the first test run as preparation for the Media-summit
where we actually want to discuss policies and further requirements.

>
>2. The mailbomb script that notifies when a patch is merged at media-stage
>   we're using right now doesn't work with well with multiple committers.
>
>   Right now, the tree at linuxtv runs it, but it might end sending patches
>   to the author and to linuxtv-commits ML that reached upstream from other
>   trees. It has some logic to prevent that, but it is not bulletproof.
>
>   A replacement script is needed. Perhaps this can be executed together
>   with the patchwork script (1B) at the committer's machine.
>
>3. Staging require different rules, as smatch/spatch/sparse/checkpatch
>   warnings and errors can be acceptable.

I thought that we came to a consensus that only warnings are acceptable?
If we accept errors in the staging but not in media master, does that
mean that we ought to send patches to the media staging tree then?
I'd vote for only allowing patches without errors into the staging tree
and in the worst case add a list with acceptable errors.

>
>4. We need to have some sort of "honour code": if undesired behavior
>   is noticed, maintainers may temporarily (or permanently) revoke
>   committer rights.

That sounds like something to discuss on the media summit, revoking
commit rights shouldn't be hard as you just have to remove push rights
for that GitLab tree.

>
>   Hopefully, this will never happen, but, if it happens, a rebase
>   of media-staging tree may be needed.
>
>5. The procedure for fixes wil remain the same. We'll have already enough
>   things to make it work. Let's not add fixes complexity just yet.
>   Depending on how well the new multi-committers experimental model
>   works, we may think using it for fixes as well.
>
>Thanks,
>Mauro
>

Regards,
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

