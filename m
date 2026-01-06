Return-Path: <linux-media+bounces-49958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB676CF61C9
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 01:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C6A53058465
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 00:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B321E7C34;
	Tue,  6 Jan 2026 00:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dsbwOcDY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12D1C4A20;
	Tue,  6 Jan 2026 00:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660717; cv=none; b=K+CLo4MGGQOrasrwWTh1hxeIay03O8cMIOLMo59ajSpl/+orOTNGPw0Psc0EiYf4UvLn6trwt2u8eJoI4XW+wfNbiSZJYKn/Wyh0XCiNrbjWrfEQTPHFGN06H/k6dbENFpsvUUf+RMimrKXukDdODgjK3fqmcTj1f+VWKSK4uaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660717; c=relaxed/simple;
	bh=VTJeb5dCDQ3Y+nAc9RZ/kPhs4MgwnnWoJGm9Y5EWAKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OU0Yre8x/8X6Tei5J7i80BkmLStfyR7yu6o1BETGD/eoxXKwg/7Vebr59ht0a2/pC3ZSmug7sfSW0XJinHe6/KQzcmgaqfLVx1AaeRIKhat/nd31W7uZ3JuLmyOMy4gNLca6iDO+vfNRNLKcSQZYkawKHbufKOuWOsu3lxvR8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dsbwOcDY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B1A066DF;
	Tue,  6 Jan 2026 01:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767660693;
	bh=VTJeb5dCDQ3Y+nAc9RZ/kPhs4MgwnnWoJGm9Y5EWAKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsbwOcDYt1rZi8fxa0YFedPNQaflHsButDuMT+mPdqE1apTVzHChyLy6s53jc67h5
	 9FrDhldQ8ms9k7+Gt8vyoFOSvm4x3N8jP0AE4pkuNYMMrXqAnGWLhnhzIqcBdlykkw
	 PlPz6CLYIpVzIm285rgzPqvHk6H7Z1axeQHsTCmY=
Date: Tue, 6 Jan 2026 02:51:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 4/4] media: dw100: Split interrupt handler to fix timeout
 error
Message-ID: <20260106005135.GM10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-4-65af34d04fd8@ideasonboard.com>
 <1c04d8cd1a6cf29f45d7ea9422dd3fe0a633a957.camel@ndufresne.ca>
 <20260105163748.2488d506@gandalf.local.home>
 <20260105234452.GH10026@pendragon.ideasonboard.com>
 <20260105194350.5a4c9138@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105194350.5a4c9138@gandalf.local.home>

On Mon, Jan 05, 2026 at 07:43:50PM -0500, Steven Rostedt wrote:
> On Tue, 6 Jan 2026 01:44:52 +0200 Laurent Pinchart wrote:
> 
> > > Agreed. Because it doesn't seem to make sense to have a oneshot threaded
> > > irq handler that doesn't have the two parts (non-threaded to acknowledge the
> > > irq, and the threaded to handle it and re-enable it).  
> > 
> > Why is so ? Isn't oneshot meant exactly for this purpose ? It's
> > documented as not reenabling the interrupt after the hardirq handler
> > (which is absent after 3/4) returns, why would a hardirq handler be
> > mandatory then ?
> 
> Because it's timing out. The error in the change log states:
> 
>     In the previous commit, the interrupt handler was changed to threaded.
>     This sometimes leads to DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being
>     set after changing the vertex map. This can be seen by repeated error
>     outputs in dmesg:
> 
>     dw100 32e30000.dwe: Interrupt error: 0x1
> 
> It needs to be acknowledged in a timely manner. That is best done in the
> hard irq context where no locks need to be taken. It looks like the handler
> also disables the interrupt on the device and will be reenabled after the
> handler has completed (in thread context).

My point is that we (neither I nor Stefan) don't know why it's "timing
out" and what it means. There's no documentation publicly available.
I'd like to get to the bottom of this.

-- 
Regards,

Laurent Pinchart

