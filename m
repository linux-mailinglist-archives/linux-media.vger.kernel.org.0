Return-Path: <linux-media+bounces-18609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FE987125
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 720421C2447C
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A67C1ACDF6;
	Thu, 26 Sep 2024 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyPznY8E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA91C1AC883
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345962; cv=none; b=W9hc+pLqvTlpk+P4btEk1ms+222QLeAJ5i7ZNwtn5uzJYWlKa4LLyOafmh4aYx6SGYydCdpgkHW+S7ERYkkHipMGZHz6SlzaqPEoxj+kb2y5bE6qUIhaJaSoJai5CD0oDuhCdAC9xH2UGV+aVQ+iQY8WLPLASheXXzvK7z10vb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345962; c=relaxed/simple;
	bh=XEeXoMqFhGkdvJXXD/Wutw986re+9WbN1QKZ5DWkYQk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/Vei0j+v8WtLwWctsihy2i2VYg0U7mxj1LFJ9cXpcV378kV1gEMldY9YTw96f3lRU5j4KjucF2fz4P8FE+tDkYTn/Xm6TN0sg/vvcncpjETGsCdWAaET1FvPl8qGiV9e+BDyndZ2JiZk/z8MBK4psXn5EZm+E533vFv4qdeNR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyPznY8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B73DC4CEC5;
	Thu, 26 Sep 2024 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727345962;
	bh=XEeXoMqFhGkdvJXXD/Wutw986re+9WbN1QKZ5DWkYQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DyPznY8E7cMhmkdPfKDvzD6Cx1sqIHWTzatRCELE8af+NmYy0Fg4pfOoBJrqpLwQ9
	 9wN8WldFMhx5XEDiaTTsYa12JLiv7rl8UhrGU47uVqQ63TulCMOWpxt/MBwPxUY9kR
	 Yo+RtfzR2jM8jjDW2Z2Vo2PMl5TX8dFjzM9gesLt9GahQMdKwhy1Gszk7MhuwbWj+/
	 i+R73Z5qPa4HS8AbuQowE78hfbOCCbdfQxQ7BR5rtwq+wWd7KiW7RDeujYq5E3tj49
	 rDjQyIEVQqJBZaWkbx2nsiIHl5grG44bvWB+cn2g2HVsfXJbMm8Gf+tonhC89Ui2XO
	 0B+yZbAp0OKlg==
Date: Thu, 26 Sep 2024 12:19:14 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Daniel Almeida
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
Message-ID: <20240926121914.69b47a50@foz.lan>
In-Reply-To: <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240925195843.GK30399@pendragon.ideasonboard.com>
	<902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
	<ZvUpuopPY8lwBHEm@kekkonen.localdomain>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 26 Sep 2024 09:30:34 +0000
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> > >>> Can you refresh my memory which processes need more work?  
> > >>
> > >> I have the same doubt. As discussed during the summit, Hans and I had some
> > >> discussions yesterday, to address a few details. For both of us the process
> > >> sounds well defined.
> > >>
> > >> From my personal notes, this will be the new process:
> > >>
> > >> - committers will merge patches at media-committers.git tree at fdo,
> > >>   provided that they'll follow the rules defined on a committers agreement
> > >>   and (partially?) enforced by media-ci checks;
> > >> - core committers follow the same rules, with a broader privilege of
> > >>   changing kernel API/ABI;
> > >> - committers will ensure that patchwork will reflect the review process of
> > >>   the patches;
> > >> - maintainers will double-check if everything is ok and, if ok, merge the
> > >>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
> > >>   being the main tree to be used for development;
> > >> - pull requests will keep using the same process as currently. The only
> > >>   change is that the media-stage.git tree will be renamed to "media.git";
> > >> - maintainers will periodically send patches upstream.
> > >>
> > >> The media-commiters.git tree at fdo might be rebased if needed; the 
> > >> media.git tree at linuxtv.org is stable. A large effort will be taken to
> > >> avoid rebasing it.
> > >>
> > >> We may need some helper scripts and/or use pwclient to keep patchwork
> > >> updated after committers reviews.  
> > > 
> > > What will happen if we update the status of patches in patchwork when
> > > merging them to the fdo tree, and the tree is later rebased to drop
> > > commits ? Will the person rebasing handle updating patchwork to move the
> > > patches back from accepted to a different status ?  
> > 
> > That should be the responsibility of the person doing the rebase. I think
> > that's what is done today as well in the rare cases we rebase.  
> 
> Sounds reasonable. I'd also like to avoid rebases as much as possible.
> 
> Do we have a list of cases where a rebase would be needed? A license issue
> or a missing Sob line, perhaps?

No, and I don't think we can write a rule to cover such cases. The only rule
is that it is up to maintainers to decide to do a rebase or not, and this
will be done case by case.

With regards to the cases you mentioned, it is almost surely that license 
issues will call for a rebase. The same may apply up to some point for 
missing/refused SoBs from authors, co-developers and from the committers.

Yet, I would expect that a more common case is if someone touches the code
and another committer/developer/author nacks with such changes.

So, for instance, suppose you maintain driver A. Some other committer
may end merging a patch for driver A without your ack. Depending on the
patch that could be OK (trivial/doc changes, bugs with bug fixes that
are available for some time, etc).

Yet, even if the committer did an honest handling of the patch, you may 
still disagree or want some changes at the original patch. On such cases, 
the maintainers may decide to drop the changes and do a normal review
process. They may otherwise request a patch on the top of the applied
one to address the pointed issues.

There is also worse case scenarios, like a committer violating the
committer's agreement.


Thanks,
Mauro

