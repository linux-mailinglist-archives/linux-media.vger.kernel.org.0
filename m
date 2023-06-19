Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715D2735587
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 13:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbjFSLNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 07:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjFSLNA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 07:13:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B105091
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 04:12:59 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="425557358"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="425557358"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 04:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="663948619"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="663948619"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 19 Jun 2023 04:12:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qBCoL-004yWr-2n;
        Mon, 19 Jun 2023 14:12:41 +0300
Date:   Mon, 19 Jun 2023 14:12:41 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 1/7] media: atomisp: Fix missing v4l2_fh_release() in
 atomisp_open() error exit
Message-ID: <ZJA4KYg9t1f8T2p7@smile.fi.intel.com>
References: <20230619105212.303653-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619105212.303653-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 19, 2023 at 12:52:06PM +0200, Hans de Goede wrote:
> Fix missing v4l2_fh_release() in atomisp_open()'s
> "if (pipe->users)" error exit path.

All LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


