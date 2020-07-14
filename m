Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EACDA220118
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 01:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgGNXpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 19:45:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47228 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgGNXpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 19:45:44 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C788371D;
        Wed, 15 Jul 2020 01:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594770342;
        bh=Jz/RItS65gNm0Nau/b7WhkSxZEmOqhpnaOTqOfQ97OA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WOrAA2qwvdMD2rW1Y8kD/e6OIRWbhWXAv0HRR5eZ16bqdwjDJwohNoitw5CF9ySNc
         36XYNcyonAxpPIuIq7SXaUv2/lZQujzJNl3rB1OyWa00bTGNha1f+GX78l1NixI3jg
         jePUbCGl+t6Mt3inRXyb6O1fdJdIKHqmRcYA7bqc=
Date:   Wed, 15 Jul 2020 02:45:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: media: i2c: Document
 'remote-endpoint'
Message-ID: <20200714234535.GN5854@pendragon.ideasonboard.com>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200714142856.58365-3-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Jul 14, 2020 at 04:28:55PM +0200, Jacopo Mondi wrote:
> Document the 'remote-endpoint' property and add it to the list of required
> endpoint properties in imx219 and ov8856 dt-schema binding files.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
>  Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> index dfc4d29a4f04..0251e15fe0a7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -71,8 +71,13 @@ properties:
>              description:
>                Allowed data bus frequencies.
>  
> +          remote-endpoint:
> +            description: |-
> +              phandle to the video receiver input port
> +
>          required:
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> index 1956b2a32bf4..c1f363bb5aee 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -84,9 +84,14 @@ properties:
>                Allowed data bus frequencies. 360000000, 180000000 Hz or both
>                are supported by the driver.
>  
> +          remote-endpoint:
> +            description: |-
> +              phandle to the video receiver input port
> +

Extraneous blank line ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>          required:
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint

-- 
Regards,

Laurent Pinchart
