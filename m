Return-Path: <linux-media+bounces-22210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5969DB4D3
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 10:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3821B28275E
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A6A15749C;
	Thu, 28 Nov 2024 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MbFKEriz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DD61FDF;
	Thu, 28 Nov 2024 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732786319; cv=none; b=fJeLCfEWXugKnXY0QkrOdnq82aVDeDEZjxvzC8Yktff5CMPynROeOQ0sPycGW4dXK7xLX72YjOVKL59twmWKOtOZEiP3v4VRZKsWiCBx5w+yojS5QBXxU6gWzR0TsK137g5wGqL5rzki+uVGuu5Y78XJZkHRoI4UfPtPK5piBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732786319; c=relaxed/simple;
	bh=m4F+PXpK+WzT9jj1TvEqLh9lHUj4BfRz1YLAFlR68tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNP8jaZgYVUr7VUWa2/JcVuGLxL00N6VKB7VY/MH4xTwsHxpcAEmFFV3K2Im+XqgQFFAFhtncGYXC8sZbbVWsTgfC1cHUbbjaYZvBf8+6iLwEuDbKZNy7cTW1HA0WQF99OTvpiBflmBwBnMVKvoD/ARtsrkKNK/qWTBPDsBZbYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MbFKEriz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7043359D;
	Thu, 28 Nov 2024 10:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732786290;
	bh=m4F+PXpK+WzT9jj1TvEqLh9lHUj4BfRz1YLAFlR68tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MbFKErizLbIcJxW4ECYlQjf86hwh95M9J33xEcCyQWHCEz4GXEEqMBYmPna/Ckrp7
	 Ijpw8YgEitjjILTGs7xE4Dl/9y3kME0aL5740PIhbQnOXlz68MdhTZRNcGFjX+csRZ
	 FSt/pdqxfyCIZNUueC5ekC+qAWbnK6gUnn8Apm0s=
Date: Thu, 28 Nov 2024 11:31:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128093143.GB13800@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <e0535e20-6e97-437f-8565-53fd257c7618@xs4all.nl>
 <20241128091959.7ddeec08@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128091959.7ddeec08@foz.lan>

On Thu, Nov 28, 2024 at 09:19:59AM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 27 Nov 2024 12:59:58 +0100 Hans Verkuil escreveu:
> 
> > > I find the GPG signature requirement to be borderline ridiculous. The
> > > first message you're giving to committers is that you distrust them so
> > > much that you want them to sign an agreement with their blood
> > > (figuratively speaking). I don't think it's a very good approach to
> > > community building, nor does it bring any advantage to anyone.  
> > 
> > I kind of agree with Laurent here. Is the media-committers mailinglist
> > publicly archived somewhere? I think it is sufficient if this is posted
> > to a publicly archived mailinglist. That could be linux-media, I would be
> > fine with that. But media-committers would be more appropriate, but only
> > if it is archived somewhere.
> > 
> > If we want a GPG key, what would we do with it anyway?
> 
> Every time I send pull requests upstream, I sign the PR tag with my GPG 
> key:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git/tag/?h=media/v6.13-2
> 
> This is a requirement from the top maintainer. Requiring it is pretty much 
> standard at the Kernel community, and wasn't anything similar "to sign with 
> my blood" (using your words).
> 
> It is not just a random GPG key: it is a trusted key as stated at this patch:
> 
> 	"a PGP key cross signed by other Kernel and media developers"
> 	 ...
> 	 For more details about PGP sign, please read 
> 	 Documentation/process/maintainer-pgp-guide.rst and
> 	 :ref:`kernel_org_trust_repository`."
> 
> If you see the last link, we're talking about a GPG signature inside
> kernel.org web of trust.
> 
> Heh, all PRs we receive are signed with GPG keys that we trust, including
> PRs from you. We need to keep doing it with the new workflow.
> 
> That reminds that there are still a gap there: the e-mail from the 
> newcoming committer shall contain something like:
> 
> 	"I'll be using this username to commit patches at media-committers:
> 	 https://gitlab.freedesktop.org/<username>"
> 
> I'll add it to the next version.

I don't mind much either way, but as we're using gitlab for the shared
tree, we could also do the same as drm-misc and handle this through a
gitlab issue instead of an e-mail. That advantage is that we'll ensure
the person has a gitlab account.

-- 
Regards,

Laurent Pinchart

