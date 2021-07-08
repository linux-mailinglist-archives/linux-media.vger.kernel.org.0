Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5F83BF8EA
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 13:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhGHL2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 07:28:47 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33562 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhGHL2q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 07:28:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 168BP8eU062944;
        Thu, 8 Jul 2021 06:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1625743508;
        bh=Nm5PF+zi+CnvnEIK9X8Ur0GOfFhsnJVQA+rpwvJmIYY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=jIxJh+vcs42ss6Wd2ahnU6QWgOMNC0HE+rt7Al24ndBsIdWFopCegdE5hsVUMniVN
         cKGJkaykLzk440G7cEe0NmntGx3WJWxjoreP5xg9qPfGdIG9sqry4iMidVD6Dks6KJ
         6u9SBEY91lAi8i14SOW7D1EDB7pY2w4bBz0CelJE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 168BP8uC088808
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Jul 2021 06:25:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 06:25:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 06:25:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 168BP7CJ040075;
        Thu, 8 Jul 2021 06:25:07 -0500
Date:   Thu, 8 Jul 2021 16:55:06 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>, Benoit Parrot <bparrot@ti.com>,
        Bert Vermeulen <bert@biot.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Qiushi Wu <wu000273@umn.edu>, Raag Jadav <raagjadav@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Zou Wei <zou_wei@huawei.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 00/11] CSI2RX support on J721E
Message-ID: <20210708112504.optj6xzkljrpbwsg@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
 <dd3b13ec-a883-5b22-47ce-d6e591b674aa@ideasonboard.com>
 <20210707185636.xxu6n6p4gihrs37d@ti.com>
 <20210708081919.rlp5xv5f4jbx6uav@uno.localdomain>
 <c7ff2f59-7975-adad-d9dd-d4084eecb65b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c7ff2f59-7975-adad-d9dd-d4084eecb65b@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/07/21 11:43AM, Tomi Valkeinen wrote:
> On 08/07/2021 11:19, Jacopo Mondi wrote:
> > Hi Tomi, Pratyush,
> > 
> > On Thu, Jul 08, 2021 at 12:26:38AM +0530, Pratyush Yadav wrote:
> > > Hi Tomi,
> > > 
> > > Thanks for looking into the patches.
> > > 
> > > On 01/07/21 10:56AM, Tomi Valkeinen wrote:
> > > > Hi Pratyush,
> > > > 
> > > > On 24/06/2021 22:21, Pratyush Yadav wrote:
> > > > > Hi,
> > > > > 
> > > > > This series adds support for CSI2 capture on J721E. It includes some
> > > > > fixes to the Cadence CSI2RX driver, adds runtime PM support to OV5640
> > > > > driver, and finally adds the TI CSI2RX wrapper driver.
> > > > > 
> > > > > This series used to include the DPHY and DMA engine patches as well, but
> > > > > they have been split off to facilitate easier merging. Patch 3 is
> > > > > build-dependent on the DPHY series [0].
> > > > > 
> > > > > The DMA engine patch [1] can go in any order since that is only a run
> > > > > time dependency. Things probably won't work without it but it will still
> > > > > build fine.
> > > > > 
> > > > > Tested on TI's J721E with OV5640 sensor.
> > > > 
> > > > I applied these (csi-2 rx, phy, dma-engine) to linux-media/master, and added dts changes to add the csi2-rx. When sending the series, can you also push the branch you use for testing, as the posted patches do not include everything needed?
> > > 
> > > Please use https://github.com/prati0100/linux-next/ branch "capture"
> > > 
> > > I will include the link in the cover letter from next version onwards.
> > > 
> > > > 
> > > > Here are some notes from quick tests:
> > > > 
> > > > Capture works, but the fps is ~28.98. I would expect it to be closer to 30. Are the clocks configured correctly?
> > > 
> > > I see this as well. I figured this had something to do with the sensor.
> > 
> > Tomi you might remember your patch to change the h/vtot values which I
> > collected in a series which I never managed to bring to v1, as Hugues
> > reported it was broken for JPEG capture.
> > 
> > I'll leave it here just for reference, I admit I dropped the ball
> > rather quickly there:
> > https://patchwork.linuxtv.org/project/linux-media/cover/20201028225706.110078-1-jacopo+renesas@jmondi.org/
> > 
> > I wish I could re-test but seems I've lost the powering cable of the
> > device I used to test ov5640 :(
> 
> Yes, I'm still using my hack patch when working with OV5640. With that hack,
> on TI platforms with CAL IP, I get ~30fps. With this series on J7, I get the
> above mentioned 28.98.
> 
> It's possible my hack patch is wrong, and CAL driver is buggy, but together
> they make things right. I guess I should also try J7 without my hack patch.

I think this is a OV5640 related issue. On IMX219 I am seeing exactly 30 
fps.

> 
> If I recall right, I tested your changes but I couldn't get them to work on
> my HW.
> 
> I haven't worked on that since then, as I decided that debugging blind is
> pointless. We need someone to analyze the signals to see what OV5640 is
> sending. Or some new understanding about the OV5640 HW.
> 
>  Tomi

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
