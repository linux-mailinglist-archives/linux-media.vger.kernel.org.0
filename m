Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6021E3C801D
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 10:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238542AbhGNIdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 04:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238482AbhGNIdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 04:33:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462EDC06175F;
        Wed, 14 Jul 2021 01:31:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB718CC;
        Wed, 14 Jul 2021 10:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626251459;
        bh=poXnfdyvgTHaupRhHBaZrhYV0sx0V+FdC5sEV/PQgAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nNK9flxhZz5LIw4BqIebzp6118WhoNkdMDxCD9eUg/ezqCZWuMsDoon15HSp+Hbv7
         WCrRpEeyO7AgI/KBd3kpi+6zGDFOwydGybBmT2ECRjU62aEkQzaC2mmDRJ8S6Bv/OE
         +mXPSZpZQZzd7t9F8ZujQ9bK2NEq1/ry/7uTNOM0=
Date:   Wed, 14 Jul 2021 11:30:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     m.felsch@pengutronix.de, robh@kernel.org,
        devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mchehab@kernel.org,
        phone-devel@vger.kernel.org, shawnguo@kernel.org,
        slongerbeam@gmail.com
Subject: Re: [PATCH v5 2/3] media: imx: add a driver for i.MX8MQ mipi csi rx
 phy and controller
Message-ID: <YO6gwz7OfUAgoAMa@pendragon.ideasonboard.com>
References: <20210618095753.114557-1-martin.kepplinger@puri.sm>
 <20210618095753.114557-3-martin.kepplinger@puri.sm>
 <YOy5uH6bSzRjO/f8@pendragon.ideasonboard.com>
 <78072a196076789745b5481e26cfb45862e935ed.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78072a196076789745b5481e26cfb45862e935ed.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Wed, Jul 14, 2021 at 08:41:58AM +0200, Martin Kepplinger wrote:
> Am Dienstag, dem 13.07.2021 um 00:52 +0300 schrieb Laurent Pinchart:
> > Hi Martin,
> > 
> > Thank you for the patch.
> 
> thank you for reviewing!
> 
> > On Fri, Jun 18, 2021 at 11:57:52AM +0200, Martin Kepplinger wrote:
> > > Add a driver to support the i.MX8MQ MIPI CSI receiver. The hardware
> > > side
> > > is based on
> > >  
> > > https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.70_2.3.0
> > > 
> > > It's built as part of VIDEO_IMX7_CSI because that's documented to
> > > support
> > > i.MX8M platforms. This driver adds i.MX8MQ support where currently
> > > only the
> > > i.MX8MM platform has been supported.
> > 
> > Overall this is really nice work. I have quite a few review comments,
> > but hopefully nothing that should be difficult to handle.
> 
> I think so too but right now I have one question:
> 
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > ---
> > >  drivers/staging/media/imx/Makefile           |   1 +
> > >  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 963 +++++++++++++++++++
> > >  2 files changed, 964 insertions(+)
> > >  create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c

[snip]

> > > +static int imx8mq_mipi_csi_pm_suspend(struct device *dev, bool runtime)
> > > +{
> > > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +       struct csi_state *state = mipi_sd_to_csi2_state(sd);
> > > +       int ret = 0;
> > > +
> > > +       mutex_lock(&state->lock);
> > > +
> > > +       if (state->state & ST_POWERED) {
> > > +               imx8mq_mipi_csi_stop_stream(state);
> > > +               imx8mq_mipi_csi_clk_disable(state);
> > > +               state->state &= ~ST_POWERED;
> > > +               if (!runtime)
> > > +                       state->state |= ST_SUSPENDED;
> > > +       }
> > > +
> > > +       mutex_unlock(&state->lock);
> > > +
> > > +       ret = icc_set_bw(state->icc_path, 0, 0);
> > > +       if (ret)
> > > +               dev_err(dev, "icc_set_bw failed with %d\n", ret);
> > > +
> > > +       return ret ? -EAGAIN : 0;
> > > +}
> > > +
> > > +static int imx8mq_mipi_csi_pm_resume(struct device *dev, bool runtime)
> > > +{
> > > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +       struct csi_state *state = mipi_sd_to_csi2_state(sd);
> > > +       int ret = 0;
> > > +
> > > +       ret = icc_set_bw(state->icc_path, 0, state->icc_path_bw);
> > > +       if (ret) {
> > > +               dev_err(dev, "icc_set_bw failed with %d\n", ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       mutex_lock(&state->lock);
> > > +
> > > +       if (!runtime && !(state->state & ST_SUSPENDED))
> > > +               goto unlock;
> > > +
> > > +       if (!(state->state & ST_POWERED)) {
> > > +               state->state |= ST_POWERED;
> > > +               ret = imx8mq_mipi_csi_clk_enable(state);
> > 
> > Enabling the clocks in the PM resume handler is correct, but they should
> > also be disabled in the PM suspend handler.
> 
> imx8mq_mipi_csi_clk_disable() is called in suspend(). I don't know what
> you mean here.

I wonder what I was thinking... You can ignore this comment.

However, imx8mq_mipi_csi_clk_disable() is also called in the error path
of the probe function and in the remove function. I don't think this is
right.

-- 
Regards,

Laurent Pinchart
