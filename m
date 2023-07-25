Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B387619FC
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 15:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjGYNbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 09:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjGYNbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 09:31:07 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0949A10E5
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690291866; x=1721827866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KesIaPfg5cgl1R1NXBTp0nQUvAdV4AHM5gFepJcQq64=;
  b=lZ4uCKxAzigKL7OQroxIdXW27LQvIdLFXiX7P+qzioQiorTBRO2C65sN
   OKXDzhEfT1xF0LLYaimrlOzmSJtBCsdUNkPaosjsGQ2TUh9uQMqY+4pZi
   GbVFljeFoy+I0ksH2hZIQANUx0P9EoECxkAAl2e8/u3f9QC9xSi0jhoRa
   YKTzHa7SNTPo1fM1eszUeaxajNbDqutpPHZ39DwkS/kzUKeLnym8QaP1A
   96nv2hLH7f8tBlXuufmCX2TePA5sl4Estdd5W8uua2ZRRZaTguBJqfIhH
   rQOkB86yhqkTgDW49z2IIOQKRytfykU5l1vS7zShRg+B8zdExGzBoQ9gG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="347327815"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="347327815"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 06:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720061493"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="720061493"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 06:30:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qOI7U-00BWjc-1F;
        Tue, 25 Jul 2023 16:30:32 +0300
Date:   Tue, 25 Jul 2023 16:30:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH -next] media: i2c: ds90ub960: fix return value check in
 ub960_rxport_add_serializer()
Message-ID: <ZL/OeBj+3ADYdBzz@smile.fi.intel.com>
References: <20230725121507.515435-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725121507.515435-1-yangyingliang@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 25, 2023 at 08:15:07PM +0800, Yang Yingliang wrote:
> i2c_new_client_device() never returns NULL pointer, it will return
> ERR_PTR() when it fails, so replace the check with IS_ERR() and
> use PTR_ERR() as return code.

Isn't the same fix to one that was in the mailing lists a few days ago?
Anyway, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


