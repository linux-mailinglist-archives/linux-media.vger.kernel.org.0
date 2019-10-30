Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D0AE9C66
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 14:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfJ3NeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 09:34:15 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42422 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfJ3NeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 09:34:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDYDge120315;
        Wed, 30 Oct 2019 08:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572442453;
        bh=riPq1EjtRAH4k2brd9erciAO5pC1LvIMZqcdS/NknfM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=gdmK7b/f9xsSEWH04DxtPVar7CK2ysklueV9IOK1ZpYDffekDLkk5BsSyq6tcSK+g
         z7CnfVAcJeoIXjklxapgvhodvfgCdJ7isEFFqcW/d72iEngxGF+WiGDx8dmuo1FtGD
         KADbjuHRe3H1uwrYpM/rNPkl3g/9tKEYPl+/FvBM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UDYD9N117904
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 08:34:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 08:34:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 08:34:00 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x9UDYCc1028496;
        Wed, 30 Oct 2019 08:34:12 -0500
Date:   Wed, 30 Oct 2019 08:34:12 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 03/19] media: ti-vpe: cal: Add per platform data support
Message-ID: <20191030133412.un4w25qpn3usmcnw@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-4-bparrot@ti.com>
 <20191029131855.GA27597@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191029131855.GA27597@bogus>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rob Herring <robh@kernel.org> wrote on Tue [2019-Oct-29 08:18:55 -0500]:
> On Fri, Oct 18, 2019 at 10:34:21AM -0500, Benoit Parrot wrote:
> > First this patch adds a method to access the CTRL_CORE_CAMERRX_CONTROL
> > register to use the syscon mechanism. For backward compatibility we also
> > handle using the existing camerrx_control "reg" entry if a syscon node
> > is not found.
> > 
> > In addition the register bit layout for the CTRL_CORE_CAMERRX_CONTROL
> > changes depending on the device. In order to support this we need to use
> > a register access scheme based on data configuration instead of using
> > static macro.
> > 
> > In this case we make use of the regmap facility and create data set
> > based on the various device and phy available.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 281 +++++++++++++++++++++-------
> >  1 file changed, 212 insertions(+), 69 deletions(-)
> 
> 
> > @@ -1816,6 +1911,18 @@ static int cal_probe(struct platform_device *pdev)
> >  	if (!dev)
> >  		return -ENOMEM;
> >  
> > +	match = of_match_device(of_match_ptr(cal_of_match), &pdev->dev);
> 
> Use of_device_get_match_data() instead.

Ok I'll change that.

> 
> > +	if (!match)
> > +		return -ENODEV;
> > +
> > +	if (match->data) {
> > +		dev->data = (struct cal_data *)match->data;
> > +		dev->flags = dev->data->flags;
> > +	} else {
> > +		dev_err(&pdev->dev, "Could not get feature data based on compatible version\n");
> > +		return -ENODEV;
> > +	}
> > +
> >  	/* set pseudo v4l2 device name so we can use v4l2_printk */
> >  	strscpy(dev->v4l2_dev.name, CAL_MODULE_NAME,
> >  		sizeof(dev->v4l2_dev.name));
> > @@ -1823,6 +1930,43 @@ static int cal_probe(struct platform_device *pdev)
> >  	/* save pdev pointer */
> >  	dev->pdev = pdev;
> >  
> > +	if (parent && of_property_read_bool(parent, "syscon-camerrx")) {
> > +		syscon_camerrx =
> > +			syscon_regmap_lookup_by_phandle(parent,
> > +							"syscon-camerrx");
> > +		if (IS_ERR(syscon_camerrx)) {
> > +			dev_err(&pdev->dev, "failed to get syscon-camerrx regmap\n");
> > +			return PTR_ERR(syscon_camerrx);
> > +		}
> > +
> > +		if (of_property_read_u32_index(parent, "syscon-camerrx", 1,
> > +					       &syscon_camerrx_offset)) {
> 
> Kind of odd to read the property twice and using functions that don't 
> match the type. We have functions to retrieve phandle and args.

Yeah, I wanted to make a distinction between the node being present and
any other kind of errors, so we can have a little more precise error
message.

> 
> > +			dev_err(&pdev->dev, "failed to get syscon-camerrx offset\n");
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		/*
> > +		 * Backward DTS compatibility.
> > +		 * If syscon entry is not present then check if the
> > +		 * camerrx_control resource is present.
> > +		 */
> > +		syscon_camerrx = cal_get_camerarx_regmap(dev);
> > +		if (IS_ERR(syscon_camerrx)) {
> > +			dev_err(&pdev->dev, "failed to get camerrx_control regmap\n");
> > +			return PTR_ERR(syscon_camerrx);
> > +		}
> > +		/* In this case the base already point to the direct
> > +		 * CM register so no need for an offset
> > +		 */
> > +		syscon_camerrx_offset = 0;
> > +	}
> > +
> > +	dev->syscon_camerrx = syscon_camerrx;
> > +	dev->syscon_camerrx_offset = syscon_camerrx_offset;
> > +	ret = cal_camerarx_regmap_init(dev);
> > +	if (ret)
> > +		return ret;
> > +
> >  	dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >  						"cal_top");
> >  	dev->base = devm_ioremap_resource(&pdev->dev, dev->res);
> 
