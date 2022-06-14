Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52D2654B215
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 15:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbiFNNM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 09:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbiFNNMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 09:12:25 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B47389D
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655212343; x=1686748343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWRhluXglDF3eEYaOYrblA1shJ/RUcNFMlvk2W3KV2s=;
  b=f+tcGY6q3h08Ymki7O4PVjKVUTHr7TBrISfYyX+CJkXgo0Oh9hxPKG/4
   HeTm2s6tE8+Lm3dTJdldiFAt3/0cmaTmxThNuEd/utfYxcLsaJTsap6t/
   Uj+23TlGjOZD3WxOFkyI1NFML0Yw1VDvtS5kaLzBYCgh/s3sevkp62LWd
   DvjW+hRH3s/WeAayyzMnuTMSMkAYYKfhIOg+yiJ5aaaxGTFyulFwzMxPh
   IPJ8h70fDVL42v3tP1RH/cNMnug5LAtNReo7i5dKI9ijncCs0bI+Lr9Pv
   MoFO+Yl2cPQ1+kmSA7xt/VwYLnEX1CUddAJIMRdHwH+JzYG8l6KfzIUJh
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="261641427"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="261641427"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:12:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="569968906"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:12:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1o16LB-000cNp-KO;
        Tue, 14 Jun 2022 16:12:17 +0300
Date:   Tue, 14 Jun 2022 16:12:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 31/40] media: atomisp: drop HMM_BO_SHARE type
Message-ID: <YqiJMRX6x3A7R/+T@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-32-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-32-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 13, 2022 at 09:51:28PM +0200, Hans de Goede wrote:
> HMM_BO_SHARE is not supported by the hmm_bo code at all, drop it.

...

> - * of memory: HMM_BO_PRIVATE, HMM_BO_USER, HMM_BO_SHARE.
> + * of memory: HMM_BO_PRIVATE, HMM_BO_USER..

Single period is enough?

-- 
With Best Regards,
Andy Shevchenko


