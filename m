Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC17E21070B
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 11:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbgGAJAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 05:00:51 -0400
Received: from mga03.intel.com ([134.134.136.65]:49658 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728969AbgGAJAs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 05:00:48 -0400
IronPort-SDR: eYL4jsmg+qsjlNjhkAq3TraECbfKfrZQjTs/Dq8+vVPyPK9yURTUWBERMI7CRO3fsFyHtz9pG3
 X32DaV8di+TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146514040"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="146514040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 02:00:46 -0700
IronPort-SDR: CIaSBSHvgTLeEmOmt1MEf4rcE6RNmN/9/cAISr7Z/nOW5kSJD5SlVNWRjnEUq3UBAg2t1zIM87
 Fkc0J1NC0J7A==
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="scan'208";a="295498778"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 02:00:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E3B1920760; Wed,  1 Jul 2020 12:00:39 +0300 (EEST)
Date:   Wed, 1 Jul 2020 12:00:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200701090039.GM16711@paasikivi.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630170746.GD1212092@chromium.org>
 <20200630184702.GH16711@paasikivi.fi.intel.com>
 <1593593242.17166.48.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593593242.17166.48.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 01, 2020 at 04:47:22PM +0800, Dongchun Zhu wrote:
> Hi Tomasz, Sakari,
> 
> Thanks for the review.
> 
> On Tue, 2020-06-30 at 21:47 +0300, Sakari Ailus wrote:
> > On Tue, Jun 30, 2020 at 05:07:46PM +0000, Tomasz Figa wrote:
> > > Hi Dongchun,
> > > 
> > > On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > 
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  MAINTAINERS                 |    1 +
> > > >  drivers/media/i2c/Kconfig   |   13 +
> > > >  drivers/media/i2c/Makefile  |    1 +
> > > >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 1067 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > 
> > > Thank you for the patch. Please see my comments inline.
> > > 
> > > [snip]
> > > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > > +				   struct v4l2_subdev_pad_config *cfg)
> > > > +{
> > > > +	struct v4l2_subdev_format fmt = {
> > > > +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> > > 
> > > As we discussed before, this function is never called with cfg == NULL.
> > > Perhaps what we need here is to call ov02a10_set_fmt() twice, once for
> > > V4L2_SUBDEV_FORMAT_ACTIVE and then for V4L2_SUBDEV_FORMAT_TRY?
> > > 
> > > Sakari, would that be a proper implementation of this function?
> > 
> > It's fine to test fmt, but it should be only done if the driver calls the
> > function with ACTIVE format. I.e. it can be removed here, and always use
> > TRY.
> > 
> 
> Sorry for my late coming.
> The implementation of this function should be common(similar to
> OV2680/OV5645).
> If it needs to update to be more proper or clear, as user always sets
> format.which to ACTIVE when calling set_fmt, we could only reserve the
> TRY format in init_cfg like this:
> struct v4l2_subdev_format fmt = {
> 	which = V4L2_SUBDEV_FORMAT_TRY,

Yes, please.

-- 
Sakari Ailus
