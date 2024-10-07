Return-Path: <linux-media+bounces-19192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C700999397B
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 23:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62E21B22FDA
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 21:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DDC18C903;
	Mon,  7 Oct 2024 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sYfXRG9P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013518C34C;
	Mon,  7 Oct 2024 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728337433; cv=none; b=AVCJKVNywieIHE01JiEiJgTEuFyOSfVnKI4TBBqPfmz+LjKiD8P/a3yLg3kH6JPXRnPlLo1Zjvzmu6HcBgP8gIVmeSwQGkHV31oz4idDwX2gHGCInw8aW+WID8t+wcUkV+sqlk8JGiu2pEtHR8p9FD/jIm155Leca64r/l3iLt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728337433; c=relaxed/simple;
	bh=11RYSo9lIEQFwo795OO9UqtSp6Ic4GVVOLJGQg8N7Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDnUe4hzR2GpQ7YwNnUpCyGSfafqua3XIcwHjxiwdfD/qw+HDvBWi8n/CjsqVLiAE6cWJlIslcIdfS5K42ekE5nWbpAEjCzjF7Fu9K03Q/xZSlqI0P6WbelSaZsy6Az1Dv7ZLcvgSmRXSXUl2IFjz9wExV7DDENaTKrK0Onp+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sYfXRG9P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94DC755;
	Mon,  7 Oct 2024 23:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728337332;
	bh=11RYSo9lIEQFwo795OO9UqtSp6Ic4GVVOLJGQg8N7Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYfXRG9Pai9BrtWZND6EBV9jZjIujTn2zwNbYXepz6wb4WT5mWIJz/46+CtWXvjX+
	 8eTJ0Ioh9kvZGl+teFXOsQTwmOieOgpUc8oYaE6w25P4U8xBTtDUw9vYkNOy5xSRl6
	 bqCs5O/PljjVdZH3CmVehWaJghxGsG0i6ClxcYF8=
Date: Tue, 8 Oct 2024 00:43:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: "rmfrfs@gmail.com" <rmfrfs@gmail.com>,
	"martink@posteo.de" <martink@posteo.de>,
	"kernel@puri.sm" <kernel@puri.sm>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management
 handling
Message-ID: <20241007214343.GB30699@pendragon.ideasonboard.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
 <AS8PR04MB9080211FC5A0FFCB255C3247FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <20240930072151.GC31662@pendragon.ideasonboard.com>
 <AS8PR04MB9080AF5E451A74FA0C0B03C0FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080AF5E451A74FA0C0B03C0FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>

Hi Guo,

On Mon, Sep 30, 2024 at 07:51:45AM +0000, G.N. Zhou (OSS) wrote:
> On Monday, September 30, 2024 3:22 PM, Laurent Pinchart wrote:
> > On Mon, Sep 30, 2024 at 07:08:09AM +0000, G.N. Zhou (OSS) wrote:
> > > On Sunday, September 29, 2024 9:44 PM, Laurent Pinchart wrote:
> > > >
> > > > Hello,
> > > >
> > > > This small patch series is a reaction to "[PATCH] media: nxp:
> > > > imx8mq-mipi-csi2: Fix CSI clocks always enabled issue" ([1]).
> > > > Instead of making the PM handling more complex, I think it can be greatly simplified.
> > > >
> > > > I have only compile-tested the patches. Guoniu, could you give this a try ?
> > >
> > > After applying the patches and test both on iMX8ULP.
> > >
> > > For iMX8ULP, it will cause kernel dump when access CSI registers and
> > > system hang during do suspend/resume while streaming Need to add
> > > system suspend/resume handlers and call
> > > pm_runtime_force_suspend/resume in the handlers.
> > >
> > > I tried to debug this issue and found pm runtime callback won't be
> > > called when system resume. The state of power domain won't enabled.
> > 
> > Thank you for testing.
> > 
> > I wonder if this could be caused by the CSI bridge being resumed from system
> > sleep before the CSI-2 receiver. Could you check if that's the case ? If so, does the
> > following change fix the issue ?
> 
> I tested on iMX8ULP which don't use CSI bridge but ISI, not iMX8MQ. In ISI driver, I notice that
> it already handler the device relationship when subdev bound like bellow:
> 
> link = device_link_add(isi->dev, sd->dev, DL_FLAG_STATELESS);
> if (!link) {
>         dev_err(isi->dev,
>                 "Failed to create device link to source %s\n", sd->name);
>         return -EINVAL;
> }

Ah yes indeed with the ISI it should already be handled.

I can't test this on hardware now as I'm travelling. Is the system hang
happening at suspend or resume time ? What is the order of the
suspend/resume handlers calls for the imx8-isi driver and the
imx8mq-mipi-csi2 driver ?

> For iMX8MQ, I'm trying to enable it, but meet some problems, so can't
> give you the results in short time.
> 
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> > b/drivers/media/platform/nxp/imx7-media-csi.c
> > index 9566ff738818..c66b0621e395 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -2057,9 +2057,22 @@ static int imx7_csi_notify_bound(struct
> > v4l2_async_notifier *notifier,  {
> >  	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
> >  	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
> > +	struct device_link *link;
> > 
> >  	csi->src_sd = sd;
> > 
> > +	/*
> > +	 * Enforce suspend/resume ordering between the source (supplier) and
> > +	 * the CSI (consumer). The source will be suspended before and resume
> > +	 * after the CSI.
> > +	 */
> > +	link = device_link_add(csi->dev, sd->dev, DL_FLAG_STATELESS);
> > +	if (!link) {
> > +		dev_err(csi->dev,
> > +			"Failed to create device link to source %s\n", sd->name);
> > +		return -EINVAL;
> > +	}
> > +
> >  	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
> >  					       MEDIA_LNK_FL_IMMUTABLE);
> >  }
> > 
> > > > [1] https://lore.kernel.org/r/20240929101635.1648234-1-guoniu.zhou@oss.nxp.com
> > > >
> > > > Laurent Pinchart (3):
> > > >   media: imx8mq-mipi-csi2: Drop stream stop/restart at suspend/resume time
> > > >   media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
> > > >   media: imx8mq-mipi-csi2: Drop system suspend/resume handlers
> > > >
> > > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 113 ++----------------
> > > >  1 file changed, 10 insertions(+), 103 deletions(-)
> > > >
> > > >
> > > > base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad

-- 
Regards,

Laurent Pinchart

