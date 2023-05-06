Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C546F9181
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 13:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjEFLZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 07:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjEFLZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 07:25:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8608A53
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 04:25:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 060CB800;
        Sat,  6 May 2023 13:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683372338;
        bh=5xp3qkOUDLOuWBfhzC0MV/kg6Es/hdIT6AcQEYzN06Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jd8J4TgrxIelK9d8CQScalN/vpc++wHwA30HE1XokqHx1HrVzbavaa8XxTN5AmLQB
         O4HQgeg2pRY/RUyjIfjCQFDd/9FOmagHbwo/2SaoyluRbqi3JE7dEPB7kgIpVGCLqo
         aP5pKav2RFeOvciEmeCBfS0Uly+Cel6NhMqvvhfs=
Date:   Sat, 6 May 2023 14:25:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 2/3] media: Documentation: Rename meta format files
Message-ID: <20230506112555.GB17474@pendragon.ideasonboard.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
 <20230505205101.54569-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505205101.54569-3-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, May 05, 2023 at 11:51:00PM +0300, Sakari Ailus wrote:
> Rename meta format files, using "metafmt" prefix instead of "pixfmt-meta".
> These are metadata formats, not pixel formats.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Bingbu Cao <bingbu.cao@intel.com>
> Cc: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../userspace-api/media/v4l/meta-formats.rst       | 14 +++++++-------
>  .../v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} |  0
>  ...-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} |  0
>  .../{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} |  0
>  .../v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst}   |  0
>  .../{pixfmt-meta-vivid.rst => metafmt-vivid.rst}   |  0
>  ...xfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} |  0
>  ...xfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} |  0
>  MAINTAINERS                                        |  4 ++--
>  9 files changed, 9 insertions(+), 9 deletions(-)
>  rename Documentation/userspace-api/media/v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} (100%)
>  rename Documentation/userspace-api/media/v4l/{pixfmt-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} (100%)
>  rename Documentation/userspace-api/media/v4l/{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} (100%)
>  rename Documentation/userspace-api/media/v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst} (100%)
>  rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vivid.rst => metafmt-vivid.rst} (100%)
>  rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} (100%)
>  rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} (100%)
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index fff25357fe86..0bb61fc5bc00 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -12,10 +12,10 @@ These formats are used for the :ref:`metadata` interface only.
>  .. toctree::
>      :maxdepth: 1
>  
> -    pixfmt-meta-d4xx
> -    pixfmt-meta-intel-ipu3
> -    pixfmt-meta-rkisp1
> -    pixfmt-meta-uvc
> -    pixfmt-meta-vsp1-hgo
> -    pixfmt-meta-vsp1-hgt
> -    pixfmt-meta-vivid
> +    metafmt-d4xx
> +    metafmt-intel-ipu3
> +    metafmt-rkisp1
> +    metafmt-uvc
> +    metafmt-vsp1-hgo
> +    metafmt-vsp1-hgt
> +    metafmt-vivid
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> similarity index 100%
> rename from Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst
> rename to Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst b/Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
> similarity index 100%
> rename from Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
> rename to Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> similarity index 100%
> rename from Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> rename to Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> similarity index 100%
> rename from Documentation/userspace-api/media/v4l/pixfmt-meta-uvc.rst
> rename to Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst b/Documentation/userspace-api/media/v4l/metafmt-vivid.rst
> similarity index 100%
> rename from Documentation/userspace-api/media/v4l/pixfmt-meta-vivid.rst
> rename to Documentation/userspace-api/media/v4l/metafmt-vivid.rst
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgo.rst b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst
> similarity index 100%
> rename from Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgo.rst
> rename to Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgt.rst b/Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst
> similarity index 100%
> rename from Documentation/userspace-api/media/v4l/pixfmt-meta-vsp1-hgt.rst
> rename to Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e25ebb7c781b..546826109900 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10359,7 +10359,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/admin-guide/media/ipu3.rst
>  F:	Documentation/admin-guide/media/ipu3_rcb.svg
> -F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
> +F:	Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
>  F:	drivers/staging/media/ipu3/
>  
>  INTEL IXP4XX CRYPTO SUPPORT
> @@ -18026,7 +18026,7 @@ L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/admin-guide/media/rkisp1.rst
>  F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> -F:	Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> +F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
>  F:	drivers/media/platform/rockchip/rkisp1
>  F:	include/uapi/linux/rkisp1-config.h
>  

-- 
Regards,

Laurent Pinchart
