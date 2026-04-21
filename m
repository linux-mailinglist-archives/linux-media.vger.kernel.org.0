Return-Path: <linux-media+bounces-59231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALRvJ2Cs52kM/AEAu9opvQ
	(envelope-from <linux-media+bounces-59231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:57:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5BD43DA80
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 689EA3069B9D
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F9E31D74B;
	Tue, 21 Apr 2026 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="lVy4WTu7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uiTLpeQV"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6963624A5
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776790522; cv=none; b=iUL5T8L+uEXHJUIZgc3/wsGpMh7Bdrlt1l4wXS4U5e3/wet4JMgcpwWV/ssiZv6jPXEM8FMB0o49FS8mpVnIKe7TQrT1hAIE3zh+7He7Irc/HwgbRfOIVQzrQtmM1Z7iB9xMPJ75sGWPRU+6jdBvemtV2Mz+96t1RerBh9CQbkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776790522; c=relaxed/simple;
	bh=oAIsPRsbjZDpWtgGGqrykA3eUG3wfJpX2An36ALB/Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GzBHMSx+6tG0vuiC3qIoaSKIkO8sUJScvjAP3QQe8UMcDu3UOGxc37GvmlUXlDD+xHMMq6cINcfpK8v888v6WwAsDIfIZCsBrhdDuJcEUSh8lVFpWQDHCT48hN8ps4Fd0iSKsz7THEFgUQsF+Zbj7KPI+g0P20sDspEszHl4bn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=lVy4WTu7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uiTLpeQV; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 376C814000A9;
	Tue, 21 Apr 2026 12:55:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 21 Apr 2026 12:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1776790519; x=1776876919; bh=2zn4a4qW9U
	F0PfDVNgzFec7Aa/HkeyvZuozs7DNUuLM=; b=lVy4WTu772b39w3Jf/ZEzgXq1T
	WawhPX4Qeosv+NJoTEn1ZBBainBg+/s98I4FRoA+hzUqWuZZsPivu3I1c/f56l2Z
	HHFxZU49WXmAmPUPOU8VLDStywmhl7RyRN3tiLPg9w+o9JiVEzw3oojJD6/eqmfq
	zdS9J8nLfr4tqT/zTp/H+pFCIVYFw8Z8E+3i6zjLxW0IyKzX6rHcqKnmi4zwwkDD
	70Co+RGwXEA3kGv1AIkVdZQGMF0F53/JIbZJEVv5hG2iiI0cGgL5aRUL8Hfahx3x
	hPSLok3fFcMpfeCZch3/vxEfWpclbWbY1AKXUxKQ6yRmpRTdtd2k6hKDlSAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776790519; x=
	1776876919; bh=2zn4a4qW9UF0PfDVNgzFec7Aa/HkeyvZuozs7DNUuLM=; b=u
	iTLpeQVGWudbY5PhHOM8kiMrZMBYQLyD7FlDvGqN+4xFotyMxPwaTSXpkyBe0EYI
	uNe0o9YFQvxAG3KzGR7jqk1s/LofN6yfem3+BXn/8F4YiHjoCHOfa4KcPPTI/B29
	mnOh35i5/lDuEEtQ/SGuhO1M3Ic8fQgbF1ytDfiap51UW5ig3DETz3QOKryIoa6K
	tMLWogdJbqiel15GgVYI80av39eBhEqy9Qo1iVmN0rtSkdlHHBNoCw2FQn4t7fQ2
	p75u4yOj1VTb2f9th9Uz1o9HSw6YKtl9WiwxSgyYthXg/N7VQyLC7fbRzc02axo3
	zmpJZOVTqeXjw+Y4vaBVw==
X-ME-Sender: <xms:9qvnaYjznKArJo5qJExq7I_TN-X40gMjw6mvZ3vvvKNblVJtmOyolg>
    <xme:9qvnabFATSmSrPd7AYlfIbbcUvLeiNbKXiNl7cE9Fwdno1YFpibRa_bDTXrK_Izoh
    UIa-DxpVb_YCZZ70vzlw2nWCfHTusZ_2gEmL7YTSXoFRvq0ZW0F>
X-ME-Received: <xmr:9qvnaf_sCZPzdWc8St9FuPfcExt4H8pHK4UaOFISHKWWbZoc5D0dn3aNS7NmwpOYby-jffg0a5VTvY5JMVHzku5IvL2PO7MJww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepgggrlhcurfgr
    tghkvghtthcuoehvrghlsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepheekgfefveetkeethffhgeeivdffkeegueevkeefveeltefg
    leehffegudegkedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehvrghlsehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghilhdrtghomhdp
    rhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtph
    htthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
    pdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrd
    horhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpd
    hrtghpthhtohepphhivghrrhgvqdgvrhhitgdrphgvlhhlohhugidqphhrrgihvghrsegr
    mhgurdgtohhm
X-ME-Proxy: <xmx:9qvnaaz9o7Hhwkq9a4l-PDlhylhfTROJthGoElg-_zoQs8iVwNiqfw>
    <xmx:9qvnaTNI2I604FqF2c3PDY9CyH5bIxDaVObcYaq_ig56r2IzpYwQFA>
    <xmx:9qvnaX-t4WDK-HI82ohdvRWuV0p8MbUKoTT8EQUcDbn7HRx5UKLrtQ>
    <xmx:9qvnaY6HST0z1SO8cDSMNe8ssP_1YKmoAzoB3dpiCUMwhjT0UE6d9A>
    <xmx:96vnae-UbyH_244q_LhhTyJHJQO3NdqoDTPCrQ0h1nsigFMViaq0ow6_>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Apr 2026 12:55:17 -0400 (EDT)
Message-ID: <de6777c1-1165-4ace-a5a7-3004aa9ea8c5@invisiblethingslab.com>
Date: Tue, 21 Apr 2026 13:55:14 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 linux-media@vger.kernel.org
Cc: Suwit Semal <sumit.semwal@linaro.org>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
 <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com>
 <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
 <4751cf03-d3c1-4d5d-af8e-39ad7c8ffb84@amd.com>
 <7472bfcf-8c22-4ac7-b903-a883cdb8f1c6@gmail.com>
 <8fe8b78b-5294-4319-af92-a4fb00527417@amd.com>
 <8846bac5-77ff-4439-ac5c-c33cdb4a94e3@gmail.com>
 <964c3670-fad3-44ce-bd93-2057bca2dcb8@amd.com>
 <08ad2301-3163-4497-8869-fa4cea30b384@gmail.com>
 <e5c00f2c-0819-48b4-b66e-71b9a40a7235@amd.com>
 <686713fc-c762-4b1b-88b2-d486d4f38ac6@gmail.com>
Content-Language: en-US
From: Val Packett <val@invisiblethingslab.com>
Autocrypt: addr=val@invisiblethingslab.com; keydata=
 xm8EaFTEiRMFK4EEACIDAwQ+qzawvLuE95iu+QkRqp8P9z6XvFopWtYOaEnYf/nE8KWCnsCD
 jz82tdbKBpmVOdR6ViLD9tzHvaZ1NqZ9mbrszMXq09VfefoCfZp8jnA2yCT8Y4ykmv6902Ne
 NnlkVwrNKFZhbCBQYWNrZXR0IDx2YWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT7CswQTEwkA
 OxYhBAFMrro+oMGIFPc7Uc87uZxqzalRBQJoVMSJAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMB
 Ah4HAheAAAoJEM87uZxqzalRlIIBf0cujzfSLhvib9iY8LBh8Tirgypm+hJHoY563xhP0YRS
 pmqZ6goIuSGpEKcW5mV3egF/TLLAOjsfroWae4giImTVOJvLOsUycxAP4O5b1Qiy+cCGsHKA
 nCRzrvqnPkyf4OeRznMEaFTEiRIFK4EEACIDAwSffe3tlMmmg3eKVp7SJ+CNZLN0M5qzHSCV
 dBBkIVvEJo+8SDg4jrx/832rxpvMCz2+x7+OHaeBHKafhOWUccYBLKqV/3nBftxCkbzXDbfY
 d02BY9H4wBIn0Y3GnwoIXRgDAQkJwpgEGBMJACAWIQQBTK66PqDBiBT3O1HPO7mcas2pUQUC
 aFTEiQIbDAAKCRDPO7mcas2pUaptAX9f7yUJLGU4C6XjMJvXd8Sz6cGTyxkngPtUyFiNqtad
 /GXBi3vHKYNfSrdqJ8wmZ8MBgOqWaaa1wE4/3qZU8d4RNR8mF7O40WYK/wdf1ycq1uGad8PN
 UDOwAqdfvuF3w8QMPw==
In-Reply-To: <686713fc-c762-4b1b-88b2-d486d4f38ac6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-59231-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org,lists.xenproject.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@invisiblethingslab.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim,invisiblethingslab.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 3B5BD43DA80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/20/26 4:12 PM, Demi Marie Obenour wrote:
> On 4/20/26 14:53, Christian König wrote:
>> On 4/20/26 20:46, Demi Marie Obenour wrote:
>>> On 4/20/26 13:58, Christian König wrote:
>>>> On 4/20/26 19:03, Demi Marie Obenour wrote:
>>>>> On 4/20/26 04:49, Christian König wrote:
>>>>>> On 4/17/26 21:35, Demi Marie Obenour wrote:
>>>> ...
>>>>>>> Are any of the following reasonable options?
>>>>>>>
>>>>>>> 1. Change the guest kernel to only map (and thus pin) a small subset
>>>>>>>     of VRAM at any given time.  If unmapped VRAM is accessed the guest
>>>>>>>     traps the page fault, evicts an old VRAM mapping, and creates a
>>>>>>>     new one.
>>>>>> Yeah, that could potentially work.
>>>>>>
>>>>>> This is basically what we do on the host kernel driver when we can't resize the BAR for some reason. In that use case VRAM buffers are shuffled in and out of the CPU accessible window of VRAM on demand.
>>>>> How much is this going to hurt performance?
>>>> Hard to say, resizing the BAR can easily give you 10-15% more performance on some use cases.
>>>>
>>>> But that involves physically transferring the data using a DMA. For this solution we basically only have to we basically only have to transfer a few messages between host and guest.
>>>>
>>>> No idea how performant that is.
>>> In this use-case, 20-30% performance penalties are likely to be
>>> "business as usual".
>> Well that is quite a bit.
>>
>>> Close to native performance would be ideal, but
>>> to be useful it just needs to beat software rendering by a wide margin,
>>> and not cause data corruption or vulnerabilities.
>> That should still easily be the case, even trivial use cases are multiple magnitudes faster on GPUs compared to software rendering.
> Makes sense.  If only GPUs supported easy and flexible virtualization the way CPUs do :(.
>
>>>>>> But I have one question: When XEN has a problem handling faults from the guest on the host then how does that work for system memory mappings?
>>>>>>
>>>>>> There is really no difference between VRAM and system memory in the handling for the GPU driver stack.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>> Generally, Xen makes the frontend (usually an unprivileged VM)
>>>>> responsible for providing mappings to the backend (usually the host).
>>>>> That is possible with system RAM but not with VRAM, because Xen has
>>>>> no awareness of VRAM.  To Xen, VRAM is just a PCI BAR.
>>>> No, that doesn't work with system memory allocations of GPU drivers either.
>>>>
>>>> We already had it multiple times that people tried to be clever and incremented the page reference counter on driver allocated system memory and were totally surprised that this can result in security issues and data corruption.
>>>>
>>>> I seriously hope that this isn't the case here again. As far as I know XEN already has support for accessing VMAs with VM_PFN or otherwise I don't know how driver allocated system memory access could potentially work.
>>>>
>>>> Accessing VRAM is pretty much the same use case as far as I can see.
>>>>
>>>> Regards,
>>>> Christian.
>>> The Xen-native approach would be for system memory allocations to
>>> be made using the Xen driver and then imported into the virtio-GPU
>>> driver via dmabuf.  Is there any chance this could be made to happen?
>> That could be. Adding Pierre-Eric to comment since he knows that use much better than I do.
>>
>>> If it's a lost cause, then how much is the memory overhead of pinning
>>> everything ever used in a dmabuf?  It should be possible to account
>>> pinned host memory against a guest's quota, but if that leads to an
>>> unusable system it isn't going to be good.
>> That won't work at all.
>>
>> We have use cases where you *must* migrate a DMA-buf to VRAM or otherwise the GPU can't use it.
>>
>> A simple scanout to a monitor is such an use case for example, that is usually not possible from system memory.
> Direct scanout isn't a concern here.
>
>>> Is supporting page faults in Xen the only solution that will be viable
>>> long-term, considering the tolerance for very substantial performance
>>> overheads compared to native?  AAA gaming isn't the initial goal here.
>>> Qubes OS already supports PCI passthrough for that.
>> We have AAA gaming working on XEN through native context working for quite a while.
>>
>> Pierre-Eric can tell you more about that.
>>
>> Regards,
>> Christian.
> I've heard of that, but last I checked it required downstream patches
> to Xen, Linux, and QEMU.  I don't know if any of those have been
> upstreamed since, but I believe that upstreaming the Xen and Linux
> patches (or rewriting them and upstreaming the rewritten version) would
> be necessary.  Qubes OS (which I don't work for anymore but still want
> to help with this) almost certainly won't be using QEMU for GPU stuff.

Yeah, our plan is to use xen-vhost-frontend[1] + vhost-device-gpu, 
ported/extended/modified as necessary. (I already have 
xen-vhost-frontend itself working on amd64 PVH with purely xenbus-based 
hotplug/configuration, currently working on cleaning up and submitting 
the necessary patches.)

I'm curious to hear more details about how AMD has it working but last 
time I checked, there weren't any missing pieces in Xen or Linux that 
we'd need.. The AMD downstream changes were mostly related to QEMU.

As for the memory management concerns, I would like to remind everyone 
once again that the pinning of GPU dmabufs in regular graphics workloads 
would be *very* short-term. In GPU paravirtualization (native contexts 
or venus or whatever else) the guest mostly operates on *opaque handles* 
that refer to buffers owned by the host GPU process. The typical 
rendering process (roughly) only involves submitting commands to the GPU 
that refer to memory using these handles. Only upon mmap() would a 
buffer be pinned/granted to the guest, and those are typically only used 
for *uploads* where the guest immediately does its memcpy() and unmaps 
the buffer.

So I'm not worried about (unintentionally) pinning too much GPU driver 
memory.

In terms of deliberate denial-of-service attacks from the guest to the 
host, the only reasonable response is:

¯\_(ツ)_/¯

CPU-mapping lots of GPU memory is far from the only DoS vector, the GPU 
commands themselves can easily wedge the GPU core in a million ways (and 
last time I checked amdgpu was noooot so good at recovering from hangs).


[1]: https://github.com/vireshk/xen-vhost-frontend

~val


