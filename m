Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5383155C1
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 19:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhBISUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 13:20:34 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:42000 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbhBISRv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 13:17:51 -0500
Received: by mail-ot1-f54.google.com with SMTP id q4so8696309otm.9;
        Tue, 09 Feb 2021 10:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yvEVgFXxj42ho51jb6dVDNgFxU/choj/euDd8LGx2dg=;
        b=me97rCxDInYiYZZC5XuYlcWX8rJmwJ6vJcr7yItwhSv7F/o4GQ25Xo+4Xm6p+x1azg
         Wr73HkIMD0sBaoB/htir40QnoQOrW2Bp0ruDNwRghs0SweKjH4RPEAyzDmtdsajwul2b
         8dTSD01VhqrqcYa6Sl1Bg8gEecZVJK8ggBPYN1/YONBukbCtJ0Thr9h0cSuBf5D6jmJA
         mI5eO88qtZITL4va8bNAoUw5vu3pTWgcE/Z625UvoDQ4QGqfoqV+bArLaeyaGSHi05yC
         oS+od2CL1fnGYxOeUxoyPWiCH3t/tnO0vCzR4hkU3GvGHpb6HDYlZrs3quMqMLLpPml7
         Uixg==
X-Gm-Message-State: AOAM531CXLmtIe34/adt2SltDErcGe1TWi65G41pGZTVdTB4+ozVkQqW
        DQgYck8Vt27AkEXYarvLGw==
X-Google-Smtp-Source: ABdhPJw4/5gXHlRhCLR6H+bmHa3XmOMLzdwLZrFeDUAOJtrrf0tETU3GzM5HQDG/rPU0Swpi08bOfg==
X-Received: by 2002:a9d:17ed:: with SMTP id j100mr17375162otj.169.1612894513667;
        Tue, 09 Feb 2021 10:15:13 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k67sm3069817oia.7.2021.02.09.10.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 10:15:12 -0800 (PST)
Received: (nullmailer pid 4073574 invoked by uid 1000);
        Tue, 09 Feb 2021 18:15:10 -0000
Date:   Tue, 9 Feb 2021 12:15:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, kishon@ti.com, vkoul@kernel.org
Subject: Re: [PATCH v3 09/14] drm/bridge: imx: Add i.MX8qxp pixel link to DPI
 support
Message-ID: <20210209181510.GA4045547@robh.at.kernel.org>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
 <1611737488-2791-10-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1611737488-2791-10-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 27, 2021 at 04:51:23PM +0800, Liu Ying wrote:
> This patch adds a drm bridge driver for i.MX8qxp pixel link to display
> pixel interface(PXL2DPI).  The PXL2DPI interfaces the pixel link 36-bit
> data output and the DSI controller’s MIPI-DPI 24-bit data input, and
> inputs of LVDS Display Bridge(LDB) module used in LVDS mode, to remap
> the pixel color codings between those modules. The PXL2DPI is purely
> combinatorial.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Call syscon_node_to_regmap() to get regmap instead of
>   syscon_regmap_lookup_by_phandle().
> 
> v1->v2:
> * Drop unnecessary port availability check.
> 
>  drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 488 +++++++++++++++++++++++++++
>  3 files changed, 497 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

> +	p2d->regmap = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(p2d->regmap)) {
> +		ret = PTR_ERR(p2d->regmap);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	p2d->id = of_alias_get_id(np, "pxl2dpi");

Don't add random aliases. I'd rather see a property in this node as long 
as it is specific to what this is used for (and not a generic index).

Rob
