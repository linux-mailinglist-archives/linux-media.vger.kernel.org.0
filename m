Return-Path: <linux-media+bounces-15465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAB493F775
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 16:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90086282AF3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C96154449;
	Mon, 29 Jul 2024 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wBNmN86d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF21E4A2;
	Mon, 29 Jul 2024 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262869; cv=none; b=jmo2WTgIdU45tFldZpTo/BPNzM2ovYSHEYQ72jLgD6I+uyTYT4I9M5PTjHvl7nGj+0Uf66PH5L5n/EQZE7i9pX0G8JRCBFrwaP/z7fedwO0qqgAuCM5vKq/H6XpfmF2Xjh9FbkMQUrgDrBGXnLXnhKxzwSfEZYsxvB55HNzYMgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262869; c=relaxed/simple;
	bh=k/zxrjQBCQsKjV6KwPCCmHvk8WRT5IxcSyyw9dFA9h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GufupvnkJsa/43x0uJP0B13NJgy2Juon+lnhOohTcIoJTQm1nEA7QGIltkNvd+SWbX4dgnLbWU0OyvBI1yhCpUQs9qoICu7OPaD51PSOarLcMv6EZgJ6gX2LfHXouE45TbfejAs+10PlpJ1QZVi8mNEq1nBuNDKa4oTWHWmFcTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wBNmN86d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCD7B229;
	Mon, 29 Jul 2024 16:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722262820;
	bh=k/zxrjQBCQsKjV6KwPCCmHvk8WRT5IxcSyyw9dFA9h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wBNmN86dhl+c6piZ6NQrSTDmboX0Cn7RqUnhFKjul0ntyQZDw0ietPgEIeUCpbtWu
	 Jduoina2GoMqsdR4I1XmTXCmyvmWcIeMXr6nBlar1LBX+4VvsgFWf8jYLgd7qC1CR5
	 WKttZuOYihYfuTgBXlPM+NSgYIxG/2GNGPMcoMvo=
Date: Mon, 29 Jul 2024 17:20:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: imx335: Mention reset-gpio polarity
Message-ID: <20240729142046.GB1552@pendragon.ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-2-umang.jain@ideasonboard.com>
 <7537c281-2f0d-43e1-9260-2d469d5a1f21@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7537c281-2f0d-43e1-9260-2d469d5a1f21@kernel.org>

On Mon, Jul 29, 2024 at 04:08:18PM +0200, Krzysztof Kozlowski wrote:
> On 29/07/2024 13:04, Umang Jain wrote:
> > Mention the reset-gpio polarity in the device tree bindings.
> > It is GPIO_ACTIVE_LOW according to the datasheet.
> > 
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> 
> IdeasOnBoard folks are seasoned developers, although I noticed from time
> to time you do not cc all necessary addresses. I wonder why? Something
> is missing in internal guideline?

We have no guidelines that prevent CC'ing anyone, so it's down to
case-by-case mistakes I suppose. get_maintainer.pl should have turned up
the DT list and the DT maintainers on this patch. Umang (and everybody
else), please make sure to not strip that in the future.

> That's not the first case, but pasting same form letter is a bit
> annoying, especially considering that *tools tell you to do correct
> stuff* and you do not need *person to tell you that*.
> 
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>

-- 
Regards,

Laurent Pinchart

