Return-Path: <linux-media+bounces-79-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E667E85E1
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 23:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 349701C20AAB
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B563C698;
	Fri, 10 Nov 2023 22:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kdu1Ti81"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE252032A
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 22:53:33 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7404A9
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 14:53:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD99D673;
	Fri, 10 Nov 2023 23:53:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699656786;
	bh=BygHLMrGFvcDqZst5+x/FWoDnRXgfT/AO8zJQOm0730=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdu1Ti81ZO0QaeVnhI8L/mO5eRpBXhC7gIi1Ir2fuKtmqTzOkHHGiQCZx+A8MIHJN
	 4GEta/Go8kisGX+CoE6C8lQnWJYOBCt5iByZhJeGuFhvW6RhXXKi1CigplLdhRTvfP
	 dgSJp2yKTvmqgRzhr5MF5v2ItJBfLz2mRxY1Gzko=
Date: Sat, 11 Nov 2023 00:53:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 6/6] media: ccs: Use V4L2 CCI for accessing sensor
 registers
Message-ID: <20231110225335.GE7466@pendragon.ideasonboard.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-7-sakari.ailus@linux.intel.com>
 <20231110152115.GF21167@pendragon.ideasonboard.com>
 <ZU6iu0Gd-MOm6tdn@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZU6iu0Gd-MOm6tdn@kekkonen.localdomain>

Hi Sakari,

On Fri, Nov 10, 2023 at 09:38:03PM +0000, Sakari Ailus wrote:
> On Fri, Nov 10, 2023 at 05:21:15PM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 10, 2023 at 11:47:05AM +0200, Sakari Ailus wrote:
> > > Use V4L2 CCI for accessing device's registers. The 8-bit compatibility
> > > read option is removed but this is supported by regmap through other
> > > means.
> > > 
> > > Also the CCS register definitions are re-generated with V4L2 CCI
> > > definitions. The older SMIA++ register definitions have been manually
> > > converted.
> > 
> > Unrelated to this series, could ccs-regs.h be generated as part of the
> > kernel build process ?
> 
> I was thinking of it but it requires Perl. That would be a new addition to
> the minimum requirements and as much as people like Perl, it might not be
> trivially available in every system where the kernel (including the CCS
> driver) needs to be built.

OK, no problem.

> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/i2c/ccs/ccs-core.c        |  80 +-
> > >  drivers/media/i2c/ccs/ccs-reg-access.c  | 191 +----
> > >  drivers/media/i2c/ccs/ccs-regs.h        | 904 +++++++++++-----------
> > >  drivers/media/i2c/ccs/ccs.h             |   2 +
> > >  drivers/media/i2c/ccs/smiapp-reg-defs.h | 948 ++++++++++++------------
> > >  5 files changed, 988 insertions(+), 1137 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > index d210b6c87db4..471bb30ab298 100644
> > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > @@ -25,8 +25,9 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/smiapp.h>
> > >  #include <linux/v4l2-mediabus.h>
> > > -#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-cci.h>
> > >  #include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > 
> > As you're also sorting includes, mediabus goes last.
> 
> It's under include/linux directory, not include/media.

Oops, my bad.

