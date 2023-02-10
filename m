Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB538691FC4
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 14:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbjBJNb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 08:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbjBJNb2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 08:31:28 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E4871677
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 05:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676035887; x=1707571887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Bs76Daq806vEWzq8FqACTwmKbFz2Iy3Ud1YqIx/XmRQ=;
  b=kGBQ7msVG8/cjI/nnwjiW3Makm6gbFmIPFAm0lgf9SpY2PpLHMbndbGN
   AQJfYGmtwHy5Y1VWDMhAt35vUlDoCw5D7FBY5vM8QHUP5bf5H6kXho9X+
   o9+IuWYE1VvLu2INmqUaevJ+wqwVcFNtP3RpJhqYsudLDPncDJp5OY0ZM
   LceAfgSkHcQo3tmkAlEVn72l8u/2rH7NreF54cELS1o1ZOXyLOmTw6OLg
   IucMHB+43whUxxApHX5EOrO6BzloBzyPt0MNvPqM80tjLx8130WuROwdP
   +cZt+4m6z28swU77PV5uXz4Jp60xlK37p2GVxgpolp8tdvcFg8NBGBS2w
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392823022"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="392823022"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:31:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="645627451"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="645627451"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:31:23 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 27AD21218A4;
        Fri, 10 Feb 2023 15:31:20 +0200 (EET)
Date:   Fri, 10 Feb 2023 15:31:20 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+ZHKFsocJX2h3GV@kekkonen.localdomain>
References: <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <3be27a04-21e5-5929-88a1-0159f554a36f@redhat.com>
 <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
 <Y+Y1yWCGg5ORJEoh@kekkonen.localdomain>
 <59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 10, 2023 at 01:59:07PM +0100, Hans de Goede wrote:
> > Who will now write the patches for this? :-)
> 
> I have already more or less volunteered / I opened this can of worms,
> so that would be me...

:-)

Thank you, this is much appreciated, and will allow factoring out ~ 50
lines of code from almost all sensor (as well as a few other) drivers.

> 
> I see in your other reply that you are fine with going without
> wrappers for the fixed width accesses for now, good. TBH I don't
> think these will add much value.

We can get back to this topic when converting drivers. These are
convenience wrappers after all and they're easy to add if needed, there's
no connection to the underlying implementation which is the important part.

> 
> I'll try to make some time to work on this somewhere the next
> couple of weeks.
> 
> Here is a rough sketch of the API for initial discussion:
> 
> /*
>  * Note cci_reg_8 deliberately is 0, not 1, so that raw
>  * (not wrapped in a CCI_REG*() macro) register addresses
>  * do 8 bit wide accesses. This allows unchanged use of register
>  * initialization lists of raw address, value pairs which only
>  * do 8 bit width accesses.
>  */
> enum cci_reg_type {
> 	cci_reg_8 = 0,
> 	cci_reg_16,
> 	cci_reg_24,
> 	cci_reg_32,

I'd use capital letters for these as they are macro-like. Or define them as
macros.

> };
> 
> /*
>  * Macros to define register address with the register width encoded
>  * into the higher bits. CCI_REG8() is a no-op so its use is optional.
>  */
> #define CCI_REG_SIZE_SHIFT		16
> #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> 
> #define CCI_REG8(x)			((cci_reg_8 << CCI_REG_SIZE_SHIFT) | (x))
> #define CCI_REG16(x)			((cci_reg_16 << CCI_REG_SIZE_SHIFT) | (x))
> #define CCI_REG24(x)			((cci_reg_24 << CCI_REG_SIZE_SHIFT) | (x))
> #define CCI_REG32(x)			((cci_reg_32 << CCI_REG_SIZE_SHIFT) | (x))

The top 8 bits could be used for flags in the future, for driver's use.
The CCS driver stores register's properties (value format) there.

> 
> int cci_read(struct regmap *regmap, u32 reg, u32 *val, int *err);
> int cci_write(struct regmap *regmap, u32 reg, u32 val, int *err);
> int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err);
> int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err);

We should also have a bulk data write function, although drivers could use
regmap directly to do this. Not needed now, nor this is a common need. Just
a note.

> 
> Note the regmap here is intended to be a regmap with 16 bit register-address
> width and 8 bit register-data width. I'll add a helper to get the regmap
> from an i2c_client to the initial implementation.

CCI also supports 8-bit register addresses (virtually all lens VCM and
flash drivers as well as some sensor drivers) so this should be a
parameter.

I expect some drivers to support CCI via both I²C and I3C. We don't need
I3C now as all sensors are I²C, but I²C should be visible in the API only
when it's about making the connection to an I²C client.

> 
> Also note that all the function names have been chosen to be 1:1 mirrors
> of the matching regmap functions with the addition of the *err argument.

-- 
Kind regards,

Sakari Ailus
