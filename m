Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE814B9C19
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 10:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238649AbiBQJfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 04:35:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiBQJfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 04:35:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5261A3B6
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 01:34:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3ADFB61C16
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 09:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFEAC340E8;
        Thu, 17 Feb 2022 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645090498;
        bh=Nst2JMdzicDBzifozlvLC7RyZgL6cf1Hd9PsIphd4XY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sd5SkNuMIuIASNvdg59M0LbmJHUHpRN1PPJ1JJBytk3XuHaF4DpeApqhouu0NNs+t
         aEaxoY4kgb4uLc1eto9uLWpk2HJdYb1kypFfpVGzsjmVBO9vKhJsvAc9h6BnVUeM//
         ibxwJ8C4E6OA+Gt/XnoIKAm+62Ssd7v3HzbF1pd8jUZUGtaMNBBusWWZy4rxt+YlPS
         HEHQHoRKIVuEujLV7jsRz+vpOjry/8V04fO4pX+jR4iAqLBc5WG0PfNC/CJK8DXh+0
         Fq/oCpqLXcreRle9MKPlYVWq8/U5xdnSsaEFruVFC8y1il7akbBmcdyAW28Y7EzG8/
         93tJXzIUsaX0w==
Date:   Thu, 17 Feb 2022 10:34:53 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.18] Misc V4L2 driver changes
Message-ID: <20220217103453.5574b675@coco.lan>
In-Reply-To: <YguGJi0Z7cKu/Yuz@pendragon.ideasonboard.com>
References: <YguGJi0Z7cKu/Yuz@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 15 Feb 2022 12:53:26 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> The following changes since commit 68a99f6a0ebfe9101ea79ba5af1c407a5ad4f629:
> 
>   media: lirc: report ir receiver overflow (2022-01-28 19:32:50 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220215
> 
> for you to fetch changes up to 90b5eb835fef2da635c459b78c5c81525ca26d47:
> 
>   media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-15 12:52:09 +0200)
> 
> ----------------------------------------------------------------
> Misc V4L2 driver changes
> 
> ----------------------------------------------------------------
> Alexander Stein (1):
>       staging: media: imx: imx7_mipi_csis: Store colorspace in set_fmt as well
> 
> Laurent Pinchart (4):
>       media: Define MIPI CSI-2 data types in a shared header file
>       media: rcar-isp: Use mipi-csi2.h
>       media: rcar-csi2: Use mipi-csi2.h
>       media: xilinx: csi2rxss: Use mipi-csi2.h
> 


> Martin Kepplinger (2):
>       dt-binding: media: hynix,hi846: use $defs/port-base port description
>       dt-bindings: media: hynix,hi846: add link-frequencies description

Those two patches seemed to have been merged already. So, I
skipped those.

The other ones were applied.

Thanks!
Mauro


> 
> Nikita Yushchenko (1):
>       media: vsp1: mask interrupts before enabling
> 
> Paul Pawlowski (1):
>       media: uvcvideo: Add support for Apple T2-attached FaceTime HD Camera
> 
> Zhou Qingyang (1):
>       media: ti-vpe: cal: Fix a NULL pointer dereference in cal_ctx_v4l2_init_formats()
> 
>  .../devicetree/bindings/media/i2c/hynix,hi846.yaml |   6 +-
>  drivers/media/platform/rcar-isp.c                  |  32 +++++--
>  drivers/media/platform/rcar-vin/rcar-csi2.c        |  57 ++++++++---
>  drivers/media/platform/ti-vpe/cal-video.c          |   3 +
>  drivers/media/platform/vsp1/vsp1_drv.c             |  37 +++++--
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 106 +++++++++------------
>  drivers/media/usb/uvc/uvc_driver.c                 |   9 ++
>  drivers/staging/media/imx/imx7-mipi-csis.c         |   4 +
>  include/media/mipi-csi2.h                          |  45 +++++++++
>  9 files changed, 212 insertions(+), 87 deletions(-)
>  create mode 100644 include/media/mipi-csi2.h
> 



Thanks,
Mauro
