Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1E1E2019
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 18:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404582AbfJWQEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 12:04:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55548 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390259AbfJWQEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 12:04:00 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NG3vgX112238;
        Wed, 23 Oct 2019 11:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571846637;
        bh=BxhYqfISxxfUd046h/4yDZAHPUSBBOH2lP6gqHi//HM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=GvH++91iQOv52dMzIZkPEqabT24Mcq+7s94V2iaDQwpU1eEH7fLI5/5uEqvkEEbjG
         nO4+okIRng8YoRPsppiiUZecToDFruPH9VqnrG1jtUhiRcHpcaTvCE1NAuiEpaOCt2
         L06s1OfblR/Ortilh+ii7hEQ/t7sZMOn2HFUPlf0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9NG3vGb114740
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Oct 2019 11:03:57 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 11:03:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 11:03:46 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x9NG3txt010695;
        Wed, 23 Oct 2019 11:03:55 -0500
Date:   Wed, 23 Oct 2019 11:03:50 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>
Subject: Re: [Patch 07/19] media: ti-vpe: cal: add CSI2 PHY LDO errata support
Message-ID: <20191023160349.3wsbtwghnixaiewf@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-8-bparrot@ti.com>
 <68dbd926-0e37-93f7-e03e-def4b4146d32@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <68dbd926-0e37-93f7-e03e-def4b4146d32@xs4all.nl>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Mon [2019-Oct-21 12:38:03 +0200]:
> On 10/18/19 5:34 PM, Benoit Parrot wrote:
> > Apply Errata i913 every time the functional clock is enabled.
> > This should take care of suspend/resume case as well.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > Signed-off-by: Jyri Sarha <jsarha@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal.c      | 56 +++++++++++++++++++++++-
> >  drivers/media/platform/ti-vpe/cal_regs.h | 27 ++++++++++++
> >  2 files changed, 82 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 62aeedb705e9..3cbc4dca6de8 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -284,6 +284,13 @@ static struct cal_data dra72x_cal_data = {
> >  	.flags = 0,
> >  };
> >  
> > +static struct cal_data dra72x_es1_cal_data = {
> > +	.csi2_phy_core = dra72x_cal_csi_phy,
> > +	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_csi_phy),
> > +
> > +	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
> > +};
> > +
> >  /*
> >   * there is one cal_dev structure in the driver, it is shared by
> >   * all instances.
> > @@ -569,9 +576,52 @@ static void cal_get_hwinfo(struct cal_dev *dev)
> >  		hwinfo);
> >  }
> >  
> > +/*
> > + *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
> > + *
> > + *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
> > + *   LDOs on the device are disabled if CSI-2 module is powered on
> > + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
> > + *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
> > + *   current draw on the module supply in active mode.
> > + *
> > + *   Errata does not apply when CSI-2 module is powered off
> > + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
> > + *
> > + * SW Workaround:
> > + *	Set the following register bits to disable the LDO,
> > + *	which is essentially CSI2 REG10 bit 6:
> > + *
> > + *		Core 0:  0x4845 B828 = 0x0000 0040
> > + *		Core 1:  0x4845 B928 = 0x0000 0040
> > + */
> > +static void i913_errata(struct cal_dev *dev, unsigned int port)
> > +{
> > +	u32 reg10 = reg_read(dev->cc[port], CAL_CSI2_PHY_REG10);
> > +
> > +	set_field(&reg10, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
> > +		  CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
> > +
> > +	cal_dbg(1, dev, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
> > +	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);
> > +}
> > +
> >  static inline int cal_runtime_get(struct cal_dev *dev)
> 
> I'd drop the 'inline' here. It doesn't seem appropriate anymore since this
> function is now more complex.

Ok I'll fix that

Benoit

> 
> Regards,
> 
> 	Hans
> 
> >  {
> > -	return pm_runtime_get_sync(&dev->pdev->dev);
> > +	int r;
> > +
> > +	r = pm_runtime_get_sync(&dev->pdev->dev);
> > +
> > +	if (dev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
> > +		/*
> > +		 * Apply errata on both port eveytime we (re-)enable
> > +		 * the clock
> > +		 */
> > +		i913_errata(dev, 0);
> > +		i913_errata(dev, 1);
> > +	}
> > +
> > +	return r;
> >  }
> >  
> >  static inline void cal_runtime_put(struct cal_dev *dev)
> > @@ -2071,6 +2121,10 @@ static const struct of_device_id cal_of_match[] = {
> >  		.compatible = "ti,dra72-cal",
> >  		.data = (void *)&dra72x_cal_data,
> >  	},
> > +	{
> > +		.compatible = "ti,dra72-pre-es2-cal",
> > +		.data = (void *)&dra72x_es1_cal_data,
> > +	},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, cal_of_match);
> > diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> > index 68cfc922b422..78d6f015c9ea 100644
> > --- a/drivers/media/platform/ti-vpe/cal_regs.h
> > +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> > @@ -10,6 +10,30 @@
> >  #ifndef __TI_CAL_REGS_H
> >  #define __TI_CAL_REGS_H
> >  
> > +/*
> > + * struct cal_dev.flags possibilities
> > + *
> > + * DRA72_CAL_PRE_ES2_LDO_DISABLE:
> > + *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
> > + *
> > + *   Enabling CSI2 LDO shorts it to core supply. It is crucial the 2 CSI2
> > + *   LDOs on the device are disabled if CSI-2 module is powered on
> > + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x1) or in ULPS (0x4845 B304
> > + *   | 0x4845 B384 [28:27] = 0x2) mode. Common concerns include: high
> > + *   current draw on the module supply in active mode.
> > + *
> > + *   Errata does not apply when CSI-2 module is powered off
> > + *   (0x4845 B304 | 0x4845 B384 [28:27] = 0x0).
> > + *
> > + * SW Workaround:
> > + *	Set the following register bits to disable the LDO,
> > + *	which is essentially CSI2 REG10 bit 6:
> > + *
> > + *		Core 0:  0x4845 B828 = 0x0000 0040
> > + *		Core 1:  0x4845 B928 = 0x0000 0040
> > + */
> > +#define DRA72_CAL_PRE_ES2_LDO_DISABLE BIT(0)
> > +
> >  #define CAL_NUM_CSI2_PORTS		2
> >  
> >  /* CAL register offsets */
> > @@ -71,6 +95,7 @@
> >  #define CAL_CSI2_PHY_REG0		0x000
> >  #define CAL_CSI2_PHY_REG1		0x004
> >  #define CAL_CSI2_PHY_REG2		0x008
> > +#define CAL_CSI2_PHY_REG10		0x028
> >  
> >  /* CAL Control Module Core Camerrx Control register offsets */
> >  #define CM_CTRL_CORE_CAMERRX_CONTROL	0x000
> > @@ -458,6 +483,8 @@
> >  #define CAL_CSI2_PHY_REG1_CLOCK_MISS_DETECTOR_STATUS_SUCCESS		0
> >  #define CAL_CSI2_PHY_REG1_RESET_DONE_STATUS_MASK		GENMASK(29, 28)
> >  
> > +#define CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK		BIT_MASK(6)
> > +
> >  #define CAL_CSI2_PHY_REG2_CCP2_SYNC_PATTERN_MASK		GENMASK(23, 0)
> >  #define CAL_CSI2_PHY_REG2_TRIGGER_CMD_RXTRIGESC3_MASK		GENMASK(25, 24)
> >  #define CAL_CSI2_PHY_REG2_TRIGGER_CMD_RXTRIGESC2_MASK		GENMASK(27, 26)
> > 
> 
