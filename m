Return-Path: <linux-media+bounces-17867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA09700AC
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 09:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0351F233C2
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 07:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F13146D7E;
	Sat,  7 Sep 2024 07:53:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091A49634
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725695635; cv=none; b=BLW1yPEQ4V+vQbQZIZxUa5UMtJlBjC4pvgNKCwrpo/JSHaeQ4Y6fY0xYEQ3wURniCFPNosZ4+jhU66o+PTxw5JdMixV8j8ZJFefCZG2wIiXYI4S9CuxoujtiZc0gnMF4uwqca5+odrZId+kUVKZx/77pwiJRGTCF7xLlIjGRfXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725695635; c=relaxed/simple;
	bh=XjGXYfvCTXmI7PmBf0Fzr7K8MIU9vAg40DqHjl/V1lE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LICIZhyoO4ccHjrKS+mUdTg+0cqcC5XdmxlUppFiuqminKB7UIjs254rUVzX+syZXkxIXrQYbIYN0L7bfPp4hFXENr5ywJfLS+OplTP2sK81e6DEoxBpjKMI1g6iQIaoTHGh7bKPmR6NygJO+ns0TTO+bgrj9PL37bMbbFDq3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969B5C4CEC2;
	Sat,  7 Sep 2024 07:53:51 +0000 (UTC)
Message-ID: <cc0bd7ab-56a9-413f-a1a3-7e908f6a7ee3@xs4all.nl>
Date: Sat, 7 Sep 2024 09:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
 <20240906101141.451db4f4@foz.lan>
 <20240906103658.updwgahyisda5yid@basti-XPS-13-9310>
 <20240906131030.6880e5f5@foz.lan>
 <20240906132959.GC27086@pendragon.ideasonboard.com>
 <20240906194257.58902baf@foz.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240906194257.58902baf@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2024 19:43, Mauro Carvalho Chehab wrote:
