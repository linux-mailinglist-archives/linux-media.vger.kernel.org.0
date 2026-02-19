Return-Path: <linux-media+bounces-53081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ3CEfjUlmmVowIAu9opvQ
	(envelope-from <linux-media+bounces-53081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:16:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634815D426
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2647E3023DA5
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 09:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D94630EF6C;
	Thu, 19 Feb 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rC0wba6e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1E41684B0
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492594; cv=none; b=VpJZxgXQbwgHPRgcUIXn9i4GTGfr24Ppj/B/h19ipk4fGGSNzSaAfgdrE9basHjw5ep481NBQz8rc8zBKO5gVjq9DjzDNUjdqtmTJ2wBjZOwDtqPEY9aYHRLcD7/L2QaH/6lJLfYnITfIce1USYm3VVCJn5l7+2a5N7a8EKPzhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492594; c=relaxed/simple;
	bh=aRFT16MLaJ2WxDBMfYYPr2N53qi9oBbx1HhgzT73PVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKL6afY4jkOk52pYOH727NvZ1ByNiwl+Mpwu3asa1akKNYdW4tSm2q7cg3WcuhGvD4cdBm8/mouEn5aFhQPXIosDWG1c5vds64mp8CH7xuSWteXpq3iS0kaLHwJIX/gL8EOekxuF1IbjbTlvoQ1JjDLHcg/7l/98buLDxZdExnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rC0wba6e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C1520673;
	Thu, 19 Feb 2026 10:15:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771492539;
	bh=aRFT16MLaJ2WxDBMfYYPr2N53qi9oBbx1HhgzT73PVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rC0wba6eJ57uhauDhy4oKxmcHS05qB/RnWYdUuFbhu2/N5RIJSBB31MSrIxCQWhRr
	 qxBshkT16RTrjWdNdpS+y+TLwoU1dytd7aiMJ2FUebPHnZ7c7Lz6JQjW36Dx3omqYj
	 cNHf8dgF7fM069QjKf5mFQnCVH85ESzCQXoxv/fs=
Date: Thu, 19 Feb 2026 10:16:28 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Itay Perl <itay.perl@q.ai>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Itay Chamiel <itay.chamiel@q.ai>
Subject: Re: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Message-ID: <20260219091628.GG520738@killaraus.ideasonboard.com>
References: <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
 <AMBPR10MB9376F52A5A6C5EC76EC263CA8D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260218222211.GE57525@killaraus.ideasonboard.com>
 <AMBPR10MB9376A5762A4DF0BA3759437A8D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260219082157.GD520738@killaraus.ideasonboard.com>
 <AMBPR10MB937601B40E77906128A82B758D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AMBPR10MB937601B40E77906128A82B758D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53081-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 9634815D426
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 09:01:15AM +0000, Itay Perl wrote:
> On 19 February 2026 16:21, Laurent Pinchart wrote:
> > On Thu, Feb 19, 2026 at 06:03:49AM +0000, Itay Perl wrote:
> > > ON 19 February 2026 06:22, Laurent Pinchart wrote:
> > > > On Wed, Feb 18, 2026 at 11:56:28AM +0000, Itay Perl wrote:
> > > > > On 18 February 2026 19:17, Ricardo Ribalda wrote:
> > > > > > On Wed, 18 Feb 2026 at 11:59, Itay Perl wrote:
> > > > > > > Would restoring the previous behavior be acceptable for compatibility?
> > > > > > > Alternatively (or additionally), would it make sense to introduce a dedicated
> > > > > > > metadata format that allows userspace to request the full UVC header for
> > > > > > > generic devices?
> > > > > >
> > > > > > By any chance the device that you are using supports
> > > > > > V4L2_META_FMT_UVC_MSXU_1_5 ?
> > > > > > If the device exposes the UVC_MSXU_CONTROL_METADATA control, that
> > > > > > format should be available, and it provices access to all the UVC
> > > > > > header as you had before.
> > > > > >
> > > > > > Alternatively, if this is needed for a specific device you could send
> > > > > > a patch adding the UVC_QUIRK_MSXU_META for that device.
> > > > > > Would that work for you?
> > > > >
> > > > > My device is an internal development platform and does not have a public VID/PID
> > > > > that could reasonably be added to the driver.
> > > > >
> > > > > I may be able to implement the MSXU control on the device side as a workaround,
> > > > > but I'm concerned that this could cause issues when the device is used on a
> > > > > Windows machine, which may expect the UVC header to follow a certain
> > > > > format when MSXU is present.
> > > >
> > > > Does your device implement a vendor-specific metadata format ?
> > >
> > > Yes, the device uses a vendor-specific metadata format to attach
> > > platform-specific data to each frame.  This is the most straightforward way to
> > > add per-frame metadata without otherwise affecting UVC functionality.  We have
> > > used this method successfully on Linux (using the 0-format hack) and on
> > > Windows, where it required a registry configuration but was otherwise
> > > supported.
> >
> > To support that device on Linux, the right way is to define a meta
> > format (such as V4L2_META_FMT_UVC and V4L2_META_FMT_UVC_MSXU_1_5) and
> > either add a VID:PID entry to the driver's uvc_ids[] array if the number
> > of devices is small, or define an XU that advertises support for the
> > format if you expect a larger number of devices. The metadata format
> > needs to be documented.
> 
> I understand the device-specific metadata approach via uvc_ids. However, my
> device is an internal development platform not intended for public
> availability, so adding specific support for it in the kernel would not be
> appropriate.
> 
> Would it be reasonable to consider a generic metadata format (such as
> V4L2_META_FMT_UVC_RAW/EXT) that could be used with generic devices? This could
> be a useful feature for UVC device development and testing in general.

The reason for the current design is to ensure that metadata formats get
publicly documented. A generic format would defeat that.

-- 
Regards,

Laurent Pinchart

