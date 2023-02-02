Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E3A68899A
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 23:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbjBBWQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 17:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjBBWQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 17:16:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6364E79604
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 14:16:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC0BF505;
        Thu,  2 Feb 2023 23:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675376166;
        bh=x+2fzmSaGM2vmU5i9CbaWzKrqpwNkXBXtj6fpsfxBpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fvANd+w7+bMgconKx7JSMROebLrdtrw82Gn0rn5MDtGoZN9ab0RdjsODa2VejH/9n
         RsrhmYZfnWisrKr6X8F4LDuMDuyZq+93GV6NsyMH5Uk/3kIOaNM6kAFoKO4Nqe8dnM
         h6zrt1lIu+YrBQEBARd7GIBDu73ZNLHSzKtpPGyI=
Date:   Fri, 3 Feb 2023 00:16:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/11] imx290: Minor fixes, support for alternate INCK,
 and more ctrls
Message-ID: <Y9w2IxdY9M1ChmnS@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Jan 31, 2023 at 07:20:05PM +0000, Dave Stevenson wrote:
> Hi All
> 
> This is a small patch set that fixes a number of issues, adds in support
> for the alternate input clock frequency option, and expands the control support
> for flips and VBLANK/HBLANK.
> 
> My source tree has the 2 patches I've just sent for mono support first, but I
> believe the two series should apply in either order.

Thank you for taking the time to upstream these, much appreciated. I'll
give the series a try with my IMX327, but I'm afraid it will have to
wait until next week after I come back from the FOSDEM.

> Dave Stevenson (11):
>   media: i2c: imx290: Match kernel coding style on whitespace
>   media: i2c: imx290: Set the colorspace fields in the format
>   media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
>   media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
>   media: i2c: imx290: Support 60fps in 2 lane operation
>   media: i2c: imx290: Use CSI timings as per datasheet
>   media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
>   media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
>   media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
>   media: i2c: imx290: Add support for 74.25MHz external clock
>   media: i2c: imx290: Add support for H & V Flips
> 
>  drivers/media/i2c/imx290.c | 429 ++++++++++++++++++++++++++++---------
>  1 file changed, 333 insertions(+), 96 deletions(-)

-- 
Regards,

Laurent Pinchart
