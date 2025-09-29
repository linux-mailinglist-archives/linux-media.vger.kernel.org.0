Return-Path: <linux-media+bounces-43339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC0BA92F2
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 14:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83BD73C1C29
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 12:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4716B30507F;
	Mon, 29 Sep 2025 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmrS1kYn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A102EB5AF;
	Mon, 29 Sep 2025 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759148335; cv=none; b=DldWRO3aGvRKVR5uv7J6bWzYaW9UbYxtrF8o/IUCSMpRZ89yvJrHiiOdDMlNNkQ0sqvxkHuronas4VPoVV3s2KgMOC6u7Tf3h7OkkYCF4bVHyWK/8+eimnd5WwocYt45uiJEiMZRx+1nXIAhe4gUz0czxRgtp1v9uNFXwBia0ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759148335; c=relaxed/simple;
	bh=sXueTz5qMnG6yHMheDvGdhZckkSaOiS4ip0M93b4lGQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gvC9DI1iDBhYgH38qWGF4wTPXthVlrCssjMQOMdZn4rn8v/xAZFyJfwQjOZ/LX6K/BWirikIg6PbV+elAOLZzziWfpOloDcND8XQpP4NFP3xZzwR18SS0Ogv7fd3BCRjd8YtLqAWeagkxdvX8mWbM3f+c3CbYIh7kzG5IcTzI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmrS1kYn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA701C4CEF4;
	Mon, 29 Sep 2025 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759148333;
	bh=sXueTz5qMnG6yHMheDvGdhZckkSaOiS4ip0M93b4lGQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=lmrS1kYnizAMIIAwuIbWoOScoDyyOwbch+obZSEAsNwH90D8RAirSQbFbVjJtYrBu
	 Ry2a8Ugsl899H27WX57Qt6kSfJm5cFEV7lFbVJ+Fr7UXipE6MKoeu+r4+9gBT9mDPp
	 ZTUUvK0IMty9nYG26v0zaqYAQiWwZ8IaKoS9v7viAC6H8bkoowRAUn49FyKwtKJfZG
	 qHti6MV5mjLsocQferhW0U+CnobLRd/bZBRURB5JIP6X6d86FlWswf6S0G5hcAnt2R
	 hkRo2w/kwu5v9MsmNEkOMAzp7kJUqLcTG1s0FpLtzlU/7/y/NEU62p7qBJvmwrsRzu
	 jSrM6Q3gJHXQg==
Message-ID: <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
Date: Mon, 29 Sep 2025 14:18:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
 <20250929120734.GG2617119@nvidia.com>
Content-Language: en-US, nl
In-Reply-To: <20250929120734.GG2617119@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2025 14:07, Jason Gunthorpe wrote:
> On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:
> 
>> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
>> just papering over a bug elsewhere, or whether this is really the correct solution.
> 
> It is papering over something, group->domain is not supposed to be
> NULL at this point.. That probably means the iommu driver has not been

It's group->blocking_domain that's NULL, not group->domain.

Regards,

	Hans

> fully setup yet.
> 
> This is ARM32? It should have gone down this path:
> 
> static int iommu_get_default_domain_type(struct iommu_group *group,
> 					 int target_type)
> {
> 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> 		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
> 				IS_ENABLED(CONFIG_IOMMU_DMA)));
> 		driver_type = IOMMU_DOMAIN_IDENTITY;
> 
> And I thought there shouldn't be a way to get here:
> 
>> drivers/media/platform/ti/omap3isp/isp.c, function isp_attach_iommu().
> 
> With a NULL group->domain?
> 
> Maybe it didn't call iommu_setup_default_domain() in the right
> sequence for some reason?
> 
> Can you inspect around this?
> 
> Jason


