Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9387E1EF967
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 15:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgFENhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 09:37:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:54175 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbgFENhz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 09:37:55 -0400
IronPort-SDR: 544vclPi1AqRxBax253PIy5jzqYODZ92DGAk158/5XFqPk1g4Jhp7rOGP7UpET2mrk/wnJECGU
 IWYKmzsDsIJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 06:37:54 -0700
IronPort-SDR: sEuqSwtS1beAn9U/dor4KFif5mC7H1OQoHPNSGTgH1eIhuIxgbPQgzhOO1jlDprNegKarlDQyT
 nnX93WLEycyA==
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="445895020"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 06:37:50 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0C3BC205D2; Fri,  5 Jun 2020 16:37:48 +0300 (EEST)
Date:   Fri, 5 Jun 2020 16:37:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605133747.GU16711@paasikivi.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605121459.GS16711@paasikivi.fi.intel.com>
 <20200605130212.GA6303@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605130212.GA6303@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 05, 2020 at 01:02:12PM +0000, Tomasz Figa wrote:
> On Fri, Jun 05, 2020 at 03:14:59PM +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> > 
> > Thank you for the update.
> > 
> > On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > control to set the desired focus via IIC serial interface.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                |   1 +
> > >  drivers/media/i2c/Kconfig  |  13 ++
> > >  drivers/media/i2c/Makefile |   1 +
> > >  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 581 insertions(+)
> > >  create mode 100644 drivers/media/i2c/dw9768.c
> [snip]
> > > +static int dw9768_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > > +
> > > +	dw9768_release(dw9768);
> > > +	regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> > > +			       dw9768->supplies);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int dw9768_runtime_resume(struct device *dev)
> > 
> > __maybe_unused for this and the suspend callback.
> >
> 
> These are always used. If runtime PM is disabled, they are called
> explicitly in probe and remove.

Ah, right. Thanks for pointing that out.

-- 
Sakari Ailus
