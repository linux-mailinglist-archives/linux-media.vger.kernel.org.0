Return-Path: <linux-media+bounces-49952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2B5CF60CF
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 00:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0546330783EE
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 23:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E7530F92E;
	Mon,  5 Jan 2026 23:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="faMVzk/d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BFF56B81;
	Mon,  5 Jan 2026 23:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767657585; cv=none; b=WMxaZS9v9KxKvTLIQeeAWlx0F6Lirk+WsgjgkstUFqQD7CIBtAVohtydxFGRh/AHBKEpWFiezsOm64nLjYGoDeHEXynx2x+IAscmnWKu6Iroyr2seVEtv43qhhPVjN6bo3YcOOxXdpkeUJYcRbUtaca3b15ZP1UFcG3k1K61/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767657585; c=relaxed/simple;
	bh=kjtbRsl2yxrgQaA3VRK6Xkc51MI2dztHlINk6nGhPd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoJLK0DNBKSfj+u39/HSi3yILPNvuTLjS2T/kA817ks30t0xTumE9nr3LKe1lH7OD2c5k9g1NEzN5CdEFB7olhXBobjcchzL2poMhCmh+02VJ/1YN+znHzK5d2HiCyQP/wB/ZEAw0nAjmBqaw/YX4xo1SX5Tp1g/qtOAIFV4Zzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=faMVzk/d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 463706DF;
	Tue,  6 Jan 2026 00:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767657560;
	bh=kjtbRsl2yxrgQaA3VRK6Xkc51MI2dztHlINk6nGhPd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faMVzk/dgr8I9pQQTWKyCl2UeK+MI640ke4MLhR/Y20xcSOT4f2WASE5xUOjruRha
	 b4+zV3IA/eNYmVKPBORlWlwnQ2Sr5QgPqQkbbU156uPG9XqVSdaKQhtmkBQ7xZdukT
	 UWYru2mxyjGqVBjvEjKmyYA8cEUN6LECPW4q57ro=
Date: Tue, 6 Jan 2026 01:59:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT enabled
Message-ID: <20260105235921.GI10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
 <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca>

On Mon, Jan 05, 2026 at 02:02:38PM -0500, Nicolas Dufresne wrote:
> Le lundi 05 janvier 2026 à 12:35 +0100, Stefan Klug a écrit :
> > On kernels with PREEMPT_RT enabled, a "BUG: scheduling while atomic"
> > kernel oops occurs inside dw100_irq_handler -> vb2_buffer_done. This is
> > because vb2_buffer_done takes a spinlock which is not allowed within
> > interrupt context on PREEMPT_RT.
> > 
> > Fix that by making the irq handler threaded. The threaded interrupt
> > handling might cause the interrupt line to be disabled a little longer
> > than before. As the line is not shared, this has no negative side
> > effects.
> 
> That's interesting, do you plan to update more drivers ? There is a lot of m2m
> using hard IRQ to minimize the idle time (save a context switch), but RT support
> might be more worth then that.

This is a part of PREEMPT_RT that puzzles me. By turning regular
spinlocks into mutexes, RT seems to break drivers that use those
spinlocks in hard IRQ handlers. That's a very large number of drivers
given how widespread regular spinlock usage is. Do drivers need to be
manually converted to either raw spinlocks or threaded IRQ handlers ?
What about non-RT kernels, how can a driver avoid the thread scheduling
penalty in those cases, do they need to manually select between
request_irq() and request_threaded_irq() based on if RT is enabled ?
This puzzles me, it feels like I must be missing something.

> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> > ---
> >  drivers/media/platform/nxp/dw100/dw100.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> > b/drivers/media/platform/nxp/dw100/dw100.c
> > index
> > 8a421059a1c9b55f514a29d3c2c5a6ffb76e0a64..4f5ef70e5f4a052fb5f208e35f8785f9d30d
> > c54e 100644
> > --- a/drivers/media/platform/nxp/dw100/dw100.c
> > +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > @@ -1600,8 +1600,9 @@ static int dw100_probe(struct platform_device *pdev)
> >  
> >  	pm_runtime_put_sync(&pdev->dev);
> >  
> > -	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, IRQF_ONESHOT,
> > -			       dev_name(&pdev->dev), dw_dev);
> > +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> > +					dw100_irq_handler, IRQF_ONESHOT,
> > +					dev_name(&pdev->dev), dw_dev);
> >  	if (ret < 0) {
> >  		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> >  		goto err_pm;

-- 
Regards,

Laurent Pinchart

