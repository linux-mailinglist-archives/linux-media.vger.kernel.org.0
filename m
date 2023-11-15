Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B377DCB0B
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 11:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbjJaKm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 06:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236181AbjJaKm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 06:42:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EF6A9;
        Tue, 31 Oct 2023 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698748944; x=1730284944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mqIiZuih7RRopQofBk63MKOtwA6VBJKSkZgc+cjP6Bw=;
  b=DpkcYLfCZw53pT83hRnLom10r+zaxbbtNzTPXitQehfrwCWolOIoDVTK
   3ZLPN/df/OPSDUCGGv3oGDRnCYn12vhxkuivIuuAaISevPE29KwSzIB0M
   rKBfVQNKThWlENXZZrbM68D8z0jrO1wdTocT+LwRPYLpe6IuWTOzl290V
   Du+w18Ym8Bx09I//WB/kk7C0DZ/0VG2gICtxz8Q42lx76RZZfWxefFOmO
   3rEx0JtIHDyOzJwCKUCumS1RtPDEzAnkThyUhLVQKJZNG4+WEQmUIn0K9
   By5Mq2pi7sHl3Unph/3YMptkPdUltbO7DSlrNwO4cHHoU93e7BVLTznEN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="388084152"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="388084152"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 03:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="789751086"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="789751086"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 03:42:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1479911F894;
        Tue, 31 Oct 2023 12:34:05 +0200 (EET)
Date:   Tue, 31 Oct 2023 10:34:05 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tommaso Merciai <tomm.merciai@gmail.com>, martin.hecht@avnet.eu,
        michael.roeder@avnet.eu, mhecht73@gmail.com,
        linuxfancy@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Gerald Loacker <gerald.loacker@wolfvision.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v10 3/3] media: i2c: Add support for alvium camera
Message-ID: <ZUDYHT0NbkoUtQlc@kekkonen.localdomain>
References: <20231020141354.2500602-4-tomm.merciai@gmail.com>
 <ZTpnHdpTgRNll3TC@kekkonen.localdomain>
 <ZT+hEg7WqkQBnLV5@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZUAxoy2cRR6Rm9ig@kekkonen.localdomain>
 <20231030233809.GD12764@pendragon.ideasonboard.com>
 <ZUCf_74Z0igCiJ_-@kekkonen.localdomain>
 <20231031085347.GH12764@pendragon.ideasonboard.com>
 <ZUDDuoNO5AGjyJLh@kekkonen.localdomain>
 <ZUDTaq9-j1HmqiEp@kekkonen.localdomain>
 <20231031101813.GI12764@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031101813.GI12764@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 31, 2023 at 12:18:13PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 31, 2023 at 10:14:02AM +0000, Sakari Ailus wrote:
