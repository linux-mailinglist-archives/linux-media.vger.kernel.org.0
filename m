Return-Path: <linux-media+bounces-41866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB95B45E58
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6DE9587E21
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E31E3090E8;
	Fri,  5 Sep 2025 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NfEn+tYW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE93306B2A;
	Fri,  5 Sep 2025 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090368; cv=none; b=c4DHxbFAzidfcSAu6gt57I47YUzFh77kYwwZfNReiFPZStxx6cz7X/gdt2Cqnt41pdbhRqOUJhnqtLT3+rCaLNpUVxnHCiv+xGmBLL7GerXi/3zqjUXgxUrsy3cB0D1E92y+gcQZVj8nq8ljwM5tVlsV/GOUwzHv5KpwS1uQrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090368; c=relaxed/simple;
	bh=zmsBzE6b5qj1Y6/n+7xcJ/aC30MluLPi1gxV/P3HC1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ge1JL15eZ7B17DLvWdJRmbLc73TcYwPf33AYGXdbnD/3KuI7dqRzwiX9LuUtqTyvhSbtrHBgqCuHNhwgwAUwOEJi1JgFUhh0o+JCLDKvhEuCa29p4T2MLEoYV0HdxaT6GzBgAcoClTOawoYL+Jnl7XZtxgeGjsBqppzk62dw3Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NfEn+tYW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 29FB7F09;
	Fri,  5 Sep 2025 18:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757090294;
	bh=zmsBzE6b5qj1Y6/n+7xcJ/aC30MluLPi1gxV/P3HC1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NfEn+tYWvOlpeB53yvR0bEXeIkn8r7IHA0NOilB1smB6p3/1sk4+gQO1WN3YQbtPU
	 3fGaOZp0KexFAlZxayt2h8aWmFBJfePJpgzUJgV+AkBjtWugzf2pq/93wpmPW44CE4
	 G/0lTkeLsPAxS99bX5gN/YxDfyuatajmuGH+zUIY=
Date: Fri, 5 Sep 2025 18:39:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, rmfrfs@gmail.com,
	martin.kepplinger@puri.sm, kernel@puri.sm,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, mchehab@kernel.org,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH 1/1] MAINTAINERS: media: nxp: Add Frank Li as reviewer
 for nxp SoC
Message-ID: <20250905163903.GB21773@pendragon.ideasonboard.com>
References: <20250904161720.514889-1-Frank.Li@nxp.com>
 <20250905160453.GA21773@pendragon.ideasonboard.com>
 <aLsRVWhK2mT32Kzf@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLsRVWhK2mT32Kzf@lizhi-Precision-Tower-5810>

On Fri, Sep 05, 2025 at 12:35:33PM -0400, Frank Li wrote:
> On Fri, Sep 05, 2025 at 06:04:53PM +0200, Laurent Pinchart wrote:
> > On Thu, Sep 04, 2025 at 12:17:20PM -0400, Frank Li wrote:
> > > Add Frank Li as reviewer for nxp SoC.
> >
> > Great idea, and thank you for volunteering ! I really appreciate your
> > help with reviews so far, and I have already mentioned it in a
> > conversation with another SoC vendor as a model they should follow.
> >
> > I'd mention media drivers here though, unless you want to volunteer to
> > review patches for the whole SoC :-) Maybe something along the lines of
> >
> > ----
> > MAINTAINERS: Add Frank Li as reviewer for NXP media drivers
> >
> > Frank has been reviewing NXP media drivers for a while, and is
> > volunteering to continue. Add him as a reviewer for the IMX media
> > drivers.
> >
> > Also add the NXP i.MX platform mailing list (imx@lists.linux.dev).
> > ----
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Do I need repost it with updated commit message? Or you can handle it when
> pick patche?

No need to repost if you're fine with the proposal. I've applied the
patch to my tree already to avoid forgetting about it. It would be
easier if Hans or Mauro (on CC) could pick it though, to avoid sending a
pull request with a single patch. Otherwise I'll send a pull request.

> > > Add nxp open source mail list imx@lists.linux.dev.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > I am work on kernel community for the while. And upstreamed/reviewed:
> > > cee06ca7a6748 media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt()
> > > 51ad3b570ea7b media: imx-jpeg: Account for data_offset when getting image address
> > > 642b70d526ab8 media: imx8mq-mipi-csi2: Add support for i.MX8QXP
> > > 382d53e9cefb3 media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
> > > 859278460faa4 media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
> > > dee8521f69874 media: nxp: imx8-isi: Use dev_err_probe() to simplify code
> > > 73a40554f979e media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> > > 60b8de2b9b4be media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> > > 66ede6d71d4e8 media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> > > 2021b8d51cdb5 media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
> > > 038d27acf987c media: imx-mipi-csis: Use CSI-2 data type macros from mipi-csi2.h
> > > fd5b6cd730676 media: imx-jpeg: Check decoding is ongoing for motion-jpeg
> > > f65fbf8c3d671 media: imx-jpeg: Change the pattern size to 128x64
> > > 7500bb9cf164e media: imx-jpeg: Cleanup after an allocation error
> > > faa8051b128f4 media: imx-jpeg: Reset slot data pointers when freed
> > > 46e9c092f850b media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahea
> > >
> > > On going thread:
> > > 5 patches, https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-1-4dfca4ed2f87@nxp.com/
> > > 32 patches, https://lore.kernel.org/imx/20250808-95_cam-v2-0-4b29fa6919a7@nxp.com/
> > > 2 patches, https://lore.kernel.org/imx/aLbdRdS3TmLHjW+Q@lizhi-Precision-Tower-5810/
> > >
> > > I am volunteer to review media related patches so add myself to MAINTIANER
> > > so I can get notified when related patches post.
> > > ---
> > >  MAINTAINERS | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b3ca0ba848879..2884a5216b427 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15327,6 +15327,8 @@ F:	drivers/media/pci/ddbridge/*
> > >  MEDIA DRIVERS FOR FREESCALE IMX
> > >  M:	Steve Longerbeam <slongerbeam@gmail.com>
> > >  M:	Philipp Zabel <p.zabel@pengutronix.de>
> > > +R:	Frank Li <Frank.Li@nxp.com>
> > > +L:	imx@lists.linux.dev
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  T:	git git://linuxtv.org/media.git
> > > @@ -15341,6 +15343,8 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
> > >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >  M:	Martin Kepplinger <martin.kepplinger@puri.sm>
> > >  R:	Purism Kernel Team <kernel@puri.sm>
> > > +R:	Frank Li <Frank.Li@nxp.com>
> > > +L:	imx@lists.linux.dev
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  T:	git git://linuxtv.org/media.git

-- 
Regards,

Laurent Pinchart

