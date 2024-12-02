Return-Path: <linux-media+bounces-22417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA79DFECB
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 11:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 520052814B6
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8168C1FC11B;
	Mon,  2 Dec 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZZIOM5iC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B4F9EC;
	Mon,  2 Dec 2024 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135081; cv=none; b=iAwx3RuFS2TGhbEpesKtK0AEXNW2SlHS6RV6TtideiuwXVHCig86TlkoPKN1wsn2qNJy2RnRHNSACmtpP/5dVNDRnKY0b2hQSG6TShD+YcS+8hmMa8Bt7woAIGO/VjoEuwG9gfCkwRA3azExHcBqbDRyQP2tpgJbxu0xDK7SOR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135081; c=relaxed/simple;
	bh=8zDgyIk2rYgZYlwF0QZb1Fo7aWXlagn21y/+c7/vosQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVZG38Rak/kMn06LAGLv6CFJC82EDRX3k9Jxp6NrNyXjcSASgLOGa0GzzXOVUdOfj/S8aDM7BjAhGeQExntmY0fo/c+l7sSKTdINidcPFOukvCjevtJitxLkZP3fZvCLXFjLEE1V3DIkfO0PerasaO7UZncghvdnhyrOtnvAlzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZZIOM5iC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A6014C7;
	Mon,  2 Dec 2024 11:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733135049;
	bh=8zDgyIk2rYgZYlwF0QZb1Fo7aWXlagn21y/+c7/vosQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZIOM5iCcBO4MgdfOcSBsnvPt23JDch/y5CgvAX8NxGNRSedvdLvG9B0wmbpa0l+E
	 quvK4Fi5P2CzcgcYQkdRqVQjKEDo/0AM4KLCiZeVmw5UvyZq5+lrj7eFwH9yNTE5WN
	 cRtyLlZuyiNC8B75AcAyUoqCeHqanPZ7YkI5bLno=
Date: Mon, 2 Dec 2024 12:24:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241202102425.GD16635@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
 <20241127132515.GH31095@pendragon.ideasonboard.com>
 <20241128191543.289f0d84@foz.lan>
 <20241128190707.GA13852@pendragon.ideasonboard.com>
 <20241129112952.1f0c9222@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129112952.1f0c9222@foz.lan>

Hi Mauro,

On Fri, Nov 29, 2024 at 11:29:52AM +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 28 Nov 2024 21:07:07 +0200 Laurent Pinchart escreveu:
> 
> > > With that in mind, every committer has duties of reviewing other
> > > developer's patches submitted for the drivers that they're listed as
> > > a maintainer at the MAINTAINERS file entries.  
> > 
> > I'm sorry but that's not a multi-committer model, it's a co-maintenance
> > model. If that's what you really want we can reopen the discussion and
> > start anew, but I don't think it's a good idea.
> > 
> > As I said before, if it increases my work load, I don't want commit
> > rights. I'll keep sending pull requests, you'll have to keep processing
> > them, and patches will be merged slower. It will be a lose-lose
> > situation for everybody, you, me, contributors and users.
> > 
> > Starting with a situation where we are understaffed and trying to solve
> > it by putting more work on the few people who currently keep the
> > subsystem alive doesn't sound like a winning strategy. 
> 
> After sleeping over it, I agree that you're partially right on this.

\o/

You should sleep more often :-D

> Doing timely reviews is orthogonal of being a committer. What defines
> if you need to do timely reviews is if you're listed or not at the
> MAINTANERS file as "M:" - e.g. if the developer is a maintainer
> (on its broader sense) or not. This applies for both PR and MR workflows.
> 
> Still, if one is not fulfilling its duty as maintainer, he may end
> losing maintainership status and the corresponding committer rights.
> 
> I wrote a separate patch to make it clear. See below.
> 
> Thanks,
> Mauro
> 
> ---
> 
> [PATCH] docs: media: profile: make it clearer about maintainership duties
> 
> During the review of the media committes profile, it was noticed
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

I'll comment on this on v3 of the series.

> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index 650803c30c41..6daf71bc72c1 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -147,6 +147,11 @@ b. Committers' workflow: patches are handled by media committers::
>  On both workflows, all patches shall be properly reviewed at
>  linux-media@vger.kernel.org before being merged at media-committers.git.
>  
> +Such patches will be timely-reviewed by developers listed as maintainers at
> +the MAINTAINERS file. Such maintainers will follow one of the above
> +workflows, e. g. they will either send a pull request or merge patches
> +directly at the media-committers tree.
> +
>  When patches are picked by patchwork and when merged at media-committers,
>  CI bots will check for errors and may provide e-mail feedback about
>  patch problems. When this happens, the patch submitter must fix them
> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> index 1756a7af6353..a873ef84fbca 100644
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
> +at https://patchwork.linuxtv.org updated.
>  
>  .. Note::
>  

-- 
Regards,

Laurent Pinchart

