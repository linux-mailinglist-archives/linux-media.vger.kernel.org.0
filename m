Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C233B521D1E
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 16:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345212AbiEJO5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 10:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345573AbiEJO4m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 10:56:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FFE253A92
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 07:18:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98AF8B60;
        Tue, 10 May 2022 16:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652192294;
        bh=9qPJAY9pGRLTdRp0tkNidjV3eNKVj/3pF/T5FFbB53k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p6chqvEuPiHCZYhVrLGETP8sTTSVUMdQKH48JJBJQIe9U6ShijkpCiWbh9cCSKeNk
         DYd6SmGUBRw5nBWEo/iDrxnU8TfDPe9NzH4hRCmyTyMWI9pQU1gugU9GyIeVL9R6XG
         1OnEla1V/lGLCLjkqKqwRbOixF4lawlb7GnFhqOo=
Date:   Tue, 10 May 2022 17:18:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: Re: [PATCH 00/50] staging: media: imx: Prepare destaging of
 imx7-media-csi
Message-ID: <Ynp0IYFke4R3F52C@pendragon.ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
 <20220510140416.4klypvzok7ril7n7@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220510140416.4klypvzok7ril7n7@arch-thunder>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Tue, May 10, 2022 at 03:04:16PM +0100, Rui Miguel Silva wrote:
> Hi Laurent,
> Thanks for this small change :).

Thanks for your small review ;-)

> On Tue, May 10, 2022 at 02:58:09PM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series prepares the imx7-media-csi for destaging by
> > decoupling it from the helpers shared with the i.MX6 IPUv3.
> > 
> > The strategy Paul and I have followed is to import copies of helper code
> > and, refactor it within the imx7-media-csi driver, and repeat until no
> > more shared helpers are used. There is still room for refactoring and
> > simplification of the imx7-media-csi driver, but I believe it is now in
> > a state clean enough to be moved out of staging.
> 
> I agree.
> 
> > The series also includes a few fixes or improvements in supported
> > formats that are now made possible thanks to this refactoring. See
> > patches 45/50 and 46/50 for details.
> > 
> > The code size has grown as a result. This is partly offset by code in
> > the shared helpers that can be removed or simplified, but I haven't
> > starting working on that. The helpers are now used for the i.MX6 IPUv3
> > only, so I will leave this exercise to anyone who would be interested in
> > destaging that driver as well.
> > 
> > Some of the items in the TODO file related to the imx7-media-csi driver
> > have been addressed. The two remaining items are frame interval monitor
> > support and restricting the list of supported formats to the SoC
> > version. The former isn't a destaging blocker in my opinion, as the
> > feature can be added later if desired (and frame interval monitoring
> > should then be moved to the V4L2 core). I believe the latter could also
> > be addressed after destaging the driver, but in any case, this is a
> > discussion for a future destaging series (which may come as soon as this
> > one is accepted).
> > 
> > Alexander, this also could greatly simplify your "[PATCH v3 0/8]
> > imx7/imx8mm media / csi patches" series.
> 
> I went over all patches and I have 2 small remarks:
> 
> 1. Shouldn't we change the connection between imx-media objects and
>    imx7-csi also in kconfig? Since at the end of this series they are
>    completely independent. Yeah, it can be done in a follow up
>    patch on the unstaging, for me that's fine also.

I was thinking of doing it while destaging, as I found it a bit
pointless to reorganize Kconfig in staging to then immediately move the
driver out of staging, but I don't mind already handling this in staging
if preferred.

> 2. Something that caught my eye on patch 2/50. But nothing functional.

I'll reply to that patch.

> Once again many thanks for continuing investing in this code.
> for the all series (except patch 2/50):
> 
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Thank you !

