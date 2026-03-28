Return-Path: <linux-media+bounces-57437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJl3N8XBx2mebwUAu9opvQ
	(envelope-from <linux-media+bounces-57437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:55:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D934E49D
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 12:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31FD9302D0A7
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 11:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699B3389479;
	Sat, 28 Mar 2026 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TS4CMPb8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983203064A9;
	Sat, 28 Mar 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698934; cv=none; b=esVz1TW+EEjaHB/VLCI1gPmt9xo5N8HRi+kS9eknDbiDaFFMBKGzBX7WrrboC7FPkZPZnmXY5vjOkyWpWJ20pCzukP0fYiqhSEKlXUoG3sHB4t4h7PgrDHa5TW8FTZd466ualm2T9TPApK9Ko1H+c74568W47NgGOWpjJyMVN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698934; c=relaxed/simple;
	bh=klZ2SzkCb0n5jxiB/B0foHVKhb8SkmZtAYYj+wa0zvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ar79/7XdtVhHs3wYgsaEFgm8qb/nESwUBrTAhJvaQsKyK68WeDAN26zo7ZG2v53YfQ4rMTWicFAKCZpN5k/hrFbB56lV+RrnIvfjQliu0yHzTJwnMDeqn5Jo/nltS4Y5vsR5S9DBx0tVVAv18CXOyKwCzwEaBhavAQAX4UKgM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TS4CMPb8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6881B63D;
	Sat, 28 Mar 2026 12:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774698848;
	bh=klZ2SzkCb0n5jxiB/B0foHVKhb8SkmZtAYYj+wa0zvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TS4CMPb8w0IlXqQu+iBjRGl3mzIMt9uT4FQVWMgVvw6KI9shNc8s9lrBAWd9iU5ti
	 AdicS9wPLKiUff1mthUxNVxSQGhTgYX+4Mddbs/oAoSV73kIIRN073zaANWkvHIVh/
	 t86AWo+XXYUXm0b4EAXu9MJMzAayyRBSQAjs0Hy8=
Date: Sat, 28 Mar 2026 12:55:25 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 00/14] media: rzg2l-cru: Rework slot programming for
 V2H/G3E
Message-ID: <acfBaMdKDThNhfcX@zed>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <CA+V-a8tGfAzMdFgY7U+pLitDXbnj3xD8-RzXjbkOQ-iH4mtkug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tGfAzMdFgY7U+pLitDXbnj3xD8-RzXjbkOQ-iH4mtkug@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57437-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D0D934E49D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar

On Fri, Mar 27, 2026 at 05:25:30PM +0000, Lad, Prabhakar wrote:
> Hi Jacopo,
>
> Thank you for the patches.
>
> On Fri, Mar 27, 2026 at 5:19 PM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > This patch series starts by collecting a patch sent from Dan in the past
> > which improves the HW slot programming on V2H(P) to avoid losing frames
> > under heavy system load conditions.
> >
> > Tommaso also sent a series a few months ago for the CRU from which I
> > collected the first two patches.
> >
> > Around it, I've reworked a bit the locking in the driver which is a bit
> > coarse and causes lost of frames under heavy system load conditions.
> >
> > Along with these, bit of drive-by cometic changes here and there to
> > modernize the driver code.
> >
> > I've tested on V2H(P) but I've also modified the G2L IRQ handler, so if
> > anyone could test on G2L and G3E it would be great!
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Daniel Scally (1):
> >       media: rzg2l-cru: Rework rzg2l_cru_fill_hw_slot()
> >
> > Jacopo Mondi (11):
> >       media: rzg2l-cru: Modernize spin_lock usage with cleanup.h
> >       media: rzg2l-cru: Use proper guard() in irq handler
> >       media: rzg2l-cru: Remove locking from start/stop routines
> >       media: rzg2l-cru: Do not use irqsave when not needed
> >       media: rzg2l-cru: Remove wrong locking comment
> >       media: rz2gl-cru: Introduce a spinlock for hw operations
> >       media: rzg2l-cru: Split hw locking from buffers
> >       media: rzg2l-cru: Manually track active slot number
> You beat me to it, I had a similar patch internally.

Oh that's great, I wasn't sure how this was going to be received!

>
> >       media: rz2gl-cru: Return pending buffers in order
> >       media: rzg2l-cru: Remove the 'state' variable
> >       media: rzg2l-cru: Simplify irq return value handling
> >
> > Tommaso Merciai (2):
> >       media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
> >       media: rzg2l-cru: Use only frame end interrupts
> >
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   2 +
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  28 +-
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 328 ++++++++-------------
> >  3 files changed, 140 insertions(+), 218 deletions(-)
>
> I'll test these patches with ISP enabled next week.

My testing platform is v2h with the ISP, if you have a G2L could you
maybe give it a spin there as I don't have any board with that SoC ?

Thanks
   j

>
> Cheers,
> Prabhakar