> Em Fri, 6 Sep 2024 16:29:59 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> 
>> On Fri, Sep 06, 2024 at 01:10:30PM +0200, Mauro Carvalho Chehab wrote:
>>> Em Fri, 6 Sep 2024 12:36:58 +0200 Sebastian Fricke escreveu:  
>>>> On 06.09.2024 10:11, Mauro Carvalho Chehab wrote:  
>>>>> Em Thu, 5 Sep 2024 09:16:27 +0200 Hans Verkuil escreveu:
>>>>>    
>>> ...  
>>>>> 1. All committers shall use a common procedure for all merges.
>>>>>
>>>>>   This is easy said than done. So, IMO, it is needed some common scripts
>>>>>   to be used by all committers. On my tests when merging two PRs there,
>>>>>   those seems to be the minimal set of scripts that are needed:
>>>>>
>>>>>   a) script to create a new topic branch at linux-media/users/<user>
>>>>>      The input parameter is the message-ID, e. g. something like:
>>>>>
>>>>> 	create_media_staging_topic <topic_name> <message_id>
>>>>>
>>>>>      (eventually with an extra parameter with the name of the tree)
>>>>>
>>>>>      It shall use patchwork REST interface to get the patches - or at least
>>>>>      to check if all patches are there (and then use b4).
>>>>>
>>>>>      such script needs to work with a single patch, a patch series and a
>>>>>      pull request.
>>>>>
>>>>>      the message ID of every patch, including the PR should be stored at
>>>>>      the MR, as this will be needed to later update patchwork.  
>>
>> I'm sure individual committers will want to optimize their workflow
>> using scripts, and possibly share them, but what's wrong with simply
>> using b4 ? With -l it will add a link to lore, so the message ID will be
>> available.
>>
>> I'd rather first focus on what we want to see included in commit
>> messages, and then on how to make sure it gets there.
> 
> It is not just running b4. There's the need of preparing a MR message that
> matches the content of patch 0, very likely with the message IDs of patches
> and PRs, and check if everything is in place on patchwork, as this is the 
> main tool to track the pending queue. Surely b4 can be called on such script.
> 
> It doesn't need to be complex, but it should automate the basic steps that
> all committers will use.
>  
>>>>>
>>>>>   b) once gitlab CI runs, there are two possible outcomes: patches may
>>>>>      pass or not. If they pass, a MR will be created and eventually be
>>>>>      merged.
>>>>>
>>>>>      Either merged or not (because something failed or the patches require
>>>>>      more work), the patchwork status of the patch require changes to
>>>>>      reflect what happened. IMO, another script is needed to update the
>>>>>      patch/patch series/PR on patchwork on a consistent way.
>>>>>
>>>>>      This is actually a *big* gap we have here. I have a script that
>>>>>      manually check patchwork status and the gap is huge. currently,
>>>>>      there are 73 patches that seems to be merged, but patchwork was not
>>>>>      updated.
>>>>>
>>>>>      From what I noticed, some PR submitters almost never update patchwork
>>>>>      after the merges.    
>>>>
>>>> Interesting I thought that is how it should be? I mean if I send a PR,
>>>> the one taking the PR must decide whether he wants to pull it, so the
>>>> decision whether the set is accepted should be on the one pulling the
>>>> changes and not on the one pushing them. Right?  
>>>
>>> Yes, but you still need to update previous attempts to submit the
>>> work. So, let's see a patch series at v9 got a PR. It is up to you
>>> to cleanup everything on patchwork from v1 to v8.  
>>
>> That should be done before though, when v2 is submitted, v1 should be
>> marked as superseded. 
> 
> Agreed. Still most of the ones sending PRs those days don't do that.
> 
>> Isn't there a patchwork bot that can help with this ? 
> 
> As far as I'm aware, no.
> 
>> It's not perfect in the sense that it doesn't always match new
>> versions with previous ones, but if it can lower the manual burden by
>> even 80%, it's a big win.
>>
>>> Now, the committer handing PR for v9 should be in charge of updating
>>> the status of it and the patches that belong to it, once the patch
>>> is merged or once he takes a decision otherwise.  
>>
>> Today most authors don't have a patchwork account, so they can't update
>> the status themselves. The responsibility mostly falls on you and Hans.
> 
> The responsibility is for the ones that submit PRs. Unfortunately, this
> is a process that it is not working right now. 
> 
> See, if you're reviewing a v2 of a patch series, you know that v1 is
> obsolete. It should be easy to run a script that would take the v1
> patch series and update patchwork to mark all v1 patches obsoleted.
> 
>> I'm fine with moving this to committers, which will make your life
>> easier. The patchwork update when merging a branch should ideally be
>> done automatically by the gitlab instance. If we have lore links in the
>> commit messages, that sounds doable.
> 
> With multi-committer, it won't be possible anymore for Hans and I do
> do such updates, as the workflow will be handled by the committers.
> 
> So, all committers will need to cleanup patch status on patchwork.

It would be really nice if patchwork would be kept in a better state.

Two or three times per kernel cycle I go through patchwork to hoover up
all the 'random patches' that people post, and at that time I also try
to clean up superseded patches etc. But sometimes it isn't clear, esp. if
the v2 renames the series title. When in doubt, I won't mark it as superseded.

So I agree with Mauro that as committer updating patchwork would be one of
the tasks. That implies that those with commit rights also need patchwork
rights.

For me it has always been easiest to keep all the patches I want to commit
in a bundle. Then, once it is in, I update all patches in the bundle.

And whenever I post a new version, I also update the old version in patchwork.
It's not much work as long as you stay on top of it, it is a lot more work
if you let it slip and you have to figure it out later.

The most annoying part of dealing with PRs from others has been to find the
patches in patchwork. I have a script that tries to find them based on the hash,
which works well, except when the patch was modified before ending in the PR,
then the hash no longer matches and I have to search manually.

