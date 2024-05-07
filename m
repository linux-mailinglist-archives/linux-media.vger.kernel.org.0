Return-Path: <linux-media+bounces-11102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F271E8BEC9A
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 21:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDD4287992
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 19:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1FC16DEC7;
	Tue,  7 May 2024 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A8UlZe2n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4E616DEAF;
	Tue,  7 May 2024 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715110230; cv=none; b=utUt+kkuLqB23YgyyZsI7qx/dTqobbJP/CPaTUdQpqFYFk/XbHs0P01mGsiL+xPEhiiAo1CeHCc306+zboK8RIRfNJx1kxBmCsg4RuWvYj8Cozr+NpUdK9S3PTaymivQ4nxDjfh+Tn8YWI+9g1RUJhunG8V169TpmI4ghqh6fzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715110230; c=relaxed/simple;
	bh=2xexOR5PY+XlryyFSTXgwIJ63MHwqRGYdM9rWaLj0dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URu0qhC1jDmTdpBrq/06AT1KBp2nCyUaLtUQY6sNvfurZgKzANuaH8ioabFBsQSu3+QivN+PDNjDwHVzSWfEVNXOqSaeuGwLttxQhfuGxrB0wLX89liHprRjNVeQA+Zs2qh0Oa3X+vIy30LHNABugEh2qY73wmVHw0Uc3i3lm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A8UlZe2n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C5829CE;
	Tue,  7 May 2024 21:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715110223;
	bh=2xexOR5PY+XlryyFSTXgwIJ63MHwqRGYdM9rWaLj0dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8UlZe2n+CFRpfaKSpKof9OOlYe2+B+jA2o4YdQ0s1U15l0Di6/6j0mg/YPqozDCQ
	 UugueUfRoLJKX3NfyBat1yGzAVpG1PZsQozOkd0k8anNCocnLwdWW9V0xLtlkQS07s
	 efK9sU8v1+FVw9+u3WPqQdeNdsFVltQBwLPEF5wc=
Date: Tue, 7 May 2024 22:30:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: linux-media@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: Fix _irqsave and _irq mix
Message-ID: <20240507193017.GA2012@pendragon.ideasonboard.com>
References: <20240505174544.18359-1-laurent.pinchart+renesas@ideasonboard.com>
 <8b532593-1e06-2378-280c-47951ad51453@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b532593-1e06-2378-280c-47951ad51453@gmail.com>

On Tue, May 07, 2024 at 11:11:25AM +0300, Sergei Shtylyov wrote:
> On 5/5/24 8:45 PM, Laurent Pinchart wrote:
> 
> > The histogram support mixes _irqsave and _irq, causing the following
> > smatch warning:
> > 
> >      drivers/media/platform/renesas/vsp1/vsp1_histo.c:153 histo_stop_streaming()
> >      warn: mixing irqsave and irq
> > 
> > The histo_stop_streaming() calls spin_lock_irqsave() followed by
> > wait_event_lock_irq(). The former hints that interrupts may be disabled
> > by the caller, while the latter reenables interrupts unconditionally.
> > This doesn't cause any real bug, as the function is always called with
> > interrupts enabled, but the pattern is still in correct.
> 
>    Incorrect? :-)

Oops :-) I'll fix it, but will likely not send a new version if that's
the only issue.

> > Fix the problem by using spin_lock_irq() instead of spin_lock_irqsave()
> > in histo_stop_streaming(). While at it, switch to spin_lock_irq() and
> > spin_lock() as appropriate elsewhere.
> > 
> > Fixes: 99362e32332b ("[media] v4l: vsp1: Add histogram support")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/linux-renesas-soc/164d74ff-312c-468f-be64-afa7182cd2f4@moroto.mountain/
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_histo.c  | 20 ++++++++-----------
> >  1 file changed, 8 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> > index 71155282ca11..cd1c8778662e 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
> [...]
> 
> MBR, Sergey

-- 
Regards,

Laurent Pinchart

