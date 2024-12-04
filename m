Return-Path: <linux-media+bounces-22613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A09F9E3997
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7092916A0E7
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80A71B87C6;
	Wed,  4 Dec 2024 12:11:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1981B4156;
	Wed,  4 Dec 2024 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733314308; cv=none; b=l/KiLg0jOLTHYRk89Yq6pyKVQKss57DUzCpYuZd+FjZu8jDY9TP6XbYzx0ek3gJ7Si3Z7vfZc6417p0DgaObixQrnqy7I0TKzLTNgyL9IkBxKOcG2sp75q2hDt57OTSjrr4ZNjqi5cNfdE5BLGe5FwUZp0LZIlXCLE5QIIhzSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733314308; c=relaxed/simple;
	bh=QZpKmJ6sBrSgww05xDv65tB4zzCrJccrNGUUStFDQRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a99spQyGISSgGkRXcPsWG4o9C2/hX+UrlMKB56s128N04Tkmf6AJWIjdaUzKLGmPIk36FEBnL7gi3K6PcWlkbPMfXmIx5Kex5DLHSLmc+ZzMo6hXLUcUZ0mtyLinyCukS1GFE4wl4WaA6CRLstzoiQLsItqRF2V4Wt4H6/AI/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF4BC4CED1;
	Wed,  4 Dec 2024 12:11:46 +0000 (UTC)
Message-ID: <57ed2ba7-ebe8-433f-bb52-914a020ca468@xs4all.nl>
Date: Wed, 4 Dec 2024 13:11:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] docs: media: profile: make it clearer about
 maintainership duties
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <f74d32eba4c1799fe7fd407a3889a3de91fb09f2.1733218348.git.mchehab+huawei@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <f74d32eba4c1799fe7fd407a3889a3de91fb09f2.1733218348.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/24 10:35, Mauro Carvalho Chehab wrote:
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
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/driver-api/media/maintainer-entry-profile.rst | 5 +++++
>  Documentation/driver-api/media/media-committer.rst          | 6 +++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index fa28059f7b3f..87b71f89b1df 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -173,6 +173,11 @@ b. Committers' workflow: patches are handled by media committers::
>  On both workflows, all patches shall be properly reviewed at
>  linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
>  
> +Such patches will be reviewed timely by the maintainers and reviewers as
> +listed in the MAINTAINERS file. The subsystem maintainers will follow one of
> +the above workflows, e. g. they will either send a pull request or merge
> +patches directly at the media-committers tree.
> +
>  When patches are picked by patchwork and when merged at media-committers,
>  CI bots will check for errors and may provide e-mail feedback about
>  patch problems. When this happens, the patch submitter must fix them, or
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

Looks OK to me, but I thought this was supposed to be folded into the 3/5 and 4/5 patches?

Regards,

	Hans

