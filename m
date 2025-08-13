Return-Path: <linux-media+bounces-39844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7988CB255EE
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DDA5882E51
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4772EB5A7;
	Wed, 13 Aug 2025 21:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OHdgNRXk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE20B2F39AE
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121812; cv=none; b=DuxjsPgbQVUMCvVdesrhpK9IHT4Ul98ySIhIo5i0Sjm+viM/rZgKCqQPegNftcLAHzRRIExAO1H7oTim8Mvdw5nCqX0FWTNU9BAEWLAMIbSmzvm2JnEB5jiRoWUSRIXZdjh3MHSZdPLLlik3Ht6wqFtULV9hx3fZ9vAgNHPz94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121812; c=relaxed/simple;
	bh=1SuDoKEnjV70ZpvNO56JyjTLz8swMJx19ufJhSPz1oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJZVigkLA+BdDtBn0UQmBSYRxdUbj2RPSgDAeweOs4IOu+w4gOdw+aZ0/t70A+8WVp6BSz2EVwkhRBY9OzrX4zFoQUFXIqKKaTeGtCC+L5Y2dUBS7oIqezf/nZTuYUnxJnxeHBDbwM9mKq+YFUBbqiM4wjs0yusB9CMOIVvNU0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OHdgNRXk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 622C1F89;
	Wed, 13 Aug 2025 23:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755121755;
	bh=1SuDoKEnjV70ZpvNO56JyjTLz8swMJx19ufJhSPz1oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHdgNRXkKjeQIbUezT85WnpAe/1k602eHfULmMjxucAkvPnzJ4z4bzmDtDxXv9MXO
	 goC1JT9gN6FE37YReG8At+9KS8HnN5zsTlKiLgLpAYxy28fgtsMjzb6BcR8ebiiuaQ
	 BoQNJzgyet8rBUz7pPFkvd4pIBuqQKBVYWWGP7Mw=
Date: Thu, 14 Aug 2025 00:49:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] media: nxp: imx8-isi: fix streaming cleanup on
 release
Message-ID: <20250813214949.GA22835@pendragon.ideasonboard.com>
References: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
 <5szbp7ae7sbfpzvfw73t2l5cwgd7i2hjmeljhmf4mxz32agwth@ycttzoi5ux46>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5szbp7ae7sbfpzvfw73t2l5cwgd7i2hjmeljhmf4mxz32agwth@ycttzoi5ux46>

On Wed, Aug 13, 2025 at 11:46:03PM +0200, Richard Leitner wrote:
> Hi Laurent,
> 
> On Thu, Aug 14, 2025 at 12:24:49AM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series fixes an issue initially reported by Richard in [1],
> > with a proposed fix. I've recommended an alternative approach, and gave
> > it a try.
> 
> Thanks for reviewing that patch of mine [1].
> And thank you for providing this alternative approach. It looks way
> cleaner now :-) I previously tought of a similar approach as yours,
> but then opted for the "less invasive" one. So again what learned for
> me. Thanks!
> 
> As I've never had such a situation and wasn't able to find something in
> the docs [2] about it: Do you need/want a Reviewed or Tested-By tag on
> patch 1/2 of this series? (Altough there's also a SoB from me before
> your Co-Developed tag)

Both tags are useful. Even if you're listes as the patch author, I've
made modifications, so your review and tests are valuable.

> [2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> regards;rl
> 
> > 
> > Patch 1/2 fixes streaming cleanup on release. Patch 2/2 then cleans up
> > the driver a bit by dropping an unneeded structure field.
> > 
> > The changes have been tested by opening and closing the video device
> > while streaming in another process. I have also tested suspend/resume
> > during streaming.
> > 
> > [1] https://lore.kernel.org/linux-media/20250709-imx8-isi-release-fix-v1-1-c47c659ce1a6@linux.dev/
> > 
> > Laurent Pinchart (1):
> >   media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field
> > 
> > Richard Leitner (1):
> >   media: nxp: imx8-isi: Fix streaming cleanup on release
> > 
> >  .../platform/nxp/imx8-isi/imx8-isi-core.h     |   3 +-
> >  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
> >  2 files changed, 57 insertions(+), 102 deletions(-)
> > 
> > 
> > base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358

-- 
Regards,

Laurent Pinchart

