Return-Path: <linux-media+bounces-32600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F69AB89C5
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 16:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2032F4E6E45
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 14:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE51FAC54;
	Thu, 15 May 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmV0kZfn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30B3D69
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320389; cv=none; b=KPGT27Tzsjyza1kk4UF4B6kqYJVVq51CFyJ7hBXYTchLZaC1Nl1ICO+LzVeVbnEe8t1vjvKgaq0MI2IF7cxjEVgqHFotMMdSXFrOsjLiZiXfbuTFAeU8pT6alkFlYMr1HT0O6kAlBNXbQ/F/g9Yxrs9As1uSFLvBMgRg3yEgm3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320389; c=relaxed/simple;
	bh=gjG62P0KJg9wb0PDRXb676J64qlF8OEy7LbdgiIXd/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E02KxaUY2DUgrIUvKwPPzjstD+4LxvVNsUlIvV94xHcF/ObwCV4RzPA/kLQdECwwCMNBcGxdF6vwRr/p8Ev/OvoMF+0RjLZEwpcSFqalTLWj6Yk+0Tx/6VkJ995N5ypvio39tkxi21CqNVEwkCOFh1FQUg61JdjNK8T14DC63J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmV0kZfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253DBC4CEEB;
	Thu, 15 May 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747320388;
	bh=gjG62P0KJg9wb0PDRXb676J64qlF8OEy7LbdgiIXd/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmV0kZfnqbImnaypqTb06/ZzoXhb9tOyznk7YxlUw5auTR/okdycot9MzWtR3Y1zu
	 n0VQ4XsErpBYKUpoDSfXPzdzJuoQbfk3YjSyuFpX0mT6b1rsLCGyu/NBsYKZYdJILT
	 KoM7EVgll+PczznVlJAUB7JgPUWJsN2kby6Tlcx4bx0cOZOzveAh13T1TA9j1ewqIy
	 DXlLrpqWykZpR1t9T2zzZ5kR5rNtlCZYSy6226H5T6G5UHALrvHE18DykOvYJa1wjJ
	 ycID4vr172cNk0xuBwkttO2Gg1I0BWj70WLRVS4Pcs6zhPzlyd7EEy/URoBqL/PnDp
	 1EA+4PQejXk3Q==
Date: Thu, 15 May 2025 16:46:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4 5/9] drm/i915: Use dma-fence driver and timeline name
 helpers
Message-ID: <gyd2k57ixbkgpogiwm3dyfh24rx74bmi4zn5ftrdnytkfjl34l@moakdhxq3n4d>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-6-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515095004.28318-6-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

On Thu, May 15, 2025 at 10:50:00AM +0100, Tvrtko Ursulin wrote:
> Access the dma-fence internals via the previously added helpers.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

