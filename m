Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E72116331A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 21:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgBRUbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 15:31:55 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37102 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgBRUby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 15:31:54 -0500
Received: by mail-oi1-f195.google.com with SMTP id q84so21512439oic.4;
        Tue, 18 Feb 2020 12:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J/VxJ3xiwdS6/BWNfUPWpgIlaLG5DINnCPtjKZgxKdM=;
        b=to4rJbzvx2eabws6ZIqorBVPxeBvz1PRGBHQrRNnzrPBYB9b8OtUIAGxg4nWCQvMh7
         Rt8zwcB1IjXcMtjJOkSvnwixmoP5lXTe7dnq6PgDXuv7UdXa9/lHhejQ7syN7BJY7FN4
         BQ/ToBs3tzaw3CDnjWyBmxo7RJy2dMPsy3gFcDMgwKDHoxvQ2gOya3UH3ZKHQcN+kqDp
         /qJuZ9B/itpHUcm9eeJ+NtPRyW4kzjukHbbK+T75Ng53AQoI0hfmvlDRZfTVa+vkFisz
         X+LUEYdfRF0GNjrAYSmSg+GKKD07IAPNE83gX4L/aemV4gCsQBYAeP7lLPYB9aA5QTuO
         MzKg==
X-Gm-Message-State: APjAAAUgxRk/6MgwUq8bRHtb/oAIeiVFfzzXXo76aoBpC+h/oR0Q2abI
        KFJw2OG2osp5nhOJRgaXtQ==
X-Google-Smtp-Source: APXvYqz4+tMO0xRMFlD+Nj7EMFcqW+z3eblcWmDWok4aK303S3lbrgXPLQt5ovOmoCv1EkypuhWhDA==
X-Received: by 2002:aca:af50:: with SMTP id y77mr2515745oie.8.1582057913671;
        Tue, 18 Feb 2020 12:31:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y25sm1716518oto.27.2020.02.18.12.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:31:52 -0800 (PST)
Received: (nullmailer pid 19094 invoked by uid 1000);
        Tue, 18 Feb 2020 20:31:51 -0000
Date:   Tue, 18 Feb 2020 14:31:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     matthias.bgg@kernel.org
Cc:     mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de,
        airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        drinkcat@chromium.org, frank-w@public-files.de,
        sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, wens@csie.org,
        linux-mediatek@lists.infradead.org, rdunlap@infradead.org,
        hsinyi@chromium.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 02/13] dt-bindings: display: mediatek: Add mmsys
 binding description
Message-ID: <20200218203151.GA15948@bogus>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213201953.15268-3-matthias.bgg@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 13, 2020 at 09:19:42PM +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MediaTek DRM has a block called mmsys, which sets
> the routing and enables the different blocks.
> This patch adds one line for the mmsys bindings description and changes
> the mmsys description to use the generic form of referring to a specific
> Soc.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
> Changes in v7:
> - add hint to the mmsys binding document
> - make mmsys description generic
> - fix typo in commit message
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  .../bindings/display/mediatek/mediatek,disp.txt          | 3 +++
>  .../bindings/display/mediatek/mediatek,mmsys.txt         | 9 +--------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709db7a4..8e453026ef78 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -24,6 +24,7 @@ connected to.
>  For a description of the display interface sink function blocks, see
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
> +Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt.
>  
>  Required properties (all function blocks):
>  - compatible: "mediatek,<chip>-disp-<function>", one of
> @@ -43,7 +44,9 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" 		- display mutex
>  	"mediatek,<chip>-disp-od"    		- overdrive
> +	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
>    the supported chips are mt2701, mt2712 and mt8173.
> +
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> index 301eefbe1618..7bbadee820e3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> @@ -5,14 +5,7 @@ The Mediatek mmsys controller provides various clocks to the system.
>  
>  Required Properties:
>  
> -- compatible: Should be one of:
> -	- "mediatek,mt2701-mmsys", "syscon"
> -	- "mediatek,mt2712-mmsys", "syscon"
> -	- "mediatek,mt6779-mmsys", "syscon"
> -	- "mediatek,mt6797-mmsys", "syscon"
> -	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"

You've lost this information about the fallback...

> -	- "mediatek,mt8173-mmsys", "syscon"
> -	- "mediatek,mt8183-mmsys", "syscon"
> +- compatible: "mediatek,<chip>-mmsys"

You are just going to have to add these all back when this is converted 
to schema.

Rob