> 
>>>>>
>>>>>      So another script to solve this gap is needed, doing updates on all
>>>>>      patches that were picked by the first script. Something like:    
>>>>
>>>> Shouldn't the update happen after the MR has been created instead,
>>>> because only after running the CI we know whether the tests fail or
>>>> pass? From what you say above it sounds like the first script merely
>>>> prepares a topic branch to be tested.  
>>>
>>> the first script I mentioned prepares and pushes the topic branch. The
>>> patchwork update script (the second one) can be used on several parts
>>> of the workflow:
>>>
>>> - before MR: if the committer decides to not merge the changes, because
>>>   it didn't pass on his review;
>>> - after MR pipeline failures;
>>> - after MR being merged: once it reaches media-staging master.
>>>   
>>>>>      update_patchwork_from_topic <topic_name> <new_status>
>>>>>
>>>>>      This would likely need to use some logic to pick the message IDs
>>>>>      of the patch inside the MR.
>>>>>
>>>>>      Such script could also check for previous versions of the patch
>>>>>      and for identical patches (it is somewhat common to receive identical
>>>>>      patches with trivial fixes from different developers).
>>>>>
>>>>>   Someone needs to work on such script, as otherwise the multi committers
>>>>>   model may fail, and we risk needing to return back to the current model.    
>>>>
>>>> Just my personal thought: This sounds a bit extreme to me, I mean we are
>>>> currently in the first test run as preparation for the Media-summit
>>>> where we actually want to discuss policies and further requirements.  
>>>
>>> What I'm saying is that multiple-committers model will only work if
>>> all committers follow a common procedure (still variants between
>>> committers is possible, provided that the minimal set is followed).
>>>
>>> If this doesn't happens, maintainers may be forced to do rebases and other
>>> manual fixes, with will actually make life worse for everyone. That's
>>> what I want to avoid by having a common set of scripts for the very basic
>>> tasks: create a topic branch for CI to test and update patchwork.  
>>
>> The issues you've listed above are about updating status of patches in
>> patchwork. That's important (or otherwise we should drop patchwork if we
>> think it's not important, but I don't think that's the case), but I
>> hardly see how missing updates to patchwork would call for a rebase :-)
> 
> The need for rebase typically won't be due to patchwork[1], but to
> broken processes to validate patches that may happen if the patches
> don't reach first a tree under linux-media/users; if someone uses a wrong
> version of compliance utils; if it has a broken topic branch, etc.
> E. g. it may happen if the agreed process isn't be followed to the
> letter.

Well, it shouldn't be possible to merge code unless the process was followed.
There is also a certain level of trust implied by giving someone commit rights.

And if they violate that trust, then we can take away those rights.

