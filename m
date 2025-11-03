Return-Path: <linux-media+bounces-46182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BAC2A992
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 09:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4FE514E2C2A
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 08:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFCB277C81;
	Mon,  3 Nov 2025 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEo4/259"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961372E03EF;
	Mon,  3 Nov 2025 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762159301; cv=none; b=EFN6jlPc4Oo0EuFzGsgC6sRrUSFCd8w8YQShb6mt8hCVv+NTV6TVBirUrw/m2e+wypIQNwBimwBkj3gLQSvvVf0NB+fbazdm9fBX4isTkfnuerumfkVr/CqzKMd/dlCqWqWB9ujWsVqpPHeTChkj7cUcRUzkGP9owPyfFfMQpUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762159301; c=relaxed/simple;
	bh=8aTzAU2/Gv1nRFnHGr2k29zzB9wCWCQrVWNMTykV0qM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hN09ytLpiUYFnAhv9+WEX+Mir33pxK6hQIERK6mJWdVTojl83VYttPkVUjLdFdFt0y+p3dfhOy6cYahCql9CDorttG8owjHAqgZcuUwKrJEeQvyU9J4LXPtzXEW/KAeyWYmNH67q1YJs3tWUHcvl/irRoaLXl98mrXfqWsqwIHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEo4/259; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95755C4CEE7;
	Mon,  3 Nov 2025 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762159301;
	bh=8aTzAU2/Gv1nRFnHGr2k29zzB9wCWCQrVWNMTykV0qM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=QEo4/259tVNl4JUjWFMEE6xAFGOcLTXOiP/hxV4OBOamMFLReci2Ygd3m2KPU5OSC
	 L1mVPlcJBYG+wP+spfy3s7pEb7JQxYk7ALHjsDWHKAp4dZ8pSjyXyLzqetJaC+hapi
	 8Ai9rDAMSA9EwYhszhf+FdVVhhcztvItyoggswC+GXKxQ6OpThHHRnjcwHZu5KKCY7
	 rnza2Gd+TDXp6bfqZXsoUNrHY0c5v38lKnqAoaZRTWuzLILDmrrOgoZsE6ldL5Sw7Z
	 IOFEYhUkJ1GFleftTk1WtSZp6hYDAiVGNKQuHhLZ3RlBp4ng8DA3EFkaHy4eQUVCFW
	 kzVF4omxMlr4g==
Message-ID: <6f1cd703-7efe-4bd4-b236-b01bf1589b73@kernel.org>
Date: Mon, 3 Nov 2025 09:41:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 0/3] media: Optimize the code using vmalloc_array
To: tanze <tanze@kylinos.cn>, mchehab@kernel.org, mingo@kernel.org,
 hverkuil@kernel.org, tskd08@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022032038.422230-1-tanze@kylinos.cn>
Content-Language: en-US, nl
In-Reply-To: <20251022032038.422230-1-tanze@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2025 05:20, tanze wrote:
> Change array_size() to vmalloc_array(), Due to vmalloc_array() is optimized better,
> uses fewer instructions, and handles overflow more concisely
> 
> v1->v2: Update patch #02 #03 due to typos CI robot detected some issues
> 
> v1:https://lore.kernel.org/all/20251021143122.268730-1-tanze@kylinos.cn/
> 
> tanze (3):
>   media: dvb-core: Optimize the code using vmalloc_array
>   media: vivid: Optimize the code using vmalloc_array
>   media: pt1: Optimize the code using vmalloc_array

FYI: all three patches are duplicates of:

https://lore.kernel.org/linux-media/20250812035310.497233-1-rongqianfeng@vivo.com/

which has already been merged.

So I'm skipping these patches.

Regards,

	Hans

> 
>  drivers/media/dvb-core/dmxdev.c               | 4 ++--
>  drivers/media/dvb-core/dvb_demux.c            | 9 +++++----
>  drivers/media/pci/pt1/pt1.c                   | 2 +-
>  drivers/media/test-drivers/vivid/vivid-core.c | 2 +-
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 


