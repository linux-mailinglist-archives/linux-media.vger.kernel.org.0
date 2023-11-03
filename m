Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1667E014F
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 11:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347177AbjKCJhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Nov 2023 05:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347166AbjKCJhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Nov 2023 05:37:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE2FD45;
        Fri,  3 Nov 2023 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699004268; x=1730540268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S/nkKrTesetAZ6aXFR4Ncu3X482+P1gkm27faoGAlpc=;
  b=gL6m+T9tazegAY1+2iKwJDdwam33EulNYWM/uyswwjZ1q0piq/xS/InD
   G4LpIRG0GSlb4RbdcCOO2Ajyyjbx9mx9QHsYC60v6FspzsoNd5tnfI9v1
   RvUQ2iNGj3iNg/BENS46eW5pldFMr3tCgzAu7GsYD4Dkm0BZi1AvkAEiQ
   sJfWL9knUoSsxrAtJVIJocyxjsLFoDAZ8ynGuEnFyIVQ6YpPI2jkyMnIw
   yo5999i03+4E/8HeLb1hbNs4T3SRR/glpnfO4OcY2plE6rIkpUdKt+xeV
   2p164a43YsYtGUKwAcYd+C2uVUnvNu9wF5OUq1QrpNHA6S0rkV45L6/gm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="388741441"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="388741441"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711460349"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="711460349"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:37:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 11148120F5B;
        Fri,  3 Nov 2023 10:42:54 +0200 (EET)
Date:   Fri, 3 Nov 2023 08:42:54 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <ZUSyjllEUXYYszoF@kekkonen.localdomain>
References: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>
 <ZUSaccRE_lq5Mizh@kekkonen.localdomain>
 <f335560c-af40-4bed-ba3f-46a9efa339b8@kadam.mountain>
 <ZUSiGbcoutTPErJH@kekkonen.localdomain>
 <f47de73d-7741-4c2e-8a15-41264fb91e56@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f47de73d-7741-4c2e-8a15-41264fb91e56@kadam.mountain>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Fri, Nov 03, 2023 at 10:51:09AM +0300, Dan Carpenter wrote:
> On Fri, Nov 03, 2023 at 07:32:41AM +0000, Sakari Ailus wrote:
> > > > > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > > > > index 4a195b68f28f..21d149969119 100644
> > > > > --- a/include/uapi/linux/v4l2-subdev.h
> > > > > +++ b/include/uapi/linux/v4l2-subdev.h
>                       ^^^^
> 
> > > > > @@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
> > > > >   * set (which is the default), the 'stream' fields will be forced to 0 by the
> > > > >   * kernel.
> > > > >   */
> > > > > - #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> > > > > + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		BIT_ULL(0)
> > > > 
> > > > This is a UAPI header but BIT_ULL() is defined in kernel-only headers.
> > > > 
> > > > So (1ULL << 0) ?
> > > > 
> > > > uapi/linux/const.h also has _BITULL().
> > > 
> > > Let's just do 1ULL < 0.  I'll resend.  Is there an automated way I could
> > > have caught this?
> > 
> > I don't know. :-) Remember to use shift left for bit definitions in UAPI
> > headers?
> 
> Yeah.  I knew it was UAPI but I'm not used to thinking about UAPI rules.
> I only tried to build this on kernel .c files and didn't try to rebuild
> the usr/ dir.
> 
> I bet someone would have complained eventually but who would have
> run into this first...  I see there are existing BIT() users in the usr/
> dir, but everyone seems good about using __u32 instead of u32.  Probably
> because declaring a variable as u32 causes an immediate compile error
> for everyone but bogus BIT() defines are not an issue until someone
> tries to use them.
> 
> KTODO: write a script to check that UAPI doesn't use kernel types
> 
> Maybe this could be a part of checkpatch.pl?

I think that would be useful.

I wonder if there are be better ways to check for non-existent macros
than e.g. singling out BIT() and others. I'd think just checking for BIT()
etc. should be enough.

> 
> regards,
> dan carpenter
> 
> $ grep BIT usr/ -Rw
> usr/include/misc/uacce/uacce.h:#define UACCE_DEV_SVA            BIT(0)
> usr/include/linux/psci.h:#define PSCI_1_0_OS_INITIATED                  BIT(0)
> usr/include/linux/can/netlink.h: * For further information, please read chapter "8 BIT TIMING
> usr/include/linux/cxl_mem.h:#define CXL_MEM_COMMAND_FLAG_ENABLED                BIT(0)
> usr/include/linux/cxl_mem.h:#define CXL_MEM_COMMAND_FLAG_EXCLUSIVE              BIT(1)
> usr/include/linux/nl80211.h: *  bitmask of BIT(NL80211_BAND_*) as described in %enum
> usr/include/linux/mdio.h:#define MDIO_AN_C73_0_PAUSE            BIT(10)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_0_ASM_DIR          BIT(11)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_0_C2               BIT(12)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_0_RF               BIT(13)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_0_ACK              BIT(14)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_0_NP               BIT(15)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_1000BASE_KX      BIT(5)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_10GBASE_KX4      BIT(6)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_10GBASE_KR       BIT(7)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_40GBASE_KR4      BIT(8)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_40GBASE_CR4      BIT(9)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_CR10    BIT(10)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_KP4     BIT(11)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_KR4     BIT(12)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_100GBASE_CR4     BIT(13)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_25GBASE_R_S      BIT(14)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_1_25GBASE_R                BIT(15)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_2_2500BASE_KX      BIT(0)
> usr/include/linux/mdio.h:#define MDIO_AN_C73_2_5GBASE_KR                BIT(1)
> usr/include/asm/kvm.h:#define KVM_PMU_EVENT_FLAG_MASKED_EVENTS BIT(0)
> usr/include/asm/kvm.h:#define KVM_EXIT_HYPERCALL_LONG_MODE      BIT(0)
> usr/include/drm/radeon_drm.h: * THESE ARE NOT BIT FIELDS
> usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_READ                BIT(0)
> usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_WRITE               BIT(1)
> usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_LBW         BIT(2)
> usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_HBW         BIT(3)
> usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_RR          BIT(4)
> usr/include/drm/habanalabs_accel.h:#define HL_RAZWI_ADDR_DEC    BIT(5)

Indeed.

-- 
Regards,

Sakari Ailus
