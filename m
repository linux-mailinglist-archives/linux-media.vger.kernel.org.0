Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E8168C22F
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 16:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjBFPuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 10:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjBFPuO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 10:50:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9407A46BC
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 07:50:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A19C4DA;
        Mon,  6 Feb 2023 16:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675698612;
        bh=uhc6icxdKUm6hP7wHbn+5cn8E08s8XfuH6HcGj3S9Dw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GYni2MEwCy6qQmRw9TqPr0Q7OTe3z7MqrCZFLORxHXyyA83npDW1qguScfSnR87UB
         +FPyKrYQo0E+MPrJKGk6AwJoPno2BHuc9HJmu8vnLIMHma/6OtBBtHx22UvguLQCr8
         CAcoF9Zw1bKbHv0cBRpf/8nrWcj6/ao/7Q2UH5Es=
Date:   Mon, 6 Feb 2023 17:50:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Capture image from imx219 sensor on i.MX8MM
Message-ID: <Y+EhsjtL5DYBie9u@pendragon.ideasonboard.com>
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com>
 <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 06, 2023 at 04:38:27PM +0100, Frieder Schrempf wrote:
> On 06.02.23 16:31, Laurent Pinchart wrote:
> > On Mon, Feb 06, 2023 at 03:24:41PM +0100, Frieder Schrempf wrote:
> >> Hi,
> >>
> >> I'm trying to get a camera stream on our i.MX8MM board up and running
> >> with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) as sensor.
> >>
> >> I basically copied the devicetree setup from Tim's overlay at
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts.
> >>
> >> With all the drivers enabled the devices (imx219, imx7-media-csi,
> >> imx-mipi-csis) seem to probe just fine and I see /dev/video0 and
> >> /dev/media0.
> >>
> >> For the v4l subdevices I would expect to see one for the sensor and one
> >> for the CSI bridge. But only the latter is there (see below).
> >>
> >> Is this correct? Am I missing something? How can I setup/enable the
> >> pipeline/stream?
> > 
> > Your expectations are correct, but the result isn't. You should see the
> > camera sensor in the media graph. Has the imx219 been probed by the
> > driver ? Did probe succeed ?
> 
> Yes, the imx219_probe() works just fine and returns with code 0. I also
> see v4l2_async_register_subdev_sensor() and the underlying code being
> called.
> 
> So I really don't understand why I'm missing the sensor subdev. Any
> ideas how to continue debugging?

The issue seems to be with v4l2-async then. There's a debugfs file that
lists the missing v4l2-async subdevs (I don't recall the path by heard),
that can give useful information. Enabling the debug messages from
v4l2-async.c may helpt too.

-- 
Regards,

Laurent Pinchart
