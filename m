Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD05B7DECDE
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 07:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232885AbjKBGbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 02:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjKBGbV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 02:31:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2292A111;
        Wed,  1 Nov 2023 23:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698906675; x=1730442675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UbNClqiwgxv+4c/yht6vSvAnCGJooAq0eVKMUfkCEks=;
  b=EHbwHQ+0kjPv+rkXnbAjyxrkomzFVdCvK9mf4NXevGgMFbi4qCptblye
   EFV+NxeVNGEoCIHSbUrEtbj7gHG/xcElZMqgxk9yo9cRmbg60YFijVIyU
   8tB4L7C3XiLaFGvQOrOZzPXj3PXG2KPZzH5HjWC7tsNDMXjAly6r+aLCh
   7ZdBAeIC7caG35qQljgaHj/VaCEKi34eMdeBjvHC78/u2qBna8yQ56gDp
   ROzmxdqV8dD8D/m3YdyyAJeMd/jYc/XqCjobycmYba5YGAx9TrCqKjk46
   GL3Zp6oC0ib5ipAkAgnE0+JXJn5M+YKSu/Bzw6ZTZ79L6UP0M4xoT/lRQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="392532818"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="392532818"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 23:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="827006106"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="827006106"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 23:30:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2874111F9E8;
        Thu,  2 Nov 2023 08:30:44 +0200 (EET)
Date:   Thu, 2 Nov 2023 06:30:44 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian
 encoded registers
Message-ID: <ZUNCFESRnKMwkHl7@kekkonen.localdomain>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
 <20231101122354.270453-2-alexander.stein@ew.tq-group.com>
 <20231102012217.GC5933@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102012217.GC5933@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Nov 02, 2023 at 03:22:17AM +0200, Laurent Pinchart wrote:
> Hi Alexander,
> 
> Thank you for the patch.
> 
> On Wed, Nov 01, 2023 at 01:23:53PM +0100, Alexander Stein wrote:
> > Some sensors, e.g. Sony, are using little-endian registers. Add support for
> 
> I would write Sony IMX290 here, as there are Sony sensors that use big
> endian.

Almost all of them. There are a few exceptions indeed. This seems to be a
bug.

> 
> > those by encoding the endianess into Bit 20 of the register address.
> > 
> > Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access helpers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++------
> >  include/media/v4l2-cci.h           |  5 ++++
> >  2 files changed, 41 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> > index bc2dbec019b04..673637b67bf67 100644
> > --- a/drivers/media/v4l2-core/v4l2-cci.c
> > +++ b/drivers/media/v4l2-core/v4l2-cci.c
> > @@ -18,6 +18,7 @@
> >  
> >  int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> >  {
> > +	bool little_endian;
> >  	unsigned int len;
> >  	u8 buf[8];
> >  	int ret;
> > @@ -25,6 +26,7 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> >  	if (err && *err)
> >  		return *err;
> >  
> > +	little_endian = reg & CCI_REG_LE;
> 
> You could initialize the variable when declaring it. Same below.

I was thinking of the same, but then it'd be logical to move initialisation
of all related variables there. reg is modified here though. I'd keep
setting little_endian here. If someone wants to move it, that could be done
in a separate patch.

> 
> >  	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> >  	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> >  
> > @@ -40,16 +42,28 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> >  		*val = buf[0];
> >  		break;
> >  	case 2:
> > -		*val = get_unaligned_be16(buf);
> > +		if (little_endian)
> > +			*val = get_unaligned_le16(buf);
> > +		else
> > +			*val = get_unaligned_be16(buf);
> 
> Unrelated to this patch, isn't buf aligned to a 4 bytes boundary ?

Very probably, as it's right after len that's an unsigned int. Adding
__aligned(8) would ensure we don't need any of the unaligned variants, and
most likely would keep the stack layout as-is.

Or... how about putting it in an union with a u64? That would mean it's
accessible as u64 alignment-wise while the alignment itself is up to the
ABI. A comment would be good to have probably.

> 
> >  		break;
> >  	case 3:
> > -		*val = get_unaligned_be24(buf);
> > +		if (little_endian)
> > +			*val = get_unaligned_le24(buf);
> > +		else
> > +			*val = get_unaligned_be24(buf);
> >  		break;
> >  	case 4:
> > -		*val = get_unaligned_be32(buf);
> > +		if (little_endian)
> > +			*val = get_unaligned_le32(buf);
> > +		else
> > +			*val = get_unaligned_be32(buf);
> >  		break;
> >  	case 8:
> > -		*val = get_unaligned_be64(buf);
> > +		if (little_endian)
> > +			*val = get_unaligned_le64(buf);
> > +		else
> > +			*val = get_unaligned_be64(buf);
> >  		break;
> >  	default:
> >  		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",

-- 
Regards,

Sakari Ailus
