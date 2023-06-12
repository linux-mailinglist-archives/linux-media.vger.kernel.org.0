Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C472072B81A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 08:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbjFLGdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 02:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbjFLGdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 02:33:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4941991
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 23:28:06 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8759AE4;
        Mon, 12 Jun 2023 08:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686551078;
        bh=48ymDa3Nl+0CZnVygSvLxtu36KNTCcDVGNRdGQ0buss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t6dWNhIctNPH1SksG7KZFgCAieBxlT9GkL8AZUeM81weWlob/Gv9QAsLJfZzp+fpj
         UErZ5nx6bWxJJtkvJeubBY2RL39lqiO0HBVFORqs+9SRSVWobonVdlaUmy5wot8uCK
         TZnqCvAX578sR1CBVii4aCETVownjfNUmU4G3HH8=
Date:   Mon, 12 Jun 2023 08:25:04 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        slongerbeam@gmail.com, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org
Subject: Re: [PATCH v3] media: ov5640: fix low resolution image abnormal issue
Message-ID: <gqbulxmced43etsayy76mr5wb4g3qj5gz4e5pb2thvsp6qkztn@6y64s7sdeik4>
References: <20230612024340.313662-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230612024340.313662-1-guoniu.zhou@oss.nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Guoniu Zhou

On Mon, Jun 12, 2023 at 10:43:40AM +0800, guoniu.zhou@oss.nxp.com wrote:
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
>
> Fixes: db15c1957a2d ("media: ov5640: Remove duplicated mode settings")
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Thank you, it was probably not necessary to send a new version as the
tag could be added by maintainers when collecting the patch (I'm
speaking for Sakari here :)

Please don't forget to add the tags you receive when you send a new
version

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
> v2->v3:
>   add "Fixes: db15c1957a2d ("media: ov5640: Remove duplicated mode settings")" in commit log
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
