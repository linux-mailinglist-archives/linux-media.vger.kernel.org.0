Return-Path: <linux-media+bounces-34629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F841AD72A7
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 15:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA65A3B6600
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 13:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB22B256C81;
	Thu, 12 Jun 2025 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qOvo1HsZ"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45A25485F;
	Thu, 12 Jun 2025 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736048; cv=none; b=aHWJzDKCIm4su8N47df2q6A6q68kUtzAq/RZ49pmLM4O6VOXWHx3vOta7hkZwMMmeEcJl2b2MWrIjVhJRA3Bo+twbV030k/TtBwk7XmMxq7tsVdoyasoiR4WYIRrtW+6qdHFFnphbyYPWMbtc1AABj/lIYom2+/7yFjNUSRlt1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736048; c=relaxed/simple;
	bh=zAb1Ax7UMFYZHc6cvqvkxz6CUNHnRlIY23Z3k22bOS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7RJne6NK3qgwQPTsq2MmzZzUeali+v9x5JtSbv/03xIhJtlJppIpNfna/Duw67+rLhp2x6gV2Ju/r07iqLKbThY6Zy/r2aWSLyc5uZzxvyUTOZAMDDAnTlQtefMOHAZpKftcPQ7/zFMAehOX/YlE+Ohfrf5r737fijbz+iN2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qOvo1HsZ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6MLOiEcKgEGTK92EJfXESEVjUwnph+8UbZ89FGNGFIA=; b=qOvo1HsZx49RfVfCBKMhddoIYA
	h+4CZjEdSAITLzpZRV0IolJvMe2o+nz2ILDGpZW8JhRITnJEir4Q4llYle049TCWSaUuIveEeSZsC
	iL3OL3bdwhMo/bjVBuQMtOwOkSZbwLs2tpfX8df+9hSn8EdoF38nXNBEyndJ7zmehKtsrNM+Ejlef
	wW5jbiFBEUREelM3JacTBIgGjRBXwytqG+aJxkdjbHjpJD8zFM5W2vPeNJ87dsfiM8p/OtkqbUoUK
	Th9/2+qMoRebv32CiO3NUM0erBPoTpR/Ts5x6ZNjRydFOzogLavgLhmL/2rnU1DEjecaiyumyC3jS
	drGYGMEA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uPiGi-002ei0-Tp; Thu, 12 Jun 2025 15:47:00 +0200
Message-ID: <e28175e3-f62a-460d-88bc-3d9d5be78e11@igalia.com>
Date: Thu, 12 Jun 2025 14:46:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling
 job-by-job
To: Danilo Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250603093130.100159-2-phasta@kernel.org>
 <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
 <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>
 <aEnzZts6acAtg3IX@cassiopeiae>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aEnzZts6acAtg3IX@cassiopeiae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/06/2025 22:21, Danilo Krummrich wrote:
>> On Tue, 2025-06-03 at 13:27 +0100, Tvrtko Ursulin wrote:
>>> On 03/06/2025 10:31, Philipp Stanner wrote:
>>> What I am not that ecstatic about is only getting the Suggested-by
>>> credit in 1/6. Given it is basically my patch with some cosmetic
>>> changes
>>> like the kernel doc and the cancel loop extracted to a helper.
>>
>> Sign the patch off and I give you the authorship if you want.
> 
> AFAICS, the proposal of having cancel_job() has been a review comment which has
> been clarified with a reference patch.

Right, this one:

https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/

> IMO, the fact that after some discussion Philipp decided to go with this
> suggestion and implement the suggestion in his patch series does not result in
> an obligation for him to hand over authorship of the patch he wrote to the
> person who suggested the change in the context of the code review.

It is fine. Just that instead of rewriting we could have also said 
something along the lines of "Okay lets go with your version after all, 
just please tweak this or that". Which in my experience would have been 
more typical.

> Anyways, it seems that Philipp did offer it however, so this seems to be
> resolved?

At the end of the day the very fact a neater solution is going in is the 
main thing for me. Authorship is not that important, only that the way 
of working I follow, both as a maintainer and a colleague, aspires to be 
more like what I described in the previous paragraph.

I am not sure I can review this version though. It feels it would be too 
much like reviewing my own code so wouldn't carry the fully weight of 
review. Technically I probably could, but in reality someone else should 
probably better do it.

Regards,

Tvrtko


