Return-Path: <linux-media+bounces-18629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71A98728D
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83B3E1F23E39
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2408D1AE869;
	Thu, 26 Sep 2024 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsrxYrPl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709C15699E
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727349239; cv=none; b=PsAVrAVOrQmLlnge+6ebp97fcEC2H7Bnpq3JYbvCSCJye4QZzF3wWR8kMoCt0q1tIrRkgzcvAbX7LaafItgM8ZxL3nRxxltEPugFUKfYWOuikI+obnCouSypVA2Pnk9waEG1IjQ79/1poDk6iWogzVXjFNXIiD+J0le5ukHAZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727349239; c=relaxed/simple;
	bh=a+dnglf8tSjcFBcwY6Wd0W2uKkDS8k3YQq6je6m6Hzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhQFWcxaxvKqbN2a+bavL/HGx6n/GlZ11Le185QY/1NcxWOqLDiqMKv+xk24H5Y8V6BFbwfQ1KlfwrNnpSBzsSNvIm1CfnY1OxzLksxGfBpaa2cij644e/xP1K6ZQc4/cHY78HN99AhquYkVfVJzSCn8TUGT8rHcon2XbJ3vNOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsrxYrPl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C840C4CEC5;
	Thu, 26 Sep 2024 11:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727349239;
	bh=a+dnglf8tSjcFBcwY6Wd0W2uKkDS8k3YQq6je6m6Hzw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GsrxYrPleRcWnwzXhVSIoW1pXxDfbvMxCTGmUK2bDTGsubaxud6AdiUduXXINyYI/
	 yAIeq5bSYKK+L425Znq4A7LVBi+7+aiXoiyDzRb8z4pGXavlpRB4z74KnZ8cnBG08k
	 wv2E99ixBxOjxioUAZpyWYyDNiNpyMtKd6dPe4D62n+8rY3M3DPBcfjKGOcNkfbE9N
	 FW7s2qb1y7qHHcWLEV5NYh1Tjvp3LgEI2WlA9dNr80tfOHa8lK9XZAXZN/6kAA6yaw
	 QuQsH0hQfSGQiywYRHmCACFcl/BB2TwjHHf7B6mblSkzgyWNbnRQ40i1PN4VjaLkAs
	 4iShW/69czrrQ==
Date: Thu, 26 Sep 2024 13:13:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sebastian Fricke <sebastian.fricke@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, r-donadkar@ti.com, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Mehdi Djait
 <mehdi.djait@linux.intel.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240926131351.533becc3@foz.lan>
In-Reply-To: <ZvU49mrccFlKDhD0@kekkonen.localdomain>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240925195843.GK30399@pendragon.ideasonboard.com>
	<902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
	<ZvUpuopPY8lwBHEm@kekkonen.localdomain>
	<20240926121914.69b47a50@foz.lan>
	<20240926102448.GA21788@pendragon.ideasonboard.com>
	<ZvU49mrccFlKDhD0@kekkonen.localdomain>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 26 Sep 2024 10:35:34 +0000
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> > > Yet, even if the committer did an honest handling of the patch, you may 
> > > still disagree or want some changes at the original patch. On such cases, 
> > > the maintainers may decide to drop the changes and do a normal review
> > > process. They may otherwise request a patch on the top of the applied
> > > one to address the pointed issues.  
> > 
> > Let's do a revert in that case, and keep rebases for cases where having
> > content in the git history causes issues other than bisection problems.  
> 
> I'd very much prefer this as well: revert or fix, if at all reasonable,
> instead of rebasing should be a rule.

As I answered already, the only rule is that such decision is up to the
subsystem's maintainers, as they'll need to handle the consequences of
upstreaming broken/reverted stuff.

> > I'd argue that even a missing SoB may not be a cause for rebase if it's
> > an accident, but that's not worth debating because CI will make sure
> > this never happens.  
> 
> Does it?
> 
> checkpatch.pl checks should just be warnings. And that should probably
> stay. Sob: and From: being different isn't necessarily that far-fetched as
> having an address in .mailmap may change From: field but not Sob:,
> resulting in a checkpatch.pl warning.
> 
> I wonder if checkpatch.pl should know about .mailmap actually, currently it
> doesn't. I could send a patch.

It does. Basically, if the media-ci does its work well, we shouldn't have
such cases in practice. 

That said, I guess the logic may require some changes, as there are some
complex rules with regards to patches developed by multiple authors.
Basically, patches shall follow an exact order of SoBs and tags to
indicate other authors for patches with multiple authors. Not sure if CI
or checkpatch enforces it currently.

> > > There is also worse case scenarios, like a committer violating the
> > > committer's agreement.  
> > 
> > I'm fine with rebases if someone gets rogue and merges malicious code,
> > or commits with insults in the commit message. I don't foresee that
> > happening regularly, if ever.  
> 
> I'm more concerned of a malicious actor getting access to the committer's
> credentials rather than the committer him-/herself going crazy. And if this
> happens, changes are it won't be noticed immediately.

This could happen as well. From subsystem's maintainer perspective,
they both will look the same when checking if a merge is ok.

> 
> Reminding of
> <URL:https://github.com/lfit/itpol/blob/master/linux-workstation-security.md>
> in the instructions might not be a bad idea.

Good point. We're writing a documentation about the new process. Once done,
we'll post at media ML for review. Please reply to it if we forget adding
it.

Thanks,
Mauro

