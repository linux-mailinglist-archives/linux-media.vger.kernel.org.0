Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42907A3364
	for <lists+linux-media@lfdr.de>; Sun, 17 Sep 2023 01:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbjIPXfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Sep 2023 19:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjIPXfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Sep 2023 19:35:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD05CD1
        for <linux-media@vger.kernel.org>; Sat, 16 Sep 2023 16:35:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C90EFA2;
        Sun, 17 Sep 2023 01:33:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694907212;
        bh=jmFnUXNrm78Q+ovYQA3lkPTWT9epL6nYMUcodoq04m8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aQ/k1cYtw8duvTkkNGl8FxlGG9d6Ii5kTKEp+kegDpNtrsLATldEphNPoPaHI6Ump
         J0D7f9gR+uLbFWd+BkAdIObn7Nk/pCHtcPH1P+5oj8q5HJaBNd05t90xYEJ/OY5SLO
         bBr1oxFkHxfe187g3/siNKfJFh1ICMtTC3cyoupg=
Date:   Sun, 17 Sep 2023 02:35:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for onsemi MT9M114 camera
 sensor
Message-ID: <20230916233520.GC8524@pendragon.ideasonboard.com>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-3-laurent.pinchart@ideasonboard.com>
 <20220513102716.q4ugg7uvyq4fzkkp@uno.localdomain>
 <20220614140216.d5jzwn7cutdflixp@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614140216.d5jzwn7cutdflixp@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 14, 2022 at 04:02:16PM +0200, Jacopo Mondi wrote:
> Hi Laurent,
>    one more comment, mostly for the record if anyone else will
> encounter the same problem I found
> 
> On Fri, May 13, 2022 at 12:27:16PM +0200, Jacopo Mondi wrote:
> > Hi Laurent,
> 
> [snip]
> 
> > > +#define MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_AVERAGE		(2 << 8)
> 
> The version of the datasheet I have documents this bit as "RESERVED"

Indeed, so does mine. I'll drop it.

> [snip]
> 
> > > +
> > > +static int mt9m114_configure(struct mt9m114 *sensor)
> > > +{
> > > +	u32 value;
> > > +	int ret = 0;
> > > +
> > > +	/*
> > > +	 * Pixel array crop and binning. The CAM_SENSOR_CFG_CPIPE_LAST_ROW
> > > +	 * register isn't clearly documented, but is always set to the number
> > > +	 * of output rows minus 4 in all example sensor modes.
> > > +	 */
> > > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_X_ADDR_START,
> > > +		      sensor->pa.crop.left, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_Y_ADDR_START,
> > > +		      sensor->pa.crop.top, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_X_ADDR_END,
> > > +		      sensor->pa.crop.width + sensor->pa.crop.left - 1, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_Y_ADDR_END,
> > > +		      sensor->pa.crop.height + sensor->pa.crop.top - 1, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CFG_CPIPE_LAST_ROW,
> > > +		      sensor->pa.format.height - 4 - 1, &ret);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = mt9m114_read(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> > > +			   &value);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	value &= ~(MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_MASK |
> > > +		   MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_MASK);
> > > +
> > > +	if (sensor->pa.crop.width != sensor->pa.format.width)
> > > +		value |= MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_SUMMING;
> > > +	if (sensor->pa.crop.height != sensor->pa.format.height)
> > > +		value |= MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_SUMMING;
> 
> While applying 2x2 subsampling, I found SUMMING to mangle the color
> output possibly because the gains should be adjusted accordingly to
> the fact the SUMMING:
> "will add the charge or voltage values of the neighboring pixels
> together"
> 
> I have found the combination that works better for me out of the box
> to be:
> 
> 	if (sensor->pa.crop.width != sensor->pa.format.width)
> 		value |= MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_AVERAGE;
> 	if (sensor->pa.crop.height != sensor->pa.format.height)
> 		value |= MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_SKIPPING;
> 
> Have you tested 2x2 binning with CSI-2 ?

I don't think I have. I'll give it a try.

> > > +
> > > +	mt9m114_write(sensor, MT9M114_CAM_SENSOR_CONTROL_READ_MODE, value,
> > > +		      &ret);
> > > +
> > > +	/*
> > > +	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
> > > +	 * and top coordinates to compensate for the lines and columns removed
> > > +	 * by demosaicing that are taken into account in the crop rectangle but
> > > +	 * not in the hardware.
> > > +	 */
> > > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_XOFFSET,
> > > +		      sensor->ifp.crop.left - 4, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_YOFFSET,
> > > +		      sensor->ifp.crop.top - 4, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_WIDTH,
> > > +		      sensor->ifp.crop.width, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_CROP_WINDOW_HEIGHT,
> > > +		      sensor->ifp.crop.height, &ret);
> > > +
> > > +	mt9m114_write(sensor, MT9M114_CAM_OUTPUT_WIDTH,
> > > +		      sensor->ifp.compose.width, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_OUTPUT_HEIGHT,
> > > +		      sensor->ifp.compose.height, &ret);
> > > +
> > > +	/* AWB and AE windows, use the full frame. */
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XSTART, 0, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YSTART, 0, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XEND,
> > > +		      sensor->ifp.compose.width - 1, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YEND,
> > > +		      sensor->ifp.compose.height - 1, &ret);
> > > +
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XSTART,
> > > +		      0, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YSTART,
> > > +		      0, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XEND,
> > > +		      sensor->ifp.compose.width / 5 - 1, &ret);
> > > +	mt9m114_write(sensor, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YEND,
> > > +		      sensor->ifp.compose.height / 5 - 1, &ret);
> > > +
> > > +	mt9m114_write(sensor, MT9M114_CAM_CROP_CROPMODE,
> > > +		      MT9M114_CAM_CROP_MODE_AWB_AUTO_CROP_EN |
> > > +		      MT9M114_CAM_CROP_MODE_AE_AUTO_CROP_EN, &ret);
> > > +
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	/* Set the media bus code. */
> > > +	ret = mt9m114_read(sensor, MT9M114_CAM_OUTPUT_FORMAT, &value);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	value &= ~(MT9M114_CAM_OUTPUT_FORMAT_RGB_FORMAT_MASK |
> > > +		   MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_MASK |
> > > +		   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
> > > +		   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
> > > +		   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
> > > +	value |= sensor->ifp.info->output_format;
> > > +
> > > +	mt9m114_write(sensor, MT9M114_CAM_OUTPUT_FORMAT, value, &ret);
> > > +	return ret;
> > > +}

[snip]

-- 
Regards,

Laurent Pinchart
