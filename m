Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6BA068C1D1
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 16:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjBFPiu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 10:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbjBFPie (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 10:38:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B15B2A994
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 07:37:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 115F24DA;
        Mon,  6 Feb 2023 16:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675697489;
        bh=39CCccG0D+js+1bE221tuCsT1Hm/1hMTLjhmJ4KeBgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HtmJGNa7v9Tl1FpbbTg48ACLxf2CVTX7xTIU9uReQrsjwftFs16IGQVbkI/ulVssL
         BVfO4/l7XFYwzSYyEXR6p78Yd+tOKn7VWGa2/5+ptl4tyTqzQ4bLG2Nq+MQkZCjloB
         sJ+23hTu478IXLnvrKk1Ua25OWBKO1GYCB7KzT8w=
Date:   Mon, 6 Feb 2023 17:31:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Capture image from imx219 sensor on i.MX8MM
Message-ID: <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com>
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Mon, Feb 06, 2023 at 03:24:41PM +0100, Frieder Schrempf wrote:
> Hi,
> 
> I'm trying to get a camera stream on our i.MX8MM board up and running
> with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) as sensor.
> 
> I basically copied the devicetree setup from Tim's overlay at
> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts.
> 
> With all the drivers enabled the devices (imx219, imx7-media-csi,
> imx-mipi-csis) seem to probe just fine and I see /dev/video0 and
> /dev/media0.
> 
> For the v4l subdevices I would expect to see one for the sensor and one
> for the CSI bridge. But only the latter is there (see below).
> 
> Is this correct? Am I missing something? How can I setup/enable the
> pipeline/stream?

Your expectations are correct, but the result isn't. You should see the
camera sensor in the media graph. Has the imx219 been probed by the
driver ? Did probe succeed ?

> ~# media-ctl -d /dev/media0 -p
> Media controller API version 6.1.8
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  6.1.8
> 
> Device topology
> - entity 1: csi (2 pads, 1 link)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>         pad1: Source
>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "csi":1 [ENABLED,IMMUTABLE]

-- 
Regards,

Laurent Pinchart
