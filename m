Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D097DEE32
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 09:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbjKBIb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 04:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjKBIb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 04:31:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01D012D;
        Thu,  2 Nov 2023 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698913910; x=1730449910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K7ZBMRtXg0wv6hbFIGdEivEXg9AfDOM8aJ4QJulJ6ss=;
  b=j/CVPG1iWK6NNaanOCwjmgn1DuKwRQ0XuLFWKsbwbFqr4UCQ9uOXZkju
   hw141JQ2MjkZUG3aDb6gK2Ji21TXbOm4edaIMmeY9mnF8pD4PLH0h56si
   8EeNRIqUc01lEY6qpzVYkzhsJb6r6b57givZw4fbKk4TdqY/LNkHPBpoC
   mxa0Q+bfRwlogIHgsTgt82o9oK5KLx2Gn0XoqU0WlmBUc5fXlZ5zpAI4l
   Hqxi394FQl7+lg937rBlUffg21VHun5e0spGaALR4AhHVPoITD1kOMzOJ
   /J141InPvvNBMyppWBwq2+C0blYv+zAzVHD5pykYsbZy48oI8eJ1fxXDh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="388482211"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="388482211"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="711067236"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="711067236"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:31:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id AEED512035D;
        Thu,  2 Nov 2023 10:31:44 +0200 (EET)
Date:   Thu, 2 Nov 2023 08:31:44 +0000
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
Message-ID: <ZUNecAPukbm3kOyv@kekkonen.localdomain>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
 <20231101122354.270453-2-alexander.stein@ew.tq-group.com>
 <20231102012217.GC5933@pendragon.ideasonboard.com>
 <1977009.tdWV9SEqCh@steina-w>
 <20231102082430.GE5933@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102082430.GE5933@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Alexander,

On Thu, Nov 02, 2023 at 10:24:30AM +0200, Laurent Pinchart wrote:
> Hi Alexander,
> 
> On Thu, Nov 02, 2023 at 08:55:01AM +0100, Alexander Stein wrote:
> > Am Donnerstag, 2. November 2023, 02:22:17 CET schrieb Laurent Pinchart:
> > > On Wed, Nov 01, 2023 at 01:23:53PM +0100, Alexander Stein wrote:
> > > > Some sensors, e.g. Sony, are using little-endian registers. Add support
> > > > for
> > > 
> > > I would write Sony IMX290 here, as there are Sony sensors that use big
> > > endian.
> > > 
> > > > those by encoding the endianess into Bit 20 of the register address.
> > > > 
> > > > Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access
> > > > helpers") Cc: stable@vger.kernel.org
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > 
> > > >  drivers/media/v4l2-core/v4l2-cci.c | 44 ++++++++++++++++++++++++------
> > > >  include/media/v4l2-cci.h           |  5 ++++
> > > >  2 files changed, 41 insertions(+), 8 deletions(-)
> 
> [snip]
> 
> > > > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > > > index 0f6803e4b17e9..ef3faf0c9d44d 100644
> > > > --- a/include/media/v4l2-cci.h
> > > > +++ b/include/media/v4l2-cci.h
> > > > @@ -32,12 +32,17 @@ struct cci_reg_sequence {
> > > >  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> > > >  #define CCI_REG_WIDTH_SHIFT		16
> > > >  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> > > > +#define CCI_REG_LE			BIT(20)
> > > > 
> > > >  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
> > > >  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
> > > >  #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
> > > >  #define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
> > > >  #define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
> > > > +#define CCI_REG16_LE(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > > > +#define CCI_REG24_LE(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > > > +#define CCI_REG32_LE(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > > > +#define CCI_REG64_LE(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> > > 
> > > I would put CCI_REG_LE first, to match the bits order.
> > 
> > You mean this order?
> > 
> > CCI_REG8(x)
> > CCI_REG16_LE(x)
> > CCI_REG16(x)
> > CCI_REG24_LE(x)
> > CCI_REG24(x)
> > CCI_REG32_LE(x)
> > CCI_REG32(x)
> > CCI_REG64_LE(x)
> > CCI_REG64(x)
> > 
> > I would either keep the _LE variants at the bottom or below to their big-
> > endian counterpart. I prefer readability thus I would put the _LE at the 
> > bottom, also it aligns nicely with the additional bit set.
> 
> No, I meant
> 
> #define CCI_REG16_LE(x)			(CCI_REG_LE | (2 << CCI_REG_WIDTH_SHIFT) | (x))
> #define CCI_REG24_LE(x)			(CCI_REG_LE | (3 << CCI_REG_WIDTH_SHIFT) | (x))
> #define CCI_REG32_LE(x)			(CCI_REG_LE | (4 << CCI_REG_WIDTH_SHIFT) | (x))
> #define CCI_REG64_LE(x)			(CCI_REG_LE | (8 << CCI_REG_WIDTH_SHIFT) | (x))

Ideally these numbers would be unsigned, i.e.

#define CCI_REG16_LE(x)			(CCI_REG_LE | (2U << CCI_REG_WIDTH_SHIFT) | (x))
#define CCI_REG24_LE(x)			(CCI_REG_LE | (3U << CCI_REG_WIDTH_SHIFT) | (x))
#define CCI_REG32_LE(x)			(CCI_REG_LE | (4U << CCI_REG_WIDTH_SHIFT) | (x))
#define CCI_REG64_LE(x)			(CCI_REG_LE | (8U << CCI_REG_WIDTH_SHIFT) | (x))

This is a pre-existing problem. Feel free to add a patch to address it. :-)

-- 
Kind regards,

Sakari Ailus
