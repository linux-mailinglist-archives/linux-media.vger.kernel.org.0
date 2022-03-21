Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794294E2532
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 12:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241898AbiCUL0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 07:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238787AbiCUL0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 07:26:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865B31BA
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 04:24:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01E29291;
        Mon, 21 Mar 2022 12:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647861877;
        bh=U27FLpb3qmNa8eaS/NfXLGcdfUvgPZQ2qJaZ2n7TKq4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sjJ8n0S+8c35Lgj6dfw2LaakA4alpHy1XbZ/bkL/eM5vMQdW+G6TZiknR4xUCUZe7
         Vmu3LH46dRZrEmRkye84kKOcejhz81N3/iXlcwxtxlyYAbICL8Vowj4ADJuNy2JPR1
         pkscYGfI1cbhYBWiFGy4CYQM2fv8q+OcBRi8ChTU=
Date:   Mon, 21 Mar 2022 13:24:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jacopo Mondi <jmondi@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <YjhgY0wFp6kcS+z/@pendragon.ideasonboard.com>
References: <20220311111259.3220718-1-paul.elder@ideasonboard.com>
 <YjUHhp0lYqQG5rgs@pendragon.ideasonboard.com>
 <YjhaUbx1tskOwWZd@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YjhaUbx1tskOwWZd@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 21, 2022 at 12:58:25PM +0200, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sat, Mar 19, 2022 at 12:28:22AM +0200, Laurent Pinchart wrote:
> > > @@ -3288,6 +3256,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > >  
> > >  	/* v4l2_ctrl_lock() locks our own mutex */
> > >  
> > > +	if (!pm_runtime_get_if_in_use(&sensor->i2c_client->dev))
> > > +		return 0;
> > 
> > I'm afraid this won't work as intended :-S This function is called by
> > v4l2_ctrl_handler_setup(), itself called from ov5640_sensor_resume(). At
> > that point, runtime PM isn't flagged as in use yet, we're still in the
> > process of resuming.
> > 
> > There are a few ways around this. The simplest one may be to move the
> > v4l2_ctrl_handler_setup() call from ov5640_sensor_resume() to
> > ov5640_s_stream(). Sakari, any opinion ?
> 
> That's one way to do it, yes.
> 
> The problem is that when the s_ctrl callback is run, there's no information
> on whether it's being called from the runtime PM resume handler (which
> powers on the device) or via another path.
> 
> Changing that would require changing the callback arguments, or adding a
> new callback with that information included.

We can also add a flag in the driver-specific structure to tell if the
device is powered or not. Delaying v4l2_ctrl_handler_setup() until
.s_stream() seems easier though, but then maybe we should return early
from .s_ctrl() until streaming is started, even if the device is powered
on ?

-- 
Regards,

Laurent Pinchart
