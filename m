Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5CE4CED05
	for <lists+linux-media@lfdr.de>; Sun,  6 Mar 2022 19:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbiCFSF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Mar 2022 13:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiCFSF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Mar 2022 13:05:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8265855BD3;
        Sun,  6 Mar 2022 10:05:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D00A482;
        Sun,  6 Mar 2022 19:05:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646589901;
        bh=R9P5UxUuOuQpv4fUryY5/BffsGWgVwBVshBneeSV640=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CPK4lqN1Jvxc7/eGb9xZDs7KAQVU7GlX9nrtJyGWieosI3OQ+WxnNwqm2PbSUQPno
         RZ425Bj75zfes8v0moWmvQqdhGcc4gmb3hPlitA6YIfgJgMsM9CulRzDY16Gfig917
         UT/cIBfm8jvZKKzzGoK1UXfR9sU8w1IhNMl57fE4=
Date:   Sun, 6 Mar 2022 20:04:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add macros for video
 interface bus types
Message-ID: <YiT3wZ746ES6x3gl@pendragon.ideasonboard.com>
References: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
 <20220306173905.22990-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220306173905.22990-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Mar 06, 2022 at 07:39:03PM +0200, Laurent Pinchart wrote:
> Add a new dt-bindings/media/video-interfaces.h header that defines
> macros corresponding to the bus types from media/video-interfaces.yaml.
> This allows avoiding hardcoded constants in device tree sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Dual-license under GPL-2.0-only or MIT
> - Rename PARALLEL TO BT601

Contrary to popular belief, further investigation revealed that BT.601
doesn't define VSYNC and HSYNC (or HREF, as it is also commonly called)
signals. MEDIA_BUS_TYPE_BT601 is thus likely not a good name. I haven't
been able to find a standard for parallel camera interfaces that would
be a good match here. On the display side there's MIPI DPI, but on the
camera side it seems things have evolved quite organically. I may have
missed something though.

> ---
>  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
> 
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> new file mode 100644
> index 000000000000..4c3810edff4c
> --- /dev/null
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__
> +
> +#define MEDIA_BUS_TYPE_CSI2_CPHY		1
> +#define MEDIA_BUS_TYPE_CSI1			2
> +#define MEDIA_BUS_TYPE_CCP2			3
> +#define MEDIA_BUS_TYPE_CSI2_DPHY		4
> +#define MEDIA_BUS_TYPE_BT601			5
> +#define MEDIA_BUS_TYPE_BT656			6
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
Regards,

Laurent Pinchart
