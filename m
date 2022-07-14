Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F16B8574AA5
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 12:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237875AbiGNKcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 06:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiGNKcI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 06:32:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3697747B9A;
        Thu, 14 Jul 2022 03:32:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FA77383;
        Thu, 14 Jul 2022 12:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657794725;
        bh=jmip/PMCfB/ioznhF5DcgU6XsiQx58FU5J2Vq+R3FgI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kG4CSkq7AlF26wO7wkgvGfN+eY8hHIhjwzPegvMUrv3G7hUOFwLYvU0q3LuhzG+wP
         SR0owL5fWVxmWXlzjaJrK6Hn1U+cz2RgNilwDIl0YXapcZQaWKuwFVC/vwAwsLTH0t
         e/Z5/G/DXQkHsr9sbc4ByhPI5ggEwp8BhwXqcGys=
Date:   Thu, 14 Jul 2022 13:31:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Volodymyr Kharuk <vkh@melexis.com>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: uapi: Add mlx7502x header file
Message-ID: <Ys/wh1wUvQlmpHrg@pendragon.ideasonboard.com>
References: <cover.1657786765.git.vkh@melexis.com>
 <0765b2ef8eea43dce67232a109e9f8b338aa06bd.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0765b2ef8eea43dce67232a109e9f8b338aa06bd.1657786765.git.vkh@melexis.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodymyr,

Thank you for the patch.

On Thu, Jul 14, 2022 at 11:34:46AM +0300, Volodymyr Kharuk wrote:
> Define user controls for mlx7502x driver and update MAINTAINERS
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> ---
>  MAINTAINERS                   |  7 +++++++
>  include/uapi/linux/mlx7502x.h | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 include/uapi/linux/mlx7502x.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef3ec334fae9..1a68d888ee14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12673,6 +12673,13 @@ S:	Supported
>  W:	http://www.melexis.com
>  F:	drivers/iio/temperature/mlx90632.c
>  
> +MELEXIS MLX7502X DRIVER
> +M:	Volodymyr Kharuk <vkh@melexis.com>
> +L:	linux-media@vger.kernel.org
> +S:	Supported
> +W:	http://www.melexis.com
> +F:	include/uapi/linux/mlx7502x.h
> +
>  MELFAS MIP4 TOUCHSCREEN DRIVER
>  M:	Sangwon Jee <jeesw@melfas.com>
>  S:	Supported
> diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
> new file mode 100644
> index 000000000000..44386f3d6f5a
> --- /dev/null
> +++ b/include/uapi/linux/mlx7502x.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Melexis 7502x ToF cameras driver.
> + *
> + * Copyright (C) 2021 Melexis N.V.
> + *
> + */
> +
> +#ifndef __UAPI_MLX7502X_H_
> +#define __UAPI_MLX7502X_H_
> +
> +#include <linux/v4l2-controls.h>
> +

These controls should be documented, in
Documentation/userspace-api/media/drivers/.

> +/* number of phases per frame: 1..8 */
> +#define V4L2_CID_MLX7502X_PHASE_NUMBER  (V4L2_CID_USER_MLX7502X_BASE + 0)
> +/* shift of each phase in frame, this is an array of 8 elements, each 16bits */
> +#define V4L2_CID_MLX7502X_PHASE_SEQ	(V4L2_CID_USER_MLX7502X_BASE + 1)
> +/* frequency modulation in MHz */
> +#define V4L2_CID_MLX7502X_FMOD		(V4L2_CID_USER_MLX7502X_BASE + 2)
> +/* time integration of each phase in us */
> +#define V4L2_CID_MLX7502X_TINT		(V4L2_CID_USER_MLX7502X_BASE + 3)

Are these control very device-specific, or are they concept that apply
in general to ToF sensors ? Same for V4L2_CID_MLX7502X_OUTPUT_MODE.

> +/* mode could sw(sending i2c packet), hw(pin triggering), and continuous(self triggering) */
> +#define V4L2_CID_MLX7502X_TRIGGER_MODE	(V4L2_CID_USER_MLX7502X_BASE + 4)
> +/* in case sw or hw trigger mode is used */
> +#define V4L2_CID_MLX7502X_TRIGGER	(V4L2_CID_USER_MLX7502X_BASE + 5)

Trigger control is likely something we need to standardize at the V4L2
level.

> +/* this is related to the taps in ToF cameras, usually A minus B is the best option */
> +#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 6)
> +/* ToF camers has its own temperature sensor, which can be read out only during streaming */
> +#define V4L2_CID_MLX7502X_TEMPERATURE	(V4L2_CID_USER_MLX7502X_BASE + 7)

This should probably use the proposed temperature control from
https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/

> +
> +#endif /* __UAPI_MLX7502X_H_ */

-- 
Regards,

Laurent Pinchart
