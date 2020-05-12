Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A8E1CEFD8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 10:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgELI6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 04:58:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:59966 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbgELI6i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 04:58:38 -0400
IronPort-SDR: eDQZkVKujyhU6W+KSA0yC492clRUQNeCMlPMzF0Jav7i6tSXeNuXIx6dxdjBpzSYJV7+gEi2kP
 THg9TgcVsfQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 01:58:38 -0700
IronPort-SDR: mbALTggVDa0a39QMG47umt49d2JUpyQD+6z3TyGCkjFdzl22VLsup2cGbdp5ICq/recQnaKmNS
 JN5exQ5tdubw==
X-IronPort-AV: E=Sophos;i="5.73,383,1583222400"; 
   d="scan'208";a="286578828"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 01:58:34 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 44834205FC; Tue, 12 May 2020 11:58:32 +0300 (EEST)
Date:   Tue, 12 May 2020 11:58:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200512085832.GI11272@paasikivi.fi.intel.com>
References: <20200502161727.30463-3-dongchun.zhu@mediatek.com>
 <20200506151352.GZ9190@paasikivi.fi.intel.com>
 <1588855524.8804.168.camel@mhfsdcap03>
 <20200507131220.GC9190@paasikivi.fi.intel.com>
 <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
 <1588907288.8804.188.camel@mhfsdcap03>
 <20200508211319.GJ9190@paasikivi.fi.intel.com>
 <1588991026.8804.235.camel@mhfsdcap03>
 <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
 <1589254403.8804.306.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589254403.8804.306.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Tue, May 12, 2020 at 11:33:23AM +0800, Dongchun Zhu wrote:
> Hi Tomasz,
> 
> On Mon, 2020-05-11 at 20:20 +0200, Tomasz Figa wrote:
> > Hi Dongchun,
> > 
> > On Sat, May 9, 2020 at 4:25 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Sakari,
> > >
> > > On Sat, 2020-05-09 at 00:13 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Fri, May 08, 2020 at 11:08:08AM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari, Tomasz,
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > On Thu, 2020-05-07 at 15:46 +0200, Tomasz Figa wrote:
> > > > > > Hi Sakari, Dongchun,
> > > > > >
> > > > > > On Thu, May 7, 2020 at 3:12 PM Sakari Ailus
> > > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > > >
> > > > > > > HI Dongchun,
> > > > > > >
> > > > > > > On Thu, May 07, 2020 at 08:45:24PM +0800, Dongchun Zhu wrote:
> > > > > > > > Hi Sakari,
> > > > > > > >
> > > > > > > > Thanks for the review.
> > > > > > > >
> > > > > > > > On Wed, 2020-05-06 at 18:13 +0300, Sakari Ailus wrote:
> > > > > > > > > Hi Dongchun,
> > > > > > > > >
> > > > > > > > > On Sun, May 03, 2020 at 12:17:27AM +0800, Dongchun Zhu wrote:
> > > > > > > > > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > > > > > > > > control to set the desired focus via IIC serial interface.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > > ---
> > > > > > > > > >  MAINTAINERS                |   1 +
> > > > > > > > > >  drivers/media/i2c/Kconfig  |  11 ++
> > > > > > > > > >  drivers/media/i2c/Makefile |   1 +
> > > > > > > > > >  drivers/media/i2c/dw9768.c | 440 +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > > > >  4 files changed, 453 insertions(+)
> > > > > > > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > > > > > > >
> > > > > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > > > > index 8d72c41..c92dc99 100644
> > > > > > > > > > --- a/MAINTAINERS
> > > > > > > > > > +++ b/MAINTAINERS
> > > > > > > > > > @@ -5157,6 +5157,7 @@ L:  linux-media@vger.kernel.org
> > > > > > > > > >  S:       Maintained
> > > > > > > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > > > > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > > > > > > +F:       drivers/media/i2c/dw9768.c
> > > > > > > > > >
> > > > > > > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > > > > > > >  M:       Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > > > > index 125d596..6a3f9da 100644
> > > > > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > > > > @@ -1040,6 +1040,17 @@ config VIDEO_DW9714
> > > > > > > > > >     capability. This is designed for linear control of
> > > > > > > > > >     voice coil motors, controlled via I2C serial interface.
> > > > > > > > > >
> > > > > > > > > > +config VIDEO_DW9768
> > > > > > > > > > + tristate "DW9768 lens voice coil support"
> > > > > > > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > > > > > > >
> > > > > > > > > Please check how this works in the media tree master branch now --- it's
> > > > > > > > > largely select based.
> > > > > > > > >
> > > > > > > >
> > > > > > > > The actuator driver uses some structures that require the
> > > > > > > > VIDEO_V4L2_SUBDEV_API code, so here we add VIDEO_V4L2_SUBDEV_API
> > > > > > > > dependency to avoid possible build error when it's not enabled.
> > > > > > >
> > > > > > > Please make sure this works with current media tree master. Right now it
> > > > > > > does not.
> > > > > > >
> > > > > >
> > > > > > Dongchun, as Sakari said, please make sure to base the patches on the
> > > > > > master branch of the media tree.
> > > > > > (https://git.linuxtv.org/media_tree.git/). The approach for Kconfig
> > > > > > dependency selection there seems to have changed recently.
> > > > > >
> > > > >
> > > > > I searched the patches on the media tree master branch.
> > > > > It seems that we need to remove the VIDEO_V4L2_SUBDEV_API dependency in
> > > > > Kconfig, and add #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API to include
> > > > > v4l2-subdev code.
> > > > > The change mainly is to make build pass, and don't return ENOTTY if
> > > > > SUBDEV_API is not set.
> > > > > Am I right?
> > > >
> > > > Please see Kconfig entries for other similar drivers from Dongwoon.
> > > >
> > >
> > > Sorry for the mistake :-)
> > > Just found the current media tree master branch code...
> > > I would update Kconfig entries in next release by referring to:
> > > https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/Kconfig
> > 
> > Sorry for last minute comments again. We had a short discussion
> > offline with Sakari and we think there are some changes needed to this
> > driver, namely:
> > 
> > 1) The hardware being driven in our case is a gt9769, which could be
> > compatible with dw9768, but it's still a different implementation and
> > could have slightly different characteristics. Thus we think the
> > driver name and compatible strings should be renamed from
> > dongwoon,dw9768 to giantec,gt9769. In the future, if there is a device

Sorry, I actually meant just the compatible string --- Dongwoon is likely
the original manufacturer. Therefore I'd name the driver according to that,
and just add a second compatible string for the Giantec device.

Either works for me though.

-- 
Regards,

Sakari Ailus
