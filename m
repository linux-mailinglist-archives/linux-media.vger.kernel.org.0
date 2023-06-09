Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B23FE729C7E
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 16:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240065AbjFIOOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 10:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjFIOOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 10:14:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8348A19B
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 07:14:35 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:4a2a:e3ff:fe5e:2efb])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC8F7C4C;
        Fri,  9 Jun 2023 16:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686320045;
        bh=Hn64AzFENzrTOporJ09Yy/Bdd70MSF/In2sWOK/Phl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jOHChZdvo37C4qbr4CYdfMZ3FDX9GoWVeZFn0IisOeICNqW3o/O6FzzFly2DnylS/
         NRy6IDvFWo3V/EJiCKsCBxVx6A6FwKcIzzXbPklOqJAhVQm9VNEBAo0dj5t+5vcjyo
         sdzCoDmKYg6Rnaq9+AByiB01K7xsWp+5ZqWHxFyU=
Date:   Fri, 9 Jun 2023 16:14:29 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        slongerbeam@gmail.com, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org
Subject: Re: [PATCH v2] media: ov5640: fix low resolution image abnormal issue
Message-ID: <hylz7iar3laa3iihmbsm5iqc3rdvp7wascuiqgicmzi3jv7htv@sp7hqsjyhgif>
References: <20230609054525.4067113-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230609054525.4067113-1-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Guoniu Zhou

On Fri, Jun 09, 2023 at 01:45:25PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> OV5640 will output abnormal image data when work at low resolution
> (320x240, 176x144 and 160x120) after switching from high resolution,
> such as 1080P, the time interval between high and low switching must
> be less than 1000ms in order to OV5640 don't enter suspend state during
> the time.
>
> The reason is by 0x3824 value don't restore to initialize value when
> do resolution switching. In high resolution setting array, 0x3824 is
> set to 0x04, but low resolution setting array remove 0x3824 in commit
> db15c1957a2d ("media: ov5640: Remove duplicated mode settings"). So
> when do resolution switching from high to low, such as 1080P to 320x240,
> and the time interval is less than auto suspend delay time which means
> global initialize setting array will not be loaded, the output image
> data are abnormal. Hence move 0x3824 from ov5640_init_setting[] table
> to ov5640_setting_low_res[] table and also move 0x4407 0x460b, 0x460c
> to avoid same issue.

I'm not 100% I got why the autosuspend delay plays a role here.

Also this is probably worth a:
Fixes: db15c1957a2d ("media: ov5640: Remove duplicated mode settings")

Could be added when applying probably ?
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
> v1->v2:
>   1) Move 0x4407, 0x460b, 0x460c from ov5640_init_setting[] table to
>      ov5640_setting_low_res[] table.

I have checked that the registers you removed from init_settings[] are
programmed in all the other modes, hence

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


>   2) Add mode switching test from 2592x1944 to other resolutions, the
>      result is okay.

Thanks for testing it and good catch!


> ---
>  drivers/media/i2c/ov5640.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 1536649b9e90..1bc4d72a906e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -568,9 +568,7 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0}, {0x3000, 0x00, 0, 0},
>  	{0x3002, 0x1c, 0, 0}, {0x3004, 0xff, 0, 0}, {0x3006, 0xc3, 0, 0},
>  	{0x302e, 0x08, 0, 0}, {0x4300, 0x3f, 0, 0},
> -	{0x501f, 0x00, 0, 0}, {0x4407, 0x04, 0, 0},
> -	{0x440e, 0x00, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x4837, 0x0a, 0, 0}, {0x3824, 0x02, 0, 0},
> +	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
>  	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0}, {0x5180, 0xff, 0, 0},
>  	{0x5181, 0xf2, 0, 0}, {0x5182, 0x00, 0, 0}, {0x5183, 0x14, 0, 0},
>  	{0x5184, 0x25, 0, 0}, {0x5185, 0x24, 0, 0}, {0x5186, 0x09, 0, 0},
> @@ -634,7 +632,8 @@ static const struct reg_value ov5640_setting_low_res[] = {
>  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
>  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
>  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> +	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> +	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>
>  static const struct reg_value ov5640_setting_720P_1280_720[] = {
> --
> 2.37.1
>
