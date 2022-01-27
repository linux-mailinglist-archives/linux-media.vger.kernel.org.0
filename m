Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 034F149D91E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jan 2022 04:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbiA0DUh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 22:20:37 -0500
Received: from mga18.intel.com ([134.134.136.126]:16135 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232984AbiA0DUg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 22:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643253636; x=1674789636;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=sVvu/HYEe/5dS/kX4S/iQn3lKM/CG5DiH/gZLFvkpNI=;
  b=iWlbPdRYyvfZ/hPH3IuuKsD11wAtivMGKfNcf2HmC4SwhMhCJLK96YPo
   +lWXk3ag2uCAysTU18c/Henp7qOKkvKA8L1OWrnr+kGsPetjEF3VvoHWj
   XNgKcWaFTBP+71kCXmyDhKQVV7Wqr5SaW0WvFnVSywYDDifULOBom4xla
   mbAjVTKi/oqHMioAUNJt+gs4lMHbsgHlW7dAQZ1BphusiS1cSw52WQiZx
   YJz04SWs4jphpSC48BmUzw7CjcE/b3VUrAXg/FHma5lwaR8NXbj/6rIAu
   znJYzGldaP8rOzjw481SdyZWK3Sn9Vw963Fz31K2QeVU/SI9dzyrhNyU3
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="230309014"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="230309014"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 19:20:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="535457309"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by orsmga008.jf.intel.com with ESMTP; 26 Jan 2022 19:20:33 -0800
Subject: Re: [PATCH] media: ov5675: use group write to update digital gain
To:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "Yeh, Andy" <andy.yeh@intel.com>
References: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
 <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com>
 <DM8PR11MB565373D28B23D9D36C0560EE99449@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YdwZUqoXnTmlveF6@paasikivi.fi.intel.com>
 <CAAFQd5CqEcLOvKsOchB29KzazAUh+hK2HWbqq+67fOhS4ydqEA@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <c52bf111-41c3-4591-cc0e-1c64d7ec6e41@linux.intel.com>
Date:   Thu, 27 Jan 2022 11:14:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CqEcLOvKsOchB29KzazAUh+hK2HWbqq+67fOhS4ydqEA@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari,

I agree with Tomasz, the group write will not cause timing issues, instead it will help
on that. So we did not need to group hold exposure and digital gain along with analog
gain. Driver can not make the policy that the exposure, a-gain and d-gain are applied
together.


On 1/11/22 12:27 PM, Tomasz Figa wrote:
> Hi Sakari,
> 
> On Mon, Jan 10, 2022 at 8:32 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
>>
>> On Wed, Dec 29, 2021 at 10:00:43AM +0000, Cao, Bingbu wrote:
>>> Hi Sakari,
>>>
>>> Thanks for your review.
>>>
>>> ________________________
>>> BRs,
>>> Bingbu Cao
>>>
>>>> -----Original Message-----
>>>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> Sent: Wednesday, December 29, 2021 5:42 PM
>>>> To: Cao, Bingbu <bingbu.cao@intel.com>
>>>> Cc: linux-media@vger.kernel.org; Tu, ShawnX <shawnx.tu@intel.com>;
>>>> senozhatsky@chromium.org; tfiga@chromium.org; bingbu.cao@linux.intel.com;
>>>> Yeh, Andy <andy.yeh@intel.com>
>>>> Subject: Re: [PATCH] media: ov5675: use group write to update digital
>>>> gain
>>>>
>>>> Hi Bingbu,
>>>>
>>>> On Wed, Dec 29, 2021 at 04:57:39PM +0800, Bingbu Cao wrote:
>>>>> MWB gain register are used to set gain for each mwb channel mannually.
>>>>> However, it will involve some artifacts at low light environment as
>>>>> gain cannot be applied to each channel synchronously. Update the
>>>>> driver to use group write for digital gain to make the sure RGB
>>>>> digital gain be applied together at frame boundary.
>>>>
>>>> How about the analogue gain and exposure time?
>>>>
>>>> Shouldn't they be applied similarly as well? Adding two more writes
>>>> increases the probability of missing a frame there.
>>>
>>> We did not meet issue related to analog gain as the it was applied by only
>>> 1 reg write, it looks like same issue we found on ov8856, changing to set
>>> digital gain by only 1 global gain write will fix the problem.
>>
>> That device is different in its support for global digital gain. This patch
>> sets the gain for each component separately.
> 
> That's not what the patch does. The existing code programs the 3
> per-component registers separately. This patch made it happen under
> one write group. It doesn't increase the likelihood of the frame
> having wrong parameters - given the same timeline, before this patch,
> the frame would just have an even worse, partial gain setting, while
> with this patch it can either have the old or new gain.
> 
> Best regards,
> Tomasz
> 
>>
>> Adding more writes on a given frame increases the probability of slipping
>> to the following frame. Doing the exposure and gain updates in the same
>> group write would alleviate that a little.
>>
>>>
>>>>
>>>> This is of course a trick since the control framework doesn't really
>>>> support this, but I think this support should be added.
>>>>
>>>> --
>>>> Regards,
>>>>
>>>> Sakari Ailus
>>
>> --
>> Sakari Ailus

-- 
Best regards,
Bingbu Cao
