Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F42454BD2
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 18:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239311AbhKQRWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 12:22:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40290 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhKQRWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 12:22:38 -0500
Received: from pendragon.ideasonboard.com (85-76-75-165-nat.elisa-mobile.fi [85.76.75.165])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52CF1E7;
        Wed, 17 Nov 2021 18:19:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637169578;
        bh=i85HkmfsVufd/ppr7LYU9Ftt+cP5kKVfCIqqo3Ckf1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KQ3Uw0AtZuJXpID7xp3NjydkJfLwjlOej/d0InW72YeBX9229aUV0oopeULzOzTFx
         qz2qahSgV++DFvG56+k68h7YAqVHfdqn8I29Ncaggw79MezSkrLCZbkydcG+D4fYV/
         KV/3BQNIrTPAPajhW+3H8HXi3y1m3IBqUpDUaJRY=
Date:   Wed, 17 Nov 2021 19:19:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     rmfrfs@gmail.com, mchehab@kernel.org, robh@kernel.org,
        shawnguo@kernel.org, kernel@pengutronix.de, kernel@puri.sm,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: media: document imx8mq support for
 imx7-csi
Message-ID: <YZU5kEmHGV9JWqZc@pendragon.ideasonboard.com>
References: <20211117092710.3084034-1-martin.kepplinger@puri.sm>
 <20211117092710.3084034-2-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211117092710.3084034-2-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

Thank you for the patch.

On Wed, Nov 17, 2021 at 10:27:10AM +0100, Martin Kepplinger wrote:
> Add the fsl,imx8mq-csi compatible string to the bindings for nxp,imx7-csi
> since the driver explicitly handles that now.

The commit message should describe why a different compatible string is
needed, without mentioning the driver, as DT bindings are not
driver-dependent.

With that fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> index 5922a2795167..4f7b78265336 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - fsl,imx8mq-csi
>            - fsl,imx7-csi
>            - fsl,imx6ul-csi
>        - items:

-- 
Regards,

Laurent Pinchart
