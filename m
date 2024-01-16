Return-Path: <linux-media+bounces-3750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0DF82EFC9
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 14:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BAEE1F23E08
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97B81BC5F;
	Tue, 16 Jan 2024 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B/UIKyUF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C111BC4E
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 727FA161B;
	Tue, 16 Jan 2024 14:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705412043;
	bh=6XSrrjfKXODoQ4+0oHCXY0Y8yaog+bQL9VfjuM/riDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/UIKyUFX/R//Imho2Rv3p1XOA+FwapjSa57glCgEpt0B8rZccrcw4kNiMYbpecMd
	 ppe+Lq/dCfRcIaXzbjsDeO1bpoWN1lDVIc2yqDo3UDXYr89i765kCaGy/3xcsvPnt2
	 sOoHKNsvjbc9oie990VuVsv0t4GvVIusHd/d+KUw=
Date: Tue, 16 Jan 2024 15:35:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: Re: [PATCH v2 1/7] media: mc: Add local pad to pipeline regardless
 of the link state
Message-ID: <20240116133516.GA7325@pendragon.ideasonboard.com>
References: <20240116084240.14228-1-laurent.pinchart@ideasonboard.com>
 <20240116084240.14228-2-laurent.pinchart@ideasonboard.com>
 <ZaZoIXiM0XGDchIo@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZaZoIXiM0XGDchIo@valkosipuli.retiisi.eu>

Hi Sakari,

On Tue, Jan 16, 2024 at 11:27:29AM +0000, Sakari Ailus wrote:
> On Tue, Jan 16, 2024 at 10:42:34AM +0200, Laurent Pinchart wrote:
> > When building pipelines by following links, the
> > media_pipeline_explore_next_link() function only traverses enabled
> > links. The remote pad of a disabled link is not added to the pipeline,
> > and neither is the local pad. While the former is correct as disabled
> > links should not be followed, not adding the local pad breaks processing
> > of the MEDIA_PAD_FL_MUST_CONNECT flag.
> > 
> > The MEDIA_PAD_FL_MUST_CONNECT flag is checked in the
> > __media_pipeline_start() function that iterates over all pads after
> > populating the pipeline. If the pad is not present, the check gets
> > skipped, rendering it useless.
> > 
> > Fix this by adding the local pad of all links regardless of their state,
> > only skipping the remote pad for disabled links.
> > 
> > Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
> > Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> > Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Closes: https://lore.kernel.org/linux-media/7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Could you add Cc: stable when sending the PR? This should be applied to 6.1
> and later.

I'll do so, far all patches in the series.

-- 
Regards,

Laurent Pinchart

