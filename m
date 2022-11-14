Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B323627D9D
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 13:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237147AbiKNMWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 07:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237145AbiKNMWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 07:22:17 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9D523179
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 04:22:17 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313758412"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="313758412"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="616292190"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="616292190"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 14 Nov 2022 04:22:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ouYTc-00CA4N-0X;
        Mon, 14 Nov 2022 14:22:12 +0200
Date:   Mon, 14 Nov 2022 14:22:11 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 00/17] media: atomisp: Convert to videobuf2
Message-ID: <Y3Iy86AUKvoMz2l1@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 20, 2022 at 09:55:16PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my patch series converting the staging atomisp driver to use
> the videobuf2 framework, fixing MMAP mode not working.
> 
> New in v2 is that the "media: atomisp: Convert to videobuf2" patch
> now also contains moving over to using a per vb_queue lock as is
> standard for v4l2 drivers. This removes a bunch of FIXME + checkpatch
> warnings (due to commented out prep for this) from v1 of this patch.
> This v2 also fixes the 1 new warning pointed out by the lkp test robot.
> 
> For some more background info here are the still relevant bits of
> the v1 cover-letter:
> 
> This also contains an important fix to try_fmt handling, so that
> the various supported output formats can actually be used by userspace
> which calls try_fmt before doing s_fmt.
> 
> So slowly this is starting to look more and more like a standard
> v4l2 device (with all the complex pipeline handling hidden in the driver,
> moving that to userspace seems to be impossible with this design since
> multiple pipeline steps are handled by a single firmware program).

I completely in favour of the series, so
Reviewed-by: Andy Shevchenko <andy@kernel.org>
for non-commented patches, for the commented, where comment is a "side note".

For the rest depends on your action, if you are going to address as suggested,
feel free to add my tag.

-- 
With Best Regards,
Andy Shevchenko


