Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 417D8631C48
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 10:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiKUJB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 04:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiKUJB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 04:01:26 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B7513CFB
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 01:01:25 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="296867813"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="296867813"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="591698052"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="591698052"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 21 Nov 2022 01:01:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ox2g4-00FBs7-2t;
        Mon, 21 Nov 2022 11:01:20 +0200
Date:   Mon, 21 Nov 2022 11:01:20 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 10/20] media: atomisp: Drop userptr support from hmm
Message-ID: <Y3s+YOqkvdBrfLy+@smile.fi.intel.com>
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-11-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120224101.746199-11-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 20, 2022 at 11:40:51PM +0100, Hans de Goede wrote:
> After the conversion to videobuf2 userptr support is no longer needed,
> drop it.

...

>  	dev_dbg(atomisp_dev,
> -		"%s: pages: 0x%08x (%zu bytes), type: %d, user ptr %p\n",
> -		__func__, bo->start, bytes, type, userptr);
> +		"%s: pages: 0x%08x (%zu bytes), type: %d, vmalloc %p\n",
> +		__func__, bo->start, bytes, type, vmalloc);

I believe we may drop __func__ here as well.

-- 
With Best Regards,
Andy Shevchenko


