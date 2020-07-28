Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D532311E0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 20:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732447AbgG1SnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 14:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbgG1SnD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 14:43:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0747DC061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 11:43:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9D30563;
        Tue, 28 Jul 2020 20:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595961778;
        bh=5TFlBCMAhPxmmp9pCr+C6irbhewF9XPqhMzGN7shuFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kRI5ljLmQ5LijnHuDw0FBQUoA6BPh6U/a09J9xECqwRFvDkV4/xKzEot9Tk2jdWYB
         glaQPqqaJey2G60R1UlvKZwYSxMeqDah63t+U7XW4ZutB+YTQRTA6olRxSDUavhbWD
         OXkYhCDbGn1kXGdLv23+n6jR3Z8H4UtuOv5rsLKc=
Date:   Tue, 28 Jul 2020 21:42:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [Query] OV5640 DVP and BT656 modes
Message-ID: <20200728184249.GI13753@pendragon.ideasonboard.com>
References: <CA+V-a8vt1HEhJzc4jN22=7PnVrkcKjzFx7Q9E1ZK-YAtc09q0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8vt1HEhJzc4jN22=7PnVrkcKjzFx7Q9E1ZK-YAtc09q0w@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Jul 28, 2020 at 06:50:21PM +0100, Lad, Prabhakar wrote:
> Hi,
> 
> I am currently investigating adding support for the BT656 format which
> is currently missing in the driver.
> 
> The platform which I am currently testing can support both 8-bit DVP
> and BT656 modes.
> * Testing DVP mode capturing 320x240, 640x480 worked  OK with random
> green lines in-between
> 
> Following is the chunk of code which enables BT656 support,  (for
> BT656 mode ov5640_set_dvp_pclk() is used), with the below changes I
> can get 640x480 working
> 
> #define OV5640_REG_CCIR656_CTRL00    0x4730
> 
> static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> {
>     int ret;
> 
>     ret = ov5640_write_reg(sensor,
>                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
>     if (ret)
>         return ret;
> 
>     ret = ov5640_write_reg(sensor,
>                    OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
>     if (ret)
>         return ret;
> 
>     ret = ov5640_write_reg(sensor,
>                    OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
>     if (ret)
>         return ret;
> 
>     return ov5640_write_reg(sensor,
>                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> }
> 
> As soon as I change the code to below to disable the data pads on
> stream OFF as below it stops working!
> 
> static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> {
>     int ret;
> 
>     ret = ov5640_write_reg(sensor,
>                    OV5640_REG_IO_MIPI_CTRL00, on ? 0x18: 0);
>     if (ret)
>         return ret;
> 
>     ret = ov5640_write_reg(sensor,
>                    OV5640_REG_PAD_OUTPUT_ENABLE01, on ? 0x7f, 0);

s/,/:/ ? Is that a typo in your e-mail, or also in the code you've
tested ? I assume the former as the latter shouldn't compile.

>     if (ret)
>         return ret;
> 
>     ret = ov5640_write_reg(sensor,
>                    OV5640_REG_PAD_OUTPUT_ENABLE02, on ? 0xfc, 0);
>     if (ret)
>         return ret;
> 
>     return ov5640_write_reg(sensor,
>                 OV5640_REG_CCIR656_CTRL00, on ? 0x1: 0x0);
> }
> 
> Looking at the datasheet [1] I don't find it wrong or is there any
> information missing in this freely available datasheet.
> 
> Ideally BT656 mode should just work in DVP mode by setting 0x1 in
> 0x4730, but doesn work.
> 
> Is there anything  I'm missing here, any thoughts ?
> 
> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf

-- 
Regards,

Laurent Pinchart
