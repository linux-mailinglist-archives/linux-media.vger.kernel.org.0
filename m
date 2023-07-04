Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F8E747434
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbjGDOgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjGDOgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:36:23 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A84EE5B
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:36:21 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="365704047"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="365704047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712903072"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="712903072"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 04 Jul 2023 07:36:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qGh8Z-0002q6-1z;
        Tue, 04 Jul 2023 17:36:15 +0300
Date:   Tue, 4 Jul 2023 17:36:15 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 28/29] media: ov2680: Add link-freq and pixel-rate
 controls
Message-ID: <ZKQuX1atvHib9Xf4@smile.fi.intel.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-29-hdegoede@redhat.com>
 <6f3d903c-acdc-983c-216b-45792a71d603@ideasonboard.com>
 <750f6763-d08a-efe1-f75e-b8c3a10b7c46@redhat.com>
 <CAPY8ntA4NexYVDuuw6-vqLJ33zz7jx+qN9bzx6c3wVGgF51ZfQ@mail.gmail.com>
 <04b22ece-84e0-22de-071b-55d77628c091@redhat.com>
 <5b2d0bfd-c074-c511-d583-56bad00787c1@redhat.com>
 <CAPY8ntC0R4PvQ02EH1b-5E2z8Nh0mDUjENbnSfgUQPCy=ck_tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntC0R4PvQ02EH1b-5E2z8Nh0mDUjENbnSfgUQPCy=ck_tQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 04, 2023 at 01:19:28PM +0100, Dave Stevenson wrote:
> On Tue, 4 Jul 2023 at 12:32, Hans de Goede <hdegoede@redhat.com> wrote:
> > On 7/4/23 13:29, Hans de Goede wrote:
> > > On 7/4/23 13:23, Dave Stevenson wrote:

...

> > > So my question is do we make the link-frequency control
> > > return 331.2 MHz or 330 MHz when a 19.2 MHz xvclk is used ?
> > >
> > > 330 MHz is what will be requested in the link-frequency
> > > device property. 331.2 MHz will be what is actually used.
> > >
> > > (the 24MHz xvclk scenario results in an exact link-freq of
> > > 330MHz)
> 
> OK, that wasn't clear from the earlier discussion.
> 
> > I just realized that since both the xvclk frequency and the
> > link-frequency property will both come from the same ACPI
> > glue we could fix this be actually putting  331.2 MHz
> > in the property and making the driver accept this as valid
> > when a 19.2 MHz xvclk is used.
> >
> > That would make the property and the actually achieved
> > link-frequency be in sync again. So this is probably the
> > best way to handle this.
> >
> > Does this solution work for everyone ?
> 
> Yes, asking for the right thing sounds like a good solution.

+1 here.

> It's the same route as I went for with imx258 in [1]. There 24MHz
> results in a slightly different link freq to the existing 19.2MHz
> configuration.

-- 
With Best Regards,
Andy Shevchenko


