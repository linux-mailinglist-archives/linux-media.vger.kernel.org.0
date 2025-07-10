Return-Path: <linux-media+bounces-37297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73070B002DA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760261899E8A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A60B271464;
	Thu, 10 Jul 2025 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP2eagOu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935681D540;
	Thu, 10 Jul 2025 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152666; cv=none; b=GGhj1Iui+OiVz1WJXlBxuabjur2BRjfbf3m6bOPBHGRiFxgmmwXVS7P3JPeT9YiqEitvQQBaVD6M5RIxUKxjNWVrx/xYKHNit2r2mKynWdl0w4ulzAf6HV89fDK55yq6CvadvujF3+JdxQhKqcjLlgSGQk/4okkBAMMJQDAqZ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152666; c=relaxed/simple;
	bh=BHOC+TSzhCIVcZOw1VLJxp7vsQPBk3FHoqJH1ZVtsmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTisMZqGZHaQcu01M0jXEB2amYU19XGaS2lMa72HT8QqsBaGyWNoLT1T6ArohhHTmWVUz9Qv7ZamrCXJc0Sp7InIrOIjzD8ipLo8jfe5AK9LADkgxnXY4q6lNId0AriwdHfURTEqc/KP9d6czNaLRWDl6jnM8sCrHFPskETCvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP2eagOu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D82CC4CEED;
	Thu, 10 Jul 2025 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752152666;
	bh=BHOC+TSzhCIVcZOw1VLJxp7vsQPBk3FHoqJH1ZVtsmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PP2eagOuc8IoRtNsmCjaToKfVumdA4viRj1tH5reOUDGB9E7A1QU7EmdMGJCX2J+f
	 tZ+1X7IsGl6tDNR5vm6glWzd7D4zvstdMS7UzlcA6CCZFHYZKIi5Q5JQgVmR3ZPWes
	 WwGJ0IeYTSkBT0ROWSoXAjlvafNE4ETR9jt3fMp+ybfbLqM+EYj5NzkPmXy5tBtv9E
	 X8PmSYzKF5mpgsG4WLH7eUhtW5Q6thaMz6l3KEQU7A6a8xn66clQx/pJj1Az+VZjAI
	 /tYFj1UEEfL33BqfBw6onSzJj3wACTtUzUyoBiK2lCU+XocpL52IynxguROiXZms1o
	 5wVJ+w1qy4xqw==
Message-ID: <eb83c9ec-47cc-4f56-b5fe-d912d3a085fe@kernel.org>
Date: Thu, 10 Jul 2025 15:04:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/sched: Warn if pending_list is not empty
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250710125412.128476-2-phasta@kernel.org>
 <20250710125412.128476-7-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250710125412.128476-7-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/25 2:54 PM, Philipp Stanner wrote:
> drm_sched_fini() can leak jobs under certain circumstances.
> 
> Warn if that happens.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>

