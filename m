Return-Path: <linux-media+bounces-36909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F363AAFA6F2
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 20:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E4E3B3B2B
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 18:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14D229E0FC;
	Sun,  6 Jul 2025 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vqe3go0t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6E5522F;
	Sun,  6 Jul 2025 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826358; cv=none; b=a8XirDekdtofFBqldeBe47VlOvQBWAWe+TPzRaVHlKg9CydrA0m6vecf6Qm6fjPX3Cg2fFhSq8KjKiwOjkqZRxY1BjioeC5a1X/z1Ltkr1zj+KYIo1pk+klEXWOpbKncsKzRg+aUJtMo3X2ALhaEZO0igp2+5VUK9irCAmSvESg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826358; c=relaxed/simple;
	bh=TiRh17OBztLl/5Um33JRzwwVspvarTEzm3jzvByfFbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEBFWMyhHyi0iPw0OwF2shT+fPi0lYPXs8cML4JqLyx8t2MAEsPRO/y+/mGT92p4s14zGt3OqOgi4Kfq/Bv1cbdFhlJ61/PbDkIOyZ68C589IOAJ2Q7X/t+TctA73c/dLidTZ++yr0z/GD/FRCroQeg8N+JljSn5vlPaBfo+nK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vqe3go0t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7E9C4CEED;
	Sun,  6 Jul 2025 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751826357;
	bh=TiRh17OBztLl/5Um33JRzwwVspvarTEzm3jzvByfFbI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vqe3go0tIOi/wdCLN4qfOdxNrHYmlMt5FPsrNnA2BPXh6D+V8JgBEh/uOl8usVpnt
	 LcdFvEGUR8qLAYzxBY1MgTrsNazo10ZAMc57diVKTS/PCwXV3cL7x6jkYdn+YyTz2v
	 zVKzPyHEmFOzdKRIfXUd1fu+KF0rBZJnMTCp7Kepaund2hyAJsIvrt8UXsZV9d+gZO
	 IXV7h5nmhmLW7Bo0j6JN46ORuPcQf8yPfJ9l19VrVfNRYnr8p4DSKuyY6ER0K/Tysf
	 /l9g/3A8t9P8WPWJRQ2QQGxtZ04eCT8QvkwY5t4XqdCqtuuhRhz7TIgoEwQAqp6uAu
	 MeOO4FnqNI0pQ==
Message-ID: <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
Date: Sun, 6 Jul 2025 20:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, skhan@linuxfoundation.com,
 dan.carpenter@linaro.org
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com>
 <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
 <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Abdelrahman

On 1-Jul-25 5:45 PM, Abdelrahman Fekry wrote:
> Hi Hans,
> 
> On Tue, Jul 1, 2025 at 4:54 PM Hans de Goede <hansg@kernel.org> wrote:

...

>> Actually I'm pretty sure that there will be quite a few
>> error-handling paths with bugs in the atomisp code given
>> its overall quality. But lets clean things up first, that
>> should make addressing any such cases easier.
>>
> I totally agree with this , i have submitted a patch that cleans the
> custom sysfs atrributes
> as you suggested as a beginning , the patch got reviewed by andy and dan
> here is the link
> https://lore.kernel.org/all/20250627100604.29061-1-abdelrahmanfekry375@gmail.com/
> 
> What do you think I should work on next after these two patches, do
> you have any suggestions?

The hmm_alloc code can use some more cleanups:

* hmm_get_mmu_base_addr() should be moved to drivers/staging/media/atomisp/pci/hmm/hmm.c
  and then the "struct hmm_bo_device bo_device;" in hmm.c can be made static

* hmm_init() sets hmm_initialized = true even on errors. It should
  immediately exit (return ret) on errors instead of continue-ing
  with calling hmm_alloc() even though hmm_bo_device_init() failed.

* I've checked the code and hmm_init() is called before any hmm_alloc()
  calls are made so the extra hmm_init() call in __hmm_alloc() can be
  dropped.

* After dropping the extra hmm_init() call in __hmm_alloc() the
  hmm_initialized flag can be removed since it is now no longer read
  anywhere.

* And maybe you'll find more possible cleanups while working on this

Regards,

Hans



