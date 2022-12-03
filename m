Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478E2641937
	for <lists+linux-media@lfdr.de>; Sat,  3 Dec 2022 22:26:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiLCV0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Dec 2022 16:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiLCV0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Dec 2022 16:26:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2EF1A220;
        Sat,  3 Dec 2022 13:26:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 617E5993;
        Sat,  3 Dec 2022 22:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670102776;
        bh=DFQPVvstzYFU3Y8ed20ItJ6G4cAHlTelbo+853g1wy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T0wfMe3vjlmasu+Rt6dntJs18oppFTGJQ5FPEzjwlMdKtTcPLb/T0HEONClBPU7JI
         Xck99V9HmdyCbALu4/Mo9HW8mSDxFu8lPr9pxExVScHuZqIsJD/ZVUU/kZtaZNftnc
         577iXUhzMQNQHXFiPErSmemBMa0c0+mPl/wRlNk0=
Date:   Sat, 3 Dec 2022 23:26:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
> This series improves the uvc video gadget by parsing the configfs
> entries. With the configfs data, the userspace now is able to use simple
> v4l2 api calls like enum and try_format to check for valid configurations
> initially set by configfs.

I've realized that this whole series got merged, despite my multiple
attempts to explain why I think it's not a good idea. The UVC gadget
requires userspace support, and there's no point in trying to move all
these things to the kernel side. It only bloats the kernel, makes the
code more complex, more difficult to maintain, and will make UVC 1.5
support more difficult.

I'm fairly unhappy with this, it will lower my trust towards your
patches.

> Michael Grzeschik (4):
>   media: v4l: move helper functions for fractions from uvc to
>     v4l2-common
>   media: uvcvideo: move uvc_format_desc to common header
>   usb: gadget: uvc: add v4l2 enumeration api calls
>   usb: gadget: uvc: add v4l2 try_format api call
> 
>  drivers/media/usb/uvc/uvc_ctrl.c       |   1 +
>  drivers/media/usb/uvc/uvc_driver.c     | 290 +-------------------
>  drivers/media/usb/uvc/uvc_v4l2.c       |  14 +-
>  drivers/media/usb/uvc/uvcvideo.h       | 147 ----------
>  drivers/media/v4l2-core/v4l2-common.c  |  86 ++++++
>  drivers/usb/gadget/function/f_uvc.c    |  30 +++
>  drivers/usb/gadget/function/uvc.h      |   2 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 286 ++++++++++++++++++++
>  include/media/v4l2-common.h            |   4 +
>  include/media/v4l2-uvc.h               | 359 +++++++++++++++++++++++++
>  10 files changed, 776 insertions(+), 443 deletions(-)
>  create mode 100644 include/media/v4l2-uvc.h

-- 
Regards,

Laurent Pinchart
