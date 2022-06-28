Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140AC55CC9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344159AbiF1KqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 06:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbiF1KqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 06:46:12 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DFF31371;
        Tue, 28 Jun 2022 03:46:10 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id AF40B20009;
        Tue, 28 Jun 2022 10:46:04 +0000 (UTC)
Date:   Tue, 28 Jun 2022 12:46:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: media: Add macros for video
 interface bus types
Message-ID: <20220628104603.2pugkopwluvgx7a7@uno.localdomain>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Jun 16, 2022 at 01:14:05AM +0300, Laurent Pinchart wrote:
> Add a new dt-bindings/media/video-interfaces.h header that defines
> macros corresponding to the bus types from media/video-interfaces.yaml.
> This allows avoiding hardcoded constants in device tree sources.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Just putting a tag here as we have more flags to add here (in example
the device orientation)

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

> ---
> Changes since v2:
>
> - Go back to PARALLEL
>
> Changes since v1:
>
> - Dual-license under GPL-2.0-only or MIT
> - Rename PARALLEL TO BT601
> ---
>  include/dt-bindings/media/video-interfaces.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/media/video-interfaces.h
>
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> new file mode 100644
> index 000000000000..68ac4e05e37f
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
> +#define MEDIA_BUS_TYPE_PARALLEL			5
> +#define MEDIA_BUS_TYPE_BT656			6
> +
> +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> --
> Regards,
>
> Laurent Pinchart
>
