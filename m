Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC472F5A22
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 06:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbhANFCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 00:02:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:56291 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbhANFCu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 00:02:50 -0500
IronPort-SDR: 2evkBKie8j4m6YUa9ZNEOVLtHEbKEkxJqGMHemFZD2/iOtD65NaLO38G8Sc95dM5Wi/SGUUMYQ
 yufVz4MGMigQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="177531197"
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; 
   d="scan'208";a="177531197"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 21:01:04 -0800
IronPort-SDR: Aq1bVifH5L/5VZ84+HyvvunwmqkKFOA4ZiEg7DLSKP3oIL65Oui/pCjATYJPe7wamd0O2+10ak
 6N2w66aB4+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; 
   d="scan'208";a="364112319"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga002.jf.intel.com with ESMTP; 13 Jan 2021 21:01:02 -0800
Subject: Re: [PATCH v2 1/1] v4l: ioctl: Fix memory leak in video_usercopy
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <20201220201124.13688-1-sakari.ailus@linux.intel.com>
 <29c100a1-cfea-9312-1d83-2d3b0c1c02d4@linux.intel.com>
Message-ID: <9ece0e2b-0a83-a986-5987-b9dd354d61c1@linux.intel.com>
Date:   Thu, 14 Jan 2021 12:59:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <29c100a1-cfea-9312-1d83-2d3b0c1c02d4@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/14/21 12:50 PM, Bingbu Cao wrote:
> Sakari,
> 
> On 12/21/20 4:11 AM, Sakari Ailus wrote:
>> When an IOCTL with argument size larger than 128 that also used array
>> arguments were handled, two memory allocations were made but alas, only
>> the latter one of them was released. This happened because there was only
>> a single local variable to hold such a temporary allocation.
>>
>> Fix this by adding separate variables to hold the pointers to the
>> temporary allocations.
>>
>> Reported-by: Arnd Bergmann <arnd@kernel.org>
>> Reported-by: syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com
>> Fixes: d14e6d76ebf7 ("[media] v4l: Add multi-planar ioctl handling code")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 32 ++++++++++++----------------
>>  1 file changed, 14 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 3198abdd538c..9906b41004e9 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -3283,7 +3283,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>>  	       v4l2_kioctl func)
>>  {
>>  	char	sbuf[128];
>> -	void    *mbuf = NULL;
>> +	void    *mbuf = NULL, *array_buf = NULL;
>>  	void	*parg = (void *)arg;
>>  	long	err  = -EINVAL;
>>  	bool	has_array_args;
>> @@ -3318,27 +3318,21 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>>  	has_array_args = err;
>>  
>>  	if (has_array_args) {
>> -		/*
>> -		 * When adding new types of array args, make sure that the
>> -		 * parent argument to ioctl (which contains the pointer to the
>> -		 * array) fits into sbuf (so that mbuf will still remain
>> -		 * unused up to here).
>> -		 */
>> -		mbuf = kvmalloc(array_size, GFP_KERNEL);
>> +		array_buf = kvmalloc(array_size, GFP_KERNEL);
>>  		err = -ENOMEM;
>> -		if (NULL == mbuf)
>> +		if (array_buf == NULL)
> 
> if (!array_buf)
> ?
> 
Please ignore my previous comment, as the patch was landed. :)
....
-- 
Best regards,
Bingbu Cao
