Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24CE550767
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiFRXCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiFRXCt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:02:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B67265D;
        Sat, 18 Jun 2022 16:02:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DBC2993;
        Sun, 19 Jun 2022 01:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655593366;
        bh=o3TJXNWjQcfIMct/dccl2nYue0SxKgsQqlrjI0rx5tA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dk5LRhADLbijUcfvy0iZSRySxtJ4nZy2NLzHRHrmdDKaDZ0DhG5QQk1I596HJCQBM
         /Jr6c0A8uPg/84UKirKLZrnvUq2rfzK3vEa3Zm6VaCsBa1tKpao/a+GCR39qla6TJt
         9Pgv3T/4b8lMj+kUBBffnRmIi1ZdMdkJylVVyae0=
Date:   Sun, 19 Jun 2022 02:02:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: mt9p031: Add MT9P006 compatible
 string
Message-ID: <Yq5ZiUK/ZA2AUvNU@pendragon.ideasonboard.com>
References: <20220618222255.478165-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220618222255.478165-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Sun, Jun 19, 2022 at 12:22:54AM +0200, Marek Vasut wrote:
> Add compatible for MT9P006 sensor, which is older variant of MT9P031
> and compatible with this driver.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
> Cc: devicetree@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> index c2ba78116dbbd..1d6af1bf9a6b6 100644
> --- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> @@ -17,6 +17,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - aptina,mt9p006
>        - aptina,mt9p031
>        - aptina,mt9p031m
>  

-- 
Regards,

Laurent Pinchart
