Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCABE74741A
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbjGDO2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbjGDO2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:28:24 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A984CE5F
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:28:23 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393879585"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="393879585"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="784243792"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="784243792"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jul 2023 07:28:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1qGh0s-0002kN-2s;
        Tue, 04 Jul 2023 17:28:18 +0300
Date:   Tue, 4 Jul 2023 17:28:18 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Fabian =?iso-8859-1?Q?W=FCthrich?= <me@fabwu.ch>
Subject: Re: [PATCH v2 01/15] media: ipu-bridge: Fix null pointer deref on
 SSDB/PLD parsing warnings
Message-ID: <ZKQsglq1DmM5sgq6@smile.fi.intel.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-2-hdegoede@redhat.com>
 <CAHp75VdQAJyfYj63pU4DaD5EhWpW-k5jJ-AUv7QNyPM1MJ4-eA@mail.gmail.com>
 <18b44c72-1873-4756-3fa3-55d6ca4c3984@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18b44c72-1873-4756-3fa3-55d6ca4c3984@ideasonboard.com>
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

On Tue, Jul 04, 2023 at 12:02:00PM +0100, Dan Scally wrote:
> On 30/06/2023 16:23, Andy Shevchenko wrote:
> > On Fri, Jun 30, 2023 at 2:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > When ipu_bridge_parse_rotation() and ipu_bridge_parse_orientation() run
> > > sensor->adev is not set yet.
> > > 
> > > So if either of the dev_warn() calls about unknown values are hit this
> > > will lead to a NULL pointer deref.
> > > 
> > > Set sensor->adev earlier, with a borrowed ref to avoid making unrolling
> > > on errors harder, to fix this.
> > TBH, I don't like this approach, it seems a bit dirty to me.
> > 
> > First of all, why do we need pci_dev to be a parameter in this function?
> > Second, why don't we consistently use the ACPI handle (with respective
> > acpi_handle_*() macros to print messages)?
> > 
> > So, my proposal here is to actually save the ACPI device handle in the
> > sensor object and use it for the messaging. It makes it consistent and
> > doesn't require to rewrite adev field which seems the dirty part to
> > me.
> 
> It's a bit finicky but I don't think it's so bad; the refcounting is all
> fine, the later acpi_dev_get() is only to hold a reference once the next
> loop iteration frees the existing one and the rewrite should store the exact
> same pointer...we could just not store the result of the acpi_dev_get() call
> to avoid that weird rewrite perhaps?

For short term solution in between the patches I might agree with you, but
backporting. Backporting a bad code doesn't make it better even if it fixes
nasty bug. And I proposed the solution. We may kill the handle same way as
we are killing the awkwardness of this assignment later in the series.

-- 
With Best Regards,
Andy Shevchenko


