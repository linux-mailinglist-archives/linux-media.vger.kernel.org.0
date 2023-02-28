Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B080D6A62C3
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 23:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjB1Wqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 17:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjB1Wqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 17:46:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8563D31E15
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 14:46:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (153.162-64-87.adsl-dyn.isp.belgacom.be [87.64.162.153])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52E1E6F0;
        Tue, 28 Feb 2023 23:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677624395;
        bh=kyB9j92Sh4eA6au+OR+tzE3xb1/LhEHC6PMCIEKiVeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wVxOiH3FEENoLjwE75vPb5DXSvZxuLbYMV080bGd4SbTRsnW/qkezPfaeHCRrnfhk
         DJLwUTdswFbbLFavWIqITPponuJmGkrZ4JQ+OFSQGTVfkLlb+II5vl5nuVjwn4NbSR
         hB3H8d+DPv4lGaYFiiZ8vTu5QSYS2dNufBDQJAPc=
Date:   Wed, 1 Mar 2023 00:46:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: Re: [RFC] Remove support for the video overlay interface
Message-ID: <Y/6ESfbtnbK5nCNJ@pendragon.ideasonboard.com>
References: <5f1ff21e-557d-0d80-293b-2ecccb9d5e2a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f1ff21e-557d-0d80-293b-2ecccb9d5e2a@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 28, 2023 at 05:52:22PM +0100, Hans Verkuil wrote:
> While working on the vb2 conversion of the saa7146 driver I dug a bit deeper into
> the video capture overlay support of that driver.
> 
> For more info of that feature see:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-overlay.html
> 
> Specifically, video overlay support relies on userspace passing the address of
> the framebuffer to the driver with VIDIOC_S_FBUF. The PCI driver can then DMA
> the captured frame straight into the framebuffer. This was useful 20 years ago,
> but today not so much.
> 
> Typically userspace would get the address from the /dev/fbX device using the
> FBIOGET_FSCREENINFO ioctl.
> 
> But drm_fb_helper.c sets the smem_start field explicitly to 0 unless:
> 
> 1) CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is set, and
> 2) CONFIG_EXPERT is set, and
> 3) set the drm_kms_helper module parameter drm_leak_fbdev_smem to 1.
> 
> Actually, even with all that set, I *still* get a 0 value. I probably
> missed something.
> 
> In any case, I think destructive overlay support is effectively dead and it
> should be removed from the v4l2 drivers.

RIP :-)

> This would affect saa7146, bttv, saa7134 and vivid.
> 
> Output overlay support is still around (ivtv, omap_vout). There is also a
> single driver with a non-destructive capture overlay:
> drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> 
> No idea what that's doing exactly in the bcm2835 driver.

I'm not sure either, but not that that driver is only used with the
legacy Raspberry Pi camera stack, not the libcamera-based stack.

> Removing support for this has some nice related benefits: the overlay
> window supports clipping (either a list of rectangles or a bitmap), and
> that would also disappear. That makes the compat32 code quite a bit easier.
> A fair amount of code is dedicated to that.
> 
> So, I propose to drop destructive overlay support from saa7146, bttv and
> saa7134 and vivid for the 6.4 kernel. In addition, support for
> V4L2_FBUF_CAP_LIST_CLIPPING and V4L2_FBUF_CAP_BITMAP_CLIPPING is also
> dropped. This only affects the vivid driver which is the only driver that
> supports this for output overlays.
> 
> Any objections?

None from me.

-- 
Regards,

Laurent Pinchart