> > On Tue, Oct 31, 2023 at 09:07:06AM +0000, Sakari Ailus wrote:
> > > On Tue, Oct 31, 2023 at 10:53:47AM +0200, Laurent Pinchart wrote:
> > > > On Tue, Oct 31, 2023 at 06:34:39AM +0000, Sakari Ailus wrote:
> > > > > On Tue, Oct 31, 2023 at 01:38:09AM +0200, Laurent Pinchart wrote:
> > > > > > On Mon, Oct 30, 2023 at 10:43:47PM +0000, Sakari Ailus wrote:
> > > > > > > On Mon, Oct 30, 2023 at 01:26:58PM +0100, Tommaso Merciai wrote:
> > > > > > > 
> > > > > > > ...
> > > > > > > 
> > > > > > > > > > +static int alvium_get_host_supp_csi_lanes(struct alvium_dev *alvium)
> > > > > > > > > > +{
> > > > > > > > > > +	u64 val;
> > > > > > > > > > +	int ret = 0;
> > > > > > > > > > +
> > > > > > > > > > +	alvium_read(alvium, REG_BCRM_CSI2_LANE_COUNT_RW, &val, &ret);
> > > > > > > > > 
> > > > > > > > > Missing error checking before the use of the value. The same pattern
> > > > > > > > > remains prevalent throughout the driver.
> > > > > > > > > 
> > > > > > > > > I think it'd be easier if you didn't use a temporary variable for reading,
> > > > > > > > > but instead had a register width specific access function. You could even
> > > > > > > > > introduce a helper macro to read this information as I suggested in an
> > > > > > > > > earlier review.
> > > > > > > > 
> > > > > > > > oks.
> > > > > > > > We are moving to use the following macros:
> > > > > > > > 
> > > > > > > > #define alvium_read_check(alvium, reg, value) \
> > > > > > > > { \
> > > > > > > > 	int ret = alvium_read(alvium, reg, value, NULL); \
> > > > > > > > 	if (ret) \
> > > > > > > > 		return ret; \
> > > > > > > > }
> > > > > > > > 
> > > > > > > 
> > > > > > > You could do something like (entirely untested):
> > > > > > > 
> > > > > > > #define ALVIUM_DECLARE_READ(sign, bits) \
> > > > > > > 	static int
> > > > > > > 	alvium_read_ ## sign ## bits(struct alvium_dev *alvium, u32 reg, \
> > > > > > > 				     sign ## bits *val, int *err) \
> > > > > > > 	{ \
> > > > > > > 		u64 val64; \
> > > > > > > 		int ret; \
> > > > > > > 			\
> > > > > > > 		if (err && *err < 0) \
> > > > > > > 			return *err; \
> > > > > > > 			\
> > > > > > > 		alvium_read(alvium, reg, &val64, &ret); \
> > > > > > > 		if (ret < 0) { \
> > > > > > > 			if (err) \
> > > > > > > 				*err = ret; \
> > > > > > > 			return ret; \
> > > > > > > 		}	\
> > > > > > > 			\
> > > > > > > 		*val = val64; \
> > > > > > > 			\
> > > > > > > 		return 0; \
> > > > > > > 	}
> > > > > > > 
> > > > > > > ALVIUM_DECLARE_READ(u, 32);
> > > > > > > 
> > > > > > > And then, e.g. instead of (and failing to check ret):
> > > > > > > 
> > > > > > > 	u64 val;
> > > > > > > 
> > > > > > > 	alvium_read(alvium, REG_BCRM_CONTRAST_VALUE_RW, &val, &ret);
> > > > > > > 	alvium->dft_contrast = val;
> > > > > > > 
> > > > > > > you'd have a single call:
> > > > > > > 
> > > > > > > 	alvium_read_u32(alvium, REG_BCRM_CONTRAST_VALUE_RW,
> > > > > > > 		        &alvium->dft_contrast, &ret);
> > > > > > > 
> > > > > > > And so on.
> > > > > > > 
> > > > > > > You can drop sign if you don't need signed reads but some of the struct
> > > > > > > fields you're writing something appear to be signed.
> > > > > > > 
> > > > > > > It'd be good to check the register size matches with the size of *val, too.
> > > > > > > Maybe something like:
> > > > > > > 
> > > > > > > WARN_ON((CCI_REG ## bits(0) && CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT
> > > > > > > 	!= sizeof(sign ## bits));
> > > > > > 
> > > > > > I think this could actually be automated, and implemented in v4l2-cci.
> > > > > > Something like the following:
> > > > > > 
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> > > > > > index bc2dbec019b0..27f1eaa7777d 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-cci.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-cci.c
> > > > > > @@ -16,7 +16,7 @@
> > > > > > 
> > > > > >  #include <media/v4l2-cci.h>
> > > > > > 
> > > > > > -int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> > > > > > +int __cci_read(struct regmap *map, u32 reg, void *val, int *err)
> > > > > >  {
> > > > > >  	unsigned int len;
> > > > > >  	u8 buf[8];
> > > > > > @@ -37,19 +37,19 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> > > > > > 
> > > > > >  	switch (len) {
> > > > > >  	case 1:
> > > > > > -		*val = buf[0];
> > > > > > +		*(u8 *)val = buf[0];
> > > > > >  		break;
> > > > > >  	case 2:
> > > > > > -		*val = get_unaligned_be16(buf);
> > > > > > +		*(u16 *)val = get_unaligned_be16(buf);
> > > > > >  		break;
> > > > > >  	case 3:
> > > > > > -		*val = get_unaligned_be24(buf);
> > > > > > +		*(u32 *)val = get_unaligned_be24(buf);
> > > > > >  		break;
> > > > > >  	case 4:
> > > > > > -		*val = get_unaligned_be32(buf);
> > > > > > +		*(u32 *)val = get_unaligned_be32(buf);
> > > > > >  		break;
> > > > > >  	case 8:
> > > > > > -		*val = get_unaligned_be64(buf);
> > > > > > +		*(u64 *)val = get_unaligned_be64(buf);
> > > > > >  		break;
> > > > > >  	default:
> > > > > >  		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
> > > > > > @@ -64,7 +64,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> > > > > > 
> > > > > >  	return ret;
> > > > > >  }
> > > > > > -EXPORT_SYMBOL_GPL(cci_read);
> > > > > > +EXPORT_SYMBOL_GPL(__cci_read);
> > > > > > 
> > > > > >  int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
> > > > > >  {
> > > > > > @@ -119,7 +119,7 @@ int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err)
> > > > > >  	u64 readval;
> > > > > >  	int ret;
> > > > > > 
> > > > > > -	ret = cci_read(map, reg, &readval, err);
> > > > > > +	ret = __cci_read(map, reg, &readval, err);
> > > > > >  	if (ret)
> > > > > >  		return ret;
> > > > > > 
> > > > > > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > > > > > index 0f6803e4b17e..31223ce8d741 100644
> > > > > > --- a/include/media/v4l2-cci.h
> > > > > > +++ b/include/media/v4l2-cci.h
> > > > > > @@ -7,6 +7,9 @@
> > > > > >  #ifndef _V4L2_CCI_H
> > > > > >  #define _V4L2_CCI_H
> > > > > > 
> > > > > > +#include <linux/bitfield.h>
> > > > > > +#include <linux/build_bug.h>
> > > > > > +#include <linux/log2.h>
> > > > > >  #include <linux/types.h>
> > > > > > 
> > > > > >  struct i2c_client;
> > > > > > @@ -39,6 +42,8 @@ struct cci_reg_sequence {
> > > > > >  #define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
> > > > > >  #define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
> > > > > > 
> > > > > > +int __cci_read(struct regmap *map, u32 reg, void *val, int *err);
> > > > > > +
> > > > > >  /**
> > > > > >   * cci_read() - Read a value from a single CCI register
> > > > > >   *
> > > > > > @@ -48,9 +53,17 @@ struct cci_reg_sequence {
> > > > > >   * @err: Optional pointer to store errors, if a previous error is set
> > > > > >   *       then the read will be skipped
> > > > > >   *
> > > > > > + * The type of the @val pointer must match the size of the register being read.
> > > > > > + * Mismatches will result in compile-time errors.
> > > > > > + *
> > > > > >   * Return: %0 on success or a negative error code on failure.
> > > > > >   */
> > > > > > -int cci_read(struct regmap *map, u32 reg, u64 *val, int *err);
> > > > > > +#define cci_read(map, reg, val, err) ({					\
> > > > > > +	u32 __reg = (reg);						\
> > > > > > +	u32 __size = FIELD_GET(CCI_REG_WIDTH_MASK, __reg);		\
> > > > > > +	BUILD_BUG_ON(sizeof(*(val)) != roundup_pow_of_two(__size));	\
> > > > > > +	__cci_read(map, __reg, (void *)(val), err);			\
> > > > > > +})
> > > > > > 
> > > > > >  /**
> > > > > >   * cci_write() - Write a value to a single CCI register
> > > > > > 
> > > > > > The change to cci_update_bits() is obviously wrong, I've hacked that to
> > > > > > compile-test the rest with the drivers using cci_read(), and I get nice
> > > > > > build-time errors due to usage of the wrong type :-)
> > > > > > 
> > > > > > Is this something that would be considered ? Bonus points to anyone who
> > > > > > would fix cci_update_bits() :-)
> > > > > 
> > > > > I like the idea of moving this to v4l2-cci.
> > > > > 
> > > > > I'd prefer _Generic() based solution as we'd have exact types there instead
> > > > > of just size. E.g. with the above code, reading a value to a long variable
> > > > > would work on some archs but fail on others.
> > > > 
> > > > Doesn't _Generic() treat compatible types identically ?
> > > 
> > > Ah, it does, indeed. So that doesn't solve the long problem.
> > > 
> > > I guess the code will be more compact with just void *, on the expense of
> > > (some) type checking.
> > > 
> > > I'm fine with either.
> > 
> > You can't check the variable size matches the register width by using a
> > void pointer. That'd be a source for possibly difficult to debug problems:
> > passing a pointer to u8 variable while reading a 64-bit register overwrites
> > seven bytes on the stack outside the variable itself.
> > 
> > Let's use _Generic().
> 
> I still don't see how that will help :-) The prototype of the
> __cci_read() function is unrelated to whether or not _Generic() gets
> used. The cci_read() macro will cause a *build* time error if the value
> pointer doesn't match the register size. The __cci_read() function must
> not be used directly by drivers.

Ah, right, this part of the check is indeed in the macro. That doesn't
catch floats but those are unlikely be a practical issue anyway.

The cast to void * is redundant in the macro.

-- 
Sakari Ailus
