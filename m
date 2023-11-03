Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6503B7DFDEB
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 03:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjKCCFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 22:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjKCCFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 22:05:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8984194
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 19:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698977136; x=1730513136;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=e7aoDjzFOrEWS4LNe0fqMqSgEbEAjTWnIT/HsUArKdY=;
  b=XPb7BV512uA9nXLKFUR6iDwUuIOkgDuMoL7XdaAy1kcpDbeQtly34w1N
   zKnG7whdxacr2Qgn3ErGGkkSL/3dQSq6gTZBS4spBFYzFf/PBj6fvfDqt
   31vYNRuAXDR2nGvRkVJGbtztXE68MR/QOkTy4qGjCJdt052tNpFnGSBvz
   uuPI5bncl3rumD7q2uvj8z/llLLRjWqzYbnKxJzY4xBiFrNXSdhYHpbJ7
   xXEFdjV3KNWcO0CY6EPHtcWq33KKJip8lHxFKxoejmBkK8r6sFu1czvkf
   x6cfDnGyBsoYSaCwt5m7+HYo3E0+HeM4LBPq+qfh4IIGNrIttbWOqQCjF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369066597"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="369066597"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 19:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="852127750"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="852127750"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2023 19:05:33 -0700
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@kernel.org>,
        "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
 <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
 <ZT92LDE9z46kxX-h@kekkonen.localdomain>
 <DM8PR11MB565366E1CEB9BB5F8F1074CE99A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <ZUH6RYayRSb-hykQ@kekkonen.localdomain>
 <DM8PR11MB56533C342B834265A3F64D1499A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <ZUOluxSV0eqZi9v9@smile.fi.intel.com>
 <e4da877a-e499-6ddc-c0cb-cffdf41e2a1b@redhat.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <5db52eb5-4d54-60d7-d87c-f34a6873be48@linux.intel.com>
Date:   Fri, 3 Nov 2023 10:01:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e4da877a-e499-6ddc-c0cb-cffdf41e2a1b@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

On 11/2/23 9:54 PM, Hans de Goede wrote:
> Hi Andy,
> 
> On 11/2/23 14:35, Andy Shevchenko wrote:
>> On Wed, Nov 01, 2023 at 07:38:24AM +0000, Cao, Bingbu wrote:
>>
>> Side note: Can you please Cc me in your v2, I believe I have some comments,
>> but let's see a new version for them?
> 
> I'm a bit confused, this is a series written by me not Bingbu
> and this series has been merged for a while now...

Yes and sorry. :)
I just borrow this thread to discuss more following your patch.

> 
> Regards,
> 
> Hans
> 
> 
> 
> 

-- 
Best regards,
Bingbu Cao
