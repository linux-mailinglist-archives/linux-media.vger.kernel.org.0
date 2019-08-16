Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C58178FD29
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 10:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfHPIHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 04:07:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35466 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfHPIHS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 04:07:18 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E2DC2AF;
        Fri, 16 Aug 2019 10:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565942837;
        bh=SOfhEHdWH70k70iQPLE4Q4YVBOjq86mN8eCP7JtboaU=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=mj3tKWhW326d9LBSsYpxP8lmjYzRd7AGQ/3CZnF/BIwBZRHUbaY3ULPc0KwRyEntQ
         chMpGacEJq8SUuc1Bml75gPhjjIJcdsm3W3Q88Uo3eP9KdRNftWi3WfU5fmC0XmkNx
         BZqK2pePSh8FmSDLwXIDRe8JpoDK9wuWpO0hSjow=
Subject: Re: [PATCH v2] v4l: rcar-fcp: Read IP version register at probe time
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190814145417.30670-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <c203bb23-c8f3-ce10-fc15-454083e39ebc@ideasonboard.com>
Date:   Fri, 16 Aug 2019 09:07:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814145417.30670-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 14/08/2019 15:54, Laurent Pinchart wrote:
> This helps identifying the IP core version, for debugging purpose only
> for now.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Use devm_platform_ioremap_resource()
> ---
>  drivers/media/platform/rcar-fcp.c | 41 +++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
> index 43c78620c9d8..6e0c0e7c0f8c 100644
> --- a/drivers/media/platform/rcar-fcp.c
> +++ b/drivers/media/platform/rcar-fcp.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> @@ -21,11 +22,38 @@
>  struct rcar_fcp_device {
>  	struct list_head list;
>  	struct device *dev;
> +	void __iomem *iomem;
>  };
>  
>  static LIST_HEAD(fcp_devices);
>  static DEFINE_MUTEX(fcp_lock);
>  
> +#define FCP_VCR			0x0000
> +#define FCP_VCR_CATEGORY_MASK	(0xff << 8)
> +#define FCP_VCR_CATEGORY_SHIFT	8
> +#define FCP_VCR_REVISION_MASK	(0xff << 0)
> +#define FCP_VCR_REVISION_SHIFT	0
> +
> +#define FCP_CFG0		0x0004
> +#define FCP_RST			0x0010
> +#define FCP_STA			0x0018
> +#define FCP_TL_CTRL		0x0070
> +#define FCP_PICINFO1		0x00c4
> +#define FCP_BA_ANC_Y0		0x0100
> +#define FCP_BA_ANC_Y1		0x0104
> +#define FCP_BA_ANC_Y2		0x0108
> +#define FCP_BA_ANC_C		0x010c
> +#define FCP_BA_REF_Y0		0x0110
> +#define FCP_BA_REF_Y1		0x0114
> +#define FCP_BA_REF_Y2		0x0118
> +#define FCP_BA_REF_C		0x011c

Do we need to pull in all these extra register definitions just to read
the version?

They don't hurt if they're for something else later...


Otherwise,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> +
> +
> +static inline u32 rcar_fcp_read(struct rcar_fcp_device *fcp, u32 reg)
> +{
> +	return ioread32(fcp->iomem + reg);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Public API
>   */
> @@ -129,6 +157,7 @@ EXPORT_SYMBOL_GPL(rcar_fcp_disable);
>  static int rcar_fcp_probe(struct platform_device *pdev)
>  {
>  	struct rcar_fcp_device *fcp;
> +	u32 version;
>  
>  	fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
>  	if (fcp == NULL)
> @@ -138,6 +167,18 @@ static int rcar_fcp_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(&pdev->dev);
>  
> +	fcp->iomem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(fcp->iomem))
> +		return PTR_ERR(fcp->iomem);
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +	version = rcar_fcp_read(fcp, FCP_VCR);
> +	pm_runtime_put(&pdev->dev);
> +
> +	dev_dbg(&pdev->dev, "FCP category %u revision %u\n",
> +		(version & FCP_VCR_CATEGORY_MASK) >> FCP_VCR_CATEGORY_SHIFT,
> +		(version & FCP_VCR_REVISION_MASK) >> FCP_VCR_REVISION_SHIFT);
> +
>  	mutex_lock(&fcp_lock);
>  	list_add_tail(&fcp->list, &fcp_devices);
>  	mutex_unlock(&fcp_lock);
> 

