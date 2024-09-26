Return-Path: <linux-media+bounces-18614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1C9871B9
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2ECA1F24270
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF5D1AD3E9;
	Thu, 26 Sep 2024 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MCE8GbHo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED3347B4
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347229; cv=none; b=RiDKsuH7hOztCfP7tk46UGYZBBWL3PhZ53bUr+1XgzqAiUxxgFHFB5jcwwxcQM4qTGTfft2sLsHIFXdVvNY33LIs1D5Yd3OGJdfgFaEetTfcoecWogyj71vIrvaGIcBGbufsXkMDytfRZE4hzumueCIx2GsqSfIHyMlIwYoVuDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347229; c=relaxed/simple;
	bh=Iqdp92aqzvtnwJJZIdODwalMIukK4LpIZAyVN2KpD1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZdpPFMHigPPSEvbLo8e8tpmdSs/LdZ8FcY/wh4UGycJmgNbEJ6xWRY92UN3debsX1zClAcMEIZaDahpDiGBH1JuvQlb69sAyeM+Hg6vxr5zdn6Z4dhwB8nl0ITFVOpg0OB1F/+CTz+HKQ8v6pSrfyRgw9a1JwEjUZ+U2cDIt7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MCE8GbHo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D294169;
	Thu, 26 Sep 2024 12:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727347136;
	bh=Iqdp92aqzvtnwJJZIdODwalMIukK4LpIZAyVN2KpD1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCE8GbHodVkalWMjTKoRUl7bW/aCX7DgcXSTGlpUfc+ccyaf/PmAt7zKnTaDA3zdp
	 2y1x82p6iMMiCh36ge7WxPkT059gx2dpd3CPVmuN/5PhzjUASWrnK0RjeTmGf55RMx
	 kLovVjI4g4siGBHbt3AFCbT6OgiFDNu3hreoW0pk=
Date: Thu, 26 Sep 2024 13:40:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240926104022.GD21788@pendragon.ideasonboard.com>
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZvU49mrccFlKDhD0@kekkonen.localdomain>

On Thu, Sep 26, 2024 at 10:35:34AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Thu, Sep 26, 2024 at 01:24:48PM +0300, Laurent Pinchart wrote:
> > On Thu, Sep 26, 2024 at 12:19:14PM +0200, Mauro Carvalho Chehab wrote:
> > > Em Thu, 26 Sep 2024 09:30:34 +0000
> > > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > > 
> > > > > >>> Can you refresh my memory which processes need more work?  
> > > > > >>
> > > > > >> I have the same doubt. As discussed during the summit, Hans and I had some
> > > > > >> discussions yesterday, to address a few details. For both of us the process
> > > > > >> sounds well defined.
> > > > > >>
> > > > > >> From my personal notes, this will be the new process:
> > > > > >>
> > > > > >> - committers will merge patches at media-committers.git tree at fdo,
> > > > > >>   provided that they'll follow the rules defined on a committers agreement
> > > > > >>   and (partially?) enforced by media-ci checks;
> > > > > >> - core committers follow the same rules, with a broader privilege of
> > > > > >>   changing kernel API/ABI;
> > > > > >> - committers will ensure that patchwork will reflect the review process of
> > > > > >>   the patches;
> > > > > >> - maintainers will double-check if everything is ok and, if ok, merge the
> > > > > >>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
> > > > > >>   being the main tree to be used for development;
> > > > > >> - pull requests will keep using the same process as currently. The only
> > > > > >>   change is that the media-stage.git tree will be renamed to "media.git";
> > > > > >> - maintainers will periodically send patches upstream.
> > > > > >>
> > > > > >> The media-commiters.git tree at fdo might be rebased if needed; the 
> > > > > >> media.git tree at linuxtv.org is stable. A large effort will be taken to
> > > > > >> avoid rebasing it.
> > > > > >>
> > > > > >> We may need some helper scripts and/or use pwclient to keep patchwork
> > > > > >> updated after committers reviews.  
> > > > > > 
> > > > > > What will happen if we update the status of patches in patchwork when
> > > > > > merging them to the fdo tree, and the tree is later rebased to drop
> > > > > > commits ? Will the person rebasing handle updating patchwork to move the
> > > > > > patches back from accepted to a different status ?  
> > > > > 
> > > > > That should be the responsibility of the person doing the rebase. I think
> > > > > that's what is done today as well in the rare cases we rebase.  
> > > > 
> > > > Sounds reasonable. I'd also like to avoid rebases as much as possible.
> > > > 
> > > > Do we have a list of cases where a rebase would be needed? A license issue
> > > > or a missing Sob line, perhaps?
> > > 
> > > No, and I don't think we can write a rule to cover such cases. The only rule
> > > is that it is up to maintainers to decide to do a rebase or not, and this
> > > will be done case by case.
> > > 
> > > With regards to the cases you mentioned, it is almost surely that license 
> > > issues will call for a rebase. The same may apply up to some point for 
> > > missing/refused SoBs from authors, co-developers and from the committers.
> > > 
> > > Yet, I would expect that a more common case is if someone touches the code
> > > and another committer/developer/author nacks with such changes.
> > > 
> > > So, for instance, suppose you maintain driver A. Some other committer
> > > may end merging a patch for driver A without your ack. Depending on the
> > > patch that could be OK (trivial/doc changes, bugs with bug fixes that
> > > are available for some time, etc).
> > > 
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
> 
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

We have an explicit check in the CI to ensure that both the author and the
committer have a SoB line. It's not base on checkpatch.pl. Ricardo,
could you confirm this ?

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

That's not much different than someone impersonating me or you when
sending pull requests. Signing tags helps, but if someone steals
credentials, it's also game over. With the new workflow the malicious
changes will need to pass CI, so there may be more scrutiny :-)

> Reminding of
> <URL:https://github.com/lfit/itpol/blob/master/linux-workstation-security.md>
> in the instructions might not be a bad idea.

Agreed.

-- 
Regards,

Laurent Pinchart

