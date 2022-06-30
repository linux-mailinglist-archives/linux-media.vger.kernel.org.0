Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9D7560DE4
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 02:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbiF3ARo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 20:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiF3ARl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 20:17:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DDC313B8
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 17:17:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95A9159D;
        Thu, 30 Jun 2022 02:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656548258;
        bh=YFlT+vJnAfVlpSq2bEq9DE6W9XD3i+IN6IPf8K6iaHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tz66w2GiXU/s2LG4MNDQUttH+4vUsi1UvsB9FFxRO2rJrUu8bR4E8S/gREMBoASEd
         zH9c8hNVHdGxRy9OESCiI8CpcF3k7jwoRJn8aK8N9KmDaQcAHkS3dMP8B+xETSYo1t
         w7LlP9VZmETs3FHyBQRCRLSfuboJiV+usNJ5COM4=
Date:   Thu, 30 Jun 2022 03:17:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH 3/7] media: vivid: Add support for the new YUVA and YUVX
 formats
Message-ID: <Yrzrjp1wBaPPsXob@pendragon.ideasonboard.com>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-4-laurent.pinchart@ideasonboard.com>
 <c0568b04-7474-c30f-54ed-20109d8c3730@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0568b04-7474-c30f-54ed-20109d8c3730@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 29, 2022 at 03:54:43PM +0200, Hans Verkuil wrote:
> On 16/06/2022 20:36, Laurent Pinchart wrote:
> > Extend vivid to support the newly added YUVA and YUVX pixel formats
> > through the TPG.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Note that v4l-utils should receive a patch adding support for these two
> new formats, esp. since the tpg and vivid uses them.
> 
> Basically just grep for V4L2_PIX_FMT_VUYX/A32 and add support for these
> two new formats.

This requires syncing with the kernel headers. What's the procedure
there, should I wait until the kernel patches get merged in a released
kernel first ?

> > ---
> >  .../media/test-drivers/vivid/vivid-vid-common.c   | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> > index 19701fe72030..38d788b5cf19 100644
> > --- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
> > +++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> > @@ -198,6 +198,21 @@ struct vivid_fmt vivid_formats[] = {
> >  		.planes   = 1,
> >  		.buffers = 1,
> >  	},
> > +	{
> > +		.fourcc   = V4L2_PIX_FMT_YUVA32,
> > +		.vdownsampling = { 1 },
> > +		.bit_depth = { 32 },
> > +		.planes   = 1,
> > +		.buffers = 1,
> > +		.alpha_mask = 0xff000000,
> > +	},
> > +	{
> > +		.fourcc   = V4L2_PIX_FMT_YUVX32,
> > +		.vdownsampling = { 1 },
> > +		.bit_depth = { 32 },
> > +		.planes   = 1,
> > +		.buffers = 1,
> > +	},
> >  	{
> >  		.fourcc   = V4L2_PIX_FMT_GREY,
> >  		.vdownsampling = { 1 },

-- 
Regards,

Laurent Pinchart