> > >  #include <uapi/linux/ccs.h>
> > >  
> > >  #include "ccs.h"
> > > @@ -98,7 +99,7 @@ static int ccs_limit_ptr(struct ccs_sensor *sensor, unsigned int limit,
> > >  	linfo = &ccs_limits[ccs_limit_offsets[limit].info];
> > >  
> > >  	if (WARN_ON(!sensor->ccs_limits) ||
> > > -	    WARN_ON(offset + ccs_reg_width(linfo->reg) >
> > > +	    WARN_ON(offset + CCI_REG_WIDTH_BYTES(linfo->reg) >
> > >  		    ccs_limit_offsets[limit + 1].lim))
> > >  		return -EINVAL;
> > >  
> > > @@ -124,7 +125,7 @@ void ccs_replace_limit(struct ccs_sensor *sensor,
> > >  	dev_dbg(&client->dev, "quirk: 0x%8.8x \"%s\" %u = %u, 0x%x\n",
> > >  		linfo->reg, linfo->name, offset, val, val);
> > >  
> > > -	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
> > > +	ccs_assign_limit(ptr, CCI_REG_WIDTH_BYTES(linfo->reg), val);
> > >  }
> > >  
> > >  u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
> > > @@ -138,7 +139,7 @@ u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
> > >  	if (ret)
> > >  		return 0;
> > >  
> > > -	switch (ccs_reg_width(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
> > > +	switch (CCI_REG_WIDTH_BYTES(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
> > >  	case sizeof(u8):
> > >  		val = *(u8 *)ptr;
> > >  		break;
> > > @@ -176,7 +177,7 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
> > >  
> > >  	for (i = 0, l = 0, ptr = alloc; ccs_limits[i].size; i++) {
> > >  		u32 reg = ccs_limits[i].reg;
> > > -		unsigned int width = ccs_reg_width(reg);
> > > +		unsigned int width = CCI_REG_WIDTH_BYTES(reg);
> > >  		unsigned int j;
> > >  
> > >  		if (l == CCS_L_LAST) {
> > > @@ -2725,66 +2726,54 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
> > >  	rval = ccs_read(sensor, MODULE_MANUFACTURER_ID,
> > >  			&minfo->mipi_manufacturer_id);
> > >  	if (!rval && !minfo->mipi_manufacturer_id)
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   SMIAPP_REG_U8_MANUFACTURER_ID,
> > > -					   &minfo->smia_manufacturer_id);
> > > +		rval = ccs_read_addr(sensor, SMIAPP_REG_U8_MANUFACTURER_ID,
> > > +				     &minfo->smia_manufacturer_id);
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_MODEL_ID,
> > > -					   &minfo->model_id);
> > > +		rval = ccs_read(sensor, MODULE_MODEL_ID, &minfo->model_id);
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   CCS_R_MODULE_REVISION_NUMBER_MAJOR,
> > > -					   &rev);
> > > +		rval = ccs_read(sensor, MODULE_REVISION_NUMBER_MAJOR, &rev);
> > >  	if (!rval) {
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   CCS_R_MODULE_REVISION_NUMBER_MINOR,
> > > -					   &minfo->revision_number);
> > > +		rval = ccs_read(sensor, MODULE_REVISION_NUMBER_MINOR,
> > > +				&minfo->revision_number);
> > >  		minfo->revision_number |= rev << 8;
> > >  	}
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_YEAR,
> > > -					   &minfo->module_year);
> > > +		rval = ccs_read(sensor, MODULE_DATE_YEAR, &minfo->module_year);
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_MONTH,
> > > -					   &minfo->module_month);
> > > +		rval = ccs_read(sensor, MODULE_DATE_MONTH,
> > > +				&minfo->module_month);
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_DAY,
> > > -					   &minfo->module_day);
> > > +		rval = ccs_read(sensor, MODULE_DATE_DAY, &minfo->module_day);
> > >  
> > >  	/* Sensor info */
> > >  	if (!rval)
> > >  		rval = ccs_read(sensor, SENSOR_MANUFACTURER_ID,
> > >  				&minfo->sensor_mipi_manufacturer_id);
> > >  	if (!rval && !minfo->sensor_mipi_manufacturer_id)
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   CCS_R_SENSOR_MANUFACTURER_ID,
> > > -					   &minfo->sensor_smia_manufacturer_id);
> > > +		rval = ccs_read(sensor, SENSOR_MANUFACTURER_ID,
> > > +				&minfo->sensor_smia_manufacturer_id);
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   CCS_R_SENSOR_MODEL_ID,
> > > -					   &minfo->sensor_model_id);
> > > +		rval = ccs_read(sensor, SENSOR_MODEL_ID,
> > > +				&minfo->sensor_model_id);
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   CCS_R_SENSOR_REVISION_NUMBER,
> > > -					   &minfo->sensor_revision_number);
> > > +		rval = ccs_read(sensor, SENSOR_REVISION_NUMBER,
> > > +				&minfo->sensor_revision_number);
> > >  	if (!rval && !minfo->sensor_revision_number)
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   CCS_R_SENSOR_REVISION_NUMBER_16,
> > > -					   &minfo->sensor_revision_number);
> > > +		rval = ccs_read(sensor, SENSOR_REVISION_NUMBER_16,
> > > +				&minfo->sensor_revision_number);
> > >  	if (!rval)
> > > -		rval = ccs_read_addr_8only(sensor,
> > > -					   CCS_R_SENSOR_FIRMWARE_VERSION,
> > > -					   &minfo->sensor_firmware_version);
> > > +		rval = ccs_read(sensor, SENSOR_FIRMWARE_VERSION,
> > > +				&minfo->sensor_firmware_version);
> > >  
> > >  	/* SMIA */
> > >  	if (!rval)
> > >  		rval = ccs_read(sensor, MIPI_CCS_VERSION, &minfo->ccs_version);
> > >  	if (!rval && !minfo->ccs_version)
> > > -		rval = ccs_read_addr_8only(sensor, SMIAPP_REG_U8_SMIA_VERSION,
> > > -					   &minfo->smia_version);
> > > +		rval = ccs_read_addr(sensor, SMIAPP_REG_U8_SMIA_VERSION,
> > > +				     &minfo->smia_version);
> > >  	if (!rval && !minfo->ccs_version)
> > > -		rval = ccs_read_addr_8only(sensor, SMIAPP_REG_U8_SMIAPP_VERSION,
> > > -					   &minfo->smiapp_version);
> > > +		rval = ccs_read_addr(sensor, SMIAPP_REG_U8_SMIAPP_VERSION,
> > > +				     &minfo->smiapp_version);
> > >  
> > >  	if (rval) {
> > >  		dev_err(&client->dev, "sensor detection failed\n");
> > > @@ -3318,6 +3307,13 @@ static int ccs_probe(struct i2c_client *client)
> > >  	if (IS_ERR(sensor->xshutdown))
> > >  		return PTR_ERR(sensor->xshutdown);
> > >  
> > > +	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
> > > +	if (IS_ERR(sensor->regmap)) {
> > > +		dev_err(&client->dev, "can't initialise CCI (%ld)\n",
> > > +			PTR_ERR(sensor->regmap));
> > > +		return PTR_ERR(sensor->regmap);
> > > +	}
> > > +
> > >  	rval = ccs_power_on(&client->dev);
> > >  	if (rval < 0)
> > >  		return rval;
> > > @@ -3653,7 +3649,7 @@ static int ccs_module_init(void)
> > >  			ccs_limit_offsets[l + 1].lim =
> > >  				ALIGN(ccs_limit_offsets[l].lim +
> > >  				      ccs_limits[i].size,
> > > -				      ccs_reg_width(ccs_limits[i + 1].reg));
> > > +				      max(CCI_REG_WIDTH_BYTES(ccs_limits[i + 1].reg), 1UL));
> > 
> > What's the reason for the max() here ?
> 
> The guardian entry of the ccs_limits array contains zero in the reg field,
> as one would expect, and CCI_REG_WIDTH_BYTES() returns, as one would
> expect, zero. And aligning by zero is generally shunned by experienced
> kernel developers.
> 
> ccs_reg_width() used flags for 16- and 32-bit registers so a register that
> had neither of the flags was considered an 8-bit one.

