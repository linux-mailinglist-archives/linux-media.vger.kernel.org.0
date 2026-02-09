Return-Path: <linux-media+bounces-52473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFC4G+dqimnnKAAAu9opvQ
	(envelope-from <linux-media+bounces-52473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 00:16:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A641155A2
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 00:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E67A300C312
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 23:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B48632AADA;
	Mon,  9 Feb 2026 23:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hBR5TsfB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A5F3101D4;
	Mon,  9 Feb 2026 23:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770679012; cv=none; b=T2hdocUqA99ZR1Zx5szRQC5MH/HgcWzBKRljlE/Ce9vlaoXYX6YK6itLLFzJUkW9Lz5leBcZcLl28rcnQWci6XY8Uf1V5dcV4NwjouwHMe9RUdC06PY0uvHBtWm37P+nH+GMOQqkq3ODqIr+O2r96Edf7y52vmtBUQIZQW2HTgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770679012; c=relaxed/simple;
	bh=dXrwEM29xURyXIg24GFEWZchD3kfoQKyDFv9qfhxcTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy1CP5zkGbGcv+8mRMM+QSZhuspJdeJPt18w8jAC9YVmty/OTb0hqwtwiYi/wrO9rm2uWKtO5K1YqDdgcJPZUj24z64vYyGukcYoVYANXeeFpZoGm0dWeR71SsTdz9sHK2CoA88jWez1ORI5p1mmjUc98TWgIjNmNMKY+pN0NIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hBR5TsfB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ACA1C1574;
	Tue, 10 Feb 2026 00:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770678962;
	bh=dXrwEM29xURyXIg24GFEWZchD3kfoQKyDFv9qfhxcTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBR5TsfBDfJs3BI9H2JX3RG7Tzznbmo6/9EdwM8MFCQymNSPA6bncUUOC4bMYRop8
	 TGB4m4Qq2hKRznZwW1qqvE37KKR6C2YDq5wox5vDQoxioFlaVdv8ufjTy0TKfAuNob
	 YZCyCGtyz9jwN0TFT6QGXzckK7X4yz/iEHyG/QAM=
Date: Tue, 10 Feb 2026 01:16:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>, julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
	frank.li@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 03/11] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Message-ID: <20260209231647.GG2405149@killaraus.ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-4-antoine.bouyer@nxp.com>
 <aYIguNosvsnnraZO@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYIguNosvsnnraZO@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52473-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 18A641155A2
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 05:58:25PM +0100, Jacopo Mondi wrote:
> Hi Antoine
> 
> On Fri, Jan 23, 2026 at 09:09:30AM +0100, Antoine Bouyer wrote:
> > Add driver documentation for V4L2 ISP generic statistics format, mainly
> > copied from the generic parameters one.
> >
> > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/v4l2-isp.rst      | 42 +++++++++++++++++--
> >  1 file changed, 39 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> > index facf6dba1ca7..9024c6998b2c 100644
> > --- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> > +++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> > @@ -32,8 +32,8 @@ types.
> >  Userspace applications are responsible for correctly populating each block's
> >  header fields (type, flags and size) and the block-specific parameters.
> >
> > -ISP block enabling, disabling and configuration
> > ------------------------------------------------
> > +ISP parameters block enabling, disabling and configuration
> > +----------------------------------------------------------
> >
> >  When userspace wants to configure and enable an ISP block it shall fully
> >  populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> > @@ -59,7 +59,43 @@ definition without invalidating the existing ones.
> >  ISP statistics
> >  ==============
> >
> > -Support for generic statistics format is not yet implemented in Video4Linux2.
> > +The generic ISP statistics format is similar to the generic ISP configuration
> > +parameters format. It is realized by defineing a C structure that contains a

s/defineing/defining/

> > +header, followed by binary buffer where the ISP driver copies a variable number
> > +of ISP statistics block.
> > +
> > +The :c:type:`v4l2_isp_stats_buffer` structure defines the buffer header which
> > +is followed by a binary buffer of ISP statistics data. ISP driver shall

s/driver/drivers/

> > +correctly populate the buffer header with the generic statistics format version
> > +and with the size (in bytes) of the binary data buffer where it will store the
> > +ISP statistics data.
> > +
> > +Each *ISP statistics block* is preceded by a header implemented by the
> > +:c:type:`v4l2_isp_stats_block_header` structure, followed by the statistics
> > +data for that specific block, defined by the ISP driver specific data types.
> > +
> > +Driver is responsible for correctly populating each block's header fields

s/Driver is/Drivers are/

> > +(type, flags and size) and the block-specific statistics data.
> > +
> > +ISP statistics block configuration
> > +----------------------------------
> > +
> > +When ISP driver wants to share statistics from an ISP block, it shall fully

s/ISP driver/an ISP driver/

> > +populate the block statistics and set the V4L2_ISP_STATS_FL_BLOCK_VALID
> > +bit in the block header's `flags` field.
> > +
> > +When ISP driver wants userspace to ignore statistics from an ISP block, it can
> 
> What would be the use case here ?
> 
> I checked a few datasheet and drivers and I haven't found any "failed
> to read stats" bits, and even if that would be a thing, isn't it easier to
> simply overwrite the header of the failed stat block instead of
> marking it invalid ?

It seems simpler to just omit the block completely indeed. The only case
where I could imagine this being useful is if the hardware writes the
statistics data to memory through DMA, with different stats engines
writing to different parts of the buffer concurrently.

In that case though, we will need to ensure the buffer format can
accommodate DMA alignment requirements of different devices, which is
likely not the case of the format proposed in this series. The size of
the top-level header and of the block headers are fixed, we would likely
need to make them configurable by the driver.

> > +simply omit the full block, or set the V4L2_ISP_STATS_FL_BLOCK_INVALID bit in
> > +the block headers's `flags` field. Then driver can omit the additional data
> > +after header, and set block header's `size` to the header structure's size only
> > +in such case.
> > +
> > +Setting both the V4L2_ISP_STATS_FL_BLOCK_VALID and
> > +V4L2_ISP_STATS_FL_BLOCK_INVALID  bits in the flags field is not allowed and
> > +userspace shall not handle it.
> > +
> > +Extension to the statistics format can be implemented by adding new blocks
> > +definition without invalidating the existing ones.
> >
> >  V4L2 ISP uAPI data types
> >  ========================

-- 
Regards,

Laurent Pinchart

