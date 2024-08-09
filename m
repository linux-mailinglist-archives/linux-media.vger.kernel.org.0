Return-Path: <linux-media+bounces-16048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F043C94CCA0
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACDA2284822
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3B118F2F2;
	Fri,  9 Aug 2024 08:47:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A64431;
	Fri,  9 Aug 2024 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723193251; cv=none; b=Db/Z4kpbvmcplfuzHugr+0FlosjOVjZNnrOmn7mOcm+I5PF/3IhuIViWEWhxIBmytW4Acz6VImUXxpW1UwitrGeGS6UucT5HXhgGE+PTQ+J6JgRUDVK6VPIjrCLkinFzZad57nih9q46K37qP5uXC+Xt9O6efRZIJLQimmXrcKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723193251; c=relaxed/simple;
	bh=RiotSpGqe/9Jcb1UC3yCnzHuIxPpn3Wgyr1HMSC2pJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1yLqTnFwBZSeZ8GAGg3NKAh0fVCqFfrN6mQFSj3zD4mIOERhy0vx8iv6BFzGV1SFstLrEdTFqr4zF5hRnrYH6d2qO/3EhI6GgqEeE12mCBACHRjNQhgOUGUXyyJacSsJ+NAdzAV0Mw84d1j68Sp1gYVhxXlNc4Ejp7fCveRa7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4F2C4AF09;
	Fri,  9 Aug 2024 08:47:29 +0000 (UTC)
Message-ID: <ae2e0ed7-0a39-4bf5-a122-73ac6667a326@xs4all.nl>
Date: Fri, 9 Aug 2024 10:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: staging: media: starfive: camss: Drop obsolete
 return value documentation
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, kernel@pengutronix.de,
 linux-media@vger.kernel.org
References: <20240424140249.542283-2-u.kleine-koenig@pengutronix.de>
 <qftrobdg46arzt5isc2fwmgwncnszkcfcsw3gf3exk7a6ubhzv@w4icj5ykvskl>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <qftrobdg46arzt5isc2fwmgwncnszkcfcsw3gf3exk7a6ubhzv@w4icj5ykvskl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Uwe,

On 22/05/2024 08:35, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Apr 24, 2024 at 04:02:48PM +0200, Uwe Kleine-König wrote:
>> Recently the function stfcamss_remove() was changed to not return a
>> value. Drop the documentation of the return value in the kernel doc.
>>
>> Fixes: b1f3677aebe5 ("media: staging: media: starfive: camss: Convert to platform remove callback returning void")
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>> Hello,
>>
>> during review of the patch that became b1f3677aebe5 Changhuang pointed
>> out this patch opportunity. But before I came around to send a v2,
>> b1f3677aebe5 was already applied. So here comes a separate patch.
>>
>> If you prefer, feel free to squash this into b1f3677aebe5.
> 
> Who feels responsible to pick up this patch (or alternatively give
> feedback)? Did I forget to address the relevant persons?

Nope, just too many patches and too few reviewers :-)

I'll pick it up.

Regards,

	Hans

> 
> Best regards
> Uwe
> 


