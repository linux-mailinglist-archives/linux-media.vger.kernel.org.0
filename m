Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42194901AA
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 14:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbfHPMeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 08:34:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHPMeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 08:34:23 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C18D2AF;
        Fri, 16 Aug 2019 14:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565958861;
        bh=FO/DP7iZ42D51PUEVRMqIqZPUDSXqO2zWwE8UR3CM7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YJCvkIGZ3aYA9JUg2VcM+VEETyogqb8TzIVtWVHCmAGorfzY8oEZBHzFBSWNkvZ7v
         j/h+QYvIDWaCFm6uz1gT4TdPyMa2yAbHGSdwhrvSV2BFtMAeexoIDoexUNztb6/66J
         UIvLKIYShnc6vC6C4tbP00ZKElQ3M3QKjRN/wBGo=
Date:   Fri, 16 Aug 2019 15:34:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] v4l: rcar-fcp: Read IP version register at probe time
Message-ID: <20190816123417.GF5020@pendragon.ideasonboard.com>
References: <20190814145417.30670-1-laurent.pinchart+renesas@ideasonboard.com>
 <c203bb23-c8f3-ce10-fc15-454083e39ebc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c203bb23-c8f3-ce10-fc15-454083e39ebc@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Fri, Aug 16, 2019 at 09:07:14AM +0100, Kieran Bingham wrote:
> On 14/08/2019 15:54, Laurent Pinchart wrote:
> > This helps identifying the IP core version, for debugging purpose only
> > for now.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Use devm_platform_ioremap_resource()
> > ---
> >  drivers/media/platform/rcar-fcp.c | 41 +++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
> > index 43c78620c9d8..6e0c0e7c0f8c 100644
> > --- a/drivers/media/platform/rcar-fcp.c
> > +++ b/drivers/media/platform/rcar-fcp.c
> > @@ -8,6 +8,7 @@
> >   */
> >  
> >  #include <linux/device.h>
> > +#include <linux/io.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > @@ -21,11 +22,38 @@
> >  struct rcar_fcp_device {
> >  	struct list_head list;
> >  	struct device *dev;
> > +	void __iomem *iomem;
> >  };
> >  
> >  static LIST_HEAD(fcp_devices);
> >  static DEFINE_MUTEX(fcp_lock);
> >  
> > +#define FCP_VCR			0x0000
> > +#define FCP_VCR_CATEGORY_MASK	(0xff << 8)
> > +#define FCP_VCR_CATEGORY_SHIFT	8
> > +#define FCP_VCR_REVISION_MASK	(0xff << 0)
> > +#define FCP_VCR_REVISION_SHIFT	0
> > +
> > +#define FCP_CFG0		0x0004
> > +#define FCP_RST			0x0010
> > +#define FCP_STA			0x0018
> > +#define FCP_TL_CTRL		0x0070
> > +#define FCP_PICINFO1		0x00c4
> > +#define FCP_BA_ANC_Y0		0x0100
> > +#define FCP_BA_ANC_Y1		0x0104
> > +#define FCP_BA_ANC_Y2		0x0108
> > +#define FCP_BA_ANC_C		0x010c
> > +#define FCP_BA_REF_Y0		0x0110
> > +#define FCP_BA_REF_Y1		0x0114
> > +#define FCP_BA_REF_Y2		0x0118
> > +#define FCP_BA_REF_C		0x011c
> 
> Do we need to pull in all these extra register definitions just to read
> the version?
> 
> They don't hurt if they're for something else later...

At least FCP_CFG0 will be used for FCNL. Some of the other registers
could be left out, but I don't think they really hurt either, they don't
take any space in the compiled object.

> Otherwise,
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > +
> > +
> > +static inline u32 rcar_fcp_read(struct rcar_fcp_device *fcp, u32 reg)
> > +{
> > +	return ioread32(fcp->iomem + reg);
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Public API
> >   */
> > @@ -129,6 +157,7 @@ EXPORT_SYMBOL_GPL(rcar_fcp_disable);
> >  static int rcar_fcp_probe(struct platform_device *pdev)
> >  {
> >  	struct rcar_fcp_device *fcp;
> > +	u32 version;
> >  
> >  	fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
> >  	if (fcp == NULL)
> > @@ -138,6 +167,18 @@ static int rcar_fcp_probe(struct platform_device *pdev)
> >  
> >  	pm_runtime_enable(&pdev->dev);
> >  
> > +	fcp->iomem = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(fcp->iomem))
> > +		return PTR_ERR(fcp->iomem);
> > +
> > +	pm_runtime_get_sync(&pdev->dev);
> > +	version = rcar_fcp_read(fcp, FCP_VCR);
> > +	pm_runtime_put(&pdev->dev);
> > +
> > +	dev_dbg(&pdev->dev, "FCP category %u revision %u\n",
> > +		(version & FCP_VCR_CATEGORY_MASK) >> FCP_VCR_CATEGORY_SHIFT,
> > +		(version & FCP_VCR_REVISION_MASK) >> FCP_VCR_REVISION_SHIFT);
> > +
> >  	mutex_lock(&fcp_lock);
> >  	list_add_tail(&fcp->list, &fcp_devices);
> >  	mutex_unlock(&fcp_lock);

-- 
Regards,

Laurent Pinchart
