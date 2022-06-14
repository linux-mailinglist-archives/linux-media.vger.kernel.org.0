Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9640E54B204
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 15:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244024AbiFNNIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 09:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243543AbiFNNIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 09:08:45 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA259F59F
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655212123; x=1686748123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=msXBuZ0bvyzVTesaAvJbe4Mq7cZJT3HuRTTi9LBEfKY=;
  b=ODvw08MlsmVIfDqQY8P2h3K2iIybcvt2vdoomhvlmc7pnUSfOa28HSCh
   H48K7r/fk4GGDfUKFcZZxvel0YeMynIsCJEvcPEpIJOxodxRX/0/MrzU2
   VrJISZVLObY9jbmiTsOdgxVm74ZawGhObHClD/I5tXFRiUIXeSnN4vDwA
   /uZIBoomFPTUWEFahBJ44NeftziVWEXO7LTx8iKyAzxeFb3ZsQnGwSFU+
   LLjPzH0jopjo6Kq8rv68456T6SJ3LSDz9vqJwmyzB+XpqT6KVWnE/lzoL
   Elolp2ftQ3PHGp4Wmox4kJIcsPe/uWLxYpUlnUjFP46Fb7nh0EkRycqdV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342575216"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="342575216"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:08:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="652027565"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:08:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1o16Hc-000cNW-Ua;
        Tue, 14 Jun 2022 16:08:36 +0300
Date:   Tue, 14 Jun 2022 16:08:36 +0300
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
Subject: Re: [PATCH 24/40] media: atomisp: drop unused ATOMISP_ACC_FW_LOAD_*
 defines
Message-ID: <YqiIVPjp1ERaVueM@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-25-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-25-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 13, 2022 at 09:51:21PM +0200, Hans de Goede wrote:
> Drop the ATOMISP_ACC_FW_LOAD_* defines, these are no longer used anywhere.

Yeah, we have expect no modification to FW at all (carved in stone) and I do
not believe we have got any alternative firware just out of thin air. OTOH
the definitions are kept in the index, so we can restore them anyway.

-- 
With Best Regards,
Andy Shevchenko


