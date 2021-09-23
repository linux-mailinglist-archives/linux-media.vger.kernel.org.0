Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288B141616F
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 16:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241681AbhIWOwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 10:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241501AbhIWOwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 10:52:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEB2C061574
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 07:50:41 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mTQ3c-0003Uh-1S; Thu, 23 Sep 2021 16:50:40 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mTQ3b-0002Ru-Kk; Thu, 23 Sep 2021 16:50:39 +0200
Date:   Thu, 23 Sep 2021 16:50:39 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v4 1/3] media: imx6-mipi-csi2: use pre_streamon callback
 to set sensor into LP11
Message-ID: <20210923145039.GD30905@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, kernel@pengutronix.de
References: <20210923105618.365513-1-m.tretter@pengutronix.de>
 <20210923105618.365513-2-m.tretter@pengutronix.de>
 <b26ba662abc999394a7381d4d412fc28fdf6aa39.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b26ba662abc999394a7381d4d412fc28fdf6aa39.camel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:46:04 up 217 days, 18:09, 114 users,  load average: 0.26, 0.24,
 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 23 Sep 2021 16:37:31 +0200, Philipp Zabel wrote:
> On Thu, 2021-09-23 at 12:56 +0200, Michael Tretter wrote:
> > Step 5 expects that the sensor is in LP11 mode. Use the new
> > pre_streamon callback to signal the sensor that it should switch into
> > LP11.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Changelog:
> > 
> > v4:
> > 
> > - new patch
> > ---
> >  drivers/staging/media/imx/imx6-mipi-csi2.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > index 9de0ebd439dc..4f19e2bce4bb 100644
> > --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> > +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > @@ -382,13 +382,17 @@ static int csi2_start(struct csi2_dev *csi2)
> >  	csi2_enable(csi2, true);
> >  
> >  	/* Step 5 */
> > +	ret = v4l2_subdev_call(csi2->src_sd, video, pre_streamon,
> > +			       V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP);
> > +	if (ret)
> > +		goto err_assert_reset;
> 
> I think this should check for (ret && ret != -ENOIOCTLCMD) to avoid
> breaking drivers that are still missing pre_streamon implementation.

Thanks. You are correct. I will wait for further comments on the other patches
of the series and fix it in the next version.

Michael
