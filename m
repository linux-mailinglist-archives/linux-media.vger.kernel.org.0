Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEAEA725D73
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 13:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239102AbjFGLlv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 07:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235326AbjFGLlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 07:41:50 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A944F19BB
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686138108; x=1717674108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G+jDRmhlBciX9yE0cuDRtb9cYfuKnCdtiMv1czu2G7I=;
  b=FvJcROgnl1nJOB+1ZhE8R+9aMdzo+larDf5lrBCR7i2mB2fIp4Qbn3xV
   LkMFs6cYmKk8Bxoi4euF1rUlPBBGF9EKkffFVWD6MfBR8wyRuBvSPlIA1
   /so9HPMkswhMdehPraRTkDYrh/UvW8DxEEEImNXpCdorsfFzNuYAK7QBZ
   FCFT8Ot8LQ1FKV+px0/pdmg/I5PO2POfDo0QUZJbOafJcMScuu60KA+gk
   yaavRGAOiKL7eg6yKSRTUeMPea4Zqii0i9Ehhu2c4HUiwoR4p69qFV7pN
   fg3l07og/O+nxBCMSZlDPhqxxuAgEvL/bg4TC98E1xnzVqNswl6cJ5i6l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356973139"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="356973139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 04:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774561343"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="774561343"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 04:41:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5189211FAE0;
        Wed,  7 Jun 2023 14:41:44 +0300 (EEST)
Date:   Wed, 7 Jun 2023 11:41:44 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Message-ID: <ZIBs+PxmG6NJN3/8@kekkonen.localdomain>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <ZIA2ste/694cokGH@kekkonen.localdomain>
 <18c5eed5-e2f0-73ff-3c58-c43223e6f4ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18c5eed5-e2f0-73ff-3c58-c43223e6f4ac@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 07, 2023 at 10:46:58AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 6/7/23 09:50, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thank you for the patchset.
> > 
> > On Tue, Jun 06, 2023 at 06:58:06PM +0200, Hans de Goede wrote:
> >> The CSI2 specification specifies a standard method to access camera sensor
> >> registers called "Camera Control Interface (CCI)".
> >>
> >> This uses either 8 or 16 bit (big-endian wire order) register addresses
> >> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> >>
> >> Currently a lot of Linux camera sensor drivers all have their own custom
> >> helpers for this, often copy and pasted from other drivers.
> >>
> >> Add a set of generic helpers for this so that all sensor drivers can
> >> switch to a single common implementation.
> >>
> >> These helpers take an extra optional "int *err" function parameter,
> >> this can be used to chain a bunch of register accesses together with
> >> only a single error check at the end, rather then needing to error
> >> check each individual register access. The first failing call will
> >> set the contents of err to a non 0 value and all other calls will
> >> then become no-ops.
> >>
> >> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  Documentation/driver-api/media/v4l2-cci.rst  |   5 +
> >>  Documentation/driver-api/media/v4l2-core.rst |   1 +
> >>  drivers/media/v4l2-core/Kconfig              |   5 +
> >>  drivers/media/v4l2-core/Makefile             |   1 +
> >>  drivers/media/v4l2-core/v4l2-cci.c           | 142 +++++++++++++++++++
> >>  include/media/v4l2-cci.h                     | 109 ++++++++++++++
> >>  6 files changed, 263 insertions(+)
> >>  create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
> >>  create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
> >>  create mode 100644 include/media/v4l2-cci.h
> >>
> >> diff --git a/Documentation/driver-api/media/v4l2-cci.rst b/Documentation/driver-api/media/v4l2-cci.rst
> >> new file mode 100644
> >> index 000000000000..dd297a40ed20
> >> --- /dev/null
> >> +++ b/Documentation/driver-api/media/v4l2-cci.rst
> >> @@ -0,0 +1,5 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +V4L2 CCI kAPI
> >> +^^^^^^^^^^^^^
> >> +.. kernel-doc:: include/media/v4l2-cci.h
> >> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
> >> index 1a8c4a5f256b..239045ecc8f4 100644
> >> --- a/Documentation/driver-api/media/v4l2-core.rst
> >> +++ b/Documentation/driver-api/media/v4l2-core.rst
> >> @@ -22,6 +22,7 @@ Video4Linux devices
> >>      v4l2-mem2mem
> >>      v4l2-async
> >>      v4l2-fwnode
> >> +    v4l2-cci
> >>      v4l2-rect
> >>      v4l2-tuner
> >>      v4l2-common
> >> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> >> index 348559bc2468..523ba243261d 100644
> >> --- a/drivers/media/v4l2-core/Kconfig
> >> +++ b/drivers/media/v4l2-core/Kconfig
> >> @@ -74,6 +74,11 @@ config V4L2_FWNODE
> >>  config V4L2_ASYNC
> >>  	tristate
> >>  
> >> +config V4L2_CCI
> >> +	tristate
> >> +	depends on I2C
> >> +	select REGMAP_I2C
> >> +
> >>  # Used by drivers that need Videobuf modules
> >>  config VIDEOBUF_GEN
> >>  	tristate
> >> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> >> index 41d91bd10cf2..be2551705755 100644
> >> --- a/drivers/media/v4l2-core/Makefile
> >> +++ b/drivers/media/v4l2-core/Makefile
> >> @@ -25,6 +25,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
> >>  # (e. g. LC_ALL=C sort Makefile)
> >>  
> >>  obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
> >> +obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
> >>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
> >>  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> >>  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> >> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> >> new file mode 100644
> >> index 000000000000..21207d137dbe
> >> --- /dev/null
> >> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> >> @@ -0,0 +1,142 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * MIPI Camera Control Interface (CCI) register access helpers.
> >> + *
> >> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> >> + */
> >> +
> >> +#include <linux/delay.h>
> >> +#include <linux/dev_printk.h>
> >> +#include <linux/module.h>
> >> +#include <linux/regmap.h>
> >> +
> >> +#include <media/v4l2-cci.h>
> >> +
> >> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
> >> +{
> >> +	int i, len, ret;
> > 
> > Could i and len be unsigned?
> 
> Andy suggested replacing the for-loop below with:
> 
> 	switch (len)
> 	case 1:
> 		*val = buf[0];
> 		break;
> 	case 2:
> 		*val = get_unaligned_be16(buf);
> 		break;
> 	case 3:
> 		*val = __get_unaligned_be24(buf);
> 		break;
> 	case 4:
> 		*val = get_unaligned_be32(buf);
> 		break;
> 	}
> 
> Then i goes away. What do you think about doing it like
> this instead ?

