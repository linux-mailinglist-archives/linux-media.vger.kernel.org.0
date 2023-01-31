Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA332682A69
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 11:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjAaKYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 05:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbjAaKYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 05:24:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225E26E91
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 02:24:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61077D6;
        Tue, 31 Jan 2023 11:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675160663;
        bh=FXAA8l8msQYFmLf6WnuhicgkGEPKamEWb+PD2pNW8dw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hDz2uOtdGfyNVkGfm1SWcMx+FfX3dUOZkVqj7XVwbh/xNEPP5GMsvdZIq0TNYkXtk
         zz4+CM2i8bF1N02gwEZybDDn714SW2WNRBIpYBMEt2KTAU7v5UAhGEcqh17yMWCzuc
         D53GbdNKcjTuE7PN+Pdh1lJqDqD47ZK+CxL3wg4U=
Date:   Tue, 31 Jan 2023 12:24:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v2 0/8] media: nxp: imx7-media-csi: Move to subdev active
 state
Message-ID: <Y9jsVN23z+vGr2pW@pendragon.ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
 <3c10605acf31dd10f4e41d3c1ce881fcc40e32ef.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c10605acf31dd10f4e41d3c1ce881fcc40e32ef.camel@puri.sm>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, Jan 31, 2023 at 11:17:46AM +0100, Martin Kepplinger wrote:
> Am Sonntag, dem 29.01.2023 um 04:34 +0200 schrieb Laurent Pinchart:
> > Hello,
> > 
> > This small series moves the imx7-mipi-csi driver to use the subdev
> > active state. Patches 1/8 to 7/8 are small preparatory cleanups, with
> > the main change in 8/8.
> > 
> > Compared to v1, I've now successfully tested the series on an
> > i.MX8MM.
> > The issues reported by Adam have been resolved by adding patch 7/8
> > and
> > fixing a problem in 8/8.
> > 
> > Laurent Pinchart (8):
> >   media: imx: imx7-media-csi: Drop imx7_csi.cc field
> >   media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
> >   media: imx: imx7-media-csi: Drop unneeded check when starting
> >     streaming
> >   media: imx: imx7-media-csi: Drop unneeded src_sd check
> >   media: imx: imx7-media-csi: Drop unneeded pad checks
> >   media: imx: imx7-media-csi: Cleanup errors in
> >     imx7_csi_async_register()
> >   media: imx: imx7-media-csi: Zero format struct before calling
> >     .get_fmt()
> >   media: imx: imx7-media-csi: Use V4L2 subdev active state
> > 
> >  drivers/media/platform/nxp/imx7-media-csi.c | 235 ++++++------------
> > --
> >  1 file changed, 70 insertions(+), 165 deletions(-)
> > 
> 
> hi Laurent, what tree did you base this on? onto v6.2-rc6 I have a
> change missing: in imx7_csi_video_validate_fmt(), before calling
> v4l2_subdev_call_state_active(), there's fmt_src.pad and fmt_src.which
> assigned. I don't have that.

The patches are based on top of the master branch fo
git://linuxtv.org/media_stage.git. I've pushed my branches to
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (named
next/media/imx-csis and next/media/imx-csi).

-- 
Regards,

Laurent Pinchart
