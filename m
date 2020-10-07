Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2299A2861CD
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbgJGPHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 11:07:43 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38304 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgJGPHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 11:07:42 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 20EE23B6996
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 15:05:29 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 94543240014;
        Wed,  7 Oct 2020 15:05:02 +0000 (UTC)
Date:   Wed, 7 Oct 2020 17:09:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hugues Fruchet <hugues.fruchet@st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH] media: ov5640: fix MIPI power sequence
Message-ID: <20201007150903.473gxynjyncok247@uno.localdomain>
References: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
 <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
 <20201007150103.GN26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201007150103.GN26842@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues, Sakari,

On Wed, Oct 07, 2020 at 06:01:03PM +0300, Sakari Ailus wrote:
> Hi Hugues,
>
> On Wed, Oct 07, 2020 at 04:43:18PM +0200, Hugues Fruchet wrote:
> > fixes: b1751ae652fb ("media: i2c: ov5640: Separate out mipi configuration from s_power")
>
> Fixes: ...
>
> And preferrably before Sob line.
>
> >
> > Fix ov5640_write_reg()return value unchecked at power off.
> > Reformat code to keep register access below the register description.
>
> If there's an error, I wouldn't stop turning things off, but just proceed.
> The caller will ignore the error in that case anyway. This changes with the
> patch.

Agreed, I think it's best to continue instead of bailing out as we're
in a power-off path

>
> >
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> > Change-Id: I12db67c416c3d63eadee400a3c89aaf48c5b1469
>
> This was probably not intended to be here.
>
> > ---
> >  drivers/media/i2c/ov5640.c | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 8d0254d..f34e62e 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -1940,14 +1940,6 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
> >  {
> >  	int ret;
> >
> > -	if (!on) {
> > -		/* Reset MIPI bus settings to their default values. */
> > -		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
> > -		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
> > -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
> > -		return 0;
> > -	}
> > -
> >  	/*
> >  	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> >  	 *
> > @@ -1958,7 +1950,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
> >  	 * [3] = 0	: Power up MIPI LS Rx
> >  	 * [2] = 0	: MIPI interface disabled
> >  	 */
> > -	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> > +	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> > +			       on ? 0x40 : 0x58);
> >  	if (ret)
> >  		return ret;
> >
> > @@ -1969,7 +1962,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
> >  	 * [5] = 1	: Gate clock when 'no packets'
> >  	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
> >  	 */
> > -	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
> > +	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00,
> > +			       on ? 0x24 : 0x04);
> >  	if (ret)
> >  		return ret;
> >
> > @@ -1981,7 +1975,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
> >  	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
> >  	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
> >  	 */
> > -	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
> > +	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00,
> > +			       on ? 0x70 : 0x00);
> >  	if (ret)
> >  		return ret;
> >
>
> --
> Kind regards,
>
> Sakari Ailus
