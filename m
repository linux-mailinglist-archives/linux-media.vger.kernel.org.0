Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAAC34CDF46
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 22:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiCDUj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 15:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbiCDUj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 15:39:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9875223202;
        Fri,  4 Mar 2022 12:39:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50BE8488;
        Fri,  4 Mar 2022 21:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646426344;
        bh=ZIuThvSZPzhbGihMWYqk3C4SO7ZPtUV/E+CxcbLn4Qo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YxOqaTCUyYQUK62QuKxr5yixlwXC047ZqtevzH0bGabLVZ/AhSiiYFdc/X3KaloP3
         +sZTcipbLTPyWSGlPY2JkIHdrqdTbHB//lsVTss8Hk1B7OeUqaEl+EVbP4/AK3I1SB
         zPBl5iw95+TLi9SQWo67sdj8EsHCPHYh8rxMicJI=
Date:   Fri, 4 Mar 2022 22:38:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2
 mem2mem driver
Message-ID: <YiJ421P+77nHr7uk@pendragon.ideasonboard.com>
References: <20220304202813.2560202-1-xavier.roumegue@oss.nxp.com>
 <20220304202813.2560202-4-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304202813.2560202-4-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier,

Thank you for the patch.

On Fri, Mar 04, 2022 at 09:28:13PM +0100, Xavier Roumegue wrote:
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>

Thank you for volunteering to maintain the driver :-)

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 70cd8a1c9495..f0ecca116786 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14120,6 +14120,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:	drivers/media/platform/imx-jpeg
>  
> +NXP i.MX 8MP DW100 V4L2 DRIVER
> +M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
> +F:	drivers/media/platform/dw100

Jacopo has created a drivers/media/platform/imx/ directory in the patch
series that destages the MIPI CSIS driver, it could make sense to move
this driver there too. Let's discuss that in the review of 2/3. With the
path updated as needed based on the outcome of the discussion,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
>  M:	Jonas Malaco <jonas@protocubo.io>
>  L:	linux-hwmon@vger.kernel.org

-- 
Regards,

Laurent Pinchart
