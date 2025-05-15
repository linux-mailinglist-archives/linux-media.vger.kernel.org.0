Return-Path: <linux-media+bounces-32603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 684BDAB8A4E
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 17:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F304918880F5
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B1E20C000;
	Thu, 15 May 2025 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+CWyul2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C629A1A5BAB
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321715; cv=none; b=LxNIIf4Dh/L7zMeq0DI/sKI7n0+1TQ5ZQ9i7OOVc4clkK+GAYySokE3FsVZS4aO1/XhafcN9xEqV/eh9vLsWlXz8LXpgE/aT7k4JNc8rYBTo/qmhh7UB5THd8mEIKDVMH5vFoNozPsq4PLbVUXEb0RinAUOGxOH47+3My/ys/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321715; c=relaxed/simple;
	bh=T5kkul3BV/QRdJCmvk/2TGfIferyKnWXjHhzw3j3+nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJuMvSqSWhwM60hGe9jLlwoIYIJTktvxndfxSX8UjZKm1v9Ato1AU7nr+780KUoBcyT1jblUujTYc3ZVzvX9brlywuqLGNojRCM8yme0G7if9sVPkA7oeTkKFxCzZLFp0EB4Q9m2QRuLch4zUJOm2jlerpeK7qsJmR3zmuIxA1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+CWyul2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8735C4CEE7;
	Thu, 15 May 2025 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747321715;
	bh=T5kkul3BV/QRdJCmvk/2TGfIferyKnWXjHhzw3j3+nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+CWyul29adiQPxbMua9d+kdRwATeyVhkYU+3SwDW0I66ifkeamziYp9N9Fw8DEAw
	 GMAyA73di3gUImvFXL2p3bc2kml5NqP8jlvj2vN0f31d/+uZhBJE7IXr6NR40/59Wz
	 9OyEcFqQi/HzagO8H16rjt4y4NO/sJKlgQ45TW0EyzFyHdqERgrlu1A3OhYjsC4pc6
	 avqnoanQ9XGgGJg+VDXQQpI4gyWsqqWNLQb8vyBZpP0Hso+7ezm9nXH9EXL1MWY3AU
	 BWh7rjkPTL8ip6qOCY5qRZp1E/cCdzReuDTxa7JH4pO0c1ALHHLzbfej4x7JUSss7Y
	 Priro14hBexoA==
Date: Thu, 15 May 2025 17:08:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4 8/9] drm/i915: Protect access to driver and timeline
 name
Message-ID: <zlpoo6ve2tpzmooliqodcmobntgzjamzrco4amn6mnxf473roc@xv473ar3qcec>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-9-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515095004.28318-9-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

On Thu, May 15, 2025 at 10:50:03AM +0100, Tvrtko Ursulin wrote:
> Protect the access to driver and timeline name which otherwise could be
> freed as dma-fence exported is signalling fences.
> 
> Now that the safe access is handled in the dma-fence API, the external
> callers such as sync_file, and our internal code paths, we can drop the
> similar protection from i915_fence_get_timeline_name().
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

