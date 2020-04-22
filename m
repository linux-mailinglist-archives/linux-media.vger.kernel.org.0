Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C731B46FE
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 16:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgDVORV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 10:17:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:47258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbgDVORV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 10:17:21 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69BCF2082E;
        Wed, 22 Apr 2020 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587565040;
        bh=3XyMiO58tkBmuFFgW/JuwJp9j9QkgsWQPIBbMEn9+jI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Jt9wSdWFgyiouWq3aolIv1+z39hj/Gqhx7GM4gJPoQxQRO5l+4j3xvhPSaZhtgNZy
         3HM9++YGkleBe4u2JZz+3c7iPyo3EnsdGwDDzmBi96GlFLR3iArXpaLLLHbCxrpsvd
         OuRlcEMA1DcHar0Pgk9vXWrVBmpIdnO9jmBfuq0s=
Date:   Wed, 22 Apr 2020 16:17:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Jonker <jbx6244@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: reorder media attributes
Message-ID: <20200422161716.0c3565ab@coco.lan>
In-Reply-To: <5c98639814988647e6da17cf0d9ad905077219c4.1587564297.git.mchehab+huawei@kernel.org>
References: <5c98639814988647e6da17cf0d9ad905077219c4.1587564297.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 22 Apr 2020 16:05:01 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Some media entry attributes got out of the order after the
> bug was split into 3. Also, as reported by Johan, the
> Rockchip VPU entry also had their attributes at the wrong
> order.
> 
> As those entries weren't merged yet upstream, let's reorder
> them with:
> 
> 	./scripts/parse-maintainers.pl --input=MAINTAINERS --output=MAINTAINERS --order
> 
> Reported-by: Johan Jonker <jbx6244@gmail.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

In time: I'm doing this just because the main media entries
have fields out of order. Updating it while not too late has
the advantage that a future eventual field reorder should not
affect the MEDIA and DOC subsystem MAINTAINERS entries.

While I appreciate patch reviews mentioning out of order fields
to developers, I don't intend myself to actively look at 
MAINTAINERS field ordering, nor I intend to spend time reviewing
janitorial patches that are just reordering things there, except
a change breaks checkpatch or get_maintainers.

> ---
>  MAINTAINERS | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c03e6a2ad27..d633a131dcd7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5125,14 +5125,14 @@ F:	scripts/documentation-file-ref-check
>  F:	scripts/kernel-doc
>  F:	scripts/sphinx-pre-install
>  X:	Documentation/ABI/
> +X:	Documentation/admin-guide/media/
>  X:	Documentation/devicetree/
> +X:	Documentation/driver-api/media/
>  X:	Documentation/firmware-guide/acpi/
>  X:	Documentation/i2c/
> -X:	Documentation/admin-guide/media/
> -X:	Documentation/userspace-api/media/
> -X:	Documentation/driver-api/media/
>  X:	Documentation/power/
>  X:	Documentation/spi/
> +X:	Documentation/userspace-api/media/
>  
>  DOCUMENTATION SCRIPTS
>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
> @@ -8654,9 +8654,9 @@ INTEL IPU3 CSI-2 IMGU DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
>  F:	Documentation/admin-guide/media/ipu3.rst
>  F:	Documentation/admin-guide/media/ipu3_rcb.svg
> +F:	Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
>  F:	drivers/staging/media/ipu3/
>  
>  INTEL IXP4XX QMGR, NPE, ETHERNET and HSS SUPPORT
> @@ -10453,8 +10453,8 @@ M:	Philipp Zabel <p.zabel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/imx.txt
>  F:	Documentation/admin-guide/media/imx.rst
> +F:	Documentation/devicetree/bindings/media/imx.txt
>  F:	drivers/staging/media/imx/
>  F:	include/linux/imx-media.h
>  F:	include/media/imx.h
> @@ -10464,9 +10464,9 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/admin-guide/media/imx7.rst
>  F:	Documentation/devicetree/bindings/media/imx7-csi.txt
>  F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> -F:	Documentation/admin-guide/media/imx7.rst
>  F:	drivers/staging/media/imx/imx7-media-csi.c
>  F:	drivers/staging/media/imx/imx7-mipi-csis.c
>  
> @@ -10612,10 +10612,10 @@ S:	Maintained
>  W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/admin-guide/media/
>  F:	Documentation/devicetree/bindings/media/
> -X:	Documentation/admin-guide/media/
> -F:	Documentation/userspace-api/media/
>  F:	Documentation/driver-api/media/
> +F:	Documentation/userspace-api/media/
>  F:	drivers/media/
>  F:	drivers/staging/media/
>  F:	include/linux/platform_data/media/
> @@ -13962,8 +13962,8 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
>  M:	Todor Tomov <todor.too@gmail.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/qcom,camss.txt
>  F:	Documentation/admin-guide/media/qcom_camss.rst
> +F:	Documentation/devicetree/bindings/media/qcom,camss.txt
>  F:	drivers/media/platform/qcom/camss/
>  
>  QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
> @@ -14485,8 +14485,8 @@ M:	Ezequiel Garcia <ezequiel@collabora.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
> -F:	drivers/staging/media/rkvdec/
>  F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +F:	drivers/staging/media/rkvdec/
>  
>  ROCKER DRIVER
>  M:	Jiri Pirko <jiri@resnulli.us>



Thanks,
Mauro
