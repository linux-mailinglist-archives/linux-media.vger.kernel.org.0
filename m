Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D23F44BF
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 11:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731753AbfKHKi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 05:38:28 -0500
Received: from mga05.intel.com ([192.55.52.43]:64124 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbfKHKi2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 05:38:28 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 02:38:27 -0800
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; 
   d="scan'208";a="213221713"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 02:38:25 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C36A320728; Fri,  8 Nov 2019 12:38:23 +0200 (EET)
Date:   Fri, 8 Nov 2019 12:38:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 11/15] media: tvp5150: add s_power callback
Message-ID: <20191108103823.GG18424@paasikivi.fi.intel.com>
References: <20190930093900.16524-1-m.felsch@pengutronix.de>
 <20190930093900.16524-12-m.felsch@pengutronix.de>
 <20191024115905.GB3966@mara.localdomain>
 <20191108102502.6bzhzip7x3qsidem@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108102502.6bzhzip7x3qsidem@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Fri, Nov 08, 2019 at 11:25:02AM +0100, Marco Felsch wrote:
> Hi Sakari,
> 
> On 19-10-24 14:59, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Mon, Sep 30, 2019 at 11:38:56AM +0200, Marco Felsch wrote:
> > > Don't en-/disable the interrupts during s_stream because someone can
> > > disable the stream but wants to get informed if the stream is locked
> > > again. So keep the interrupts enabled the whole time the pipeline is
> > > opened.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/media/i2c/tvp5150.c | 23 +++++++++++++++++------
> > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> > > index dda9f0a2995f..4afe2093b950 100644
> > > --- a/drivers/media/i2c/tvp5150.c
> > > +++ b/drivers/media/i2c/tvp5150.c
> > > @@ -1356,11 +1356,26 @@ static const struct media_entity_operations tvp5150_sd_media_ops = {
> > >  /****************************************************************************
> > >  			I2C Command
> > >   ****************************************************************************/
> > > +static int tvp5150_s_power(struct  v4l2_subdev *sd, int on)
> > > +{
> > > +	struct tvp5150 *decoder = to_tvp5150(sd);
> > > +	unsigned int val = 0;
> > > +
> > > +	if (on)
> > > +		val = TVP5150_INT_A_LOCK;
> > > +
> > > +	if (decoder->irq)
> > > +		/* Enable / Disable lock interrupt */
> > > +		regmap_update_bits(decoder->regmap, TVP5150_INT_ENABLE_REG_A,
> > > +				   TVP5150_INT_A_LOCK, val);
> > 
> > Could you use runtime PM to do this instead?
> 
> You mean I should add a simple runtime_resume/suspend() which is called
> during v4l2_subdev_internal_ops.open/close()? Of course I can do that
> but why?

There's no reason to use generic mechanisms that have been around for ten
or so years. Eventually the s_power() op will be dropped.

-- 
Sakari Ailus
