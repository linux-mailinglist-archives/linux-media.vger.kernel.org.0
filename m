Return-Path: <linux-media+bounces-45494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED43C062F8
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F3D24E4FED
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F471313E2E;
	Fri, 24 Oct 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKvfsL01"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D652D5924;
	Fri, 24 Oct 2025 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761307980; cv=none; b=Cd1+GI4Q1+TQdVGjqeTiY23m8PdBUTDLrscoNTaDLZi77oB9NZX1T8mQQpj1eFlfkZyuNRmKFe9zlIhq5JSIkDiysZqbel+bDXcb4tUtA7gVlot6ocZfAPyS/+nPJJNEmQQIBkPRyZJW39Ss5tAlqovpfXRItE43OcNhVs02850=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761307980; c=relaxed/simple;
	bh=OUk76ys6nMYdTGFO9m0BC6J/XiUc43vsBYgM5iphDsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PovncGRmmr8PLEKNY79XlOUvAy1gj2Hklp9HA4DUYiaJgl0Lmza8V0LvpcWMuRa9oHrAq4TDoenQiHrio4OpjnTT0qvAblYFdo8qGfJ0kLkKISQVscnDLX4sBegTMezmUoNtm+EgLCSMtortBwa5tUuu2QdiZ3Gwsbp85Q3v1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKvfsL01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D608AC4CEF1;
	Fri, 24 Oct 2025 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761307979;
	bh=OUk76ys6nMYdTGFO9m0BC6J/XiUc43vsBYgM5iphDsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KKvfsL016APxbCetUhGFzBkdrNnbXJrbu9QqLvml7A0H5TmGT9VKfKC4Q4gOE1Ayu
	 p0cFFzA087tdWMnri0ZNtgEE4Ly3eKBPEqM18dJuqOLZ0HPn/MhBql7M/s+329FFp8
	 lcBpyXEULsBsrLvrasfRQSXvoJj2G2wm4BHKvkVGXCsGjcWWiNebbRy3zIkHEpi141
	 onbxiNmYbmKPUBougQcJ9UwqDw7jp7Wg2jIdciYo3Z1qNwFO7eCyEKuHPJC3BX2JhD
	 41BTg6sN6z4uUSTWMgGi1pItjxuKwVtp9LueSPyOumGdiizabputuHu+iVzmNedH27
	 JP3ejm2KpXwEw==
Message-ID: <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
Date: Fri, 24 Oct 2025 14:12:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/24/25 1:31 PM, Tvrtko Ursulin wrote:
> Also, the short name can be reduced from a verbose starting point similar to yours:
> 
>  "unknown-driver-is-detached-from-the-signaled-fence"
>  "driver-detached-from-the-fence"
>  "driver-detached"
> 
> Or keep "detached-driver" as good enough. Mea culpa for typing it up transposed. :)

"detached-driver" is misleading, just because the fence is signaled it doesn't
mean that the driver is detached.

