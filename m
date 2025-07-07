Return-Path: <linux-media+bounces-37023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B17AFB612
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84699425E8F
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583C82D9EE0;
	Mon,  7 Jul 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtrrWXCw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF30A2D838C;
	Mon,  7 Jul 2025 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898366; cv=none; b=I/ovZabVZok7Jlv9KBdx8cu0rusAoUEAgOFlzr4ieggz0mmyDSG+o6Pyh3aNlOipq1gByg5E+PHRPxteZfrvIiu6tWoOtDGyWEpVWhj1UIhB5SVpH7Pyw8SH2Mr1smr9vpTY+lzxDXAALhlAtB0Tk78d16KtyHese69yQCNkrDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898366; c=relaxed/simple;
	bh=OBRjOpjOD3WykltUSQMBZISNgt5fgN/t8xYyHJ16hjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lEgW+oV+yh6pNHGzUnwg0zwsk2iyHeuRQ5gHJuk/XRpwCf1A/Qo5FCSmR/FHGsvOW54h7uwMzfo4FmmNo5dr8hmpCMIzXP/+4QZ4a3jLCNHxFSGlEm5999miWSaz3lGjjyh57nJjz4n7zNV34hhHtsVJzf3vqTG5bsTBy9PQssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtrrWXCw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426CBC4CEE3;
	Mon,  7 Jul 2025 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751898365;
	bh=OBRjOpjOD3WykltUSQMBZISNgt5fgN/t8xYyHJ16hjA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FtrrWXCwihQc4HhxP+7uIfFuqgZkW/OrkvocN04uMru1qFolF8COfcG8n9z/7HEu4
	 k1YNKAH+obsa5iDJU39RlkYvJYkhg08KPQC6u3/O3CM1+P+UPNIBKaqPCDtZXJNgIo
	 Ih+9l7xLkH3dXl2QchCsdE9z9HR8PSENbtwZ4jBs1VUdf7VJ2tWbMAEvUIPuJHzFNn
	 T9K7x61OmwJW8pNrYTbukg9jEh3faZkkvUdI9RKAjwwMxESEBMZGmg+mU0b/5ScHOL
	 0wtjO2m1kt7vOnsb78t0dP0InmhzIcfsu3o3/iWZC+6yCTzBDrn0I4n13PNyZMdT3F
	 P9Kxc/F81DxWg==
Message-ID: <b78fbad7-b7e3-454d-be67-03777ba3daa4@kernel.org>
Date: Mon, 7 Jul 2025 16:26:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/nouveau: Remove waitque for sched teardown
To: phasta@kernel.org
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
 <89b0a4bf-2a66-4610-93d2-8f2f096592a3@kernel.org>
 <7d5137a8c71c525c4e806f8ff06102d2e3a47ccc.camel@mailbox.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <7d5137a8c71c525c4e806f8ff06102d2e3a47ccc.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/25 3:54 PM, Philipp Stanner wrote:
> On Mon, 2025-07-07 at 15:47 +0200, Danilo Krummrich wrote:
>> On 7/7/25 3:42 PM, Philipp Stanner wrote:
>>> struct nouveau_sched contains a waitque needed to prevent
>>> drm_sched_fini() from being called while there are still jobs
>>> pending.
>>> Doing so so far would have caused memory leaks.
>>>
>>> With the new memleak-free mode of operation switched on in
>>> drm_sched_fini() by providing the callback
>>> nouveau_sched_fence_context_kill() the waitque is not necessary
>>> anymore.
>>>
>>> Remove the waitque.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>
>> Doesn't this break the driver until fixed up by the subsequent patch?
>>
> 
> Did you mean to answer to patch 6?
> 
> Patch 6 implements the cancel_job() callback for nouveau, which makes
> sure the (still existing) waitque will never block. The, now redundant,
> waitque then gets removed in patch 7.

Yup, I mixed up the order on my end.

Acked-by: Danilo Krummrich <dakr@kernel.org>

