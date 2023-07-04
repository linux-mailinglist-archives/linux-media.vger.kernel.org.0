Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE4774742B
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjGDOcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjGDOcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:32:50 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FF210C3
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:32:49 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393880694"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="393880694"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="784246285"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="784246285"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jul 2023 07:32:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1qGh50-0002nl-2Z;
        Tue, 04 Jul 2023 17:32:34 +0300
Date:   Tue, 4 Jul 2023 17:32:34 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new
 common ipu_bridge_init()
Message-ID: <ZKQtgkyTf/x48eCO@smile.fi.intel.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-14-hdegoede@redhat.com>
 <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com>
 <51c9a63b-915b-c128-916e-b84e1fe659fa@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51c9a63b-915b-c128-916e-b84e1fe659fa@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 04, 2023 at 02:55:02PM +0100, Dan Scally wrote:
> On 30/06/2023 16:45, Andy Shevchenko wrote:
> > On Fri, Jun 30, 2023 at 2:07 PM Hans de Goede <hdegoede@redhat.com> wrote:

(Can you remove unneeded context when replying to the messages, please?)

...

> > > +       if (!acpi_match_device_ids(adev, dual_lane_sensors))
> > > +               lanes = 2;
> > > +       else
> > > +               lanes = 1;
> > Can we use positive conditional?
> > 
> >         if (acpi_match_device_ids(adev, dual_lane_sensors))
> >                 lanes = 1;
> >         else
> >                 lanes = 2;
> 
> Or perhaps "if (acpi_match_device_ids(adev, dual_lane_sensors) == 0)"?

Unfortunately this will be more confusing. The above mentioned API returns
the error code or 0 on success.

	ret = acpi_match_device_ids(adev, dual_lane_sensors);
        if (ret)
                lanes = 1;
        else
                lanes = 2;

probably is the best to have semantics of returned code more or less
easy to get.

-- 
With Best Regards,
Andy Shevchenko


