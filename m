Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3941D3612B9
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 21:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbhDOTJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 15:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbhDOTJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 15:09:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE00C061574;
        Thu, 15 Apr 2021 12:09:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3328489A;
        Thu, 15 Apr 2021 21:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618513754;
        bh=gLNtJFaQbvMKXIV6EfSIiSxgJmMNMNgmb7ZCXKlPKzA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=soe2YImbD+oQuc/ikHKUpLz7fKsX5WUx5nI9exzq1UsBjtTKh19PWeEkMp5NMviYD
         af1Y3YrSTX0OpaUN2VeZYb5Gt3ApxFUL0UYHbjpNZrlqVgklPt0NVl3gt0GCLpj+bz
         Ds7GXIcX7hEJb21bBGhV9/gQFtZL8k+/+Z3GTSKw=
Date:   Thu, 15 Apr 2021 22:09:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is
 not mandatory
Message-ID: <YHiPWPTjWeEQ522E@pendragon.ideasonboard.com>
References: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Tue, Apr 13, 2021 at 05:53:46PM +0200, Niklas Söderlund wrote:
> When converting the binding to use the video-interfaces schemas the node
> port@0 was incorrectly made a mandatory property.
> 
> The port@0 node describes which CSI-2 transmitter the R-Car CSI-2
> receiver is connected too. Not all boards connects all CSI-2 receivers
> to an CSI-2 transmitter.

Ports are properties of the device, they should always be there,
regardless of connections. It's the endpoints that describe connections.

> Fixes: 066a94e28a23e04c ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> index 20396f1be9993461..395484807dd5ed47 100644
> --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> @@ -78,7 +78,6 @@ properties:
>            modules connected the CSI-2 receiver.
>  
>      required:
> -      - port@0
>        - port@1
>  
>  required:

-- 
Regards,

Laurent Pinchart
