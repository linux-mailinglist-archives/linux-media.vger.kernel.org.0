Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 283628B409
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 11:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfHMJYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 05:24:03 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51514 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725781AbfHMJYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 05:24:03 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 45371634C88;
        Tue, 13 Aug 2019 12:23:54 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxT21-0000e8-J2; Tue, 13 Aug 2019 12:23:53 +0300
Date:   Tue, 13 Aug 2019 12:23:53 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add entry for IMX290 CMOS image
 sensor driver
Message-ID: <20190813092353.GF835@valkosipuli.retiisi.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806130938.19916-4-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Tue, Aug 06, 2019 at 06:39:38PM +0530, Manivannan Sadhasivam wrote:
> Add MAINTAINERS entry for Sony IMX290 CMOS image sensor driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d0ed735994a5..27e4c1f57b61 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14669,6 +14669,14 @@ S:	Maintained
>  F:	drivers/media/i2c/imx274.c
>  F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
>  
> +SONY IMX290 SENSOR DRIVER
> +M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	drivers/media/i2c/imx290.c
> +F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
> +
>  SONY IMX319 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org

Please put the MAINTAINERS changes to the first patch adding files.

-- 
Sakari Ailus
