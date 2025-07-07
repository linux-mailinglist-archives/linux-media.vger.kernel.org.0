Return-Path: <linux-media+bounces-37024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD0AFB614
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0FCD426385
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F552DA751;
	Mon,  7 Jul 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXgFnxf4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DDD2D8DBA;
	Mon,  7 Jul 2025 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898385; cv=none; b=M4ibiD+E87EFUGQkwvMHk3O5I3/J14urot7vtrCXmmb4qNhuJcmlsn3jHLvq52kz9+iZmeqIhV83G/ZdykMofmNrLSlhaQUQGXxTcb1FZPNFUXAbpnnZp/Wxqj22xKEcMbg/uc5HYrhGQn9biSQ1IWciP9u4L3yuoHX14yuLcsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898385; c=relaxed/simple;
	bh=pxxSWw0ZaWXiIlPKV16cK66booNTkS+AQKK4//X9m6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtFXnLtZbp9sDxI38c0dnYoKoU/gv0tn4a5KNQdgHdaYmSrrVuI7VgnDdKnSoPhABTuDRGV60hkERd830on/AU49uwuZaeYtjiBAa1WJ50bmogRC9dC0ebXb5S5XQy8L7yljiK6m2jB97bhKZkYC3lSFmdGS9+SMkg5OdZ9/GQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXgFnxf4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44423C4CEE3;
	Mon,  7 Jul 2025 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751898385;
	bh=pxxSWw0ZaWXiIlPKV16cK66booNTkS+AQKK4//X9m6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WXgFnxf49GUpq2xaGWsdgdw4o1mY2SGZjxw6Us19b5sh+qMPCUI4lV+8zMyKuqdFV
	 K92lGix+rpjEtR3gM1oiZGNBPOA0ntfV+PCqKVMDAQHK/J9cVGqxqscMKMnxuZOcfi
	 XjXMgkl5B5QbVwLPcPBe5/XweUBWYAXvHgGqFtwK+ajs7dQ2egbnS7G817K8Kfb/vN
	 Z3Ywrz9Qs7BukE3GhziisRwLurpR7Qjtqqm7+bSV8838hzQgCt8RRQdAuYY9PXdevZ
	 UByzCvf/rPm2kSpc7TPOtk4CmqW1pTyNUJ+E2IjCwr9BXkjqm0qtIi26xVtvz/L67S
	 cB9yBqb8qSXXA==
Message-ID: <91a3d9ca-0420-4f80-893d-708db57b3d13@kernel.org>
Date: Mon, 7 Jul 2025 16:26:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/nouveau: Add new callback for scheduler
 teardown
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
 <20250707134221.34291-8-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250707134221.34291-8-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/25 3:42 PM, Philipp Stanner wrote:
> There is a new callback for always tearing the scheduler down in a
> leak-free, deadlock-free manner.
> 
> Port Nouveau as its first user by providing the scheduler with a
> callback that ensures the fence context gets killed in drm_sched_fini().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>


