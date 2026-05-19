Return-Path: <linux-media+bounces-62111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPxuCwomDGrvXQUAu9opvQ
	(envelope-from <linux-media+bounces-62111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:57:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B668257AA88
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0E73307C2C2
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56E73EDACC;
	Tue, 19 May 2026 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UHWhEtQu"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB9338F929;
	Tue, 19 May 2026 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180586; cv=none; b=Bcs0qWDGv0mtDWisvT40TRCKtPSjZ6Ys/t8+OtAWF3lyg4D4bERwwZpEpQHVejX3j7VJre/tt7movDOGJ0gTP/od4WIJ2xsKvlOo506XGxTvUa+onA8birgQDrHX3f9LoYhS8Agjj43YpkdxC4Xlrgw5yG27HIrIIA8HiVLGiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180586; c=relaxed/simple;
	bh=2ItcKLOHuYuo+5+zg3nAK5dtbbWOEusz4M2dKNduT5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eO47J9qW2YlFwqcYLcJZ5HCdLNhX2EaUJ0pVj/uDenJVN9iE+r6Wz6FbIzSadCrYtbZenFr9GB7l9iOBPqzqsCnTfC8FTv0Vt7Iuk3DSbKfk+55YNdq5Kgkbha7cYcaxFw56oJQKi4eZvf42Tj4yqJaDJr9sAKy6mp+1i+76+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UHWhEtQu; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61AF234FC;
	Tue, 19 May 2026 01:49:38 -0700 (PDT)
Received: from [10.57.24.124] (unknown [10.57.24.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E89C3F85F;
	Tue, 19 May 2026 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779180583; bh=2ItcKLOHuYuo+5+zg3nAK5dtbbWOEusz4M2dKNduT5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UHWhEtQu0+j3+QsOWr2nLpXICsL3AQVNq2V7x/fb/XyRGPAKRbuSINGm0ljae0+i8
	 9z42OdtXMowoLE3td48keL3MFMfcrE2qLP+5ACkvZROnd4D2JJ9PLo2A8+sjpZLK8t
	 k19/XatDyTfkXHKjdvr06k8CRJ9nVozmozjNf8GY=
Message-ID: <8f0b1750-a853-4895-9672-73a75f6dbd84@arm.com>
Date: Tue, 19 May 2026 10:49:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Marcin_=C5=9Alusarz?=
 <marcin.slusarz@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Florent Tomasin
 <florent.tomasin@arm.com>, nd@arm.com
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260505181523.49a3d85c@fedora> <afxVIuVVPisBQ9p_@e129842.arm.com>
 <20260507135356.5428d50d@fedora> <agMvb_jeRsO7tSS-@e142607>
 <20260512161111.0cb7000e@fedora> <agNJasayW8VCHTiU@e142607>
 <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
 <20260518091650.5a7a4f4a@fedora>
 <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
 <20260519093955.448ff899@fedora>
Content-Language: en-US
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20260519093955.448ff899@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62111-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ketil.johnsen@arm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: B668257AA88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 09:39, Boris Brezillon wrote:
> On Mon, 18 May 2026 17:36:40 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
> 
>> On Mon, May 18, 2026 at 12:16 AM Boris Brezillon
>> <boris.brezillon@collabora.com> wrote:
>>>
>>> On Wed, 13 May 2026 12:31:32 -0700
>>> Chia-I Wu <olvaffe@gmail.com> wrote:
>>>   
>>>> On Tue, May 12, 2026 at 8:39 AM Liviu Dudau <liviu.dudau@arm.com> wrote:
>>>>>
>>>>> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
>>>>>> On Tue, 12 May 2026 14:47:27 +0100
>>>>>> Liviu Dudau <liviu.dudau@arm.com> wrote:
>>>>>>   
>>>>>>> On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
>>>>>>>> On Thu, 7 May 2026 11:02:26 +0200
>>>>>>>> Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
>>>>>>>>   
>>>>>>>>> On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
>>>>>>>>>>> @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
>>>>>>>>>>>                      return ret;
>>>>>>>>>>>      }
>>>>>>>>>>>
>>>>>>>>>>> +   /* If a protected heap name is specified but not found, defer the probe until created */
>>>>>>>>>>> +   if (protected_heap_name && strlen(protected_heap_name)) {
>>>>>>>>>>
>>>>>>>>>> Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
>>>>>>>>>> name is "" already?
>>>>>>>>>
>>>>>>>>> If dma_heap_find() will fail, then the whole probe with fail too.
>>>>>>>>> This check prevents that.
>>>>>>>>
>>>>>>>> Yeah, that's also a questionable design choice. I mean, we can
>>>>>>>> currently probe and boot the FW even though we never setup the
>>>>>>>> protected FW sections, so why should we defer the probe here? Can't we
>>>>>>>> just retry the next time a group with the protected bit is created and
>>>>>>>> fail if we can find a protected heap?
>>>>>>>
>>>>>>> The problem we have with the current firmware is that it does a number of setup steps at "boot"
>>>>>>> time only. One of the steps is preparing its internal structures for when it enters protected
>>>>>>> mode and it stores them in the buffer passed in at firmware loading. We cannot later run the
>>>>>>> process when we have a group with protected mode set.
>>>>>>
>>>>>> No, but we can force a full/slow reset and have that thing
>>>>>> re-initialized, can't we? I mean, that's basically what we do when a
>>>>>> fast reset fails: we re-initialize all the sections and reset again, at
>>>>>> which point the FW should start from a fresh state, and be able to
>>>>>> properly initialize the protected-related stuff if protected sections
>>>>>> are populated. Am I missing something?
>>>>>
>>>>> Right, we can do that. For some reason I keep associating the reset with the
>>>>> error handling and not with "normal" operations.
>>>> I kind of hope we end up with either
>>>>
>>>>   - panthor knows the exact heap to use and fails with EPROBE_DEFER if
>>>> the heap is missing, or
>>>>   - panthor gets a dma-buf from userspace and does the full reset
>>>>     - userspace also needs to provide a dma-buf for each protected
>>>> group for the suspend buffer
>>>>
>>>> than something in-between. The latter is more ad-hoc and basically
>>>> kicks the issue to the userspace.
>>>
>>> Indeed, the second option is more ad-hoc, but when you think about it,
>>> userspace has to have this knowledge, because it needs to know the
>>> dma-heap to use for buffer allocation that cross a device boundary
>>> anyway. Think about frames produced by a video decoder, and composited
>>> by the GPU into a protected scanout buffer that's passed to the KMS
>>> device. Why would the GPU driver be source of truth when it comes to
>>> choosing the heap to use to allocate protected buffers for the video
>>> decoder or those used for the display?
>> I don't think the GPU driver is ever the source of truth. If the
>> system integrator wants to specify the source of truth (SoT) from
>> kernel space, they should use the device tree (or module params /
>> config options). If they want to specify the SoT in userspace, then we
>> don't really care how it is done other than providing an ioctl.
>> Panthor is always on the receiving end.
> 
> Okay, we're on the same page then.
> 
>>
>> If we don't want to delay this functionality, but it takes time to
>> converge on SoT, maybe a solution that is not a long-term promise can
>> work? Of the options on the table (dt, module params, kconfig options,
>> ioctls), a kconfig option, potentially marked as experimental, seems
>> like a good candidate.
> 
> If Panthor is only a consumer, I actually think it'd be easier to just
> let userspace pass the protected FW section as an imported buffer
> through an ioctl for now. It means we don't need any of the
> modifications to the dma_heap API in this series, and userspace is free
> to choose its SoT (efuse, DT, ...) and pass the info back to mesa/GBM
> somehow (envvar, driconf, ...). The only thing we need to ensure is if
> lazy protected FW section allocation is going to work, but given the
> current code purely and simply ignores those sections, and the FW is
> still able to boot and act properly (at least on v10-v13), I'm pretty
> confident this is okay, unless there's some trick the MCU can do to
> detect that the protected section isn't mapped (which I doubt, because
> the MCU doesn't know it lives behind an MMU).
> 
> Of course, once we have a consensus on how to describe this in the DT,
> we can switch Panthor over to "protected dma_heap selection through DT",
> and reflect that through the ioctl that exposes whether protected
> support is ready or not (would be a DEV_QUERY), such that userspace can
> skip this "PROTM initialization" step.
> 
> We're talking about an extra ioctl to set those buffers, and a
> DEV_QUERY to query the state (ready or not), the size of the global
> protected buffer (protected FW section) and the size of the protected
> suspend buffer. The protected suspend buffer would be allocated and
> passed at group creation time (extra arg passed to the existing
> GROUP_CREATE ioctl). So, overall, I don't consider it a huge liability
> in term of maintenance cost.

If we can avoid the dma-heap changes, then that would surely help!
I can try to implement this in the next version unless someone finds a 
reason why it is a bad idea.

>>>> For the former, expressing the relation in DT seems to be the best,
>>>> but only if possible :-). Otherwise, a kconfig option (instead of
>>>> module param) should be easier to work with.
>>>>
>>>> Looking at the userspace implementation, can we also have an panthor
>>>> ioctl to return the heap to userspace?
>>>
>>> Yes, it's something we can add, but again, I'm questioning the
>>> usefulness of this: how can we ensure the heap used by panthor to
>>> allocate its protected FW buffers is suitable for scanout buffers
>>> (buffers that can be used by display drivers). There needs to be a glue
>>> leaving in usersland and taking the decision, and I'm not too sure
>>> trusting any of the component in the chain (vdec, gpu, display) is the
>>> right thing to do.
>> The heap returned by panthor is only for panfrost/panvk. It says
>> nothing about compatibility with other components on the system.
> 
> Okay, if it's used only for internal buffers, I guess that's fine.

--
Ketil

