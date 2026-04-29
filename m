Return-Path: <linux-media+bounces-60025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sd6kCeVp8mnIqwEAu9opvQ
	(envelope-from <linux-media+bounces-60025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:28:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4149A22D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B851C3054C13
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4355E3932F9;
	Wed, 29 Apr 2026 20:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hvZv2WbP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A87277C9D;
	Wed, 29 Apr 2026 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494486; cv=none; b=ebjCjvliTeUvEIP0MLAMVD6KhMkdYWPnDT5Ay8qiRXgg3KW29dmJXQ1x28nZc1+qrRDMWbVSsAFo7GNKeXNDSV2UjfZO+PvqnzLUy7HH+ACHrvy+gttb2Dt6mT2o+fLHybnTyJFDzD2JQoc+8qKoalUcox+vqHxm69paiZLtHG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494486; c=relaxed/simple;
	bh=1WhgM7s9T8lW6CepEqkpok80KW4t2frLj0MmsJ97CGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJXaQsv2OtWKSo/tzWkYiqSeb1Q2kL7VJmFBo3pPDv+aToqK3SCrVdgiukP9KeZad8ZSJX1egqkcganjCth8LMB4KEa0vZyOVnPbt11FnlRK6lkf+SyT4i7Ri8SIwq+IWzs16fgjO7hdW+cRvSy6F3dwXmpqCht44ts8p73dofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hvZv2WbP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B06C4BB;
	Wed, 29 Apr 2026 22:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777494379;
	bh=1WhgM7s9T8lW6CepEqkpok80KW4t2frLj0MmsJ97CGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvZv2WbPUcj8PXY4U2VeLOPhprcqJVhV0mf63yTHq3/7DHMi7MiAURSCj7kI4DwDb
	 PcSqqViBPLyq1gloP1XHV1zMaCeqyQWq1MIxGJlApnoQBu72uQrHe1IwT8eJYXygy/
	 aGIQUBrxyO2GZkwTFigfUPxYqi+WHZE/9odR2Elk=
Date: Wed, 29 Apr 2026 23:28:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH][next] media: xilinx: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <20260429202801.GB132396@killaraus.ideasonboard.com>
References: <afJiL-iZ4QbJ5v12@kspp>
 <20260429202449.GA132396@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429202449.GA132396@killaraus.ideasonboard.com>
X-Rspamd-Queue-Id: 8DD4149A22D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-60025-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

I forgot to ask, how do you want to get this merged? Will you collect
all similar patches and send a tree-wide pull request, or should they be
merged by individual subsystems ? In the latter case, Tomi, could you
please handle this with other Xilinx patches ?

On Wed, Apr 29, 2026 at 11:24:50PM +0300, Laurent Pinchart wrote:
> CC'ing Tomi Valkeinen.
> 
> On a side note, Tomi, can I send a patch to add you to the "XILINX VIDEO
> IP CORES" section of MAINTAINERS ?
> 
> On Wed, Apr 29, 2026 at 01:55:27PM -0600, Gustavo A. R. Silva wrote:
> > -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> > getting ready to enable it, globally.
> > 
> > Use the TRAILING_OVERLAP() helper to fix the following warning:
> > 
> > drivers/media/platform/xilinx/xilinx-dma.h:99:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > 
> > This helper creates a union between a flexible-array member (FAM)
> > and a set of members that would otherwise follow it. This overlays
> > the trailing members onto the FAM while preserving the original
> > memory layout.
> > 
> > Lastly, the static_assert() ensures the alignment between the FAM
> > and struct data_chunk sgl; is not inadvertently changed, and it's
> > intentionally placed inmediately after the related structure (that
> > is, no blank line in between).
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/platform/xilinx/xilinx-dma.h | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
> > index 18f77e1a7b39..65f6147ff6c6 100644
> > --- a/drivers/media/platform/xilinx/xilinx-dma.h
> > +++ b/drivers/media/platform/xilinx/xilinx-dma.h
> > @@ -96,9 +96,14 @@ struct xvip_dma {
> >  
> >  	struct dma_chan *dma;
> >  	unsigned int align;
> > -	struct dma_interleaved_template xt;
> > -	struct data_chunk sgl;
> > +
> > +	/* Must be last as it ends in a flexible-array member. */
> > +	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
> > +		struct data_chunk sgl;
> > +	);
> >  };
> > +static_assert(offsetof(struct xvip_dma, xt.sgl) ==
> > +	      offsetof(struct xvip_dma, sgl));
> >  
> >  #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)
> >  

-- 
Regards,

Laurent Pinchart

