Return-Path: <linux-media+bounces-18761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076C989B4D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83AA31C212C5
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E731552F6;
	Mon, 30 Sep 2024 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qwR2GjGD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA45714A0AB;
	Mon, 30 Sep 2024 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680918; cv=none; b=kX4EAd1AS1nq7bvbJvxktVddTs8GABqSlXzmyAbaRCwQdLgSgZSzOQ3ELLCbCr2KA3M+84OQzKwWkW54sguSKPZE+XDbG/fPW02ArLKjq4wl1QC56sEaADCYDuz7KHI0e763weS4sSrTf6zq+CQnEGRAaVvmkhwGdbj3NZJAw0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680918; c=relaxed/simple;
	bh=cdcHOH4arkLm0zru6oCJ02VyxLBvcCTvbxkPC2+57Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFmpZfl2nfByYeJoHs7mGQWMH1i3BgLF5rxANDspy6Q+WYZ4Tfx60Bs7RYKUsz6C2lr0JdRXPvgGztpr0OnpE6af1fwNQ5S7uu8O4Fsaj8X2DXsjRycYVb1hRF1NQ6eUYBzgIS4dNrcjr+BJhGzHTaR2WgK7tfDGb/8N34JrSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qwR2GjGD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8711A1A;
	Mon, 30 Sep 2024 09:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727680824;
	bh=cdcHOH4arkLm0zru6oCJ02VyxLBvcCTvbxkPC2+57Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwR2GjGDisyXvS3FC5gFhsn8Ueel5CcCWd9dMIdd4Z5OwGc+5tqCLhshuX/tWtFAk
	 Tf8imkuL+nW0Y1cESO+6Cco6Qb31JRD9mfCs510HYV7pFtEf3Ram9eMo+rvAPNiwMy
	 NoR5qnivQxJsM/DvOQYUYCmGvXpGvdPt91A+9YSk=
Date: Mon, 30 Sep 2024 10:21:51 +0300
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
Message-ID: <20240930072151.GC31662@pendragon.ideasonboard.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
 <AS8PR04MB9080211FC5A0FFCB255C3247FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9080211FC5A0FFCB255C3247FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>

On Mon, Sep 30, 2024 at 07:08:09AM +0000, G.N. Zhou (OSS) wrote:
> On Sunday, September 29, 2024 9:44 PM, Laurent Pinchart wrote:
> > 
> > Hello,
> > 
> > This small patch series is a reaction to "[PATCH] media: nxp:
> > imx8mq-mipi-csi2: Fix CSI clocks always enabled issue" ([1]). Instead of making
> > the PM handling more complex, I think it can be greatly simplified.
> > 
> > I have only compile-tested the patches. Guoniu, could you give this a try ?
> 
> After applying the patches and test both on iMX8ULP.
> 
> For iMX8ULP, it will cause kernel dump when access CSI registers and
> system hang during do suspend/resume while streaming
> Need to add system suspend/resume handlers and call
> pm_runtime_force_suspend/resume in the handlers.
> 
> I tried to debug this issue and found pm runtime callback won't be
> called when system resume. The state of power domain won't enabled.

Thank you for testing.

I wonder if this could be caused by the CSI bridge being resumed from
system sleep before the CSI-2 receiver. Could you check if that's the
case ? If so, does the following change fix the issue ?

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 9566ff738818..c66b0621e395 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2057,9 +2057,22 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
 	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
+	struct device_link *link;
 
 	csi->src_sd = sd;
 
+	/*
+	 * Enforce suspend/resume ordering between the source (supplier) and
+	 * the CSI (consumer). The source will be suspended before and resume
+	 * after the CSI.
+	 */
+	link = device_link_add(csi->dev, sd->dev, DL_FLAG_STATELESS);
+	if (!link) {
+		dev_err(csi->dev,
+			"Failed to create device link to source %s\n", sd->name);
+		return -EINVAL;
+	}
+
 	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
 					       MEDIA_LNK_FL_IMMUTABLE);
 }

> > [1] https://lore.kernel.org/r/20240929101635.1648234-1-guoniu.zhou@oss.nxp.com
> > 
> > Laurent Pinchart (3):
> >   media: imx8mq-mipi-csi2: Drop stream stop/restart at suspend/resume
> >     time
> >   media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
> >   media: imx8mq-mipi-csi2: Drop system suspend/resume handlers
> > 
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 113 ++----------------
> >  1 file changed, 10 insertions(+), 103 deletions(-)
> > 
> > 
> > base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad

-- 
Regards,

Laurent Pinchart

