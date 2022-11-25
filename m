Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610C3638C62
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiKYOjW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiKYOjV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:39:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCD717895;
        Fri, 25 Nov 2022 06:39:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CCAF262480;
        Fri, 25 Nov 2022 14:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D07C433C1;
        Fri, 25 Nov 2022 14:39:17 +0000 (UTC)
Message-ID: <06d4c93d-3f94-cc95-f123-751e7bb2ab3b@xs4all.nl>
Date:   Fri, 25 Nov 2022 15:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/8] media: uapi: Add mlx7502x header file
Content-Language: en-US
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <cc798c882c35ef135179fba869d3f98507edde50.1669381013.git.vkh@melexis.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <cc798c882c35ef135179fba869d3f98507edde50.1669381013.git.vkh@melexis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> Define user controls for mlx7502x driver, add its documentation and
> update MAINTAINERS
> 
> Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> ---
>  .../userspace-api/media/drivers/index.rst     |  1 +
>  .../userspace-api/media/drivers/mlx7502x.rst  | 28 +++++++++++++++++++
>  MAINTAINERS                                   |  2 ++
>  include/uapi/linux/mlx7502x.h                 | 20 +++++++++++++
>  4 files changed, 51 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/mlx7502x.rst
>  create mode 100644 include/uapi/linux/mlx7502x.h
> 
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 32f82aed47d9..f49e1b64c256 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -37,5 +37,6 @@ For more details see the file COPYING in the source distribution of Linux.
>  	imx-uapi
>  	max2175
>  	meye-uapi
> +	mlx7502x
>  	omap3isp-uapi
>  	uvcvideo
> diff --git a/Documentation/userspace-api/media/drivers/mlx7502x.rst b/Documentation/userspace-api/media/drivers/mlx7502x.rst
> new file mode 100644
> index 000000000000..6f4874ec010d
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/mlx7502x.rst
> @@ -0,0 +1,28 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Melexis mlx7502x ToF camera sensor driver
> +=========================================
> +
> +The mlx7502x driver implements the following driver-specific controls:
> +
> +``V4L2_CID_MLX7502X_OUTPUT_MODE (menu)``
> +----------------------------------------
> +	The sensor has two taps, which gather reflected light: A and B.
> +	The control sets the way data should be put in a buffer. The most
> +	common output mode is A-B which provides the best sunlight robustness.
> +
> +.. flat-table::
> +	:header-rows:  0
> +	:stub-columns: 0
> +	:widths:       1 4
> +
> +	* - ``(0)``
> +	  - A minus B
> +	* - ``(1)``
> +	  - A plus B
> +	* - ``(2)``
> +	  - only A
> +	* - ``(3)``
> +	  - only B
> +	* - ``(4)``
> +	  - A and B (this config will change PAD format)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a2bc2ce53056..0a6dda8da6bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13116,7 +13116,9 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  W:	http://www.melexis.com
> +F:	Documentation/userspace-api/media/drivers/mlx7502x.rst
>  F:	Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> +F:	include/uapi/linux/mlx7502x.h
>  
>  MELFAS MIP4 TOUCHSCREEN DRIVER
>  M:	Sangwon Jee <jeesw@melfas.com>
> diff --git a/include/uapi/linux/mlx7502x.h b/include/uapi/linux/mlx7502x.h
> new file mode 100644
> index 000000000000..68014f550ed2
> --- /dev/null
> +++ b/include/uapi/linux/mlx7502x.h
> @@ -0,0 +1,20 @@
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
> +/*
> + * this is related to the taps in ToF cameras,
> + * usually A minus B is the best option
> + */
> +#define V4L2_CID_MLX7502X_OUTPUT_MODE	(V4L2_CID_USER_MLX7502X_BASE + 0)

You need to add an enum with the mode settings. E.g.:

enum v4l2_mlx7502x_output_mode {
        V4L2_MLX7502X_OUTPUT_MODE_A_MINUS_B     = 0,
	...
};

And you can use those enum defines in the documentation.

Regards,

	Hans

> +
> +#endif /* __UAPI_MLX7502X_H_ */

