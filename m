Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC04A725DE8
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 14:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbjFGMBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 08:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234761AbjFGMBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 08:01:21 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B911BCE
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 05:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686139279; x=1717675279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZrgTxmxKUC+VF35ofvB7iyyJoMQZ95+3+KDLBO2qLiU=;
  b=P2vtK4fBga639/PPszyawIpudJ6nEcvz6nHz2tUqWOoAKcymMnH4e1vj
   mGurrjT13C0mZkslBhSk7IAz6rDb6dEgyoIaWnPJmydUSsEXYVmKKaQoi
   M3mrYhTIfjNjtUriKZHvs2H/nPWPdyua8oLFcUCJgJTxlu/n1yxfTotQl
   QiqtGFNLciswtwLAS/UYmWC0YzVg8MElLc37btfp7lcQOnHeHdXKfdbDA
   haF+sodsWYVy3l8BJa3MTi2LxVtLkpAP2WCe66jcXa6mqRdqpMHhRZZWC
   xdhyQeEErznfoqKCUHU+6Wr7xsD5QAXQABQJbssX5ql/VgQqnFZj2N+Ut
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420523443"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="420523443"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 05:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="779408965"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="779408965"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 05:01:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 10C6311FAE0;
        Wed,  7 Jun 2023 15:01:10 +0300 (EEST)
Date:   Wed, 7 Jun 2023 12:01:10 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Message-ID: <ZIBxhg1LVL8+zBCE@kekkonen.localdomain>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
 <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com>
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

On Wed, Jun 07, 2023 at 10:40:34AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 6/6/23 22:43, Andy Shevchenko wrote:
> > On Tue, Jun 6, 2023 at 7:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
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
> > 
> > ...
> > 
> >> +#include <linux/delay.h>
> >> +#include <linux/dev_printk.h>
> >> +#include <linux/module.h>
> >> +#include <linux/regmap.h>
> > 
> > + types.h
> > 
> >> +#include <media/v4l2-cci.h>
> > 
> >> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
> >> +{
> >> +       int i, len, ret;
> >> +       u8 buf[4];
> >> +
> >> +       if (err && *err)
> >> +               return *err;
> >> +
> >> +       /* Set len to register width in bytes */
> >> +       len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> >> +       reg &= CCI_REG_ADDR_MASK;
> >> +
> >> +       ret = regmap_bulk_read(map, reg, buf, len);
> >> +       if (ret) {
> >> +               dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
> >> +               if (err)
> >> +                       *err = ret;
> >> +
> >> +               return ret;
> >> +       }
> >> +
> >> +       *val = 0;
> >> +       for (i = 0; i < len; i++) {
> >> +               *val <<= 8;
> >> +               *val |= buf[i];
> >> +       }
> > 
> > I really prefer to see put_unaligned() here depending on the length.
> > Note, that on some CPUs it might be one assembly instruction or even
> > none, depending on how the result is going to be used.
> 
> Ok, so you mean changing it to something like this:
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

I think the loop looks nicer but I'm fine with this as well.

> 
> ?
> 
> 		
> 
> > 
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(cci_read);
> > 
> > Can we have it namespaced?
> 
> I'm not sure if having just these 5 symbols in their own namespace is worth it. SO far the media subsystem is not using module/symbol namespacing at all.
> 
> Sakari, Laurent, any opinions on this ?

Regmap nor V4L2 use it so I wouldn't use it here either.

> 
> 
> 
> >> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
> >> +{
> >> +       int i, len, ret;
> >> +       u8 buf[4];
> >> +
> >> +       if (err && *err)
> >> +               return *err;
> >> +
> >> +       /* Set len to register width in bytes */
> >> +       len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> >> +       reg &= CCI_REG_ADDR_MASK;
> >> +
> >> +       for (i = 0; i < len; i++) {
> >> +               buf[len - i - 1] = val & 0xff;
> >> +               val >>= 8;
> >> +       }
> >> +
> >> +       ret = regmap_bulk_write(map, reg, buf, len);
> >> +       if (ret) {
> >> +               dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
> >> +               if (err)
> >> +                       *err = ret;
> >> +       }
> >> +
> >> +       return ret;
> >> +}
> >> +EXPORT_SYMBOL_GPL(cci_write);
> > 
> > Same comments as per above function.
> > 
> > ...
> > 
> >> +               if (regs[i].delay_us)
> > 
> > I'm wondering why fsleep() doesn't have this check? Or does it?
> > 
> >> +                       fsleep(regs[i].delay_us);
> > 
> > ...
> > 
> >> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
> >> +{
> >> +       struct regmap_config config = {
> >> +               .reg_bits = reg_addr_bits,
> >> +               .val_bits = 8,
> >> +               .reg_format_endian = REGMAP_ENDIAN_BIG,
> > 
> > Is the lock required?
> > If so, how is it helpful?
> 
> Interesting questions sensor drivers typically already do
> their own locking.
> 
> So I guess we could indeed tell regmap to skip locking here.
> 
> Sakari, Laurent any opinion on this ?

There are loops here so it won't be atomic in any case.

Generally drivers indeed already take care of this. I don't think we need
locking on this level.

> 
> > Can we move this outside as static const?
> 
> No, because reg_bits is not const.
> 
> 
> 
> >> +       };
> >> +
> >> +       return devm_regmap_init_i2c(client, &config);
> >> +}
> > 
> > ...
> > 
> >> +#ifndef _V4L2_CCI_H
> >> +#define _V4L2_CCI_H
> > 
> > + bits.h
> > 
> >> +#include <linux/regmap.h>
> > 
> > Not used, rather requires forward declarations of
> > 
> > struct regmap
> > struct reg_sequence
> 
> Ack, I'll change this for the next version.
> 
> > Also note missing i2c_client forward declaration.
> 
> That was also taken care of by regmap.h.
> 
> > 
> >> +#include <linux/types.h>
> >> +
> >> +/*
> >> + * Note cci_reg_8 deliberately is 0, not 1, so that raw
> >> + * (not wrapped in a CCI_REG*() macro) register addresses
> >> + * do 8 bit wide accesses. This allows unchanged use of register
> >> + * initialization lists of raw address, value pairs which only
> >> + * do 8 bit width accesses. Which makes porting drivers easier.
> >> + */
> >> +enum cci_reg_type {
> >> +       cci_reg_8 = 0,
> > 
> > But this is guaranteed by the C standard... See also below.
> > 
> >> +       cci_reg_16,
> > 
> > But this one becomes 1, so the above comment doesn't clarify why it's
> > okay to have it 1 and not 2.
> 
> Basically the idea is that the enum value is the reg-width in bytes - 1
> where the - 1 is there so that cci_reg_8 = 0 .

I'm fine with the comment.

-- 
Kind regards,

Sakari Ailus
