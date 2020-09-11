Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3033B266431
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 18:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgIKQcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 12:32:53 -0400
Received: from mga02.intel.com ([134.134.136.20]:10433 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgIKPSv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 11:18:51 -0400
IronPort-SDR: nzThaXujr+ALgCRhaSW7VKSfyQ96qsG48/iJVKP0U/fwtHYabvnephDxfUdYBfWrCf6qeJmT5R
 QPbp7UEdrRzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146447683"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="146447683"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 06:49:08 -0700
IronPort-SDR: YGXxGEATdN65IN69VmiikoyK2YTR30+O68yZe+59DwGOF1ft0rbD8qiEt2xPK07XTQzomCDuQC
 bjRCn57WG/Vg==
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="378568692"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 06:49:04 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A94202079D; Fri, 11 Sep 2020 16:49:02 +0300 (EEST)
Date:   Fri, 11 Sep 2020 16:49:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Cozma, Andrei" <Andrei.Cozma@analog.com>
Subject: Re: [PATCH 1/2] media: i2c: Add driver for the Analog Devices
 ADDI9036 ToF front-end
Message-ID: <20200911134902.GH26842@paasikivi.fi.intel.com>
References: <20200910162426.55306-1-bogdan.togorean@analog.com>
 <20200910220138.GJ3940@pendragon.ideasonboard.com>
 <DM6PR03MB5274FF37BB02D98691BB43289B240@DM6PR03MB5274.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR03MB5274FF37BB02D98691BB43289B240@DM6PR03MB5274.namprd03.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bogdan,

On Fri, Sep 11, 2020 at 01:32:39PM +0000, Togorean, Bogdan wrote:
> Hi Laurent,
> 
> > Hi Bogdan,
> > 
> > Thank you for the patch.
> 
> Thank you for review!
> 
> > 
> > On Thu, Sep 10, 2020 at 07:24:06PM +0300, Bogdan Togorean wrote:
> > > The ADDI9036 is a complete, 45 MHz, front-end solution for charge
> > > coupled device (CCD) time of flight (TOF) imaging applications.
> > >
> > > It has 2-lane MIPI CSI-2 RAW12 data output and i2c control interface.
> > >
> > > The programming of calibration and firmware is performed by userspace
> > > SDK through CID_USER class IOCTLs.
> > 
> > I'm afraid that's not acceptable. The firmware should be loaded using
> > the Linux kernel firmware API. As for calibration, is it static data ?
> > How is it generated ?
> 
> Calibration data is static data, generated at production and stored on and EEPROM
> memory on camera board. The camera board consists mainly of ADDI9036 processor
> + CCD image sensor + EEPROM.
> 
> The firmware is a set of (address, data) tuples that are written via I2C.
> We want this driver to be a generic one and support all implementations
> of ADDI9036 ToF processor. Now the problem is that some implementations 
> store firmware + calibration on external EEPROM and some store just calibration 
> data on EEPROM and firmware is loaded from a file stored in SDK. With the help 
> of the 2 custom controls we move the camera model detection, firmware
> and calibration fetching from driver to user space SDK.

Can you figure out by reading EEPROM which one of these is the case?
Alternatively you could add a custom DT property IMO.

The calibration data could be loaded using request_firmware(), too. I'd use
a specific directory for just this purpose.

> 
> Also an important point is that the ToF processor has 3 operating modes 
> (near, medium and far). At each mode change a new set of firmware + 
> calibration data is loaded into ADDI9036 chip. If we move the firmware loading
> in driver we would still need a custom enumeration control to select the working mode.

I don't see there being an issue having such a control.

-- 
Kind regards,

Sakari Ailus
