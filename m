Return-Path: <linux-media+bounces-4700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12689849B47
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 14:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35FCF1C20385
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 13:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7420DF6;
	Mon,  5 Feb 2024 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d5vXidBx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87343A1C3
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137924; cv=none; b=H2R5AGfuffEkojHHBbChEQUeYcdQ7aPYWp//JMUDBh8WGqQfKRLJJueQkygIiw5iV5FnH1OphgHawHUpg7XHPuqXvJ+DaN4ddMeWNHbbqxhYHqIzbJMdEWMQaYjB27ewHS3yAA0we2b+5YkHDIfa5Q3JY6eMtKb4fiBZLNVJ8tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137924; c=relaxed/simple;
	bh=O4EDsft+77j612glbAeJb9mByXgHcDSntXWHKC09Wvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMfz1pgzg9QYDEMgYTaLRP6ovdKNs7TqVsjol7j2X+8OOn47/RcCYpbJqeWAeuyjB0mi1Irke981NaKiT0mJyxQ/ZF05+vyhObII12EYPhw6xcbpjkBap5e2JUMQG2i9r5sL5XcYYFhvWVVsAElhhDP9B/r+9hzz0PC/UdgfzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d5vXidBx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [109.128.141.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B2D52B3;
	Mon,  5 Feb 2024 13:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707137830;
	bh=O4EDsft+77j612glbAeJb9mByXgHcDSntXWHKC09Wvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5vXidBx9GI2AFyUhCg5U6EB0LTHMEKWS4C/qdTMoje6K0QvW9+VApXW57jGrC9EA
	 77nb15ImdFpeaMt7VdbZF1luP5TOFii/lTWqQ+/KmUIkx4svl9Zh99bNrflP9OkCFq
	 c4VIsGPsaDGkKZ1catCFaV1+foXj1oOmUK/Ok7vY=
Date: Mon, 5 Feb 2024 14:58:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL FOR v6.9] MUST_CONNECT & imx8-isi fixes
Message-ID: <20240205125829.GA15182@pendragon.ideasonboard.com>
References: <20240201131737.GA5344@pendragon.ideasonboard.com>
 <34a01f66-83c5-420f-b147-e77963d29936@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34a01f66-83c5-420f-b147-e77963d29936@xs4all.nl>

On Mon, Feb 05, 2024 at 01:07:03PM +0100, Hans Verkuil wrote:
> On 01/02/2024 14:17, Laurent Pinchart wrote:
> > Hello Hans and Mauro,
> > 
> > The following changes since commit feb8831be9d468ee961289c6a275536a1ee0011c:
> > 
> >   media: ov08x40: Reduce start streaming time (2024-02-01 13:45:19 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-next-20240131
> > 
> > for you to fetch changes up to 87a913cc4385da5313208ae240484fa2c591eb2e:
> > 
> >   media: nxp: imx8-isi: Factor out a variable (2024-02-01 15:12:32 +0200)
> > 
> > ----------------------------------------------------------------
> > - Fix handling of MEDIA_PAD_FL_MUST_CONNECT flag in V4L2 core
> > - Fix MUST_CONNECT-related crash in the imx8-isi driver
> > - Fix compiler warning in imx8-isi driver
> > 
> > ----------------------------------------------------------------
> > Laurent Pinchart (6):
> >       media: mc: Add local pad to pipeline regardless of the link state
> >       media: mc: Fix flags handling when creating pad links
> >       media: mc: Add num_links flag to media_pad
> >       media: mc: Rename pad variable to clarify intent
> >       media: mc: Expand MUST_CONNECT flag to always require an enabled link
> >       media: nxp: imx8-isi: Mark all crossbar sink pads as MUST_CONNECT
> > 
> > Marek Vasut (1):
> >       media: nxp: imx8-isi: Check whether crossbar pad is non-NULL before access
> 
> All the patches above have a CC to stable, but only 2 have a Fixes tag. Is that
> intended or are the Fixes tags missing? It's odd to CC to stable without a Fixes
> tag.

That's intended.

Commit "media: mc: Add local pad to pipeline regardless of the link
state" is a standalone bug fix and has a Fixes: tag. No problem there.

Commit "media: nxp: imx8-isi: Check whether crossbar pad is non-NULL
before access" is another fix, and depends on the previous commit
("media: mc: Fix flags handling when creating pad links"), which is
CC'ed to stable as it's a dependency.

The fix in "media: nxp: imx8-isi: Check whether crossbar pad is non-NULL
before access" is a bit of a hack though, as it addresses the imx8-isi
driver only, while the problem is more widespread. The subsequent
commits implement a better fix, which is why I CC'ed them to stable too.
As the original problem is already fixed by a previous commit, there's
no new Fixes: tag.

I could have dropped "media: nxp: imx8-isi: Check whether crossbar pad
is non-NULL before access" in favour of the more generic fix, but I
decided to keep it in case the more generic rework ends up introducing a
problem and needs to be reverted.

> > Ricardo Ribalda (1):
> >       media: nxp: imx8-isi: Factor out a variable
> > 
> >  .../userspace-api/media/mediactl/media-types.rst   | 11 ++-
> >  drivers/media/mc/mc-entity.c                       | 93 ++++++++++++++++------
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  4 +-
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  8 +-
> >  include/media/media-entity.h                       |  2 +
> >  5 files changed, 81 insertions(+), 37 deletions(-)
> > 

-- 
Regards,

Laurent Pinchart

