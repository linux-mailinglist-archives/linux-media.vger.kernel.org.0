Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5774727E7B
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 13:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236483AbjFHLJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 07:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236383AbjFHLI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 07:08:57 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36413A86
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686222404; x=1717758404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yGLWkruIJgws3d4IRLbQcE5CoCMdEMJrcsKAySSMk1g=;
  b=JEXJu9VKc8gpgoFGu+XVs5kH/+qWFM9i3FsXqs9SK9fpluvAbn8sf5ou
   OrVmCLYjwQmNDYgx3GEnt4+2x1Jo8cQSdSTmL8n7+kv1DkSuYWZtUosq0
   9fFjZx4Ok4mS8RHvjt06330U7xWBBCUuUGlq1k/RR8r5sVKoOJFRHgdNV
   rAlD6ntKCpHPWy99sEdc3O069wibTMtwiz726hCIPx7Snswk8yZg0J0gY
   WqFR4V82ulxfhzSW2hNm5bwIlfZf/36xv1f+DBbpzG6znC/ChQ1iOeVn3
   xF65WLbsIblBg9CRPVoHGwUUA7koiTnvlmSZTAfzCi5NQGVABw4ttSrV8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337634447"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="337634447"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 04:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709938059"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="709938059"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 04:06:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A947C120BE1;
        Thu,  8 Jun 2023 14:06:00 +0300 (EEST)
Date:   Thu, 8 Jun 2023 11:06:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Nicholas Roth <nicholas@rothemail.net>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Add an entry for V4L2 sensor and lens
 drivers
Message-ID: <ZIG2GJdQ+oiMRhBk@kekkonen.localdomain>
References: <20230608095157.4055544-1-sakari.ailus@linux.intel.com>
 <20230608105637.GQ5058@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230608105637.GQ5058@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 08, 2023 at 01:56:37PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Jun 08, 2023 at 12:51:57PM +0300, Sakari Ailus wrote:
> > I maintain V4L2 sensor and lens drivers but there hasn't been a specific
> > MAINTAINERS entry for them. Add it now.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > The purpose is to help people cc me when sending sensor or lens driver
> > patches. Of course I find the patches in Patchwork but this always
> > introduces a delay in reviewing them.
> > 
> >  MAINTAINERS | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cec3c9ef43590..57aeca250bf4c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22084,6 +22084,21 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:	Maintained
> >  F:	drivers/clk/ux500/
> >  
> > +V4L2 SENSOR AND LENS DRIVERS
> > +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +F:	drivers/media/i2c/ar*
> > +F:	drivers/media/i2c/hi*
> > +F:	drivers/media/i2c/imx*
> > +F:	drivers/media/i2c/mt*
> > +F:	drivers/media/i2c/og*
> > +F:	drivers/media/i2c/ov*
> > +F:	drivers/media/i2c/st-vgxy61.c
> > +F:	drivers/media/i2c/dw*
> > +F:	drivers/media/i2c/ak*
> > +F:	drivers/media/i2c/lm*
> 
> This almost makes me think we should have sensor/ and lens/
> directories...

That's a fair question. I think it should be still corroborated whether and
how this could be aligned with other directories, or whether I²C (for
whatever reason) should have a special directory structure.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Kind regards,

Sakari Ailus
