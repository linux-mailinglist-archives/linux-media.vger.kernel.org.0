Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593B529FB07
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 03:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgJ3CFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 22:05:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:55409 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ3CFI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 22:05:08 -0400
IronPort-SDR: sMO2sRfpDvIlqy8cw1hWRdtMN2QagOOt0wCwhGMGmKb10JfFHx0bqR98o1OGjHZCWPVImMlrsm
 93GmIoDLhU1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="155520050"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="155520050"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 19:05:07 -0700
IronPort-SDR: 9xUrulEtbV9aYS0t/p9+Dzawsvo9D0UQD/uq4MnauNwvFK4oTXt59fTvEToMt+SXWBf53ofZau
 64IYo9M1n00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="526960700"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2020 19:05:05 -0700
Subject: Re: [PATCH v1] media: ipu3-cio2: Use macros from mm.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20201029201657.GE4077@smile.fi.intel.com>
From:   "Cao, Bingbu" <bingbu.cao@linux.intel.com>
Message-ID: <61584879-babd-6a95-2cbb-c160ccb45351@linux.intel.com>
Date:   Fri, 30 Oct 2020 10:01:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029201657.GE4077@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 10/30/20 4:16 AM, Andy Shevchenko wrote:
> On Wed, Oct 28, 2020 at 04:11:05PM +0800, Bingbu Cao wrote:
>> Andy, thanks for your patch.
> 
>> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> Thanks!
> 
>> On 10/28/20 2:14 AM, Andy Shevchenko wrote:
> 
>>> -	entry[1].second_entry.last_page_available_bytes =
>>> -			(remaining & ~PAGE_MASK) ?
>>> -				(remaining & ~PAGE_MASK) - 1 : PAGE_SIZE - 1;
>>> +	remaining = offset_in_page(remaining);
>>> +	entry[1].second_entry.last_page_available_bytes = (remaining ?: PAGE_SIZE) - 1;
>>
>> Not really about this change, is there some coding style update? This line obviously over 80
>> chars, but the latest script did not report warning.
> 
> There is a relaxation in the script, but now it's ambiguous with the documentation.
> I just realized I can rewrite this as:
> 
> 	remaining = offset_in_page(remaining) ?: PAGE_SIZE;
> 	entry[1].second_entry.last_page_available_bytes = remaining - 1;
> 
> Would it work for you?

Yes, looks good for me, thanks.

> 
>>>  	/* Fill FBPT */
>>>  	remaining = length;
>>>  	i = 0;
> 

-- 
Best regards,
Bingbu Cao
