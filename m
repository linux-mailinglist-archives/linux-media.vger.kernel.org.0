Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5F4510B40
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 23:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355424AbiDZVaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 17:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351224AbiDZVay (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 17:30:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DB432EDB;
        Tue, 26 Apr 2022 14:27:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84A02E5;
        Tue, 26 Apr 2022 23:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1651008462;
        bh=BDH3BcCRfjnP1eJEMtFNlFeFl0ncgfQ9+iUtAYA4PUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CeVAkOuz2i2S7/iDrJqVGM+T3Lf5tCT7qF8+v9cCuuZk9o6u4lsqQIlWxThEFx4mi
         A6RjHnkMzEUqoQ/Qx5Uu5ktBjtS6x2na4iuc9Zh0V9gdHs7MYFkFvX9Mkr0u34yv9x
         Qcy8rXJ7auP0Z597VJUjqTh0EQpgmKP3T1rv6m2o=
Date:   Wed, 27 Apr 2022 00:27:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 9/9] media: MAINTAINERS: add entry for i.MX8MP DW100
 v4l2 mem2mem driver
Message-ID: <YmhjzsNtMcX6D6tt@pendragon.ideasonboard.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-10-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328141309.177611-10-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

Thank you for the patch.

On Mon, Mar 28, 2022 at 04:13:09PM +0200, Xavier Roumegue wrote:

A commit message would be nice.

> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 49d1e43f4a9d..be517babe68e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13932,6 +13932,15 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
>  F:	drivers/nfc/nxp-nci
>  
> +NXP i.MX 8MP DW100 V4L2 DRIVER
> +M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
> +F:	Documentation/userspace-api/media/drivers/dw100.rst
> +F:	drivers/media/platform/nxp/dw100

I'd add a / at the end to make it clear it's a directory.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +F:	include/uapi/linux/dw100.h
> +
>  NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
>  M:	Mirela Rabulea <mirela.rabulea@nxp.com>
>  R:	NXP Linux Team <linux-imx@nxp.com>

-- 
Regards,

Laurent Pinchart
