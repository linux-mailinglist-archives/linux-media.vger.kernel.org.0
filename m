Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9A95F6576
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiJFL4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiJFL4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:56:16 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8019DDA6
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 04:56:14 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 274F540006;
        Thu,  6 Oct 2022 11:56:11 +0000 (UTC)
Date:   Thu, 6 Oct 2022 13:56:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 07/16] media: i2c: ov9282: Reduce vblank_min values based
 on testing
Message-ID: <20221006115610.zwyocdduhexusfyb@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-8-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-8-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 05, 2022 at 04:28:00PM +0100, Dave Stevenson wrote:
> The configured vblank_min setting of 250 (meaning VTS of

Do you mean 151 ?

> 720 + 250 = 970) is far higher than the setting that works on
> the sensor, and there are no obvious restrictions stated in the
> datasheet.
>
> Reduce the vblank_min to allow for faster frame rates.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 1cd6cb4addfb..abb1223c0260 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -268,7 +268,7 @@ static const struct ov9282_mode supported_modes[] = {
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
