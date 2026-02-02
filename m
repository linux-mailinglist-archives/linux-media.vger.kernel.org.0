Return-Path: <linux-media+bounces-52007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGu8Ld+NgGkl+wIAu9opvQ
	(envelope-from <linux-media+bounces-52007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:43:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEEECBDCC
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AEBF13004D25
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 11:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23827363C56;
	Mon,  2 Feb 2026 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D+xMuwC6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0835B65F;
	Mon,  2 Feb 2026 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032601; cv=none; b=eEqIfDJn2iAZJxWQ8Hn3p8Q0wOsd5qSOTzznzsBJd7Pz9pYLjlfwFRe9oLDKtmeoULsN/cN+lrjM3MK4LybiElvcwYI1sP53XvQa9sQDd3jimZfvN7lPSdTp2RDcputMHoGivCfDFZY1PPLDNVYIV63VoAYmbsN9GCvTugI3nrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032601; c=relaxed/simple;
	bh=53IqFtmY5k6XcBZAWO6IXfkg/Zh/qfv2Y+ngXI7iML0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQV8644KAMEfO5h/sfB1k/ld4GSZpH6bKBAOgFmDUzCDcRw72AQ6Z8lMPAsRYbsmGET3ZRPB7jUf1fXSc2KpU83B0+1V7r7Bsp7b3RdNjieNEJatfUYd9UAheEHtBAm0btokFFPC8SzDxDyM1amMLt3dg2m0pm9d4bvSt9pEhhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D+xMuwC6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E8578492;
	Mon,  2 Feb 2026 12:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770032558;
	bh=53IqFtmY5k6XcBZAWO6IXfkg/Zh/qfv2Y+ngXI7iML0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+xMuwC68fdhryheH0mYSTqUq2R779LLpSrwlgONwfPMADRNVD1+Oa3juu7UBz+2/
	 5r94tTK1SgtiGuKkwoHQFjqgrQRg2SVftCH7k1DW3qD+d/p4u2MmDHa+384FEmPmx2
	 +XombrNKVICX0fSwoZ7CYscQ4p/HBf2H+lz9uPFg=
Date: Mon, 2 Feb 2026 13:43:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	linux-media@vger.kernel.org, jani.nikula@linux.intel.com,
	anisse@astier.eu, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <20260202114317.GB4173464@killaraus>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <5073898.31r3eYUQgx@natalenko.name>
 <20260202001704.2419778a@foz.lan>
 <13939245.uLZWGnKmhe@natalenko.name>
 <20260202020214.2243acec@foz.lan>
 <aYBo69zrMnRdWs32@kernel.org>
 <aYBsBw2j6pkwAssn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYBsBw2j6pkwAssn@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52007-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 7EEEECBDCC
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:19:03AM +0200, Jarkko Sakkinen wrote:
> On Mon, Feb 02, 2026 at 11:05:52AM +0200, Jarkko Sakkinen wrote:
> > On Mon, Feb 02, 2026 at 02:02:14AM +0100, Mauro Carvalho Chehab wrote:
> > > On Mon, 02 Feb 2026 00:25:37 +0100 Oleksandr Natalenko wrote:
> > > > On pondělí 2. února 2026 0:17:20, středoevropský standardní čas Mauro Carvalho Chehab wrote:
> > > > > No. At the machine with the camera, obs can read from a V4L2 input,
> > > > > generate a mpeg TS stream, and listen to a UDP port (for instance). 
> > > > > 
> > > > > At the remote machine, you can just pass the URL to ffmpeg.  
> > > > 
> > > > I can't, I have to feed the stream into Firefox somehow for it to see the stream as a virtual webcam.
> > > 
> > > Motioneye could be used on such scenario. It has a proper web
> > > interface, allows multiple users to watch, has login control accepts
> > > multiple cameras.
> > 
> > When proposed workarounds move in the area of motion detection systems
> > it feels like there was a competion who invents the most impractical
> > solution for a practical real-world problem out in the wild.

I'm also not quite sure how motioneye would be related. Please see my
reply to Gergo in this mail thread for a proposed solution that is (in
my opinion) not a workaround.

> A trivial Google search shows that the scope of the issue, which is
> also (on emphasis) a security issue, and net effect that is caused
> of not addressing it properly.

How is it a security issue ?

-- 
Regards,

Laurent Pinchart

