Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DD848A64A
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 04:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346709AbiAKD2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 22:28:18 -0500
Received: from mga02.intel.com ([134.134.136.20]:46844 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236937AbiAKD2S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 22:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641871697; x=1673407697;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=W2adCTRLvv38iA/+8u7WVqn7sQB+rsB9p8Kv8IHLqYI=;
  b=aE14dM2IyXrT5c4vz4Rl6ysLGMbQO1vasiU6ztKEk8bUu0o9IPHWl96A
   P6l1nDJWMP3hctyCcN754NulE1yzxm0u8ycSgP+g3BMf+TkhZ5nVK2m9/
   t17uaSjFQb4PWyFW7WkaSs7Uh09ixIu5DO/sMWmPuaqFOAQdp9Ik5BtDZ
   O4TtDp/lQ/G9DRci/09YSnf4d8XmbzMHHlVs5N0qBfldM59IbsNkwqn2g
   pmP+3CGsjrdaURHjdZTnLo1FSBUkyGDutWoBW6cHMQl1zcd9y5nVtjO97
   CdAgQ/215J3gJ5F+AO0QHrJ7/H4oMIItL4mV/a0IIl9KdVGbivKY6EBou
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230734420"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="230734420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 19:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="528547093"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by orsmga008.jf.intel.com with ESMTP; 10 Jan 2022 19:28:15 -0800
Subject: Re: [PATCH] media: ov5675: use group write to update digital gain
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "Yeh, Andy" <andy.yeh@intel.com>
References: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
 <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com>
 <DM8PR11MB565373D28B23D9D36C0560EE99449@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YdwZUqoXnTmlveF6@paasikivi.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <593d842c-2f8a-d4fd-3f31-feca1fd4cf31@linux.intel.com>
Date:   Tue, 11 Jan 2022 11:22:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YdwZUqoXnTmlveF6@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/10/22 7:32 PM, Sakari Ailus wrote:
> On Wed, Dec 29, 2021 at 10:00:43AM +0000, Cao, Bingbu wrote:
>> Hi Sakari, 
>>
>> Thanks for your review.
>>
>> ________________________
>> BRs,  
>> Bingbu Cao 
>>
>>> -----Original Message-----
>>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Sent: Wednesday, December 29, 2021 5:42 PM
>>> To: Cao, Bingbu <bingbu.cao@intel.com>
>>> Cc: linux-media@vger.kernel.org; Tu, ShawnX <shawnx.tu@intel.com>;
>>> senozhatsky@chromium.org; tfiga@chromium.org; bingbu.cao@linux.intel.com;
>>> Yeh, Andy <andy.yeh@intel.com>
>>> Subject: Re: [PATCH] media: ov5675: use group write to update digital
>>> gain
>>>
>>> Hi Bingbu,
>>>
>>> On Wed, Dec 29, 2021 at 04:57:39PM +0800, Bingbu Cao wrote:
>>>> MWB gain register are used to set gain for each mwb channel mannually.
>>>> However, it will involve some artifacts at low light environment as
>>>> gain cannot be applied to each channel synchronously. Update the
>>>> driver to use group write for digital gain to make the sure RGB
>>>> digital gain be applied together at frame boundary.
>>>
>>> How about the analogue gain and exposure time?
>>>
>>> Shouldn't they be applied similarly as well? Adding two more writes
>>> increases the probability of missing a frame there.
>>
>> We did not meet issue related to analog gain as the it was applied by only
>> 1 reg write, it looks like same issue we found on ov8856, changing to set
>> digital gain by only 1 global gain write will fix the problem.
> 
> That device is different in its support for global digital gain. This patch
> sets the gain for each component separately.
> 
> Adding more writes on a given frame increases the probability of slipping
> to the following frame. Doing the exposure and gain updates in the same 
> group write would alleviate that a little.

Sakari,

It is feasible to put the exposure and gain update in a same group, however, lunching
the group at different time may increase the probability of slipping as well.

What do you think?

> 
>>
>>>
>>> This is of course a trick since the control framework doesn't really
>>> support this, but I think this support should be added.
>>>
>>> --
>>> Regards,
>>>
>>> Sakari Ailus
> 

-- 
Best regards,
Bingbu Cao
