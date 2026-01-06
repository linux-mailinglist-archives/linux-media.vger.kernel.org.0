Return-Path: <linux-media+bounces-49957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB19CF61BA
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 01:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 554613067658
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 00:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400E01E0DE8;
	Tue,  6 Jan 2026 00:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q+HXA8Vf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404EA185B48;
	Tue,  6 Jan 2026 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660590; cv=none; b=FwxjFgYV9zZiDcnAwryoQl7W0lXJvE8hapS5sKKxa+BpzinayKwn3UnjJTkSBIkeoafkwM/UwZWW7j2iZzgb/stX50997WImQQLJofB8yf52Vd4Nm/sGWIuLmCieLYIiU1muHdxXYiOs4v7Fqg+9rw57sUV2RZL9Y467rHLVEeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660590; c=relaxed/simple;
	bh=fPzT0sFqAlfIHi79xc2OcfhFC3tTRV1/J07CE8ftjF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duWqTsR344fEmFrlE8lErKJ2fwBrRfJzZfYT1VrBRbA5MfdJVxE/EsM5NaOG7Cp++OUE2hyiZ0LiRKq4HhKqh47L9gHTRqblaGcCw95yrqV1dh6QlynBj2gf39SizWU5RCx0KDs+dzfBF3I8Lq/lWobw59ozTXzK0azCS+ngrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q+HXA8Vf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B7F826DF;
	Tue,  6 Jan 2026 01:49:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767660566;
	bh=fPzT0sFqAlfIHi79xc2OcfhFC3tTRV1/J07CE8ftjF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+HXA8VfSBi+gXnjwqldheAInyuLxNery+PRJQLav1vgbzP10kFR+9S2qkMO6RHYv
	 +3AC84ANnP7ppJgvnMC8jtdCagDK9Z92ZhHfaLcKHxwOx86mnpHegL9ayzAfBPnqyf
	 GAcjnOKepkAk5JkU2Jl5sPOp8TssXYWS2Ado/Rtw=
Date: Tue, 6 Jan 2026 02:49:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT enabled
Message-ID: <20260106004928.GL10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
 <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca>
 <20260105235921.GI10026@pendragon.ideasonboard.com>
 <20260105193933.40485807@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105193933.40485807@gandalf.local.home>

On Mon, Jan 05, 2026 at 07:39:33PM -0500, Steven Rostedt wrote:
> On Tue, 6 Jan 2026 01:59:21 +0200 Laurent Pinchart wrote:
> 
> > > That's interesting, do you plan to update more drivers ? There is a lot of m2m
> > > using hard IRQ to minimize the idle time (save a context switch), but RT support
> > > might be more worth then that.  
> > 
> > This is a part of PREEMPT_RT that puzzles me. By turning regular
> > spinlocks into mutexes, RT seems to break drivers that use those
> > spinlocks in hard IRQ handlers. That's a very large number of drivers
> > given how widespread regular spinlock usage is. Do drivers need to be
> > manually converted to either raw spinlocks or threaded IRQ handlers ?
> 
> No. Pretty much all interrupts are converted into threaded interrupt
> handlers unless IRQF_NO_THREAD, IRQF_PERCPU, or IRQF_ONESHOT are specified.
> 
> The interrupt line is disabled until the thread handler is called.
> 
> > What about non-RT kernels, how can a driver avoid the thread scheduling
> > penalty in those cases, do they need to manually select between
> > request_irq() and request_threaded_irq() based on if RT is enabled ?
> > This puzzles me, it feels like I must be missing something.
> 
> The issue here is that the interrupt handler specifies ONESHOT which causes
> the handler to be executed in hard interrupt context.

Gotcha.

Stefan, please explain in the commit message why the ONESHOT flag is
set by the driver.

-- 
Regards,

Laurent Pinchart

