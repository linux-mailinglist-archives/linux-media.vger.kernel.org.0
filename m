Return-Path: <linux-media+bounces-34023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E903ACC9C0
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 17:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277CB16AFD3
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 15:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABA4238C27;
	Tue,  3 Jun 2025 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="QaxdeAbp"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A61DA23
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962874; cv=none; b=Poxb+4YUn31pI4RhRNMMwQaAxJzm9/uRu2BnoMIAWtm6IwYc7tvOsHzgTi+NayELc0HDJFSt0ZAfDv2EVOaP3sFcwuZUn/VCvDTj8oVE9IP00iFrP4sZ7hni0LtJfR4AhukSK19/hgH0hWQaq/5feCW85P2k/WFiWhz5qHBuHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962874; c=relaxed/simple;
	bh=3E+Va4DWuWSRYe3zP3yrYh8vZjnDLzwlRs9PN3sSVXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in6TV4VRVuE0udoIwysUbFW0SmAs+kkChIQhsl4JEBHM8+oeZPoelM4y1yZqguLSNyrHkNsW652+5W5Q6C/8JhvnefcnucvPPxwMuWwIkZxoJDEZQhOSkRnEavIgx7TP1ZiXT897WfAL5wcN428gzvSU19zsgNtUhgiEd2rnG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=QaxdeAbp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z8ILGm2DDoULUeBY/syksmZNaTj7qj6sGpxbrKa1akg=; b=QaxdeAbpaiApSC7NJl66pKGxRc
	opFHAifORlKeJPz+oASDN2uzKSBqCnr3wbVW5QHULmFX1bkDTcwXzcl1k6myVJJBr93Aq1M/4u5Q3
	mA61xDKVfWU/pOuRM/O+4R6jmxGT0Wg8uKcPNqKE2+J2DKbvJJqMtMT1orKaPM9+X8qyu/UvXjg0a
	DGJBpGmfgvYyEYuEiK5flUXQdqtptpQwWZeSL9h425ejw8QlwKMLgJnBj8g8N2Ph5Q7I1VlfuNHn0
	68+3cL+TeHwx1sB0Mj5TRf+ckhierF+REFrB3cz8tmWWkQidca25aF5vDIljOzoNAVCtkjP77724G
	zO+/H0JQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uMT8K-00GifD-F7; Tue, 03 Jun 2025 17:00:56 +0200
Message-ID: <e969d68a-aff3-4560-be28-de17498d7b6e@igalia.com>
Date: Tue, 3 Jun 2025 16:00:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 03/06/2025 14:13, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 02, 2025 at 04:42:27PM +0200, Christian König wrote:
>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>> On 15/05/2025 14:15, Christian König wrote:
>>>> Hey drm-misc maintainers,
>>>>
>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>
>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>
>>> Looks like the backmerge is still pending?
>>
>> Yes, @Maarten, @Maxime and @Thomas ping on this.
> 
> It's done

Thanks Maxime!

Christian, I can merge 2-5 to take some load off you if you want?

Regards,

Tvrtko


