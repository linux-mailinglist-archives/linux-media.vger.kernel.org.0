Return-Path: <linux-media+bounces-65223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vr15BEsYNGp3OQYAu9opvQ
	(envelope-from <linux-media+bounces-65223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:09:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF86A17D6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:09:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=Q8Egq5Qq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65223-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65223-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69691310AEE8
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0A3342C93;
	Thu, 18 Jun 2026 16:03:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5803633CEA9;
	Thu, 18 Jun 2026 16:03:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798596; cv=none; b=o67wN4h9MqfaHrdwvfyzUYT1v5PlN1QouKmKY01W8zQOCRjrDt/Qzo/Ud58Cv3ECms72FcPHU8Bhmx7PRfy3Um90Wam1kgLzKaXogiy5GAL0rGlj3xs8fTEWomQIGG+NdWrHGQ/v6q7Z7hObqecTSmA+/C9udDwLZ6xaEzszsJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798596; c=relaxed/simple;
	bh=pxxjTurErBPbZSVdpQVC/czu+0dCa/wlf2q5mS+4Wo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VH7IFb8GilKssJWtxmQ84+bLW2XQh8MlORBPScIb6btoTjZDp1W4uNRzOhvjGX/M9SUYhtWahRLh6tu9ZcZ4Zf/9zsAgPn+7e/65T6uT1WrJPqtSQxjxRNmMZDy84rufXf6gUnd2bwNjP5P1OkiChOKlwxQJaEFJTCveIheSfBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=Q8Egq5Qq; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781798591;
	bh=CfifCrl8Q++07t0ifufF0LbiKfswFAiTJ96aHCWBaCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q8Egq5QqNA7WnLXBj4pddVbHTukgEL/QeZcJzopqJcWketQsAkeB+p3x3cEg+5m1H
	 20VmvA7cLdevI9H3sxyJLIfpjlg6WIwpeQ6sY+Pk3nxThq/iD4OzH2ZojhUrLehhqu
	 TyhWx9dG5h4FDQrtw5kFnPXihjnTZSksZ+SkSiLhdmzMSHTwxpcqHKmtjxZVJpjd4E
	 FHtoIKGopW28vyE7oLTWksm13BQWIU/7i/s7OtHdJ9HIQ2jOzvodITKQEVPFX2+qSf
	 usXbDgjcuMLofRqmP73wTi1TPf71edUgn0QlYAlmmdSVAHBM+YtEGdlT8fvqwjKwB8
	 7ShWjkqT8aUPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gh59L19CBz58mL;
	Fri, 19 Jun 2026 02:03:01 +1000 (AEST)
Message-ID: <24f34e59-7c3b-4b56-83bf-cb07e3f369a6@ozlabs.org>
Date: Thu, 18 Jun 2026 17:02:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Content-Language: en-GB
To: "Tian, Kevin" <kevin.tian@intel.com>,
 Pranjal Shrivastava <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Ankit Agrawal <ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org> <aixgZQiBQKgS7yIM@google.com>
 <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
 <ajGbRE3WWJxNxcrg@google.com>
 <BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65223-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:praan@google.com,m:jgg@nvidia.com,m:alex@shazbot.org,m:leon@kernel.org,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:dkim,ozlabs.org:mid,ozlabs.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70FF86A17D6

Hi Kevin, Praan, (+bonus Jason)

On 17/06/2026 07:22, Tian, Kevin wrote:
>> From: Pranjal Shrivastava <praan@google.com>
>> Sent: Wednesday, June 17, 2026 2:52 AM
>>
>> On Tue, Jun 16, 2026 at 09:48:14AM +0000, Tian, Kevin wrote:
>>>> From: Pranjal Shrivastava <praan@google.com>
>>>> Sent: Saturday, June 13, 2026 3:39 AM
>>>>
>>>> On Wed, Jun 10, 2026 at 04:43:20PM +0100, Matt Evans wrote:
>>>>> @@ -1264,7 +1265,7 @@ static int vfio_pci_ioctl_reset(struct
>>>> vfio_pci_core_device *vdev,
>>>>>  	if (!vdev->reset_works)
>>>>>  		return -EINVAL;
>>>>>
>>>>> -	vfio_pci_zap_and_down_write_memory_lock(vdev);
>>>>> +	down_write(&vdev->memory_lock);
>>>>>
>>>>>  	/*
>>>>>  	 * This function can be invoked while the power state is non-D0. If
>>>>> @@ -1277,10 +1278,11 @@ static int vfio_pci_ioctl_reset(struct
>>>> vfio_pci_core_device *vdev,
>>>>>  	 */
>>>>>  	vfio_pci_set_power_state(vdev, PCI_D0);
>>>>>
>>>>> -	vfio_pci_dma_buf_move(vdev, true);
>>>>> +	vfio_pci_zap_revoke_bars(vdev);
>>>>
>>>> I'm wondering if this change in behavior is correct?
>>>> BEFORE this patch the sequence was:
>>>>
>>>> 1. zap vma mappings
>>>> 2. Enter D0
>>>>
>>>> After this patch the sequence becomes
>>>>
>>>> 1. Take the lock
>>>> 2. Enter D0
>>>> 3. zap vma mappings
>>>>
>>>> My worry is if user-space accesses a BAR *during* the transition to D0,
>>>> it could crash since the mappings still exist during the transition?
>>>
>>> not 'crash' as you also noted later with all Fs on read and dropped writes.
>>
>> Ack, "crash" is definitely a strong word, I just meant that the
>> user-space program isn't expecting to see all Fs today. Since today any
>> access during reset is faulted, however with this all apps may have to
>> lookout for all Fs during a read. Could this change cause existing apps
>> to crash?
> 
> I expect there will be certain handshake between the resetting process
> and any subordinary processes using the exported dmabuf. The device
> state right after a resetting is not functional. Presumably the resetting
> process (as the userspace driver of the entire device) needs to re-initialize
> the device into a state allowing dmabuf to work correctly again. This
> window is much larger than above, within which I'm not sure what'd
> be reasonable expectations from those apps.
> 
>>>>
>>>> The old code is immune to it because it removed user-mappings first.
>>>>
>>>> Following the discussion from v1 regarding the ordering of
>>>> vfio_pci_dma_buf_move() and the D0 transition.. while it makes sense to
>>>> perform the DMABUF revocation/move after the hardware is in D0.. I'm
>> not
>>>> too confident about moving zap after D0 :/
>>>
>>> probably add a comment to remind that ordering requirement for dma
>>>
>>
>> +1. That'd be helpful.

Will do.

>>
>>>>
>>>> I mean, sure, the user would just see all Fs on a read and writes will
>>>> be dropped silently until we are in D0.. but the behaviour before this
>>>> change was that the user access will fault and hang on the memory_lock
>>>> instead which ensures that the user observes a consistent dev state..
>>>>
>>>
>>> I see this more consistent from another angle.
>>>
>>> Old code only removes/blocks cpu access but not for device. DMAs
>>> are allowed to this device while it's transitioning between D0/D3.
>>>
>>> New code at least make this part consistent - both cpu/p2p are allowed
>>> in the transition window.
>>>
>>> Ideally a sane userspace shouldn't rely on the content read back when
>>> it has initiated a reset in parallel. So this behavior change sounds ok?
>>
>> I agree on the CPU / P2P consistency part. However, my concern is for a
>> shared reset scenario where a reset triggered by one process (I guess it
>> was vfio_assign_device_set?) can affect multiple devices in a dev_set
>> that are owned by different, unrelated processes.
>>
>> In the old code, these peer processes are protected because their BAR
>> mappings are zapped immediately. Their MMIO threads simply stall in
>> a page fault until the reset is complete.
>>
>> I agree for a single-reset scenario, sane user-space should never access
>> regions during a self-triggered reset.
>>
>> Am I missing something?
>>
> 
> Given the resetting impact is intrusive, IMHO handshake/coordination
> is also required between processes operating on devices in a same 
> dev_set otherwise peer processes will break quickly even with the
> protection in the old code.
> 
> btw I don't remember all the detail but holds an impression there are
> restrictions on the caller owning all devices in a dev_set or they all
> belong to the same iommufd context...

(Apologies for being late to the thread.)  This is my understanding too;
whether it's one process or a group, a reset has to be coordinated and
access held back, otherwise you're exposed to all manner of
unpredictable things.  But isn't this thread really about possible
powersave states leading up to the reset, rather than the reset itself?

Revisiting the sequence Praan queried (with add'l context):

Current:

 A1. Take the lock
 A2. Zap VMA mappings
 A3. Enter D0
 A4. DMABUF move (revoke) [*]
 A5. Function reset
 A6. DMABUF move (unrevoke)
 A7. Unlock

[*]: In v1, Alex/Leon point out that this is after D0 to give the
importer the opportunity to access the device in order to let go.  Added
a comment to this effect, as requested above.

This patch:

 B1. Take the lock
 B2. Enter D0           \_ switched
 B3. Zap VMA mappings.  /
 B4. DMABUF move (revoke)
 B5. Function reset
 B6. DMABUF move (unrevoke)
 B7. Unlock

Can you please say a bit more about the access racing in these
sequences?  I'm afraid I don't follow.

Since access to a BAR on a device in D3 will UR, it's a bit of a problem
if we have it exposed to userspace at any time.

My understanding is that the sequences above wake a device that happens
to have previously been put into D3, and AFAICT it could only have got
there because of a previous vfio_pci_set_power_state().  Seems its only
caller is from the emulation of PCI_PM_CTRL using
vfio_lock_and_set_power_state(), and this zaps/revokes BAR access before
a transition to D3.  Similarly, an attempt to access a BAR via an
ioctl/through vfio_pci_core_do_io_rw() fails the D3 check in
__vfio_pci_memory_enabled(), and besides will try to take the memory_lock.

What accesses could there be to the BARs in order to trigger the race
you're warning of?  If there _could_ a path to access somehow, then
couldn't it happen currently before A2 or B3 above anyway?

I still think this sequence is okay; it's not unlikely that I'm missing
a nuance and would be grateful for help seeing it.

Other thing to highlight is both of these sequences ensure the device is
inaccessible from CPU or P2P _across the reset itself_.  I think we're
just debating the preamble (up to A4 or B4).

(Kevin, aside: regarding your suggestion on PATCH 8/9 for a warning when
setting a revocation status that is the same as current, smells like
this is a situation where that could arise.  I'll dig, but if so perhaps
we just warn on the double-PERM_REVOKED case.)

Thoughts?


Thanks,


Matt