I'll reply to discussion there.

> 
> > 
> >> +	u8 buf[4];
> >> +
> >> +	if (err && *err)
> >> +		return *err;
> >> +
> >> +	/* Set len to register width in bytes */
> >> +	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> >> +	reg &= CCI_REG_ADDR_MASK;
> >> +
> >> +	ret = regmap_bulk_read(map, reg, buf, len);
> >> +	if (ret) {
> >> +		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
> >> +		if (err)
> >> +			*err = ret;
> >> +
> >> +		return ret;
> >> +	}
> >> +
> >> +	*val = 0;
> >> +	for (i = 0; i < len; i++) {
> >> +		*val <<= 8;
> >> +		*val |= buf[i];
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(cci_read);
> >> +
> >> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
> >> +{
> >> +	int i, len, ret;
> > 
> > Same here.
> > 
> >> +	u8 buf[4];
> >> +
> >> +	if (err && *err)
> >> +		return *err;
> >> +
> >> +	/* Set len to register width in bytes */
> >> +	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> >> +	reg &= CCI_REG_ADDR_MASK;
> >> +
> >> +	for (i = 0; i < len; i++) {
> >> +		buf[len - i - 1] = val & 0xff;
> >> +		val >>= 8;
> >> +	}
> >> +
> >> +	ret = regmap_bulk_write(map, reg, buf, len);
> >> +	if (ret) {
> >> +		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
> >> +		if (err)
> >> +			*err = ret;
> >> +	}
> >> +
> >> +	return ret;
> >> +}
> >> +EXPORT_SYMBOL_GPL(cci_write);
> >> +
> >> +int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err)
> >> +{
> >> +	int width, ret;
> >> +	u32 readval;
> >> +
> >> +	if (err && *err)
> >> +		return *err;
> >> +
> >> +	/*
> >> +	 * For single byte updates use regmap_update_bits(), this uses
> >> +	 * the regmap-lock to protect against other read-modify-writes racing.
> >> +	 */
> >> +	width = (reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT;
> >> +	if (width == cci_reg_8) {
> >> +		reg &= CCI_REG_ADDR_MASK;
> >> +		ret = regmap_update_bits(map, reg, mask, val);
> >> +		if (ret) {
> >> +			dev_err(regmap_get_device(map), "Error updating reg 0x%4x: %d\n", reg, ret);
> >> +			if (err)
> >> +				*err = ret;
> >> +		}
> >> +
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = cci_read(map, reg, &readval, err);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	val = (readval & ~mask) | (val & mask);
> >> +
> >> +	return cci_write(map, reg, val, err);
> >> +}
> >> +EXPORT_SYMBOL_GPL(cci_update_bits);
> >> +
> >> +int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err)
> >> +{
> >> +	int i, ret;

	    ^

I should be unsigned here. As well as num_regs.

> >> +
> >> +	if (err && *err)
> >> +		return *err;
> >> +
> >> +	for (i = 0; i < num_regs; i++) {
> >> +		ret = cci_write(map, regs[i].reg, regs[i].def, err);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		if (regs[i].delay_us)
> >> +			fsleep(regs[i].delay_us);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
> >> +
> >> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
> >> +{
> >> +	struct regmap_config config = {
> >> +		.reg_bits = reg_addr_bits,
> >> +		.val_bits = 8,
> >> +		.reg_format_endian = REGMAP_ENDIAN_BIG,
> >> +	};
> >> +
> >> +	return devm_regmap_init_i2c(client, &config);
> >> +}
> >> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
> > 
> > Bulk write functions would be nice, too: CCI does not limit access to
> > register-like targets.
> 
> For bulk writing encoding the register width into the address
> makes no sense, so we would need to specify in the documentation
> that only raw register addresses are accepted and that the write
> is always done in bytes.
> 
> At which point we are basically adding a 1:1 wrapper around
> regmap_bulk_write(). So I think it would be better for sensor
> drivers which need this to just use regmap_bulk_write()
> directly.

Ah, good point. The first argument is indeed the regmap map.

-- 
Kind regards,

Sakari Ailus
