Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48D32731508
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 12:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245016AbjFOKQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 06:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240382AbjFOKQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 06:16:52 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707F32738
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 03:16:50 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="362252796"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="362252796"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="715576306"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="715576306"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2023 03:16:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1q9k22-003uot-02;
        Thu, 15 Jun 2023 13:16:46 +0300
Date:   Thu, 15 Jun 2023 13:16:45 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 4/5] media: atomisp: ov2680: Convert to new CCI
 register access helpers
Message-ID: <ZIrlDUM+EAl8dHky@smile.fi.intel.com>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-5-hdegoede@redhat.com>
 <CAHp75VdgN4Uc4_LdPO+q1kwV8so4Uey6h8R8fqyf=XEO9Ns8_g@mail.gmail.com>
 <2123e55c-7591-14d9-3303-9ff152181637@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2123e55c-7591-14d9-3303-9ff152181637@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 15, 2023 at 11:02:37AM +0200, Hans de Goede wrote:
> On 6/14/23 22:15, Andy Shevchenko wrote:
> > On Wed, Jun 14, 2023 at 10:24 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> -       struct i2c_client *client;
> >> +       struct device *dev;
> >> +       struct regmap *regmap;
> > 
> > Similar question as per patch 2. Do we need both of them?
> 
> You are right that having both is not strictly necessary,
> but the entire atomisp-ov2680.c file is going away as soon as
> my main ov2680.c driver changes series is merged.
> 
> The only reason to upstream this patch is because much
> of the work landing in the main ov2680.c is copy -pasted
> from the state of atomisp-ov2680.c *after this patch* ,
> so having this in git history before deleting atomisp-ov2680.c
> is helpful in case someone ever finds the need to compare
> the code.
> 
> Since the next patch for atomisp-ov2680.c after this one
> is going to be deleting the entire file I really don't feel
> like spending time on fixing this minor review remark,
> I hope you understand.

Sure. In case of new version, please mention this in the commit message.

-- 
With Best Regards,
Andy Shevchenko