Could you instead process the sentinel outside of the loop ? It sounds
less error-prone.

> > >  			ccs_limit_offsets[l].info = i;
> > >  			l++;
> > >  		} else {
> > > diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
> > > index 652d705a2ef5..81d3e2db38f1 100644
> > > --- a/drivers/media/i2c/ccs/ccs-reg-access.c
> > > +++ b/drivers/media/i2c/ccs/ccs-reg-access.c
> > > @@ -62,87 +62,6 @@ static u32 float_to_u32_mul_1000000(struct i2c_client *client, u32 phloat)
> > >  }
> > >  
> > >  
> > > -/*
> > > - * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
> > > - * Returns zero if successful, or non-zero otherwise.
> > > - */
> > > -static int ____ccs_read_addr(struct ccs_sensor *sensor, u16 reg, u16 len,
> > > -			     u32 *val)
> > > -{
> > > -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > > -	struct i2c_msg msg;
> > > -	unsigned char data_buf[sizeof(u32)] = { 0 };
> > > -	unsigned char offset_buf[sizeof(u16)];
> > > -	int r;
> > > -
> > > -	if (len > sizeof(data_buf))
> > > -		return -EINVAL;
> > > -
> > > -	msg.addr = client->addr;
> > > -	msg.flags = 0;
> > > -	msg.len = sizeof(offset_buf);
> > > -	msg.buf = offset_buf;
> > > -	put_unaligned_be16(reg, offset_buf);
> > > -
> > > -	r = i2c_transfer(client->adapter, &msg, 1);
> > > -	if (r != 1) {
> > > -		if (r >= 0)
> > > -			r = -EBUSY;
> > > -		goto err;
> > > -	}
> > > -
> > > -	msg.len = len;
> > > -	msg.flags = I2C_M_RD;
> > > -	msg.buf = &data_buf[sizeof(data_buf) - len];
> > > -
> > > -	r = i2c_transfer(client->adapter, &msg, 1);
> > > -	if (r != 1) {
> > > -		if (r >= 0)
> > > -			r = -EBUSY;
> > > -		goto err;
> > > -	}
> > > -
> > > -	*val = get_unaligned_be32(data_buf);
> > > -
> > > -	return 0;
> > > -
> > > -err:
> > > -	dev_err(&client->dev, "read from offset 0x%x error %d\n", reg, r);
> > > -
> > > -	return r;
> > > -}
> > > -
> > > -/* Read a register using 8-bit access only. */
> > > -static int ____ccs_read_addr_8only(struct ccs_sensor *sensor, u16 reg,
> > > -				   u16 len, u32 *val)
> > > -{
> > > -	unsigned int i;
> > > -	int rval;
> > > -
> > > -	*val = 0;
> > > -
> > > -	for (i = 0; i < len; i++) {
> > > -		u32 val8;
> > > -
> > > -		rval = ____ccs_read_addr(sensor, reg + i, 1, &val8);
> > > -		if (rval < 0)
> > > -			return rval;
> > > -		*val |= val8 << ((len - i - 1) << 3);
> > > -	}
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -unsigned int ccs_reg_width(u32 reg)
> > > -{
> > > -	if (reg & CCS_FL_16BIT)
> > > -		return sizeof(u16);
> > > -	if (reg & CCS_FL_32BIT)
> > > -		return sizeof(u32);
> > > -
> > > -	return sizeof(u8);
> > > -}
> > > -
> > >  static u32 ireal32_to_u32_mul_1000000(struct i2c_client *client, u32 val)
> > >  {
> > >  	if (val >> 10 > U32_MAX / 15625) {
> > > @@ -178,21 +97,14 @@ u32 ccs_reg_conv(struct ccs_sensor *sensor, u32 reg, u32 val)
> > >  static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
> > >  			   bool only8, bool conv)
> > >  {
> > > -	unsigned int len = ccs_reg_width(reg);
> > > +	u64 __val;
> > >  	int rval;
> > >  
> > > -	if (!only8)
> > > -		rval = ____ccs_read_addr(sensor, CCS_REG_ADDR(reg), len, val);
> > > -	else
> > > -		rval = ____ccs_read_addr_8only(sensor, CCS_REG_ADDR(reg), len,
> > > -					       val);
> > > +	rval = cci_read(sensor->regmap, reg, &__val, NULL);
> > >  	if (rval < 0)
> > >  		return rval;
> > >  
> > > -	if (!conv)
> > > -		return 0;
> > > -
> > > -	*val = ccs_reg_conv(sensor, reg, *val);
> > > +	*val = conv ? ccs_reg_conv(sensor, reg, __val) : __val;
> > >  
> > >  	return 0;
> > >  }
> > > @@ -200,7 +112,7 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
> > >  static int __ccs_static_read_only(struct ccs_reg *regs, size_t num_regs,
> > >  				  u32 reg, u32 *val)
> > >  {
> > > -	unsigned int width = ccs_reg_width(reg);
> > > +	unsigned int width = CCI_REG_WIDTH_BYTES(reg);
> > >  	size_t i;
> > >  
> > >  	for (i = 0; i < num_regs; i++, regs++) {
> > > @@ -291,71 +203,13 @@ int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
> > >  	return ccs_read_addr_raw(sensor, reg, val, false, true, false, true);
> > >  }
> > >  
> > > -static int ccs_write_retry(struct i2c_client *client, struct i2c_msg *msg)
> > > -{
> > > -	unsigned int retries;
> > > -	int r;
> > > -
> > > -	for (retries = 0; retries < 10; retries++) {
> > > -		/*
> > > -		 * Due to unknown reason sensor stops responding. This
> > > -		 * loop is a temporaty solution until the root cause
> > > -		 * is found.
> > > -		 */
> > > -		r = i2c_transfer(client->adapter, msg, 1);
> > > -		if (r != 1) {
> > > -			usleep_range(1000, 2000);
> > > -			continue;
> > > -		}
> > > -
> > > -		if (retries)
> > > -			dev_err(&client->dev,
> > > -				"sensor i2c stall encountered. retries: %d\n",
> > > -				retries);
> > > -		return 0;
> > > -	}
> > > -
> > > -	return r;
> > > -}
> > > -
> > > -int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
> > > -{
> > > -	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > > -	struct i2c_msg msg;
> > > -	unsigned char data[6];
> > > -	unsigned int len = ccs_reg_width(reg);
> > > -	int r;
> > > -
> > > -	if (len > sizeof(data) - 2)
> > > -		return -EINVAL;
> > > -
> > > -	msg.addr = client->addr;
> > > -	msg.flags = 0; /* Write */
> > > -	msg.len = 2 + len;
> > > -	msg.buf = data;
> > > -
> > > -	put_unaligned_be16(CCS_REG_ADDR(reg), data);
> > > -	put_unaligned_be32(val << (8 * (sizeof(val) - len)), data + 2);
> > > -
> > > -	dev_dbg(&client->dev, "writing reg 0x%4.4x value 0x%*.*x (%u)\n",
> > > -		CCS_REG_ADDR(reg), ccs_reg_width(reg) << 1,
> > > -		ccs_reg_width(reg) << 1, val, val);
> > > -
> > > -	r = ccs_write_retry(client, &msg);
> > > -	if (r)
> > > -		dev_err(&client->dev,
> > > -			"wrote 0x%x to offset 0x%x error %d\n", val,
> > > -			CCS_REG_ADDR(reg), r);
> > > -
> > > -	return r;
> > > -}
> > > -
> > >  /*
> > >   * Write to a 8/16-bit register.
> > >   * Returns zero if successful, or non-zero otherwise.
> > >   */
> > >  int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
> > >  {
> > > +	unsigned int retries = 10;
> > 
> > This is really not nice, but unrelated to this patch.
> > 
> > >  	int rval;
> > >  
> > >  	rval = ccs_call_quirk(sensor, reg_access, true, &reg, &val);
> > > @@ -364,7 +218,12 @@ int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
> > >  	if (rval < 0)
> > >  		return rval;
> > 
> > Here you test rval < 0, but below cci_write() will consider any positive
> > value as an error too. There may not be an actual bug if the function
> > call above doesn't return positive values, but it's error-prone
> > nonetheless.
> 
> Good point. The quirk function is supposed to return either an error or
> zero, but I'll assign it to zero here just in case.

You could also change the check to

	if (rval)
		return rval;

> I'd hope in the future we would have few quirks and would do most of this
> using CCS static data instead.
> 
> > >  
> > > -	return ccs_write_addr_no_quirk(sensor, reg, val);
> > > +	do {
> > > +		if (cci_write(sensor->regmap, reg, val, &rval))
> > > +			fsleep(1000);
> > > +	} while (rval && --retries);
> > > +
> > > +	return rval;
> > >  }
> > >  
> > >  #define MAX_WRITE_LEN	32U
> > > @@ -373,40 +232,36 @@ int ccs_write_data_regs(struct ccs_sensor *sensor, struct ccs_reg *regs,
> > >  			size_t num_regs)
> > >  {
> > >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > > -	unsigned char buf[2 + MAX_WRITE_LEN];
> > > -	struct i2c_msg msg = {
> > > -		.addr = client->addr,
> > > -		.buf = buf,
> > > -	};
> > >  	size_t i;
> > >  
> > >  	for (i = 0; i < num_regs; i++, regs++) {
> > >  		unsigned char *regdata = regs->value;
> > >  		unsigned int j;
> > > +		int len;
> > >  
> > > -		for (j = 0; j < regs->len;
> > > -		     j += msg.len - 2, regdata += msg.len - 2) {
> > > +		for (j = 0; j < regs->len; j += len, regdata += len) {
> > >  			char printbuf[(MAX_WRITE_LEN << 1) +
> > >  				      1 /* \0 */] = { 0 };
> > > +			unsigned int retries = 10;
> > >  			int rval;
> > >  
> > > -			msg.len = min(regs->len - j, MAX_WRITE_LEN);
> > > +			len = min(regs->len - j, MAX_WRITE_LEN);
> > >  
> > > -			bin2hex(printbuf, regdata, msg.len);
> > > +			bin2hex(printbuf, regdata, len);
> > >  			dev_dbg(&client->dev,
> > >  				"writing msr reg 0x%4.4x value 0x%s\n",
> > >  				regs->addr + j, printbuf);
> > >  
> > > -			put_unaligned_be16(regs->addr + j, buf);
> > > -			memcpy(buf + 2, regdata, msg.len);
> > > -
> > > -			msg.len += 2;
> > > -
> > > -			rval = ccs_write_retry(client, &msg);
> > > +			do {
> > > +				rval = regmap_bulk_write(sensor->regmap,
> > > +							 regs->addr + j, regdata, len);
> > 
> > I'm surprised by the line length ;-)
> 
> Yes, indeed, there seems to be an issue here. I'll fix it for v2.
> 
> > > +				if (rval)
> > > +					fsleep(1000);
> > > +			} while (rval && --retries);
> > 
> > A blank line would be nice.
> 
> Yes.
> 
> > >  			if (rval) {
> > >  				dev_err(&client->dev,
> > >  					"error writing %u octets to address 0x%4.4x\n",
> > > -					msg.len, regs->addr + j);
> > > +					len, regs->addr + j);
> > >  				return rval;
> > >  			}
> > >  		}
> > > diff --git a/drivers/media/i2c/ccs/ccs-regs.h b/drivers/media/i2c/ccs/ccs-regs.h
> > > index 6ce84c5ecf20..45f933cbe478 100644
> > > --- a/drivers/media/i2c/ccs/ccs-regs.h
> > > +++ b/drivers/media/i2c/ccs/ccs-regs.h
> > > @@ -10,59 +10,57 @@
> > >  
> > >  #include <linux/bits.h>
> > >  
> > > -#define CCS_FL_BASE		16
> > > -#define CCS_FL_16BIT		BIT(CCS_FL_BASE)
> > > -#define CCS_FL_32BIT		BIT(CCS_FL_BASE + 1)
> > > -#define CCS_FL_FLOAT_IREAL	BIT(CCS_FL_BASE + 2)
> > > -#define CCS_FL_IREAL		BIT(CCS_FL_BASE + 3)
> > > -#define CCS_R_ADDR(r)		((r) & 0xffff)
> > > +#include <media/v4l2-cci.h>
> > >  
> > > -#define CCS_R_MODULE_MODEL_ID					(0x0000 | CCS_FL_16BIT)
> > > -#define CCS_R_MODULE_REVISION_NUMBER_MAJOR			0x0002
> > > -#define CCS_R_FRAME_COUNT					0x0005
> > > -#define CCS_R_PIXEL_ORDER					0x0006
> > > +#define CCS_FL_BASE		CCI_REG_FLAG_PRIVATE_START
> > 
> > Unless CCS_FL_BASE is used in the driver, I would drop it and use
> > CCI_REG_FLAG_PRIVATE_START in the two macros below. Up to you.
> > 
> > > +#define CCS_FL_FLOAT_IREAL	BIT(CCS_FL_BASE)
> > > +#define CCS_FL_IREAL		BIT(CCS_FL_BASE + 1)
> > > +#define CCS_R_MODULE_MODEL_ID					CCI_REG16(0x0000)
> > > +#define CCS_R_MODULE_REVISION_NUMBER_MAJOR			CCI_REG8(0x0002)
> > > +#define CCS_R_FRAME_COUNT					CCI_REG8(0x0005)
> > > +#define CCS_R_PIXEL_ORDER					CCI_REG8(0x0006)
> > >  #define CCS_PIXEL_ORDER_GRBG					0U
> > >  #define CCS_PIXEL_ORDER_RGGB					1U
> > >  #define CCS_PIXEL_ORDER_BGGR					2U
> > >  #define CCS_PIXEL_ORDER_GBRG					3U
> > > -#define CCS_R_MIPI_CCS_VERSION					0x0007
> > > +#define CCS_R_MIPI_CCS_VERSION					CCI_REG8(0x0007)
> > >  #define CCS_MIPI_CCS_VERSION_V1_0				0x10
> > >  #define CCS_MIPI_CCS_VERSION_V1_1				0x11
> > >  #define CCS_MIPI_CCS_VERSION_MAJOR_SHIFT			4U
> > >  #define CCS_MIPI_CCS_VERSION_MAJOR_MASK				0xf0
> > >  #define CCS_MIPI_CCS_VERSION_MINOR_SHIFT			0U
> > >  #define CCS_MIPI_CCS_VERSION_MINOR_MASK				0xf
> > > -#define CCS_R_DATA_PEDESTAL					(0x0008 | CCS_FL_16BIT)
> > > -#define CCS_R_MODULE_MANUFACTURER_ID				(0x000e | CCS_FL_16BIT)
> > > -#define CCS_R_MODULE_REVISION_NUMBER_MINOR			0x0010
> > > -#define CCS_R_MODULE_DATE_YEAR					0x0012
> > > -#define CCS_R_MODULE_DATE_MONTH					0x0013
> > > -#define CCS_R_MODULE_DATE_DAY					0x0014
> > > -#define CCS_R_MODULE_DATE_PHASE					0x0015
> > > +#define CCS_R_DATA_PEDESTAL					CCI_REG16(0x0008)
> > > +#define CCS_R_MODULE_MANUFACTURER_ID				CCI_REG16(0x000e)
> > > +#define CCS_R_MODULE_REVISION_NUMBER_MINOR			CCI_REG8(0x0010)
> > > +#define CCS_R_MODULE_DATE_YEAR					CCI_REG8(0x0012)
> > > +#define CCS_R_MODULE_DATE_MONTH					CCI_REG8(0x0013)
> > > +#define CCS_R_MODULE_DATE_DAY					CCI_REG8(0x0014)
> > > +#define CCS_R_MODULE_DATE_PHASE					CCI_REG8(0x0015)
> > >  #define CCS_MODULE_DATE_PHASE_SHIFT				0U
> > >  #define CCS_MODULE_DATE_PHASE_MASK				0x7
> > >  #define CCS_MODULE_DATE_PHASE_TS				0U
> > >  #define CCS_MODULE_DATE_PHASE_ES				1U
> > >  #define CCS_MODULE_DATE_PHASE_CS				2U
> > >  #define CCS_MODULE_DATE_PHASE_MP				3U
> > > -#define CCS_R_SENSOR_MODEL_ID					(0x0016 | CCS_FL_16BIT)
> > > -#define CCS_R_SENSOR_REVISION_NUMBER				0x0018
> > > -#define CCS_R_SENSOR_FIRMWARE_VERSION				0x001a
> > > -#define CCS_R_SERIAL_NUMBER					(0x001c | CCS_FL_32BIT)
> > > -#define CCS_R_SENSOR_MANUFACTURER_ID				(0x0020 | CCS_FL_16BIT)
> > > -#define CCS_R_SENSOR_REVISION_NUMBER_16				(0x0022 | CCS_FL_16BIT)
> > > -#define CCS_R_FRAME_FORMAT_MODEL_TYPE				0x0040
> > > +#define CCS_R_SENSOR_MODEL_ID					CCI_REG16(0x0016)
> > > +#define CCS_R_SENSOR_REVISION_NUMBER				CCI_REG8(0x0018)
> > > +#define CCS_R_SENSOR_FIRMWARE_VERSION				CCI_REG8(0x001a)
> > > +#define CCS_R_SERIAL_NUMBER					CCI_REG32(0x001c)
> > > +#define CCS_R_SENSOR_MANUFACTURER_ID				CCI_REG16(0x0020)
> > > +#define CCS_R_SENSOR_REVISION_NUMBER_16				CCI_REG16(0x0022)
> > > +#define CCS_R_FRAME_FORMAT_MODEL_TYPE				CCI_REG8(0x0040)
> > >  #define CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE			1U
> > >  #define CCS_FRAME_FORMAT_MODEL_TYPE_4_BYTE			2U
> > > -#define CCS_R_FRAME_FORMAT_MODEL_SUBTYPE			0x0041
> > > +#define CCS_R_FRAME_FORMAT_MODEL_SUBTYPE			CCI_REG8(0x0041)
> > >  #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_SHIFT		0U
> > >  #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_MASK		0xf
> > >  #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_SHIFT		4U
> > >  #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_MASK		0xf0
> > > -#define CCS_R_FRAME_FORMAT_DESCRIPTOR(n)			((0x0042 | CCS_FL_16BIT) + (n) * 2)
> > > +#define CCS_R_FRAME_FORMAT_DESCRIPTOR(n)			(CCI_REG16(0x0042) + (n) * 2)
> > 
> > This assumes that the address is encoded in the LSBs. I think it would
> > be better to write
> > 
> > #define CCS_R_FRAME_FORMAT_DESCRIPTOR(n)			CCI_REG16(0x0042 + (n) * 2)
> 
> Oops. I missed checking this one. I'll fix the script for v2...
> 
> > >  #define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_MIN_N			0U
> > >  #define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_MAX_N			14U
> > > -#define CCS_R_FRAME_FORMAT_DESCRIPTOR_4(n)			((0x0060 | CCS_FL_32BIT) + (n) * 4)
> > > +#define CCS_R_FRAME_FORMAT_DESCRIPTOR_4(n)			(CCI_REG32(0x0060) + (n) * 4)
> > >  #define CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_SHIFT		0U
> > >  #define CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_MASK			0xfff
> > >  #define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_SHIFT			12U
> > 
> > [snip]
> > 
> > > diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> > > index 2c013d96adcc..096573845a10 100644
> > > --- a/drivers/media/i2c/ccs/ccs.h
> > > +++ b/drivers/media/i2c/ccs/ccs.h
> > > @@ -13,6 +13,7 @@
> > >  #define __CCS_H__
> > >  
> > >  #include <linux/mutex.h>
> > > +#include <linux/regmap.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-subdev.h>
> > >  
> > > @@ -211,6 +212,7 @@ struct ccs_sensor {
> > >  	struct clk *ext_clk;
> > >  	struct gpio_desc *xshutdown;
> > >  	struct gpio_desc *reset;
> > > +	struct regmap *regmap;
> > >  	void *ccs_limits;
> > >  	u8 nbinning_subtypes;
> > >  	struct ccs_binning_subtype binning_subtypes[CCS_LIM_BINNING_SUB_TYPE_MAX_N + 1];
> > > diff --git a/drivers/media/i2c/ccs/smiapp-reg-defs.h b/drivers/media/i2c/ccs/smiapp-reg-defs.h
> > > index 177e3e51207a..72b1af2a9824 100644
> > > --- a/drivers/media/i2c/ccs/smiapp-reg-defs.h
> > > +++ b/drivers/media/i2c/ccs/smiapp-reg-defs.h
> > > @@ -13,480 +13,480 @@
> > >  #define __SMIAPP_REG_DEFS_H__
> > 
> > Shouldn't you include v4l2-cci.h ?
> 
> I can add this for completeness. linux/bits.h is needed, too.
> 
> > >  
> > >  /* Register addresses */
> > 
> > I haven't reviewed the manual changes here.
> 
> That's fine. I'm not worried about those as I used a small Perl script
> (that is however bygone now) to do the conversion. :-)
> 
> > [snip]
> > 
> > >  
> > >  /* Register bit definitions */
> > >  #define SMIAPP_IMAGE_ORIENTATION_HFLIP			BIT(0)

-- 
Regards,

Laurent Pinchart

