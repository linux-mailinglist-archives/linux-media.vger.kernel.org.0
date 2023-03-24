Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7B06C7BA8
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbjCXJj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjCXJjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:39:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503EA2528A;
        Fri, 24 Mar 2023 02:38:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47B83A49;
        Fri, 24 Mar 2023 10:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679650707;
        bh=46FEB6B4KYheh1/LQCXw3LlSYaHsyUENsbK2BOPTRzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Slkho+gEW7qT6IKf002F7zk1GnJCP6HKRTmE9Xq6Kn/49tAulKVDhN9FJH8mUQOMM
         2e32tnMPhZOGh9MhUr4lBHGDLEIYqfszNeuEB43c9gZj2RpI7XbEuoXHPqG5VtWP9N
         d/dRWioCJZ/BdyvnInoiVTIbFisTNlSocFbIrRVM=
Date:   Fri, 24 Mar 2023 11:38:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 0/8] usb: gadget: uvc: fix errors reported by
 v4l2-compliance
Message-ID: <20230324093834.GJ18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Thu, Mar 23, 2023 at 12:41:09PM +0100, Michael Tretter wrote:
> This series fixes various errors and warnings that are reported by
> v4l2-compliance for the v4l2 output device created by the UVC gadget.
> 
> Most notably, it changes the driver to take the initial format from the
> configfs instead of using a hard coded value that might be rejected later in
> the SET_FORMAT call. Note that user space is still responsible for negotiating
> the format with the UVC host.

I'm afraid I dislike most of this series (apart from the fix to
REQBUFS). It was a bad idea to add format handling to the driver in the
first place, and this series adds up code on top of that to please a
compliance tool but without any added value. This code should never be
exercised by userspace and will just bloat the kernel. That's not good.
I'd recommend reverting the series that add format handling if you want
to improve the UVC gadget driver.

> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Daniel Scally <dan.scally@ideasonboard.com>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: kernel@pengutronix.de
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> 
> ---
> Michael Tretter (8):
>       usb: gadget: uvc: use fourcc printk helper
>       usb: gadget: uvc: fix return code of REQBUFS
>       usb: gadget: uvc: implement s/g_output ioctl
>       usb: gadget: uvc: move video format initialization to uvc_v4l2
>       usb: gadget: uvc: initialize video format using configfs
>       usb: gadget: uvc: try harder to find a valid format
>       usb: gadget: uvc: add colorspace handling
>       usb: gadget: uvc: implement s/g_parm
> 
>  drivers/usb/gadget/function/f_uvc.c     |   2 +
>  drivers/usb/gadget/function/uvc.h       |   5 +
>  drivers/usb/gadget/function/uvc_queue.c |   6 +-
>  drivers/usb/gadget/function/uvc_v4l2.c  | 235 ++++++++++++++++++++++++++++++--
>  drivers/usb/gadget/function/uvc_v4l2.h  |   3 +
>  drivers/usb/gadget/function/uvc_video.c |   5 -
>  6 files changed, 238 insertions(+), 18 deletions(-)
> ---
> base-commit: 8be174835f07b2c106b9961c0775486d06112a3c
> change-id: 20230323-uvc-gadget-cleanup-47b1495befb9

-- 
Regards,

Laurent Pinchart
