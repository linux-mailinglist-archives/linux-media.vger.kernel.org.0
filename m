Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC4D56B7A9
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237844AbiGHKvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237745AbiGHKvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:51:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274E384EE7;
        Fri,  8 Jul 2022 03:51:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6790B56D;
        Fri,  8 Jul 2022 12:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657277462;
        bh=vpDa5/vXKwnHRXWnf55gBcrxecKnxpDnEe8HcCmlVMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HM2O9oTpIaJ9BFEIJD6dq6QCKCohaJcdgkrhWbHXAvkajhGD/YbBLZTMDO1UYYH56
         Bip8E5P9r56b3tFTUOkktnJzq6wdU/z9KzEPTE9CeE7M9MihzpiIVOHfpSf0vU/aDn
         xCGA0DUfkkdIaTHtjaP+2gHfnE6MVZLg17MC1xF8=
Date:   Fri, 8 Jul 2022 13:50:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 11/14] media: uapi: Add a control for DW100 driver
Message-ID: <YsgL/E58FfgeKzmb@pendragon.ideasonboard.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
 <20220623143115.3185297-12-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220623143115.3185297-12-xavier.roumegue@oss.nxp.com>
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

On Thu, Jun 23, 2022 at 04:31:12PM +0200, Xavier Roumegue wrote:
> The DW100 driver gets the dewarping mapping as a binary blob from the
> userspace application through a custom control.
> The blob format is hardware specific so create a dedicated control for
> this purpose.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../userspace-api/media/drivers/dw100.rst          | 13 +++++++++++++
>  include/uapi/linux/dw100.h                         | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 include/uapi/linux/dw100.h
> 
> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> index 1ca6fa55f539..d8a6e10b4395 100644
> --- a/Documentation/userspace-api/media/drivers/dw100.rst
> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> @@ -66,4 +66,17 @@ map.
>  More details on the DW100 hardware operations can be found in
>  *chapter 13.15 DeWarp* of IMX8MP_ reference manual.
>  
> +The Vivante DW100 m2m driver implements the following driver-specific control:
> +
> +``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (__u32 array)``
> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
> +    dynamic array. The image is divided into many small 16x16 blocks. If the
> +    width/height of the image is not divisible by 16, the size of the
> +    rightmost/bottommost block is the remainder. The dewarping map only saves
> +    the vertex coordinates of the block. The dewarping grid map is comprised of
> +    vertex coordinates for x and y. Each x, y coordinate register uses 16 bits
> +    (UQ12.4) to record the coordinate address, with the Y coordinate in the
> +    upper bits and X in the lower bits.

I would add "The driver modifies the dimensions of this control when the
sink format is changed, to reflect the new input resolution." or
something similar.

> +
>  .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
> new file mode 100644
> index 000000000000..3356496edd6b
> --- /dev/null
> +++ b/include/uapi/linux/dw100.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/* Copyright 2022 NXP */
> +
> +#ifndef __UAPI_DW100_H__
> +#define __UAPI_DW100_H__
> +
> +#include <linux/v4l2-controls.h>
> +
> +/*
> + * Check Documentation/userspace-api/media/drivers/dw100.rst for control details.
> + */
> +#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
> +
> +#endif

-- 
Regards,

Laurent Pinchart
