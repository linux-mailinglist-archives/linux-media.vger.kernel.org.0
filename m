Return-Path: <linux-media+bounces-53068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNARB/s7lmkDcwIAu9opvQ
	(envelope-from <linux-media+bounces-53068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 23:23:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993515A9C7
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 23:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56FDE30626D1
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 22:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5D4335540;
	Wed, 18 Feb 2026 22:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NCgqywQY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51CA304BDF
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 22:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771453338; cv=none; b=AmBcTLZISNMXJTUM93gs+y8ZTXb0PjDY1YSBaQGsY08RusVt23+gOWp92hgSE3JbCsnh7DWLFPuw7YRS/NwA18uNBnGQGb06vtMksQ8XSK3QBhqw/7q3EK3WapnPTjX+j+HopSPqOxDwPOFVj0uQVTOcMU85l4q0KyBZy+whm8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771453338; c=relaxed/simple;
	bh=c2bYFjKYrsZTZG+WRbXqjELmtLaVjNQ57pajq83q4RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNVm1Htapxtr1Y4hgl5EC4Vx1O8ur4lXYnC/K7Xl8YO0eO8FLPR5yeFCjh8sO4P5fRhvFs42VS9LKvgp6NKSqYNOKWnzVNYBt7hf7sBgcsLMtVHXsbHjIEpsMwnwClnsauCiWF/V0i5OPG4jbtkX32CIx+VdEWhugtkQVDbYpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NCgqywQY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7D2C066B;
	Wed, 18 Feb 2026 23:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771453282;
	bh=c2bYFjKYrsZTZG+WRbXqjELmtLaVjNQ57pajq83q4RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCgqywQYet4KeDXgFhOMhOw7yUM5r3pYvFMnSqHLZhZSRowHUlpcXQrNjOLgVpPrX
	 hcpBDj6mD9Dc002M1vbivLBCEivjZkq74Ewk0eP5aqL0troPrzDSeowgmqcbF0ZLme
	 6dx6Ss94L0TFAkAhzp8kw7zhP7sNEhcpHE/y4Z9M=
Date: Wed, 18 Feb 2026 23:22:11 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Itay Perl <itay.perl@q.ai>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Itay Chamiel <itay.chamiel@q.ai>
Subject: Re: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Message-ID: <20260218222211.GE57525@killaraus.ideasonboard.com>
References: <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
 <AMBPR10MB9376F52A5A6C5EC76EC263CA8D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AMBPR10MB9376F52A5A6C5EC76EC263CA8D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53068-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 7993515A9C7
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 11:56:28AM +0000, Itay Perl wrote:
> On 18 February 2026 19:17, Ricardo Ribalda wrote:
> > On Wed, 18 Feb 2026 at 11:59, Itay Perl wrote:
> > > Would restoring the previous behavior be acceptable for compatibility?
> > > Alternatively (or additionally), would it make sense to introduce a dedicated
> > > metadata format that allows userspace to request the full UVC header for
> > > generic devices?
> > 
> > By any chance the device that you are using supports
> > V4L2_META_FMT_UVC_MSXU_1_5 ?
> > If the device exposes the UVC_MSXU_CONTROL_METADATA control, that
> > format should be available, and it provices access to all the UVC
> > header as you had before.
> >
> > Alternatively, if this is needed for a specific device you could send
> > a patch adding the UVC_QUIRK_MSXU_META for that device.
> > Would that work for you?
> 
> My device is an internal development platform and does not have a public VID/PID
> that could reasonably be added to the driver.
> 
> I may be able to implement the MSXU control on the device side as a workaround,
> but I'm concerned that this could cause issues when the device is used on a
> Windows machine, which may expect the UVC header to follow a certain
> format when MSXU is present.

Does your device implement a vendor-specific metadata format ?

-- 
Regards,

Laurent Pinchart

