Return-Path: <linux-media+bounces-42942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F7B911E2
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3462C1763C9
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 12:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9163A307493;
	Mon, 22 Sep 2025 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFISUv0C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C45288CA6;
	Mon, 22 Sep 2025 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758544037; cv=none; b=YRCc3bqLbw3cafUNcIa9n1UqIqT0Cln05V3ffXCdyTdIthZCdItD7Trke3T+zhvvUKMNXIfkNmjoyicIfWnn4mAKuLRQcYEZEYpoiKW0ouzi+cgmRyDxHGZmwmDtvNGYAv2Zuez50uQqQwcH8EwD8wdd/aTAvIpnUcCeOl3lqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758544037; c=relaxed/simple;
	bh=nn71jYKJUfLJdSiXQc761lhdp5O9gEml56dkSvOCQ+E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JyU4SyqdjrvQX26+54sdfd+4JL2sOB4xO3En90Jz6aIpcfWxZjK7tXmGcIoMWTQX1nlZYcHL9fTcvsVSE4fucKQ16ChiOCDsInKZqbGtohjtFSEiyZ3lzGHULL/1i16NdWrRsyfBvide6dmKtJ573wUGLmvHle+X0xvtGKA29Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFISUv0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8D1C113D0;
	Mon, 22 Sep 2025 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758544037;
	bh=nn71jYKJUfLJdSiXQc761lhdp5O9gEml56dkSvOCQ+E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=NFISUv0ChwJJp7wFd7//jAHXUtELe5XBclawAhLLONURnxG/Q+94ixqXwLbAqEhaE
	 hAgAx3tS8wLWVcU8FlfiAxYWuu15A94zGKUE50MiTuhr0/T9jxdsQiQHCDCBOD4DdT
	 utXZJGesvqkuaPna5Q6yeTAd+sMm+x+xH2zt3JgapUCcpeVl/SakISVonfIIAajxCb
	 MRgkkGcnIKa9hFC9jV5VzcmMh+2C+AiTtcedqUqSo/1NiEskUttHgdrLFIsx02vQUd
	 WZcxQCyT9fot83rxPqSbpLURp26meXs/F0LviTSExPkU0S/9jEC7HWr3AI8pGFjqmv
	 fYgAtAaWJBjxQ==
Message-ID: <70b66bb7-3889-4c66-bbeb-e3961f16d7b9@kernel.org>
Date: Mon, 22 Sep 2025 14:27:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 5/5] docs: media: profile: make it clearer about
 maintainership duties
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <cover.1755851331.git.mchehab+huawei@kernel.org>
 <a17ca9fa81e95aff9167c6f1162b4703178c65c9.1755851331.git.mchehab+huawei@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <a17ca9fa81e95aff9167c6f1162b4703178c65c9.1755851331.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2025 10:33, Mauro Carvalho Chehab wrote:
> During the review of the media committer's profile, it was noticed
> that the responsibility for timely review patches was not clear:
> such review is expected that all developers listed at MAINTAINERS
> with the "M:" tag (e.g. "maintainers" on its broad sense).
> 
> This is orthogonal of being a media committer or not. Such duty
> is implied at:
> 
> 	Documentation/admin-guide/reporting-issues.rst
> 
> and at the MAINTAINERS header, when it says that even when the
> status is "odd fixes", the patches will flow in.
> 
> So, let make it explicit at the maintainer-entry-profile that
> maintainers need to do timely reviews.
> 
> Also, while right now our focus is on granting committer rights to
> maintainers, the media-committer model may evolve in the future to
> accept other committers that don't have such duties.
> 
> So, make it clear at the media-committer.rst that the duties
> related to reviewing patches from others are for the drivers
> they are maintainers as well.
> 
> Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/driver-api/media/maintainer-entry-profile.rst | 5 +++++
>  Documentation/driver-api/media/media-committer.rst          | 6 +++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index 41a1a2326bef..67a18f82f857 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -177,6 +177,11 @@ b. Committers' workflow: patches are handled by media committers::
>  On both workflows, all patches shall be properly reviewed at
>  linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
>  
> +Such patches will be reviewed timely by the maintainers and reviewers as
> +listed in the MAINTAINERS file. The subsystem maintainers will follow one of

You probably mean "media maintainers" instead of "subsystem maintainers".

> +the above workflows, e. g. they will either send a pull request or merge

e. g. -> e.g.

> +patches directly at the media-committers tree.
> +
>  When patches are picked by patchwork and when merged at media-committers,
>  CI bots will check for errors and may provide e-mail feedback about
>  patch problems. When this happens, the patch submitter must fix them or
> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> index 3d0987a8a93b..0bc038a0fdcc 100644
> --- a/Documentation/driver-api/media/media-committer.rst
> +++ b/Documentation/driver-api/media/media-committer.rst
> @@ -90,9 +90,9 @@ be a part of their maintenance tasks.
>  Due to that, to become a committer or a core committer, a consensus between
>  all subsystem maintainers is required, as they all need to trust a developer
>  well enough to be delegated the responsibility to maintain part of the code
> -and to properly review patches from third parties, in a timely manner and
> -keeping the status of the reviewed code at https://patchwork.linuxtv.org
> -updated.
> +and to properly review patches from third parties for the drivers that they
> +maintain in a timely manner and keeping the status of the patches at
> +https://patchwork.linuxtv.org updated.
>  
>  .. Note::
>  

I think that it would make sense to just merge these changes into the preceding
patches.

Regards,

	Hans

