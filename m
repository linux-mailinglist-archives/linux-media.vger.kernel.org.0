Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C0E4BCE80
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 13:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbiBTMuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 07:50:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiBTMuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 07:50:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6B832EF1
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 04:50:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC63F25B;
        Sun, 20 Feb 2022 13:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645361427;
        bh=QJLGdigbYbu+G/htcxQfYphGRkNZZX0OB98Yz7Xm5Eg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AuF7C7dq7160x//8/3L9T1K5YBzxCH6j+EahYiGxVznO4o+vXzrMed6RHYDQHNQvC
         fIempHoieHXDdnxHcctPBwZ6f8+i3t1apTF+bqm8SU/9QQBN26iU+WgJhj3hFMGdpp
         5HBaJVnS1jU/wrEvUnfeCSalshpycfM6Wod4BFl0=
Date:   Sun, 20 Feb 2022 14:50:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 09/23] media: ov5640: Fix 720x480 in RGB888 mode
Message-ID: <YhI5Cd44XaCGTia4@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210110458.152494-10-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210110458.152494-10-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Feb 10, 2022 at 12:04:44PM +0100, Jacopo Mondi wrote:
> Adjust the left crop of 720x480 to enable capture in RGB888 format,
> which is otherwise broken.

How is it broken ?

> The 56 pixels alignment has been copied from the 720x576 mode.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 9ba1b44d21f7..f817f865ad16 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -746,7 +746,7 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
>  			.height	= 1947,
>  		},
>  		.crop = {
> -			.left	= 16,
> +			.left	= 56,

The values look weird. The mode has an analog crop width of 2624, and
uses subsampling. After subsampling the width is thus 1312, and a left
offset of 16 or 56 for the crop rectangle thus output an image that
isn't centered.

Regardless, given that the centering issue preexists, if this fixes the
problem,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			.top	= 60,
>  			.width	= 720,
>  			.height	= 480,

-- 
Regards,

Laurent Pinchart
