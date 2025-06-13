Return-Path: <linux-media+bounces-34705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C2AD84EA
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46933A5C61
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 07:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1D72E6D19;
	Fri, 13 Jun 2025 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pKtl3N3d"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188AC2C3268
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800440; cv=none; b=oan/Avcx5QbZTcjcC4MEuvH2bNsX8V2eeJ/TiVpyVsROKL872D3HPveZhdcQUAf8b3Zw5Zdm1OXFL3QQxbvpPotG9nr7HpoTPftIzHqX9AVAuVINTaEgDUlxTItATb6EMf27czwDjPTWZ3xeOEjQIk8rxVSgWLlrKysMF3LWL88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800440; c=relaxed/simple;
	bh=UQ4VB5/wh31U7Yy88Dly6xL6WULdi4rErdf1WL/qNIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0Km4r7oSxsm8d9yQBXzxggrW+uVTKDq4KA7nWU4xbLn+yf5CrgUMOQvxDWvKIUgnxIiVwm3iMzeyVBi8047ft4NFseOhg3tmqbRAblU3uxPJkxvMNZb2u/1F9d5/4DX9UxmBy9Rj3p+X45KlaTjNhdcJvNIlym1buBAd7PRYOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pKtl3N3d; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=30ezSC5SuiN0IChbbRZASt5M1rZUDx5UAhi1YP6jKF0=; b=pKtl3N3dNtArzKVtv7y/bpuBWj
	Et87NBgYnRm91BqJx4CM/u0+4pR95JNXUx6cKR+XyLuukbV2oVoWbWer+E2r8ceQDs/lLNJksLy6z
	j/bW1JXti2NzQ/AMj8ypECl9riVPFyEvp+vZQtb0D53cluiwEw6FHko0fyXaa7dVvZLrTspUmVzeZ
	UxBBYrOCuFYt/qa61rpkSIPS+/a3mLwo0tN3d90N0o1ocQEny8xTo9WNPgy0sreWTB57wba1rfUu1
	AkeVh50M+5C3biWbOyMABV8ghv5b1ODheC8TN7/d6LQ5P0oLWW/M5ZIHnHxhu2WnDbZp3K1gvugqp
	KBTqgMfw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uPz1K-002vBD-5Z; Fri, 13 Jun 2025 09:40:14 +0200
Message-ID: <36c36380-6770-4776-9e85-69299e4ab11a@igalia.com>
Date: Fri, 13 Jun 2025 08:40:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe: Make dma-fences compliant with the safe
 access rules
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
 <20250610164226.10817-5-tvrtko.ursulin@igalia.com>
 <lagtnrxxqzwn4akmummmuxd4msqctbzrqbht66debl7ktzgkpm@7xn5yv5ackvl>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <lagtnrxxqzwn4akmummmuxd4msqctbzrqbht66debl7ktzgkpm@7xn5yv5ackvl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/06/2025 18:49, Lucas De Marchi wrote:
> On Tue, Jun 10, 2025 at 05:42:26PM +0100, Tvrtko Ursulin wrote:
>> Xe can free some of the data pointed to by the dma-fences it exports. 
>> Most
>> notably the timeline name can get freed if userspace closes the 
>> associated
>> submit queue. At the same time the fence could have been exported to a
>> third party (for example a sync_fence fd) which will then cause an use-
>> after-free on subsequent access.
>>
>> To make this safe we need to make the driver compliant with the newly
>> documented dma-fence rules. Driver has to ensure a RCU grace period
>> between signalling a fence and freeing any data pointed to by said fence.
>>
>> For the timeline name we simply make the queue be freed via kfree_rcu and
>> for the shared lock associated with multiple queues we add a RCU grace
>> period before freeing the per GT structure holding the lock.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> for merging this through drm-misc tree.

Thanks!

I've now pushed the series drm-misc-next.

Btw there is also an IGT for xe I wrote ages ago^1, if you want to ping 
someone to review it or take it over. Might be useful to have permanent 
verification the UAF keeps being resolved.


Regards,

Tvrtko

1) https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2


