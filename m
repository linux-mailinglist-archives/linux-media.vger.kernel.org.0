Return-Path: <linux-media+bounces-65934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xXwLAt1fQmrk5gkAu9opvQ
	(envelope-from <linux-media+bounces-65934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:06:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81F6D9CCD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:06:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=T6QbnTJ9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65934-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65934-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9DAF302F7F5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884C03FE652;
	Mon, 29 Jun 2026 12:05:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AC83DE445;
	Mon, 29 Jun 2026 12:05:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734758; cv=none; b=IyuHH6H+fsk/jVNeZOyfAcd3BgNKZ3A20LhnKW64xhtT7iRw02Y8QT7tEox/V6/+CT9B6HxVdfNG1NlQVdjjO/FX+if9/WChhVcV18o5PzlepXAjDoruruICxG0mtq0m358RpbSVWg2apspZFBNpdOBZymyZHgeTa6uRwKclfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734758; c=relaxed/simple;
	bh=DHwgphUmlbxgLc24Ph5sZ43WhZWNIQjAa2XiVhZFpOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rY3QaSPGBlyq9XIOZaPzjHypgmfenbcwQDPpR8had9DZljGXlGRKPfYhn6SvURbuETRHlZO2w+J0zJnbkXe6qgkHqCREqWjbSm62ohez/RROLZTFzGiycsOPgNfZtXZ3iRrzJ8yn73X6QOiG1MT5WRmhyuyvMIEIAhpKSVAqy3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T6QbnTJ9; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C168D4;
	Mon, 29 Jun 2026 14:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782734710;
	bh=DHwgphUmlbxgLc24Ph5sZ43WhZWNIQjAa2XiVhZFpOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6QbnTJ9wwTsH/tZzrlJqYF198UavhKbi95td6A7AmR7ZCZ1scfrX/MfQOsVlYFYU
	 jTghHH4tvXZVI3XiYFngjXJGc9KmkoJEjp0AXGG0+iXn+1GtAUu3FND8VNHv8bCJK1
	 K+cQLBv5i4vEpNv2XFeR0dxQFxFQbSnpP36Tmo/s=
Date: Mon, 29 Jun 2026 15:05:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com,
	Konstantin Babin <Konstantin.Babin@arm.com>,
	Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Message-ID: <20260629120552.GE3054459@killaraus.ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
 <20260629095732.GC3054459@killaraus.ideasonboard.com>
 <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65934-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,killaraus.ideasonboard.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A81F6D9CCD

On Mon, Jun 29, 2026 at 12:08:08PM +0100, Vincenzo Frascino wrote:
> On 29/06/2026 10:57, Laurent Pinchart wrote:
> > On Sat, Jun 27, 2026 at 04:29:14PM +0200, Jacopo Mondi wrote:
> >> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >>
> >> Implement validation of CCM block parameters.
> >>
> >> CCM coefficients are expressed as 13 bits signed Q4.8 format and their
> >> raw value cannot be higher than 8191 (BIT(13) - 1).
> >>
> >> CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
> >> value cannot be higher than 4095 (BIT(12) - 1).
> >>
> >> CCM offsets are 12 bits unsigned integers and their value cannot be
> >> higher than 4095 (BIT(12) - 1).
> >>
> >> Validate the parameters provided by userspace using the .block_validate
> >> callback of struct v4l2_isp_params_block_type_info.
> > I don't think this is needed.
> > 
> > We need to validate parameters that can cause the ISP to malfunction in
> > ways that requires a system reset, or in ways that cause malfunction of
> > other system components (e.g. buffer overflows, memory bus lock ups,
> > ...). The rest doesn't need to be validated.
> > 
> > If you want to be cautious, you can just mask the value when writing to
> > registers, which I think you're doing in patch 1/4.
> 
> According to me here is not a matter of being cautious, but of honouring the
> contract with the userspace.
> 
> If the userspace is doing something wrong it should be notified. The only
> reasonable argument against this would be if this code is on a critical path and
> the validations have a performance impact.

I don't agree with this. As long as it doesn't have an impact on other
parts of the system, there's no need to notify userspace. It's purely a
userspace issue, it's pointless to waste CPU cycles every frame.

> @Jacopo, can you please confirm if this is the case?

-- 
Regards,

Laurent Pinchart

