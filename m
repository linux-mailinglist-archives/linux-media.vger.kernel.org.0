Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC0C6AD4EE
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 03:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjCGCnj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 21:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjCGCni (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 21:43:38 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA0F3B878
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 18:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678157014; x=1709693014;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=eYoh8cogwlP7opflh9To5P9HempUd0bhePwaCdg/n08=;
  b=PZB0sbE2BRBymBtGjGBryt5w89MuqJfT/F8bqRjui5wnUtrS49OH2FH1
   NOXo7fUX9qCpkQYbhyt4mPRbPzKS1kfkUbhvkiigbnsVEw0XnrcflyPdx
   RHxO+fVwX6Yv9kny6dxKAYtjZjceOzN5wTBQXBN4IEldmbSwvvWJbylhj
   0L7FY7etq89PUFdo5lPXAhM7K3g5I+xM3xer6lBK4vXb1Q4KbWYnrsUog
   GeEtz0VkTH7yq+W+vAfp78x9WvnRfHdDoIMXfI/o/kcaoC/V2aiMbN1yh
   evszzommusSW8WseX9yZ83i6wJbiDEGWBYa8gSbkIbTj4Xi533SbAGTtO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335765824"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="335765824"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 18:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669703719"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="669703719"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga007.jf.intel.com with ESMTP; 06 Mar 2023 18:43:32 -0800
Subject: Re: [PATCH] media: ipu3-cio2: support multiple sensors and VCMs with
 HID name
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>
References: <20230303144432.2108677-1-bingbu.cao@intel.com>
 <ZAXN9EszoxHt+F7w@smile.fi.intel.com>
 <DM8PR11MB565375ACA9BECCB175EE931199B69@DM8PR11MB5653.namprd11.prod.outlook.com>
 <ZAYWPpcjOghZ5L33@smile.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <154730c6-1a60-af92-8125-d7d1c51ff711@linux.intel.com>
Date:   Tue, 7 Mar 2023 10:43:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZAYWPpcjOghZ5L33@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Andy,

On 3/7/23 12:35 AM, Andy Shevchenko wrote:
> On Mon, Mar 06, 2023 at 01:33:30PM +0000, Cao, Bingbu wrote:
>>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Sent: Monday, March 6, 2023 19:27
>>> On Fri, Mar 03, 2023 at 10:44:32PM +0800, bingbu.cao@intel.com wrote:
> 
> ...
> 
>>>> +	if (sensor->ssdb.vcmtype) {
>>>> +		scnprintf(vcm_name, sizeof(vcm_name), "%s-%u",
>>>> +			  cio2_vcm_types[sensor->ssdb.vcmtype - 1],
>>>> +			  sensor->ssdb.link);
>>>
>>> Is using 'c' variant a cargo cult? Otherwise explain, why dropping the
>>> last part of the number is not a problem.
>>
>> Sorry, I can't understand. What is cargo cult?
> 
> Use of sCnprintf(). I.o.w. can you explain the point of using it instead of
> simply snprintf()?

Thanks, I see and will use simply snprintf() instead in v2.

> 
>>>> +		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
>>>> +	}
> 
> ...
> 
>>>> +		scnprintf(sensor->name, sizeof(sensor->name), "%s-%u",
>>>> +			  cfg->hid, sensor->ssdb.link);
> 
> Ditto.
> 
> ...
> 
>>>> -	char name[ACPI_ID_LEN];
>>>> +	char name[ACPI_ID_LEN + 4];
>>>
>>> Why 4 is chosen? This needs an explanation.
>>
>> 'link' is u8, so it is supposed to be max 4 characters along with '-'.
> 
> It should be mentioned somewhere.

Will add a comment.

> 

-- 
Best regards,
Bingbu Cao
