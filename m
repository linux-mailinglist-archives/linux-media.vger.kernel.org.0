Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724507A4973
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbjIRMT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241336AbjIRMT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:19:28 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159BAA4
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:19:22 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4Rq3kZ1pWFzyWs;
        Mon, 18 Sep 2023 15:19:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1695039558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UU9Kf9+Jb0KHeplo7dSJSzqzNMWykxf5NP/4iC42ZMM=;
        b=UthYg7FvY8LUDTZzU4YFSJKogIA47WlfXhhiQWE8Zs9XinjpAEj2MtVG/341eVylTj+hKN
        GYPJHsghXAvtj+7TFo77ICaokTn6WKlZE5vFKo6G8CHmZfr2+nBGFCy8MFu+MrCn+Lkp4W
        uyDaXY42WxSLAqsLG6KWB6p3rVNw5bc=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1695039558; a=rsa-sha256; cv=none;
        b=P9N1TCUsoLD96jg7sUV3biOZOthIVbPr+Gbm3GxHZ7WIbU3eB/C8GQYBntXr8e/HbqMwqM
        JLSdRwtRbd85UeVuKLl5Ir4fnqxHDfgheN+TwOczuIUB+Lxd5DqIwPofFeCNGV06ekEcSL
        2aMGdqnC1QFBJSlURMC/hM0JsHGqEU8=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1695039558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UU9Kf9+Jb0KHeplo7dSJSzqzNMWykxf5NP/4iC42ZMM=;
        b=iHUFH882DOSRdk1xehcTihlX5RQ7k0mJ4h9llj7AwPS5JUJye9JMlviAZjg4OT+Zmb+Rgq
        miiiqiBe9xM5GWP+0paeR5Yx5Dp/lbAM/XLidu9JwdESd2YNH4dlbcgSh/upA/JUukGod9
        /zgO4YZo8AZuDMaX9F94LLxHnBwbn8U=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 939CF634C93;
        Mon, 18 Sep 2023 15:19:15 +0300 (EEST)
Date:   Mon, 18 Sep 2023 12:19:15 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH] media: i2c: imx415: Replace streaming flag with runtime
 PM check
Message-ID: <ZQhAQ44CjpD/cK2d@valkosipuli.retiisi.eu>
References: <20230914174600.850-1-laurent.pinchart@ideasonboard.com>
 <20230918121007.GA9789@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918121007.GA9789@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 18, 2023 at 03:10:07PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 14, 2023 at 08:46:00PM +0300, Laurent Pinchart wrote:
> > The streaming flag in the driver private structure is used for the sole
> > purpose of gating register writes when setting a V4L2 control. This is
> > better handled by checking if the sensor is powered up using the runtime
> > PM API. Do so and drop the streaming flag.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx415.c | 32 +++++++++++++++-----------------
> >  1 file changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> > index 3f00172df3cc..346f623c1331 100644
> > --- a/drivers/media/i2c/imx415.c
> > +++ b/drivers/media/i2c/imx415.c
> > @@ -353,8 +353,6 @@ struct imx415 {
> >  
> >  	const struct imx415_clk_params *clk_params;
> >  
> > -	bool streaming;
> > -
> >  	struct v4l2_subdev subdev;
> >  	struct media_pad pad;
> >  
> > @@ -542,8 +540,9 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct v4l2_subdev_state *state;
> >  	unsigned int vmax;
> >  	unsigned int flip;
> > +	int ret;
> >  
> > -	if (!sensor->streaming)
> > +	if (!pm_runtime_get_if_in_use(sensor->dev))
> >  		return 0;
> >  
> >  	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
> > @@ -554,24 +553,33 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> >  		/* clamp the exposure value to VMAX. */
> >  		vmax = format->height + sensor->vblank->cur.val;
> >  		ctrl->val = min_t(int, ctrl->val, vmax);
> > -		return imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
> > +		ret = imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
> > +		break;
> >  
> >  	case V4L2_CID_ANALOGUE_GAIN:
> >  		/* analogue gain in 0.3 dB step size */
> >  		return imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);
> 
> This should be
> 
> 		ret = imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);
> 
> Sakari, would you like a v2, or would you prefer fixing this locally ?

I can fix it here, it's easier that way.

> 
> > +		break;
> >  
> >  	case V4L2_CID_HFLIP:
> >  	case V4L2_CID_VFLIP:
> >  		flip = (sensor->hflip->val << IMX415_HREVERSE_SHIFT) |
> >  		       (sensor->vflip->val << IMX415_VREVERSE_SHIFT);
> > -		return imx415_write(sensor, IMX415_REVERSE, flip);
> > +		ret = imx415_write(sensor, IMX415_REVERSE, flip);
> > +		break;
> >  
> >  	case V4L2_CID_TEST_PATTERN:
> > -		return imx415_set_testpattern(sensor, ctrl->val);
> > +		ret = imx415_set_testpattern(sensor, ctrl->val);
> > +		break;
> >  
> >  	default:
> > -		return -EINVAL;
> > +		ret = -EINVAL;
> > +		break;
> >  	}
> > +
> > +	pm_runtime_put(sensor->dev);
> > +
> > +	return ret;
> >  }
> >  
> >  static const struct v4l2_ctrl_ops imx415_ctrl_ops = {
> > @@ -766,8 +774,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
> >  		pm_runtime_mark_last_busy(sensor->dev);
> >  		pm_runtime_put_autosuspend(sensor->dev);
> >  
> > -		sensor->streaming = false;
> > -
> >  		goto unlock;
> >  	}
> >  
> > @@ -779,13 +785,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
> >  	if (ret)
> >  		goto err_pm;
> >  
> > -	/*
> > -	 * Set streaming to true to ensure __v4l2_ctrl_handler_setup() will set
> > -	 * the controls. The flag is reset to false further down if an error
> > -	 * occurs.
> > -	 */
> > -	sensor->streaming = true;
> > -
> >  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls);
> >  	if (ret < 0)
> >  		goto err_pm;
> > @@ -807,7 +806,6 @@ static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
> >  	 * likely has no other chance to recover.
> >  	 */
> >  	pm_runtime_put_sync(sensor->dev);
> > -	sensor->streaming = false;
> >  
> >  	goto unlock;
> >  }
> > 
> > base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