> 
> [1] Still, rebases might still be needed if the developer is not taking
>     enough care on patchwork. See, if a developer sends a patch X with a
>     change, and some days/weeks later another developer sends a patch Y
>     identical to X, except for the author (and eventually description), 
>     if patch Y is merged, there will be a need to drop it and pick X, to
>     properly give credits to the right person.
> 
>> There's a need to make sure that what lands in the shared tree is
>> proper, and for that we need a clearly documented procedure. At this
>> point I don't think it requires a committer tool script, even if in the
>> future developing such a tool could help.
>>
>>>>> 2. The mailbomb script that notifies when a patch is merged at media-stage
>>>>>    we're using right now doesn't work with well with multiple committers.
>>>>>
>>>>>    Right now, the tree at linuxtv runs it, but it might end sending patches
>>>>>    to the author and to linuxtv-commits ML that reached upstream from other
>>>>>    trees. It has some logic to prevent that, but it is not bulletproof.
>>>>>
>>>>>    A replacement script is needed. Perhaps this can be executed together
>>>>>    with the patchwork script (1B) at the committer's machine.  
>>
>> This could possibly be done with 'b4 ty'.
> 
> Call b4 ty after having patches merged at media staging tree works for me. 
> Again placing it on a script that would for instance call pwclient and
> b4 ty afterwards sounds the right thing to do.
> 
>> Another option is to rely on patchwork notifications instead. If a patch is 
>> marked as merged, the notification e-mail sounds enough to notify the
>> submitter.
> 
> Patchwork notification e-mails is about patch reviews, being optional.
> Most authors won't create accounts at patchwork, but are interested only
> at the final result. "b4 ty" or similar sounds more appropriate to me.
> 
> Also, having such patches c/c to linuxtv-commits help maintainers,
> committers and developers to keep track with tree updates.
> 
>>> The bar for sending stuff to drivers/staging is lower than for
>>> drivers/media. According with Kernel's documentation at
>>> Documentation/process/2.Process.rst:
>>>
>>> 	"Current rules require that drivers contributed to staging
>>> 	 must, at a minimum, compile properly."
>>>
>>> We actually try to be better than that, but still when new stuff is
>>> added to staging, while we try to also ensure no static code checkers
>>> would fail, we may need to relax the rules, as it is not uncommon to
>>> receive drivers that need extra care to follow Kernel coding style
>>> there.  
>>
>> Why can't we tell the submitter to fix the warnings first ? Especially
>> if we can point them to a CI report, that would seem the best course of
>> action to me. drivers/staging/ is meant for code that need more time to
>> be considered stable enough for the kernel. The stabilization doesn't
>> happen by magic, it requires someone actively working on it. If the
>> submitter can't bother to fix the warnings, it doesn't forebode anything
>> good and wouldn't make me confident that the code would ever get out of
>> staging (other than simply being deleted).
> 
> Surely we can ask fixes, but sometimes the driver is in so bad shape
> that it may take some time, specially when it is a driver that came
> from a developer without Linux upstream development experience. That
> happened, for instance, when we merged lirc drivers, several USB non-uvc
> camera drivers, atomisp, etc.
> 
> So, I'd say this will happen case by case, but, from the media CI PoV, 
> an option to relax the checks for stuff under drivers/staging is needed.

As I mentioned elsewhere, I think this should be under a CI option: by
default staging shouldn't have warnings, but it can be relaxed by setting
a CI option. But I also think this should only be allowed for new files,
not when adding patches on top.

Regards,

	Hans

> 
>>>>> 4. We need to have some sort of "honour code": if undesired behavior
>>>>>    is noticed, maintainers may temporarily (or permanently) revoke
>>>>>    committer rights.    
>>>>
>>>> That sounds like something to discuss on the media summit,   
>>>
>>> Sure. That's why I'm asking to explicitly add it to the topics to be
>>> discussed there ;-)
>>>
>>> It would be nice if someone could come up with a proposal for 
>>> it, although the discussions of such proposal should likely happen via 
>>> email.
>>>
>>> Also, the ones to be added there likely need to explicitly ack with
>>> such code before being added to gitlab's permission group.  
>>
>> This sounds fairly straightforward, I think we'll easily agree on rules.
> 
> Sure, but a document with those and an explicit ack sounds an important
> measure to avoid potential future problems.
> 
>>> 5. The procedure for fixes wil remain the same. We'll have already enough
>>>    things to make it work. Let's not add fixes complexity just yet.
>>>    Depending on how well the new multi-committers experimental model
>>>    works, we may think using it for fixes as well.  
>>
>> I think this last point should still be discussed in Vienna. I want to
>> design a clear workflow that covers -next and -fixes. I'm fine if we
>> decide to then implement part of the workflow only as an initial step,
>> if there are good enough reasons to do so.
> 
> I don't see any need. There will be enough things for discussion there
> just for -next, which is where 99% of the patches sit.
> 
> Handling -fixes require a different procedure, as maintainers need to
> prepare an special PR to send them. Also, it is up to the maintainers 
> to decide to either accept a patch as fixes or postpone to next,
> as sometimes it is not a black and white decision if a patch belongs
> to -fixes or if they will be postponed to the next merge week.
> 
> For instance, at -rc7, we usually postpone more complex fixes to
> the merge window, as it is usually not a good idea to do last minute 
> complex changes. If a committer write a fix patch during -rc7 and get
> it merged, but the maintainers decide to postpone to the merge window,
> the fix branch will require rebase.
> 
> Thanks,
> Mauro