> > Laurent Pinchart (48):
> >   staging: media: imx: imx7-media-csi: Initialize locks early on
> >   staging: media: imx: imx7-media-csi: Split imx_media_dev from probe()
> >   staging: media: imx: imx7-media-csi: Import notifier helpers
> >   staging: media: imx: imx7-media-csi: Drop duplicate link creation
> >   staging: media: imx: imx7-media-csi: Drop the imx_media notifier
> >   staging: media: imx: imx7-media-csi: Don't populate vdev lists
> >   staging: media: imx: imx7-media-csi: Drop unused frame_interval
> >   staging: media: imx: imx7-media-csi: Move format init to probe time
> >   staging: media: imx: imx7-media-csi: Import video device helpers
> >   staging: media: imx: imx7-media-csi: Drop legacy video device support
> >   staging: media: imx: imx7-media-csi: Drop unused controls support
> >   staging: media: imx: imx7-media-csi: Reorganize imx7_csi structure
> >   staging: media: imx: imx7-media-csi: Fold capture_priv into imx7_csi
> >   staging: media: imx: imx7-media-csi: Ensure consistent function prefix
> >   staging: media: imx: imx7-media-csi: Don't set subdev group id
> >   staging: media: imx: imx7-media-csi: Import imx_media_dev_init()
> >     helper
> >   staging: media: imx: imx7-media-csi: Embed imx_media_dev in imx7_csi
> >   staging: media: imx: imx7-media-csi: Drop imx_media_add_video_device
> >     call
> >   staging: media: imx: imx7-media-csi: Don't initialize unused fields
> >   staging: media: imx: imx7-media-csi: Inline imx_media_pipeline_pad()
> >   staging: media: imx: imx7-media-csi: Import
> >     imx_media_pipeline_set_stream()
> >   staging: media: imx: imx7-media-csi: Avoid unnecessary casts
> >   staging: media: imx: imx7-media-csi: Inline pipeline start/stop
> >   staging: media: imx: imx7-media-csi: Fold imx_media_dev into imx7_csi
> >   staging: media: imx: imx7-media-csi: Decouple from imx_media_buffer
> >   staging: media: imx: imx7-media-csi: Fold imx_media_video_dev into
> >     imx7_csi
> >   staging: media: imx: imx7-media-csi: Store imx7_csi in drv data
> >   staging: media: imx: imx7-media-csi: Decouple from imx_media_dma_buf
> >   staging: media: imx: imx7-media-csi: Decouple from shared macros
> >   staging: media: imx: imx7-media-csi: Drop error message on alloc
> >     failure
> >   staging: media: imx: imx7-media-csi: Import format helpers
> >   staging: media: imx: imx7-media-csi: Replace ipu_color_space with bool
> >     yuv field
> >   staging: media: imx: imx7-media-csi: Drop IC support from
> >     imx7_csi_try_colorimetry()
> >   staging: media: imx: imx7-media-csi: Drop IPU-only formats
> >   staging: media: imx: imx7-media-csi: Drop unsupported YUV and RGB
> >     formats
> >   staging: media: imx: imx7-media-csi: Make default formats consistent
> >   staging: media: imx: imx7-media-csi: Define macro for default mbus
> >     code
> >   staging: media: imx: imx7-media-csi: Simplify default mbus code in
> >     try_fmt
> >   staging: media: imx: imx7-media-csi: Drop YUV/RGB/BAYER format
> >     selectors
> >   staging: media: imx: imx7-media-csi: Drop unneeded imx7_csi_pixfmt
> >     fields
> >   staging: media: imx: imx7-media-csi: Inline imx7_csi_init_mbus_fmt()
> >   staging: media: imx: imx7-media-csi: Simplify default format in
> >     try_fmt
> >   staging: media: imx: imx7-media-csi: Fix list of supported formats
> >   staging: media: imx: imx7-media-csi: Add V4L2_PIX_FMT_Y14 support
> >   staging: media: imx: imx7-media-csi: Drop unneeded pixel format
> >     validation
> >   staging: media: imx: imx7-media-csi: Inline
> >     imx7_csi_enum_pixel_formats()
> >   staging: media: imx: imx7-media-csi: Drop V4L2 events support
> >   staging: media: imx: imx7-media-csi: Drop usage of shared helpers
> > 
> > Paul Elder (2):
> >   staging: media: imx: imx7-media-csi: Move misc init out of probe()
> >   staging: media: imx: imx7-media-csi: Remove imx_media_of_add_csi
> > 
> >  drivers/staging/media/imx/imx7-media-csi.c | 1370 +++++++++++++++++---
> >  1 file changed, 1172 insertions(+), 198 deletions(-)
> > 
> > 
> > base-commit: c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a

-- 
Regards,

Laurent Pinchart
