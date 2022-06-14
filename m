Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BC454BC83
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 23:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357648AbiFNVHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 17:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241295AbiFNVHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 17:07:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5904D506E4;
        Tue, 14 Jun 2022 14:07:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 923E52E4;
        Tue, 14 Jun 2022 23:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655240832;
        bh=jCYvsA6z1AYPLyvZ5o1lPYrugwPV+h4sgcgKgzhR7Z8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GVTwmaFJfVfVwB9sPYzJFpC1vvXRWvstXD1bZZowchajQ/tXFFpoELK1VYCJqzquj
         fU/8h94+yBg6GU2hc3nXm/w3M1Rprax5aQEFG2iaBESgiJ09FDhrZhIhDejy7qK4Vd
         5NyHWXKI3ssu3r6Lnj3ZGp+RrbXA1AViIGFimf0Q=
Date:   Wed, 15 Jun 2022 00:07:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/9] media: uapi: Add a control for DW100 driver
Message-ID: <Yqj4d+HrR+XV9bb/@pendragon.ideasonboard.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-7-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220503093925.876640-7-xavier.roumegue@oss.nxp.com>
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

On Tue, May 03, 2022 at 11:39:22AM +0200, Xavier Roumegue wrote:
> The DW100 driver gets the dewarping mapping as a binary blob from the
> userspace application through a custom control.
> The blob format is hardware specific so create a dedicated control for
> this purpose.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../userspace-api/media/drivers/dw100.rst          | 13 +++++++++++++
>  include/uapi/linux/dw100.h                         | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 include/uapi/linux/dw100.h
> 
> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> index 1e606459cf47..1ea727698ea1 100644
> --- a/Documentation/userspace-api/media/drivers/dw100.rst
> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> @@ -87,4 +87,17 @@ an identity map.
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
