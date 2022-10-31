Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07F11613368
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 11:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbiJaKPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 06:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJaKPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 06:15:33 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BF3DEE1
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 03:15:32 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 32932240006;
        Mon, 31 Oct 2022 10:15:29 +0000 (UTC)
Date:   Mon, 31 Oct 2022 11:15:28 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 07/16] media: i2c: ov9282: Reduce vblank_min values
 based on testing
Message-ID: <20221031101528.ed2x7igafwqd4pte@uno.localdomain>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-8-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028160902.2696973-8-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Fri, Oct 28, 2022 at 05:08:53PM +0100, Dave Stevenson wrote:
> The configured vblank_min setting of 151 (meaning VTS of
> 720 + 151 = 871) is far higher than the setting that works on
> the sensor, and there are no obvious restrictions stated in the
> datasheet.
>
> Reduce the vblank_min to allow for faster frame rates.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Let's hope this work on all platforms... I wonder if when something is
not documented but experimentally confirmed we should not record it
with a comment.

That's a general issue, not on this patch specifically

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

> ---
>  drivers/media/i2c/ov9282.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 7e0b12b89655..35bc2b0438bc 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -262,7 +262,7 @@ static const struct ov9282_mode supported_modes[] = {
>  		.height = 720,
>  		.hblank = 250,
>  		.vblank = 1022,
> -		.vblank_min = 151,
> +		.vblank_min = 41,
>  		.vblank_max = 51540,
>  		.link_freq_idx = 0,
>  		.reg_list = {
> --
> 2.34.1
>
