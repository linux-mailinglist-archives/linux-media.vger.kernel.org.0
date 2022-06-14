Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B192854BCA0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 23:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344813AbiFNVNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 17:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235143AbiFNVNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 17:13:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0D74D682;
        Tue, 14 Jun 2022 14:13:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFF1A268;
        Tue, 14 Jun 2022 23:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655241198;
        bh=mAShYV34Fcsv5UqG0oYypCupSmjw7SSvFdoLGEbUP08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dFdQ3HrzHnvnxPI784QNeSCY0pIgjeVgobAJjcQZ3bbqTM3kMWuZbAsMNEDkIhcEu
         bVjTVnNT04xfp5QH0h7OrU4F/b/o11vI/RvIjrDkLrBT3p3yl8Ydrr58z6PvJezzPX
         NJJf1sLZUpSksBpazNa/tQOe97p8Kzfo8yCysmoY=
Date:   Wed, 15 Jun 2022 00:13:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/9] media: Documentation: dw100: Add user
 documentation for the DW100 driver
Message-ID: <Yqj55JoGIF7SWyvX@pendragon.ideasonboard.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-5-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220503093925.876640-5-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

Thank you for the patch.

On Tue, May 03, 2022 at 11:39:20AM +0200, Xavier Roumegue wrote:
> Add user documentation for the DW100 driver.
> 
> while at it, replace spaces with tab on drivers list.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  .../userspace-api/media/drivers/dw100.rst     | 90 +++++++++++++++++++
>  .../userspace-api/media/drivers/index.rst     |  3 +-
>  2 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
> 
> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> new file mode 100644
> index 000000000000..1e606459cf47
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> @@ -0,0 +1,90 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +DW100 dewarp driver
> +===================
> +
> +The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
> +programmable geometrical transformation on input image to correct distortion

s/on input image/on the image image/ (or "on input images")

> +introduced by lenses.
> +
> +The transformation function is exposed by the hardware as a grid map with 16x16
> +pixel macroblocks indexed using X, Y vertex coordinates.
> +::
> +
> +                          Image width
> +           <--------------------------------------->
> +
> +      ^    .-------.-------.-------.-------.-------.
> +      |    | 16x16 |       |       |       |       |
> +   I  |    | pixel |       |       |       |       |
> +   m  |    | block |       |       |       |       |
> +   a  |    .-------.-------.-------.-------.-------.
> +   g  |    |       |       |       |       |       |
> +   e  |    |       |       |       |       |       |
> +      |    |       |       |       |       |       |
> +   h  |    .-------.-------.-------.-------.-------.
> +   e  |    |       |       |       |       |       |
> +   i  |    |       |       |       |       |       |
> +   g  |    |       |       |       |       |       |
> +   h  |    .-------.-------.-------.-------.-------.
> +   t  |    |       |       |       |       |       |
> +      |    |       |       |       |       |       |
> +      |    |       |       |       |       |       |
> +      v    '-------'-------'-------'-------'-------'
> +
> +            Grid of Image Blocks for Dewarping Map
> +
> +
> +Each x, y coordinate register uses 16 bits to record the coordinate address in
> +an unsigned 12.4 fixed point format (UQ12.4).
> +::
> +
> +    .----------------------.--------..----------------------.--------.
> +    |         31~20        | 19~16  ||         15~4         |  3~0   |
> +    |       (integer)      | (frac) ||       (integer)      | (frac) |
> +    '----------------------'--------''----------------------'--------'
> +    <-------------------------------><------------------------------->
> +                Y coordinate                     X coordinate
> +
> +                           Remap Register Layout
> +
> +The dewarping remap contains two interpolations: coordinate interpolation and
> +pixel interpolation as shown in the figure below.
> +::
> +
> +                           P1                 P2
> +                        (x1, y1)           (x2, y2)
> +                           .-----------------.
> +                           |                 |
> +                           |      P          |
> +                           |   (x, y)        |
> +                           |      *          |
> +                           |                 |
> +                           |                 |
> +                           '-----------------'
> +                           P3                P4
> +                        (x3, y3)          (x4, y4)
> +
> +                          Remap with Coordinate
> +                          and Pixel Interpolation

I don't understand from this figure (and the text above it) how the
interpolation works, or how it's relevant to the control definition. You
could either expand the documentation, or drop this part.

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +The dewarping map is set from applications using the
> +V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control. The control contains
> +an array of u32 values storing (x, y) destination coordinates for each
> +vertex of the grid. The x coordinate is stored in the 16 LSBs and the y
> +coordinate in the 16 MSBs.
> +
> +The number of elements in the array must match the image size:
> +
> +.. code-block:: C
> +
> +    elems = (DIV_ROUND_UP(width, 16) + 1) * (DIV_ROUND_UP(height, 16) + 1);
> +
> +If the control doesn't contain the correct number of elements, the driver uses
> +an identity map.
> +
> +More details on the DW100 hardware operations can be found in
> +*chapter 13.15 DeWarp* of IMX8MP_ reference manual.
> +
> +.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 12e3c512d718..0c720ca1a27d 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -33,7 +33,8 @@ For more details see the file COPYING in the source distribution of Linux.
>  
>  	ccs
>  	cx2341x-uapi
> -        hantro
> +	dw100
> +	hantro
>  	imx-uapi
>  	max2175
>  	meye-uapi

-- 
Regards,

Laurent Pinchart
