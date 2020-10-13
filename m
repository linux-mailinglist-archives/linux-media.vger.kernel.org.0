Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11E828D5BA
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 22:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgJMUsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 16:48:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33186 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbgJMUsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 16:48:17 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 466ABB87;
        Tue, 13 Oct 2020 22:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602622095;
        bh=JbyDpaAPAuphVyXU/3ZjAcGlKDaeO2wByBbmG29hO4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bolecuV9yxM7cIwxOiDhjVpZLPczbUNeoYeJobM/q6Wd/KBlwe4QPFiD7TNP51EYQ
         3ZDapUFZ1a5FvuOePr8oNe7y2je7yX1acWAE297yLye4jKe0JSeLgmY0iNW2ZfUbNG
         Y8CMwTwKlq/oupCVjDQRgYDGIX9mpyhNmf6c65fk=
Date:   Tue, 13 Oct 2020 23:47:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 4/5] media: dt-bindings: media: renesas,drif: Add
 r8a77965 support
Message-ID: <20201013204729.GM11939@pendragon.ideasonboard.com>
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com>
 <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Oct 13, 2020 at 04:01:49PM +0100, Fabrizio Castro wrote:
> The r8a77965 (a.k.a. R-Car M3-N) device tree schema is
> compatible with the already documented R-Car Gen3 devices.
> 
> Document r8a77965 support within renesas,drif.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2->v3:
> * New patch
> 
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> index ae50b1448320..89445ddd598e 100644
> --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -53,6 +53,7 @@ properties:
>        - enum:
>          - renesas,r8a7795-drif        # R-Car H3
>          - renesas,r8a7796-drif        # R-Car M3-W
> +        - renesas,r8a77965-drif       # R-Car M3-N
>          - renesas,r8a77990-drif       # R-Car E3
>        - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device
>  

-- 
Regards,

Laurent Pinchart
