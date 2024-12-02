Return-Path: <linux-media+bounces-22456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1829E059E
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F21328C8AC
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC483205E21;
	Mon,  2 Dec 2024 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="EjT+TdmT"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88B202F76;
	Mon,  2 Dec 2024 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150940; cv=pass; b=I5kf/6Eucxjqx+HaQc7N8rdZCnnrs+dBsy09rzzjTR8A3nqgEcSk57oYaoAIFpTPw9XSaQSX0euy1uCCamr1aSNZwmqMHC6SYho4WiEdjGfJffY9Yhwwtz7A29LqDFiZaplkO6KsynTjnQjLtmFYXRVDf7OrPeRalq7Yb0Lw080=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150940; c=relaxed/simple;
	bh=H5hPZUx0N71wjzwU9sPZ5euypkFPFfdruoNx7QEtSNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBPAY/vr0pCY281KWBrm5a6D+WDryZ6etbuZJPeKb3SepB7FeWySZFeHkZL2++bvFbM13xr1kvMK+zzxBQD32qJuhOrDxLgUuDKQKV46uXVbUTN0vsM/g3Z4P64i9ExH7sggk/hKNmgRlX/mfZTX02fx1cVFhYmuZkxMwaxhuRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=EjT+TdmT; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Y269f5q4yzySM;
	Mon,  2 Dec 2024 16:48:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1733150934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hk+EnLsdF6+gCNcJg34JWRmKv0bJbT4GQLbay5GUXCM=;
	b=EjT+TdmTB65VfYr1N8VF21Cuux7iblf+AVKZWC2K/0hLzlV/uwny7krPzHMwjhHqE38DCX
	UtuXyFqC1krTAmBJwmnR5/wtWIWxkcmWDTbVEeDANIoVZ+WwhDusBwADXqT3QEn7QU98h7
	irYdWYB5yx3Q9vqmh+H4Nj3THne5P+U=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1733150934; a=rsa-sha256; cv=none;
	b=RP9fa6Sw2GpoYb65medWDIAWOZ6H5zqtZSqAQIYHUmjuHZNSFIs4iRCGRTjv8zBdIbEFCt
	sZ7pS1EcoMybq4A90b3UXJu+t4v4vLygD7zwCWKQx1Nkeu73Nqz2fwAGTMaiSxDkkV/7KK
	Ybbjpk09nZKMpHUnWzxhHvmuled2/IQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1733150934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hk+EnLsdF6+gCNcJg34JWRmKv0bJbT4GQLbay5GUXCM=;
	b=Bx758vUXToUiTuOXeZKqnPHXTfb3vXOhIQs6BEsIi65iOU4k95oWux/AwOLRclS9LfxziT
	fJifoLevnMvAwtOsFKCmuLmZj/q0fMiuB+d/gxoM8PNDhNfK11jaAevfPEj9S9H/3bAnzf
	gAnartX0fmjFJ2iZMSU60DfMPVgqFmo=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6E4B3634C94;
	Mon,  2 Dec 2024 16:48:53 +0200 (EET)
Date: Mon, 2 Dec 2024 14:48:53 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] docs: media: profile: make it clearer about
 maintainership duties
Message-ID: <Z03I1R0aRylSz742@valkosipuli.retiisi.eu>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
 <f47082a84e0c799dd047525d4bc351eb3a759e83.1733131405.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f47082a84e0c799dd047525d4bc351eb3a759e83.1733131405.git.mchehab+huawei@kernel.org>

Hi Mauro,

On Mon, Dec 02, 2024 at 10:26:21AM +0100, Mauro Carvalho Chehab wrote:
> During the review of the media committes profile, it was noticed

s/committe\K/r/

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
> index 705209eacf58..50568c744129 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -153,6 +153,11 @@ b. Committers' workflow: patches are handled by media committers::
>  On both workflows, all patches shall be properly reviewed at
>  linux-media@vger.kernel.org before being merged at media-committers.git.
>  
> +Such patches will be timely-reviewed by developers listed as maintainers at
> +the MAINTAINERS file. Such maintainers will follow one of the above

I'd put this as:

Such patches will be reviewed timely by the maintainers and reviewers as
listed in the MAINTAINERS file.

> +workflows, e. g. they will either send a pull request or merge patches
> +directly at the media-committers tree.

Can we expect people listed as maintainers to either send PRs or be media
committers? I think this might be eventually the result but I think we're
quite far from this currently and I expect things to remain that way in the
near future.


> +
>  When patches are picked by patchwork and when merged at media-committers,
>  CI bots will check for errors and may provide e-mail feedback about
>  patch problems. When this happens, the patch submitter must fix them, or
> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> index 3c2f8f413307..ec81f01db126 100644
> --- a/Documentation/driver-api/media/media-committer.rst
> +++ b/Documentation/driver-api/media/media-committer.rst
> @@ -87,9 +87,9 @@ be delegating part of their maintenance tasks.
>  Due to that, to become a committer or a core committer, a consensus between
>  all subsystem maintainers is required, as they all need to trust a developer
>  well enough to be delegated the responsibility to maintain part of the code
> -and to properly review patches from third parties, in a timely manner and
> -keeping the status of the reviewed code at https://patchwork.linuxtv.org
> -updated.
> +and to properly review patches from third parties for the drivers they are
> +maintainers in a timely manner and keeping the status of the reviewed code

s/code/patches/

> +at https://patchwork.linuxtv.org updated.
>  
>  .. Note::
>  

-- 
Kind regards,

Sakari Ailus

