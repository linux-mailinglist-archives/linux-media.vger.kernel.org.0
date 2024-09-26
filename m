Return-Path: <linux-media+bounces-18632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA479872E4
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17341B22426
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCAA14C59B;
	Thu, 26 Sep 2024 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCHcEYon"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D033347B4
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 11:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727350526; cv=none; b=HtXdeKyPyPtPPyJCDnC1lNJEjFqhQ3B2SzecHYomV+gE8+gfnCK7waIcODx4wvi9fWqrmjf6h3G8Lj8cqc373vX9sZdR58zkxgthHUGBNWkpdQEKg3iC4/YKvuahcaWVhofHB6IkeOaayQYQJSMeToofxwzX2zF7Rwp6tRfbynw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727350526; c=relaxed/simple;
	bh=1HbzETLIc3oOJXN+ApfcbktwwJ3TMNnDhPaoTgidHkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tQFHtQgL4DhhNxYMbyTX4rlrrTTCe9OEKOWIEqNMHxgxeJQfFWy6dx26uOtwHxCoNHmp/ABUO28gp5tCIeHEPuF0RRaWvWBp3JeN7T6d5Jr4WIVIkRdoB17yVIQAI/PrNx2Tjm8vp23AU5WqDrDihYnfYILvAiRbCMUoVQdRFy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCHcEYon; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8592DC4CEC5;
	Thu, 26 Sep 2024 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727350525;
	bh=1HbzETLIc3oOJXN+ApfcbktwwJ3TMNnDhPaoTgidHkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FCHcEYonQ/1tyav7HQt67HjTY+lBZyok+hW5q4sbwkyyTGXRxjPtaTVNIINf544Z+
	 g3dxc96AuRpchoU28TlMqQ1MQIFONfwDBaVCM3mIHOyQe1YM4JKJkk0HS/dJi7PC7k
	 HpbcRcD16hNx4Q/9gNF/aNRhMrAmUQxBUd4sbadSiLE29nsDj5RC4OcUu811Qu66p7
	 qiXEPrZfbUPCY8YxXcGjkrwlcm6vV6Kebmf2uAKLmhB+UIh6YWy9YWYsPheHLDTwlZ
	 cGL7bR/M41IIzA8jcf7fhfulkpABh7d93ez+w8DgMJrvaP0NjskwTt6ErKeRGEac61
	 iHtPMqCJJhQ0Q==
Date: Thu, 26 Sep 2024 13:35:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
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
Message-ID: <20240926133516.368a8367@foz.lan>
In-Reply-To: <20240926111307.GG21788@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
	<20240918132323.2a384f87@sal.lan>
	<20240925195653.GJ30399@pendragon.ideasonboard.com>
	<20240926003815.6537fdbb@foz.lan>
	<20240926103002.GB21788@pendragon.ideasonboard.com>
	<20240926130615.5397cc30@foz.lan>
	<20240926111307.GG21788@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 26 Sep 2024 14:13:07 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > > > See, the media-committers repository at fdo can be rebased. This might
> > > > happen, for instance, if we don't agree with some merge there during
> > > > our merge review or if other committers disagree with merges. On such
> > > > case, the not-accepted patches will be dropped via rebase and the patches
> > > > will need to be reviewed the normal way.    
> > > 
> > > Things that haven't reached a consensus should not be merged in the
> > > first place, and in the rare cases where it happens, a revert is fine.
> > > Rebases should be kept for situations where no other option is possible.  
> > 
> > I guess we agree to disagree.  
> 
> I certainly disagree, yes. I won't comment further, I think you know my
> position well enough, and I'm certain the majority of the community is
> also against rebases.

Nobody like rebases, including subsystem maintainers. A rebase means
lots of manual work that we would very much prefer not to do it.

You don't want rebases, fine. There shouldn't be any rebases if every
committer ensures that each patch they merged were properly 
reviewed/accepted and have the proper license and tags, including
SPDX, SoBs, A-B, R-B, etc.

Yet, if a committer screws up somehow (intentionally or not), subsystem 
maintainers will handle it the way they think it is the best, deciding 
either to rebases or revert, depending on the case.

Thanks,
Mauro

