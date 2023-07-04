Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743BE747412
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbjGDO0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbjGDO0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:26:36 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D96EE49
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:26:36 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343466775"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="343466775"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808955779"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="808955779"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2023 07:26:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1qGgz9-0002iU-1Z;
        Tue, 04 Jul 2023 17:26:31 +0300
Date:   Tue, 4 Jul 2023 17:26:31 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 09/15] media: ipu-bridge: Drop early setting of
 sensor->adev
Message-ID: <ZKQsF4Spx5MEtKnD@smile.fi.intel.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-10-hdegoede@redhat.com>
 <CAHp75VfH1nE3KxOTVpJ6=7naMvU-wpjai1Gg0JPSUXkWADqRaw@mail.gmail.com>
 <0dc01c91-dfe0-a422-06f2-0f6ae8257a5f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dc01c91-dfe0-a422-06f2-0f6ae8257a5f@redhat.com>
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

On Tue, Jul 04, 2023 at 01:20:33PM +0200, Hans de Goede wrote:
> On 6/30/23 16:30, Andy Shevchenko wrote:
> > On Fri, Jun 30, 2023 at 2:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> sensor->adev is no longer dereferenced before it is permanently set by:
> >>
> >>         sensor->adev = acpi_dev_get(adev);
> >>
> >> So the early assignment with a borrowed reference can be dropped.
> > 
> > Ah, now I see that that change was temporary.
> 
> Ack
> 
> > Can we avoid backporting
> > it please?
> 
> Patch 1/15 does fix a NULL pointer deref oops, so backporting it would
> be a good thing to do IMHO.

Then better to go with ACPI handle. I don't like the rewriting same field
(even if it's the same information). It's prone to errors which might be
hard to find.

-- 
With Best Regards,
Andy Shevchenko


