Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E6077CD57
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 15:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236727AbjHONcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 09:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbjHONcD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 09:32:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E524D127
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 06:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692106321; x=1723642321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fr42fSDqd2ZxmBucCiunO4t4uy3k0/ftEm70ni9EhBU=;
  b=GqiXwTsE4X4T5UD+GiViiWOnfLSEIWzGuykkRP9Bza2WLTCTAmOYGXcY
   3i1i2bnt4iAVpeCrcHD9PQJ8YgKKk6lL1acAF2WcAEtj6a1B2xShuZ7fX
   B6C0K8DjMF8jsW43mlQc+AO/sWzDksmb/1niXzAY3+m2X8UMD2VSAZHvw
   vO/Y2kskKWQBgEHhikmDetAg7wdJ5kKbIoufc43i7zYNyNlJbrsYVITlA
   XkLP1tI4VmN9JtIW1T9uHqSOFm1yDOW/+hO0SpTB62bv/hsAIVorKwh09
   oy1Ca82oR3HyLx/kEJarw/+q439JEZ/0OJGMF9FRx1iSZwuEG1j19eJFA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438613225"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="438613225"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 06:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848068368"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="848068368"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 06:31:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0644111FBCB;
        Tue, 15 Aug 2023 16:31:56 +0300 (EEST)
Date:   Tue, 15 Aug 2023 13:31:55 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/5] media: imx290: Convert to new CCI register access
 helpers
Message-ID: <ZNt+S6dl/rTNLgId@kekkonen.localdomain>
References: <20230627125109.52354-1-hdegoede@redhat.com>
 <20230627125109.52354-4-hdegoede@redhat.com>
 <20230815131539.GA9702@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815131539.GA9702@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Aug 15, 2023 at 04:15:39PM +0300, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Tue, Jun 27, 2023 at 02:51:06PM +0200, Hans de Goede wrote:
> > Use the new comon CCI register access helpers to replace the private
> > register access helpers in the imx290 driver.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > Note:
> > 1. This is untested
> > 2. For reviewers: all the IMX290_REG_?BIT defines in both the register
> > address defines as well as in various reg-sequences were automatically
> > changed using search replace.
> > ---
> > Changes in v3:
> > - Fixed a couple of lines > 80 chars
> > 
> > Changes in v2:
> > - New patch in v2 of this series
> > ---
> >  drivers/media/i2c/Kconfig  |   1 +
> >  drivers/media/i2c/imx290.c | 360 +++++++++++++++----------------------
> >  2 files changed, 150 insertions(+), 211 deletions(-)
> 
> [snip]
> 
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index b3f832e9d7e1..e78c7b91ae72 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -21,91 +21,86 @@
> 
> [snip]
> 
> > @@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290, u32 code)
> >  	return NULL;
> >  }
> >  
> > -/* -----------------------------------------------------------------------------
> > - * Register access
> > - */
> > -
> > -static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
> > -{
> > -	u8 data[3] = { 0, 0, 0 };
> > -	int ret;
> > -
> > -	ret = regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> > -			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> > -	if (ret < 0) {
> > -		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
> > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > -		return ret;
> > -	}
> > -
> > -	*value = get_unaligned_le24(data);
> > -	return 0;
> > -}
> > -
> > -static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
> > -{
> > -	u8 data[3];
> > -	int ret;
> > -
> > -	if (err && *err)
> > -		return *err;
> > -
> > -	put_unaligned_le24(value, data);
> 
> We seem to be having a problem here, as the CCI helpers unconditionally
> use big endian for the data :-(

Well spotted. This driver needs to address this.

It's a hardware issue though. It's the only sensor ever I've seen to have
little endian registers.

> 
> > -
> > -	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
> > -			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
> > -	if (ret < 0) {
> > -		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
> > -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> > -			 addr & IMX290_REG_ADDR_MASK, ret);
> > -		if (err)
> > -			*err = ret;
> > -	}
> > -
> > -	return ret;
> > -}
> > -
> 
> [snip]
> 

-- 
Regards,

Sakari Ailus
