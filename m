Return-Path: <linux-media+bounces-46189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DCC2AE91
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15F6B4E64C7
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA25F2FBDF6;
	Mon,  3 Nov 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wJ3Krqsi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8A14A60F
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164315; cv=none; b=ctp0rrHu5jaJ9CApfi6G7hQrPQ/xM6H8FO0mNCmcvRGavVmAUPAuk2qpbu3//necWenHMmyEpAMOHsN+if4o753nmuL/3niJaH5woMwFMtSBWnT/KCsbiRjJvThR7TPtkBJFNTs3BZlHhQu6mDt6CEo6qooIwxXkEhgftmSus08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164315; c=relaxed/simple;
	bh=e5xasHaCVcGRPs4CYQWqsYMoAB+ejAzO0HPOx0ruAe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tzf9nuW5KIQJprex2kc83IjiMd1EFjj3hh2RMrS/EakfVqJgOja1j/paD4ISTLU6FSOm7YfCNeMhMT8J+cvUA7sj0oVH0M8zpETYMOawPadGqED9qWv8qaYFcyKwwWJ22JZnYqfQgcUdAabPOrNyeY2DaKpzLPw2xR/DGzpzta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wJ3Krqsi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1F9D9111D;
	Mon,  3 Nov 2025 11:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762164197;
	bh=e5xasHaCVcGRPs4CYQWqsYMoAB+ejAzO0HPOx0ruAe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wJ3KrqsiV52ALebxdELPIVT6vrbkcqC680iinN1awGcAb70FF1r2wEynae1CvqStD
	 0IKFnNoIAri1Lq6PeVOCt35vBlu9vQEGbrM42wZyikVMQsoEPL6DD/wXWIUpOCqha1
	 TDmJ3ow6mZ1epu6NlvwjRLfajGNfESfaOv0aS/Sc=
Date: Mon, 3 Nov 2025 12:04:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL FOR v6.19] NXP media drivers changes
Message-ID: <20251103100456.GO27255@pendragon.ideasonboard.com>
References: <20251103001640.GA9221@pendragon.ideasonboard.com>
 <4989c563-47f4-478c-80c4-41f7e98597e4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4989c563-47f4-478c-80c4-41f7e98597e4@kernel.org>

On Mon, Nov 03, 2025 at 09:08:10AM +0100, Hans Verkuil wrote:
> Hi Laurent,
> 
> I noticed you forgot to CC to linux-media (I added that now), but also that all

Oops sorry, my bad.

> these patches have a Link: tag. Linus only wants Link tags if there is additional
> information through that link. That's not the case here.
> 
> I'm dropping the Link tags from the patches in this PR, let me know if you disagree.

You missed the last episode of the drama :-)

https://lore.kernel.org/all/CAHk-=wj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyBSpTKR+=Vtw@mail.gmail.com/

We can use Link: trailers to reference the patch that was picked, and we
need to use the patch.msgid.link domain for that purpose. Adding

[b4]
	linkmask = https://patch.msgid.link/%s

to your .gitconfig will instruct b4 to use that domain.

> On 03/11/2025 01:16, Laurent Pinchart wrote:
> > Hi Hans, Mauro,
> > 
> > The following changes since commit 163917839c0eea3bdfe3620f27f617a55fd76302:
> > 
> >   MAINTAINERS: Update Daniel Scally's email address (2025-10-29 14:07:02 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20251103
> > 
> > for you to fetch changes up to a581a7c7d2c354131e184a8770f761c40168dda6:
> > 
> >   media: imx8mq-mipi-csi2: drop unused module alias (2025-11-03 01:23:28 +0200)
> > 
> > ----------------------------------------------------------------
> > NXP media drivers changes:
> > 
> > - Add Frank Li as a reviewer for NXP media drivers
> > - Improve buffer sequence in rkisp1
> > - Add i.MX91 support and i.MX93 parallel input support to imx8-isi
> > - Drop unused module aliases
> > 
> > ----------------------------------------------------------------
> > Alice Yuan (2):
> >       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
> >       media: nxp: imx8-isi: Add parallel camera input support for i.MX93
> > 
> > Frank Li (1):
> >       MAINTAINERS: Add Frank Li as reviewer for NXP media drivers
> > 
> > Guoniu Zhou (3):
> >       media: nxp: imx8-isi: Refine code by using helper macro
> >       media: nxp: imx8-isi: Reorder the platform data
> >       media: nxp: imx8-isi: Add ISI support for i.MX91
> > 
> > Johan Hovold (3):
> >       media: imx-mipi-csis: drop unused module alias
> >       media: imx7-media-csi: drop unused module alias
> >       media: imx8mq-mipi-csi2: drop unused module alias
> > 
> > Stefan Klug (1):
> >       media: rkisp1: Improve frame sequence correctness on stats and params buffers
> > 
> >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 ++++-
> >  MAINTAINERS                                        |  4 ++
> >  drivers/media/platform/nxp/imx-mipi-csis.c         |  1 -
> >  drivers/media/platform/nxp/imx7-media-csi.c        |  1 -
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 58 +++++++++++++---------
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
> >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 22 ++++++--
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  1 -
> >  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  1 +
> >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 27 ++++++++--
> >  10 files changed, 92 insertions(+), 37 deletions(-)

-- 
Regards,

Laurent Pinchart

