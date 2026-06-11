Return-Path: <linux-media+bounces-64593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 498oFre0KmpNvgMAu9opvQ
	(envelope-from <linux-media+bounces-64593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 15:14:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D667243A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 15:14:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=mKpuxxEB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64593-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64593-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06039316DAA9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 13:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3AB406833;
	Thu, 11 Jun 2026 13:11:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF56A402BB7;
	Thu, 11 Jun 2026 13:11:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183463; cv=none; b=rAJNzydkP5OVNcqm6k0i7/Lo0yN5H4VHczhKD1CIrCDjuE/06pqTQeME+4Ks9QTDmXMMnzvaKM+zPyRVyTkQH+0YlMdQGrwKIGkKCtaH6puzPOslGTfwwgNrAVHaDR0c5Z97OpYBW/UyAbtrkGbjiQeXmxkbnUZCp4zJQwvykxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183463; c=relaxed/simple;
	bh=dKGInWVhf3/eAG/GM57TlIFJIUDuruotPgvubC4is1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uf93z6UoOlLSIeKqVOoOya2QhpbKZSztrnJ3+UCnVyFC6oAGTEFW6tenGIOlYPrr5PjWqsDZ9ZthrQywgbthzSXfHeN9zG+P+UgshMdt9zT9umfuyGj71MIdZ8eWw/iG72bpwmUoCyskm5FnHMSbRLkXEThzdpj/KqWAzGDsTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mKpuxxEB; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34F29D0;
	Thu, 11 Jun 2026 15:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781183430;
	bh=dKGInWVhf3/eAG/GM57TlIFJIUDuruotPgvubC4is1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKpuxxEBqykpfu7t8V9UpjizqQB+COxMxqDksetJrn1Bg6O/4impTEiVMVT3C7ZZC
	 qkl6L/naPnepF7G5IJ1JkVMPnF8RxMDHE1TXVQGzgaY7TEEPIs7q5/eFBm7ztiCdqS
	 6Mrja13/+8J8kek0htlabSrpAOp3FaMngyXQdpY4=
Date: Thu, 11 Jun 2026 16:10:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx219: Report streams using frame descriptors
Message-ID: <20260611131058.GA1795343@killaraus.ideasonboard.com>
References: <20260611-imx219-frame-desc-v1-1-fe7e975bca6e@ideasonboard.com>
 <aip-xwYlKT1d3N0S@kekkonen.localdomain>
 <b39bc319-8ae0-4715-8e3f-b822cdb535dc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b39bc319-8ae0-4715-8e3f-b822cdb535dc@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64593-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 991D667243A

On Thu, Jun 11, 2026 at 04:06:38PM +0300, Tomi Valkeinen wrote:
> On 11/06/2026 12:24, Sakari Ailus wrote:
> > On Thu, Jun 11, 2026 at 12:13:02PM +0300, Tomi Valkeinen wrote:
> >> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> Implement the .get_frame_desc() subdev operation to report information
> >> about streams to the connected CSI-2 receiver. This is required to let
> >> the CSI-2 receiver driver know about virtual channels and data types for
> >> each stream.
> >>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> [tomi.valkeinen: picked from "Generic line based metadata support, internal pads" series]
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >> This patch that adds .get_frame_desc() support to imx219 driver has been
> >> circulating for a few years, and is currently posted in "[PATCH v12
> >> 00/86] Generic line based metadata support, internal pads" series.
> >>
> >> However, as some bridge drivers require modern drivers that support
> >> .get_frame_desc, specifically ds90ub960.c, let's pick the patch and
> >> queue it separately from the huge metadata series.
> > 
> > I've been recently working on
> > <URL:https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/>.
> > In other words, drivers that have a single stream don't need this. We could
> 
> Thanks, I had missed that. I like the idea of a helper that does the 
> fallback mechanism. But I wonder about the need for dynamic alloc, which 
> complicates the series. In any case, we can drop this series and 
> continue the discussion on your series.

Maybe we can merge the fallback implementation separately from the
dynamic allocation if the latter requires more work ? I'm also not a fan
of the dynamic allocation, at least in the way it's implemented in the
proposed series. I'm wondering if we could build the frame descriptors
at stream enable time and store it in state structures instead.

-- 
Regards,

Laurent Pinchart

