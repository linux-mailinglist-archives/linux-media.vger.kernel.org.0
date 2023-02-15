Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6F1697B6F
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 13:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjBOMGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 07:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjBOMGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 07:06:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170A53866F
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 04:05:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9443810B;
        Wed, 15 Feb 2023 13:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676462729;
        bh=JorAEjOOp+7x6X8Q7CQsEXBwrOb8CrNX5vlVjHtyL/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=guvQEuTxEs2+3nMoWrBvnfR2wCYBub6NOyI7yXSQ9geSRkEJ0mdqr8dOG+RTfc6el
         p2z0R8RI67s0YVCC5y0yIDM3uPVGC98qjxQ+PmAvxw82cDPVSgb7zroF1hWw7YvOx2
         x1jW3XOiIRS9PYW4mTeUAXtmz0XoTSqr1mZPx0PQ=
Date:   Wed, 15 Feb 2023 14:05:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: NULL pointer dereference in imx-mipi-csis driver when starting
 stream
Message-ID: <Y+zKibHcez8or6nS@pendragon.ideasonboard.com>
References: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
 <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 15, 2023 at 12:53:56PM +0100, Frieder Schrempf wrote:
> On 14.02.23 17:47, Frieder Schrempf wrote:
> > Hi everyone,
> > 
> > after solving the previous devicetree and driver issues with the media
> > pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
> > now try to get an image from the sensor and run into the next problem.
> > 
> > Below you can find the commands I use and the output I'm getting. Maybe
> > someone can see straight away what's wrong or at least can make a guess
> > before I start diving into the code. ;)
> > 
> > By the way: This happens on v6.1.11 and 6.2-rc8.
> 
> So it looks like there are several problems (again):
> 
> First I missed to enable the link between the imx219 and the imx-mipi-csis:
> 
> media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"
> 
> And the imx-mipi-csis driver is missing a check for the missing source
> link which caused the exception. I currently have this applied and will
> send this as formal patch later:
> 
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct
> mipi_csis_device *csis,
>         s64 link_freq;
>         u32 lane_rate;
> 
> +       if (!csis->src_sd) {
> +               dev_err(csis->dev, "Missing source link\n");
> +               return -EINVAL;
> +       }
> +
>         /* Calculate the line rate from the pixel rate. */
>         link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
>                                        csis_fmt->width,

The pipeline is not correctly configured, and that should have been
caught earlier as both pads are created with the
MEDIA_PAD_FL_MUST_CONNECT flag. The __media_pipeline_start() function
should have return an error. Could you try to check why that didn't
happen ?

> Now with this resolved, I get:
> 
> v4l2-ctl -d /dev/video0
> --set-fmt-video=width=640,height=480,pixelformat=RG10 --stream-mmap
> [  574.758110] imx7-csi 32e20000.csi: pipeline start failed with -32
>                 VIDIOC_STREAMON returned -1 (Broken pipe)
> 
> So still not there, but a bit closer ;)
> Probably I'm doing something wrong when setting up the format, etc.

Quite likely :-) Have you configured formats on all subdevs through the
pipeline with media-ctl ?

-- 
Regards,

Laurent Pinchart
