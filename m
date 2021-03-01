Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1F1327ADE
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbhCAJfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbhCAJfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 04:35:46 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5797C06174A;
        Mon,  1 Mar 2021 01:35:05 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id b18so8853970wrn.6;
        Mon, 01 Mar 2021 01:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UzfzmhNr6fqvNNH3IVVEESp2qdG+H82QR74dTMPGRL0=;
        b=nZwK3DETy9QkC1dfoEdkPVGGXHBzl/85r6Lz/6JJaLiIf/HNLDAo98WLQe8HDWXpAr
         1pi1Q+rB8ex6UkhRjEBcJGdxgZzFHIJ5pZjkpLKZM+nwylu93G47en0d4s+xUmyhbjr6
         sfv/apSYT4O9++CwgRdfOlNNlXvVEdwmfkTsRncOGNn4FYO0USZQcYFHjQmr5Nlf+sbI
         j5xoY/46DIVG+0WwCnMF/yDvncDGgjk0WsNGtIcu3Kzpz/gOOtWW+mmL+G+VNeOJO1lb
         lQWGmD1Dr2ywe5ILk9IJXgIC0Rrq2gTiFV4PjYaqCTz2s1ULrus2KRlNlnL2CbuxGSCE
         Ncow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UzfzmhNr6fqvNNH3IVVEESp2qdG+H82QR74dTMPGRL0=;
        b=dSoW/pQVQPw5qoWEJC3sCFwsCOi2H+rPzQ6Q7FRehJ7Zk2aGdjqIMsfbiqiZFaj/En
         nrklWLG6x3qOH1CaduNHjtWPvNdSHybn6/EpfwOcuvpWd/6M+WnK4wYVNTwKgdjViTo+
         fjxdouhBXYkUYiCmyqdlezRAdywGgaL3fP4uEkBjj8w908CkWedQX58MjLdOX0Gqpqnh
         RVhkRCpxid/uKzvqVUd/0icbN4/FB2VrBxkcBNbpD523H6b503MzA1TZ93Oq7KTqBh8z
         J+vsiImhyU0GirWjhS9zCbMnszmpZBH0vL7XyaW4BPQanMdBGpi18WdN4K+sXWz56vX5
         RWmA==
X-Gm-Message-State: AOAM532CGWeZXMFJcv9QARymQbl9dwXM8jn5JlIyqaW1mvk5Bh3/+u9q
        LFpaUv+iBFV0lK3Jr8AOnlo=
X-Google-Smtp-Source: ABdhPJxGz8OG3i1Dco2JoIF948GvohaBHR0EgL4+khoxmwBO2FCYr/b7UDnMi7ELOC8sgS5fL1JU3w==
X-Received: by 2002:adf:d236:: with SMTP id k22mr8668844wrh.144.1614591304504;
        Mon, 01 Mar 2021 01:35:04 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v1sm21388186wmj.31.2021.03.01.01.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 01:35:04 -0800 (PST)
Date:   Mon, 1 Mar 2021 09:35:02 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 61/77] dt-bindings: media: nxp,imx7-mipi-csi2: Expand
 descriptions
Message-ID: <20210301093502.l3vo6y2nn7viox5r@arch-thunder.localdomain>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-62-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-62-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Mon, Feb 15, 2021 at 06:27:25AM +0200, Laurent Pinchart wrote:
> Expand the description of the binding itself and of individual
> properties to include additional information that may not be immediately
> appartent from reading the reference manual. Drop the last sentence of
> the phy-supply description that refers to the driver's implementation.
> 
> While at it, fix the capitalization of MIPI CSI-2 in the title.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

For the descriptions changes, LGTM.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> index 76fcc8d80ee3..471a5bf7eb76 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> @@ -4,14 +4,19 @@
>  $id: http://devicetree.org/schemas/media/nxp,imx7-mipi-csi2.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NXP i.MX7 Mipi CSI2
> +title: NXP i.MX7 MIPI CSI-2 receiver
>  
>  maintainers:
>    - Rui Miguel Silva <rmfrfs@gmail.com>
>  
> -description: |
> -  This is the device node for the MIPI CSI-2 receiver core in i.MX7 soc. It is
> -  compatible with previous version of samsung d-phy.
> +description: |-
> +  The NXP i.MX7 SoC family includes a MIPI CSI-2 receiver IP core, documented
> +  as "CSIS V3.3". The IP core seems to originate from Samsung, and may be
> +  compatible with some of the Exynos4 ad S5P SoCs.
> +
> +  While the CSI-2 receiver is separate from the MIPI D-PHY IP core, the PHY is
> +  completely wrapped by the CSIS and doesn't expose a control interface of its
> +  own. This binding thus covers both IP cores.
>  
>  properties:
>    compatible:
> @@ -24,8 +29,10 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    minItems: 3
> -    maxItems: 3
> +    items:
> +      - description: The peripheral clock (a.k.a. APB clock)
> +      - description: The external clock (optionally used as the pixel clock)
> +      - description: The MIPI D-PHY clock
>  
>    clock-names:
>      items:
> @@ -37,16 +44,14 @@ properties:
>      maxItems: 1
>  
>    phy-supply:
> -    description:
> -      Phandle to a regulator that provides power to the PHY. This
> -      regulator will be managed during the PHY power on/off sequence.
> +    description: The MIPI D-PHY digital power supply
>  
>    resets:
> -    maxItems: 1
> +    items:
> +      - description: MIPI D-PHY slave reset
>  
>    clock-frequency:
> -    description:
> -      The IP main (system bus) clock frequency in Hertz
> +    description: The desired external clock ("wrap") frequency, in Hz
>      default: 166000000
>  
>    ports:
> -- 
> Regards,
> 
> Laurent Pinchart
> 
