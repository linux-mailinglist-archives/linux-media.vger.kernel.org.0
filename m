Return-Path: <linux-media+bounces-18639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA79874E5
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D2371F27261
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562AE13632B;
	Thu, 26 Sep 2024 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8L87CqT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48841292CE
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727358981; cv=none; b=RDVW4BkOg/9wuXwtPPdJmkCSeGlsYv+wCppqV5uVbsveDXV/Yj4Vt2SNK8Z/hac3Ccv8xRgZDyqMDkjcRPveZt6fNVlQdO3/mKiJQxF8ETIbYsagdQoCtmndfz4/TtrQXm1iLihhTGQAFJnCdIFLX4YMKHLvuZi5KlxTPY5BKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727358981; c=relaxed/simple;
	bh=cWPYhCJpk9cXnNlqkXhrUM+l6Ld8rmiMjMeemXvfv8s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ls0QFSFuT23JT07Mmoq7ZJwjWl2Y0zVvB6Idy4p54jw13Q5auebGXjHnFh69YK1zkouRsS/oPzI8rRjwD3n/yFd19nQS51E7m82vKRd52XuVcVefCLf/5ypCrWODDQNyDVKRsQx3ENJue8ZUwy7vPbXlkUlpbyR2p6MQWtO1If4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8L87CqT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34873C4CEC5;
	Thu, 26 Sep 2024 13:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727358981;
	bh=cWPYhCJpk9cXnNlqkXhrUM+l6Ld8rmiMjMeemXvfv8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A8L87CqTv7i1AztbYffkI8iSh9cKSquRtpEJ1lK3ib5MlCDIuLprAVZfY9JWdrxT9
	 M1qcrdH2bnhWY3yY4dOOWzDVsCMG2TKkNkMvoZvBr99exZr7LXpinhC4bxf3CpN/mG
	 i6e5VkL3km17mE9BIQpWl92EvoOHttrnFHXqiWnRbNu1xE/E8/eqGtGLbW4ObkBuea
	 bI2FNqBAEVIFeLUQZxC5obVPDKNGAOvarpvaoUF0VovKSnBlx8Xau+A1jeYAcmxZPS
	 4u5mrCcgmpUzi8M9oUfPPqVb60hrHJfv7XZt6a8fR2RbFdpBPAjAtQZQOD2YBeE5Ds
	 GHhS0lLaXpZtg==
Date: Thu, 26 Sep 2024 15:56:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, Linux
 Media Mailing List <linux-media@vger.kernel.org>, Daniel Almeida
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
Message-ID: <20240926155613.7af1bd1f@foz.lan>
In-Reply-To: <ZvU5sF7KC03x-LMu@kekkonen.localdomain>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
	<20240918132323.2a384f87@sal.lan>
	<20240925195653.GJ30399@pendragon.ideasonboard.com>
	<20240926003815.6537fdbb@foz.lan>
	<20240926103002.GB21788@pendragon.ideasonboard.com>
	<ZvU5sF7KC03x-LMu@kekkonen.localdomain>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 26 Sep 2024 10:38:40 +0000
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Laurent,
> 
> On Thu, Sep 26, 2024 at 01:30:02PM +0300, Laurent Pinchart wrote:
> > > See, the main repository is hosted at linuxtv.org. We intend to avoid 
> > > as much as possible rebases at the media tree at linuxtv.org, on both
> > > fixes and next branches.
> > > 
> > > The media-committers tree at fdo is focused on executing patches at CI
> > > and should only be used by committers. All other developers should base 
> > > their work at the repository stored at linuxtv.org[1].  
> > 
> > That I don't like. We want people working on the media subsystem to test
> > the very latest code, and to base their work on the tree that their
> > patches will land in. Otherwise there will be conflicts, and the risk of
> > conflict will increase as we pick up pace with the new workflow and
> > merge patches faster.  
> 
> I was under the impression the tree at linuxtv.org would be synchronised
> (very) often or even updated based on a git hook, effectively making it a
> mirror.

No. There will be an ancillary tree there doing that, just to override
some gitlab limitations on its public version, but the actual merge at
linuxtv.org "media" tree will be after maintainers check that if the merges 
are OK.

This won't be a normal patch-per-patch review. We'll be mainly looking at 
the merge diffstat, commit authors and such. We'll be triggered by
automatic e-mails sent from linuxtv.org when patches got merged at the
ancillary tree there.

Thanks,
Mauro

