Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FA350D996
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 08:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbiDYGoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 02:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbiDYGof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 02:44:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB7620188;
        Sun, 24 Apr 2022 23:41:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97CF461264;
        Mon, 25 Apr 2022 06:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEE1C385A4;
        Mon, 25 Apr 2022 06:41:29 +0000 (UTC)
Message-ID: <28526ccf-4ae4-bd20-af16-67cb6bb8286a@xs4all.nl>
Date:   Mon, 25 Apr 2022 08:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/9] media: Documentation: dw100: Add user
 documentation for the DW100 driver
Content-Language: en-US
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-5-xavier.roumegue@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220328141309.177611-5-xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/03/2022 16:13, Xavier Roumegue wrote:
> Add user documentation for the DW100 driver.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  .../userspace-api/media/drivers/dw100.rst     | 23 +++++++++++++++++++
>  .../userspace-api/media/drivers/index.rst     |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst
> 
> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> new file mode 100644
> index 000000000000..4cd55c75628e
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +DW100 dewarp driver
> +===========================
> +
> +The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
> +programmable geometrical transformation on input image to correct distorsion
> +introduced by lenses.
> +
> +The transformation function is exposed by the hardware as a grid map with 16x16
> +pixel macroblocks indexed using X, Y vertex coordinates. Each x, y coordinate
> +register uses 16 bits to record the coordinate address in UQ12.4 fixed point

'UQ12.4' is a mostly TI notation it seems: https://en.wikipedia.org/wiki/Q_(number_format)

I would replace this with: ...in an unsigned 12.4 fixed point format

And in the control documentation this can be documented more precisely (I'll comment on
that patch).

Regards,

	Hans

> +format.
> +
> +The dewarping map can be set from application through a dedicated v4l2 control.
> +If not set or invalid, the driver computes an identity map prior to start the
> +processing engine. The map is evaluated as invalid if the array size does not
> +match the expected size inherited from the destination image resolution.
> +
> +More details on the DW100 hardware operations can be found in
> +*chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
> +
> +.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 12e3c512d718..8826777321b0 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  
>  	ccs
>  	cx2341x-uapi
> +	dw100
>          hantro
>  	imx-uapi
>  	max2175

