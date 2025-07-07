Return-Path: <linux-media+bounces-37013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EADCAFB51B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D716B172C58
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 13:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E203F1F4CAE;
	Mon,  7 Jul 2025 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLkNWj/e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B181EF1D;
	Mon,  7 Jul 2025 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896052; cv=none; b=Odd/CNPq9jqWCgGKjI1u6v6K9mgXwlwhN5pjlag0Ek6Z4+brvUllYQ27+A9XswkwszygvjEWBSXIvXh6YhtyiHt0aAWbNzbeSazr1soRc9qk3IhdmNglzBNWy0/9yrzCYtbeRXL3vDWVq+ccxn3kuYat8b0X1P8Rdsfm/ar8wwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896052; c=relaxed/simple;
	bh=NkJ28C6WWVMhFFn2trWWf6jY+uHY6XH7e1z7DoddFtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FuQ4HcGXau1FkYclNzzHVwNB0Yto/mUnxTimGGATDcZ/Ntv1wKWyPXNPlKPq1ONJ44qrtuJll8c52O68n1GlcTRGVC6NB3r7gKPIMzp2mw/plHykjS3KKJdtMkCCE5zH9/p/pYGkqnm6DHYlTp5jsJdZMAcWlWZPu95KYb3nOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLkNWj/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82BEC4CEF4;
	Mon,  7 Jul 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751896051;
	bh=NkJ28C6WWVMhFFn2trWWf6jY+uHY6XH7e1z7DoddFtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jLkNWj/eSCL6Op2B7n+OrHoC1annBvQxj4QC8Z6bqxoENFIw5wQA0O/ujXkebp7DQ
	 YORxsB710egtIKAPSJxQP3v77rtnW8nU9vYiDabPH2OJiMdMQarG50yNOZSaCIyvo7
	 AqSkt31ClNyES1eafiZBXFgOW/IO6dDf9YLbtPYlkGRJLNTqMDi6Rd2chTfH6MZkE0
	 SBmXJhRPCOqdksUpsIFDRhw09NGKnC6yd69eIwJZeTwCoXd1+Y1LhTRVUbu6XbglOH
	 O0W9AB6sVUJsjlbEfPoWnswdFLbqHax8E5zzoaOg+2M2aNo+XmyVnDep/y/X1JrmIn
	 HjZrl3Jo8HsUQ==
Message-ID: <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
Date: Mon, 7 Jul 2025 15:47:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/nouveau: Remove waitque for sched teardown
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-9-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250707134221.34291-9-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/25 3:42 PM, Philipp Stanner wrote:
> struct nouveau_sched contains a waitque needed to prevent
> drm_sched_fini() from being called while there are still jobs pending.
> Doing so so far would have caused memory leaks.
> 
> With the new memleak-free mode of operation switched on in
> drm_sched_fini() by providing the callback
> nouveau_sched_fence_context_kill() the waitque is not necessary anymore.
> 
> Remove the waitque.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Doesn't this break the driver until fixed up by the subsequent patch?


