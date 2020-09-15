Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E2626AC40
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 20:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgIOSkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 14:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbgIORhm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 13:37:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C28C06174A;
        Tue, 15 Sep 2020 10:37:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECA7814DF;
        Tue, 15 Sep 2020 19:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600191453;
        bh=8XpEjYtWxpoNmIPz2ytB8NwTWHDpXOMp4QwS1MpdbBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=glQ6s2yMYVYNdIKMBMJtvG7NfwXStJrmVm8xkM+ePw9ylEyUqoK1ElNXoClA8i/ZM
         QK0Nt5QeRdHSfQVoex36hcCX7AwkHWzfZo4AhQgRLGbsQgdCCYPmeKhMaE9b/cQS9Z
         hZFMEarS/1vNxgXztXcARR3l7Zm8t+9o1N/I6Rfo=
Date:   Tue, 15 Sep 2020 20:37:02 +0300
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
Subject: Re: [PATCH 3/3] media: dt-bindings: media: renesas,drif: Add
 r8a77990 support
Message-ID: <20200915173702.GE26029@pendragon.ideasonboard.com>
References: <20200915131216.21137-1-fabrizio.castro.jz@renesas.com>
 <20200915131216.21137-4-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915131216.21137-4-fabrizio.castro.jz@renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Sep 15, 2020 at 02:12:16PM +0100, Fabrizio Castro wrote:
> The r8a77990 (a.k.a. R-Car E3) device tree schema is
> compatible with R-Car H3 and M3-W schema.
> 
> Document r8a77990 support within renesas,drif.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> index f57fccc159d6..051d515be38d 100644
> --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -53,6 +53,7 @@ properties:
>        - enum:
>          - renesas,r8a7795-drif        # R-Car H3
>          - renesas,r8a7796-drif        # R-Car M3-W
> +        - renesas,r8a77990-drif       # R-Car E3
>        - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device
>  
>    reg:

-- 
Regards,

Laurent Pinchart
