Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9E0613360
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 11:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiJaKMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 06:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiJaKMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 06:12:16 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEB7DF81
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 03:12:13 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 65FB7240002;
        Mon, 31 Oct 2022 10:12:11 +0000 (UTC)
Date:   Mon, 31 Oct 2022 11:12:09 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 06/16] media: i2c: ov9282: Correct HTS register for
 configured pixel rate
Message-ID: <20221031101209.guqwlnegslap4ey4@uno.localdomain>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-7-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028160902.2696973-7-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Fri, Oct 28, 2022 at 05:08:52PM +0100, Dave Stevenson wrote:
> The calculations from pixel rate, width+hblank, and height+vblank
> do not give the correct framerate - it's half the speed it should
> be.
>
> The datasheet lists the default for the TIMING_HTS registers (0x380c/d)
> as being 0x2d8 (728) which is less than the width of the image, so
> the units clearly can't be pixels.
> If TIMING_HTS is considered to be units of 2-pixels, then the
> resulting value of 0x5b0 (1456) makes all the calculations correct.
>
> This driver is reporting an HBLANK value of 250, with an image width
> of 1280, so TIMING_HTS is 1530 (0x5fa) pixels. However it was also
> setting the register to 0x5fa, thereby not taking into account it
> being units of 2-pixels.
>
> Correct the register value to 0x2fd so that all the timing calculations
> give the correct results.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks, the commit message is now very clear

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/ov9282.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 1524189cf3e5..7e0b12b89655 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -236,8 +236,8 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x3809, 0x00},
>  	{0x380a, 0x02},
>  	{0x380b, 0xd0},
> -	{0x380c, 0x05},
> -	{0x380d, 0xfa},
> +	{0x380c, 0x02},
> +	{0x380d, 0xfd},
>  	{0x3810, 0x00},
>  	{0x3811, 0x08},
>  	{0x3812, 0x00},
> --
> 2.34.1
>
