Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405895F638B
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiJFJX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiJFJXZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:23:25 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C71898C80
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:23:23 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 49A74240006;
        Thu,  6 Oct 2022 09:23:20 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:23:19 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 06/16] media: i2c: ov9282: Correct HTS register for
 configured pixel rate
Message-ID: <20221006092319.x4nc5p5y3c7oqyc7@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-7-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-7-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 05, 2022 at 04:27:59PM +0100, Dave Stevenson wrote:
> The calculations from pixel rate, width+hblank, and height+vblank
> do not give the correct framerate - it's half the speed it should
> be.
>
> Whilst not documented as such, the TIMING_HTS register (0x380c/d)
> appears to be in units of 2 pixels.
> The default is 0x2d8 (728) which can not be valid as-is when the
> frame is 1280 active pixels wide. Doubling to 0x5b0 (1456) results
> in the correct timings.

Not sure I get this one. If TIMING_HTS has a 2-pixels units, won't
0x2d8 be correct (as it equals to your desired 1456 pixels) ?

>
> This driver isn't using the default frame width + hblank, so
> use 0x02fd which is half of the width of 1280 and hblank of 250
> which is reported to userspace. With this the frame rate calculations
> work correctly.

So this patch is basically changing the default vblank from 728 to 760 ?

Should we rather move the per-mode blankings to the mode definition
and program them when applying a new mode ?

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f7823d584522..1cd6cb4addfb 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -242,8 +242,8 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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
