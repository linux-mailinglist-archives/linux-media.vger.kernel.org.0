Return-Path: <linux-media+bounces-49954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CACF6184
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 01:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 992EB302DB3F
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 00:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FF41D63EF;
	Tue,  6 Jan 2026 00:39:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7163A1E63;
	Tue,  6 Jan 2026 00:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767659965; cv=none; b=QOj/abPAknJk2NAmTEd9bL/6S71DH23/m4PtDiXAZ7qjs2Zwl9pYtSOFsfhY/+wyKfxM45MZ8TGProd7LJXJ1K72WHJAGLro9bSFUhPjcyTCwH8ToBxRxRbhraB7NWaruicrtkAK94IdQ1BFFv3AQ+AhRUAe9dsWZEdy5sCh9ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767659965; c=relaxed/simple;
	bh=Oyrwnd6iX7XuIfagXrIfDAmgi63aTsjq/viTSjXf/1c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTXX894nzCbNBnutyrbt/diOOL86XM9YU230rAIciZtB2IroYLE192Tuiz9tfqaLOsgWdH+3galfqh3FwzfZqhlrxXpIZb/TLpKMT2jGm4KrNRSPGn4SJIxisgoEs03zMBwix0IY0XcwMbkf3+Q9e2wdGhWBo/pPKXTHnArOWlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id D26E4C1757;
	Tue,  6 Jan 2026 00:39:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 9309D20028;
	Tue,  6 Jan 2026 00:39:10 +0000 (UTC)
Date: Mon, 5 Jan 2026 19:39:33 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Stefan Klug
 <stefan.klug@ideasonboard.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT
 enabled
Message-ID: <20260105193933.40485807@gandalf.local.home>
In-Reply-To: <20260105235921.GI10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
	<8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca>
	<20260105235921.GI10026@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 9g3fymwneetyszmde1d4grc7nedxsr7y
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 9309D20028
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+jyBUrmzGz/LIwDu33A2ymGczKKjDEAkw=
X-HE-Tag: 1767659950-586319
X-HE-Meta: U2FsdGVkX1+7VVNXxP1MAPsGOmGqsjr2CdajrWager3p8/66b/7VqrFtu8H8OFk5Qrbdbi7VIQE0ntXCY4/NJ/Jdp5AlFD+l73lG9mQkHbcwV4Vhxd3ITNHWRv/F9b23QBUgrx3rLtDMSAGSUrfpRg0ygrdm8rBRrArh0OzJFLAoENV84Hd72sO1ughXFVz9PyLzA75X1Oc8G4I59xp7uULpZXcHbXqCcemz9m4hBnXtYDiw2CTD5wPDbFUgsRFEamU8o2UhHTJS2B7j0ClDTiA6rwzXKpxveETZzmgR3i0hLL86ksNNxdO6ylI+qw4s/rmnyKL1X+FYtNvk+CU3NLRYEdTMOSflE/vvCrtOkstn6W6OwiZAU839Hz6lilyV

On Tue, 6 Jan 2026 01:59:21 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > That's interesting, do you plan to update more drivers ? There is a lot of m2m
> > using hard IRQ to minimize the idle time (save a context switch), but RT support
> > might be more worth then that.  
> 
> This is a part of PREEMPT_RT that puzzles me. By turning regular
> spinlocks into mutexes, RT seems to break drivers that use those
> spinlocks in hard IRQ handlers. That's a very large number of drivers
> given how widespread regular spinlock usage is. Do drivers need to be
> manually converted to either raw spinlocks or threaded IRQ handlers ?

No. Pretty much all interrupts are converted into threaded interrupt
handlers unless IRQF_NO_THREAD, IRQF_PERCPU, or IRQF_ONESHOT are specified.

The interrupt line is disabled until the thread handler is called.


> What about non-RT kernels, how can a driver avoid the thread scheduling
> penalty in those cases, do they need to manually select between
> request_irq() and request_threaded_irq() based on if RT is enabled ?
> This puzzles me, it feels like I must be missing something.

The issue here is that the interrupt handler specifies ONESHOT which causes
the handler to be executed in hard interrupt context.

-- Steve

