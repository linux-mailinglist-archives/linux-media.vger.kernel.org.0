Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE1404C27F7
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 10:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiBXJUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 04:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiBXJUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 04:20:48 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59B120A97A
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 01:20:18 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id E39372004E;
        Thu, 24 Feb 2022 11:20:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1645694416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gSc/WgGeR0CwvDW1/3sfQEN83B7VmLShvff40xenAAM=;
        b=AwdNKAx07drYXl3rdPoTkM+Tux+P/eoGIndtLm4Dx5SRVR7UZ3voMNRN9AoEjBS/N30mTD
        ddH+7ddRsEH+hD3FlYvMUCrU1HCsOMXtWl9I5ivakitvn5S66dqYhDgGhZE6n3C0D+Mggg
        pH6dD70cDJk9GZYX+CtpYyFqK7ReoP4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 79ADF634C91;
        Thu, 24 Feb 2022 11:20:16 +0200 (EET)
Date:   Thu, 24 Feb 2022 11:20:16 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 18/27] media: ov5640: Implement init_cfg
Message-ID: <YhdN0FB3OfAl9qal@valkosipuli.retiisi.eu>
References: <20220223145603.121603-1-jacopo@jmondi.org>
 <20220223145603.121603-19-jacopo@jmondi.org>
 <YhaYKpI88/1k1fbE@valkosipuli.retiisi.eu>
 <20220224080834.j4yvwxyyjj22rquk@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224080834.j4yvwxyyjj22rquk@uno.localdomain>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1645694416; a=rsa-sha256; cv=none;
        b=rfiznleBLZaUK2XDK0h8vgm53U1jf2VN/Hf+kKT24ez7L9Ri4VCIw02C/tXnGhKNsd2b1a
        tM/uv/kwWBWlmDKMFoWZUzuznJDJpQmc+nTv3aZDqCAgOsQVgCAt8aCEsqHqGxI1C4hKkJ
        7LxD0utp8R2A4rnDJuMsaQZWw24ETIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1645694416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gSc/WgGeR0CwvDW1/3sfQEN83B7VmLShvff40xenAAM=;
        b=XS3mI6UgQqn9PnUKIsnR8B08xWdlL40M60SVsUTJ+tljqxjXVtwn3Oq6b1TUTvi5Le8Net
        Jt4qvYLaF955nh0d0rknBuOhkxj2v97peiGO8NDlAxo7Id+lIWkoXI6SpaggssFFTDsIpn
        geRbtcWKo57vP+UnY7HJawuubKS/wy4=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Feb 24, 2022 at 09:08:34AM +0100, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Wed, Feb 23, 2022 at 10:25:14PM +0200, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Wed, Feb 23, 2022 at 03:55:54PM +0100, Jacopo Mondi wrote:
> > > Implement the init_cfg pad operation to initialize the subdev state
> > > format to the default one.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 34 ++++++++++++++++++++++++----------
> > >  1 file changed, 24 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 6c2c76b61140..c1fc2ab1e0cf 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -408,6 +408,18 @@ static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
> > >   * over i2c.
> > >   */
> > >  /* YUV422 UYVY VGA@30fps */
> > > +
> > > +static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
> > > +	.code = MEDIA_BUS_FMT_UYVY8_2X8,
> > > +	.width = 640,
> > > +	.height = 480,
> > > +	.colorspace = V4L2_COLORSPACE_SRGB,
> > > +	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
> > > +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> > > +	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
> > > +	.field = V4L2_FIELD_NONE,
> > > +};
> > > +
> > >  static const struct reg_value ov5640_init_setting[] = {
> > >  	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> > >  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
> > > @@ -3515,6 +3527,16 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
> > >  	return ret;
> > >  }
> > >
> > > +static int ov5640_init_cfg(struct v4l2_subdev *sd,
> > > +			   struct v4l2_subdev_state *state)
> > > +{
> > > +	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_get_try_format(sd, state, 0);
> >
> > Could you run
> >
> > 	$ ./scripts/checkpatch.pl --strict --max-line-length=80
> >
> > on the entire set, and see what else is trivial to fix?
> >
> 
> I was asked the same by Laurent, and I was honestly surprised as I
> thought from our last discussions that 100 cols limit was encouraged.

At least I didn't draw that conclusion from the discussion. It was rather
that people had somewhat differing opinions what else should be documented
besides what's there right now.

> 
> Oh well, I suspect that' the price for having dropped the ball with
> "[PATCH] media: Document coding style requirements"
> 
> I'll check with 80 cols limits.

Thank you.

-- 
Sakari Ailus
