Return-Path: <linux-media+bounces-56208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMMqAnmcummHZgIAu9opvQ
	(envelope-from <linux-media+bounces-56208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:37:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A029E2BB91A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57FB2301F6AF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA89F3B6C1C;
	Wed, 18 Mar 2026 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q9kspBrT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C553D6660;
	Wed, 18 Mar 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837410; cv=none; b=bndCmWLhVKL/KQy3s8pQ12o2L7OBtWASPzRY3UsOGqK19z9FTKMASBh62hW60mDENPbG751kb3ksl5x1WqLs7WsoeaZkuWLXRrxWX/h6o+NDSp4r6ypApCLmXD8kH/vrSlH8YmDXXkyHDZY+nJbZOJZFhqe2xrQ+92WvnqYNNGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837410; c=relaxed/simple;
	bh=gJkOarkqeNqFiAqowEMJMqnQqZrj5iZoJNTJdDiOL4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyDMMQ6Pzj9nvzR8LATAWcCunMYQ++cdiRaDLsyc5CmIZ5NT7Qq4wLPjFakitDxGRof/ED0Wdv+E2mTDQ3gC+SGgTm6HxjDmtyXhBPMSG3ULyfhAvwV6faCTBiw0Fda9hlY3WP+ErZDwOB3JxxOf8T6Ps+PveJyH5JF9PI0ni5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q9kspBrT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 72950308;
	Wed, 18 Mar 2026 13:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773837333;
	bh=gJkOarkqeNqFiAqowEMJMqnQqZrj5iZoJNTJdDiOL4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9kspBrTMBUX3jZiKr4U6vvXHQJz3taLkvyeKuD0N0+qePPY5mqUuQ+9lcruXL4m+
	 YYR5GvGa3S7My22X6fxaaTrAqdpAYNLl4BV+pVNQPnkVLdq9Xi4cfSVzotm20AzBJL
	 3fvo+Ii/5Zvd7iHEzNm1x8I/M8gju231SQ+/Muvc=
Date: Wed, 18 Mar 2026 14:36:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <20260318123644.GH408929@killaraus.ideasonboard.com>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
 <aXOo0cc07cRi7-rF@pengutronix.de>
 <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
 <abqUAKj83Xaz0RzM@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abqUAKj83Xaz0RzM@pengutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56208-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A029E2BB91A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 01:01:04PM +0100, Michael Tretter wrote:
> On Fri, 23 Jan 2026 14:34:29 -0500, Frank Li wrote:
> > On Fri, Jan 23, 2026 at 05:58:57PM +0100, Michael Tretter wrote:
> > > On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> > > > On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > > > > If the IMX media pipeline is configured to receive multiple video
> > > > > inputs, the second input stream may be broken on start. This happens if
> > > > > the IMX CSI hardware has to be reconfigured for the second stream, while
> > > > > the first stream is already running.
> > > > >
> > > > > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > > > > The media pipeline is only validated on the first start. Thus, any later
> > > > > start of the media pipeline skips the validation and directly starts
> > > > > streaming. This may leave the hardware in an inconsistent state compared
> > > > > to the driver configuration. Moving the hardware configuration to the
> > > > > stream start to make sure that the hardware is configured correctly.
> > > > >
> > > > > Patch 1 removes the caching of the upstream mbus_config in
> > > > > csi_link_validate and explicitly request the mbus_config in csi_start,
> > > > > to get rid of this implicit dependency.
> > > > >
> > > > > Patch 2 actually moves the hardware register setting from
> > > > > csi_link_validate to csi_start to fix the skipped hardware
> > > > > reconfiguration.
> > > >
> > > > Gentle ping.
> > >
> > > Is there anything still missing to get these patches applied?
> 
> I'm not entirely sure, who is responsible for applying patches for
> media-imx. You handled the last few patches for this driver. Maybe you
> could apply these patches, too?
> 
> I also sent another series [0] for media-imx. Can you handle this other
> series, as well?

I don't have bandwidth to handle the i.MX6 camera code in staging, at
least for the parts that are not on their way out of staging (I really
want to help with imx6-mipi-csi2, but even there time is short). I'm
fine if Hans handles this series.

> [0] https://lore.kernel.org/linux-media/20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de/
> 
> > > > >
> > > > > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > > > > ---
> > > > > Changes in v2:
> > > > > - Document changed locking in commit message
> > > > > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > > > >
> > > > > ---
> > > > > Michael Tretter (2):
> > > > >       media: staging: imx: request mbus_config in csi_start
> > > > >       media: staging: imx: configure src_mux in csi_start
> > > > >
> > > > >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> > > > >  1 file changed, 48 insertions(+), 36 deletions(-)
> > > > > ---
> > > > > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > > > > change-id: 20251105-media-imx-fixes-acef77c7ba12

-- 
Regards,

Laurent Pinchart

