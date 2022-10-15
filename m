Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081C45FFC96
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 01:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiJOXXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Oct 2022 19:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJOXXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Oct 2022 19:23:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB5C3ECEF;
        Sat, 15 Oct 2022 16:23:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4A51491;
        Sun, 16 Oct 2022 01:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665876217;
        bh=W5d/TYSZnCg/jUE3T7Y+rbO6nluH0VRHje+Oo84Zkzc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aNgBMhLduKhxpQgFlSQeGqwZOzJVaxM0wx5p4FrEXla/bBbCk4n1U2LV0WMafgMBp
         naj2Mw4xzjstd023BwOr9dR/D1WQbbQgGaki4mcujRqtvlmcQy13hzScx3ZKZfbXYn
         T0DK0cfSqi9Kq7khox9/rNC2YqZeJIw9nezUpBXI=
Date:   Sun, 16 Oct 2022 02:23:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Shawn Tu <shawnx.tu@intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/5] media: i2c: ov5645: Return zero for s_stream(0)
Message-ID: <Y0tA4cZBdwCOkaOs@pendragon.ideasonboard.com>
References: <20221014183459.181567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221014183459.181567-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y0pSYfw+VDxXv85b@pendragon.ideasonboard.com>
 <Y0snkMEp9WqGtzom@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0snkMEp9WqGtzom@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Oct 15, 2022 at 09:35:12PM +0000, Sakari Ailus wrote:
> On Sat, Oct 15, 2022 at 09:25:37AM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 14, 2022 at 07:34:58PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > 
> > > Always return zero while stopping the stream as the caller will ignore the
> > > return value.
> > > 
> > > This patch drops checking the return value of ov5645_write_reg() and
> > > continues further in the code path while stopping stream. The user anyway
> > > gets an error message in case ov5645_write_reg() fails.
> > 
> > Continuing all the way to pm_runtime_put() is fine, but I don't think
> > the function should return 0. It's not up to the driver to decide if a
> > failure would be useful to signal to the caller or not.
> 
> If the function returns an error when disabling streaming, what is the
> expected power state of the device after this?

That's up to us to decide :-)

> The contract between the caller and the callee is that the state is not
> changed if there is an error.

For most APIs, but that's not universal.

> This is a special case as very few callers
> check the return value for streamoff operation and those that do generally
> just print something. I've never seen a caller trying to prevent streaming
> off in this case, for instance.

I think the stream off call should proceed and try to power off the
device even if an error occurs along the way, i.e. it shouldn't return
upon the first detected error.

> Of course we could document that streaming off always counts as succeeded
> (e.g. decreasing device's runtime PM usage_count) while it could return an
> informational error code. But I wonder if anyone would ever benefit from
> that somehow. :-)

I think it could be useful to propagate errors up to inform the user
that something wrong happened. That would involve fixing lots of drivers
along the call chain though, so there's no urgency for the ov5645 to do
so, but isn't it better to propagate the error code instead of hiding
the issue ?

> > > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v1->v2
> > > * New patch
> > > ---
> > >  drivers/media/i2c/ov5645.c | 11 ++++-------
> > >  1 file changed, 4 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > index a0b9d0c43b78..b3825294aaf1 100644
> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -995,14 +995,11 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
> > >  		if (ret < 0)
> > >  			goto err_rpm_put;
> > >  	} else {
> > > -		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
> > > -		if (ret < 0)
> > > -			return ret;
> > > +		ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
> > > +
> > > +		ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> > > +				 OV5645_SYSTEM_CTRL0_STOP);
> > >  
> > > -		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> > > -				       OV5645_SYSTEM_CTRL0_STOP);
> > > -		if (ret < 0)
> > > -			return ret;
> > >  		pm_runtime_put(ov5645->dev);
> > >  	}
> > >  

-- 
Regards,

Laurent Pinchart
