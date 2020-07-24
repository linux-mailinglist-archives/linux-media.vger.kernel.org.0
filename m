Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA19922CC4A
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 19:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgGXRj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 13:39:57 -0400
Received: from linux.microsoft.com ([13.77.154.182]:50220 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXRj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 13:39:56 -0400
Received: from [192.168.1.14] (unknown [76.104.235.235])
        by linux.microsoft.com (Postfix) with ESMTPSA id 27D1520B4908;
        Fri, 24 Jul 2020 10:39:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 27D1520B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1595612396;
        bh=KshWL/tix/iSiGVpNaQ4UVJL3O8Ijr9mAMobUMIPV6A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=okH9s1ucN1teaOe7BbgwIpk604Ycpv4Nt4kH/9t3rUMnmov/cOfcFVRzCafQXnDWE
         aTBbi9XdMmCuv5YV7jgqBgcQLxZIoflFrHV/PrkKeGMR05d1J0OTVBwmmFU5MJaKgO
         PeQRarvsRSVOymzTurKzmhWESaA40UGVfBnqhbG4=
Subject: Re: [PATCH] media: ipu3.rst: Format media-ctl and yavta commands as
 code blocks
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200630040508.11461-1-jorhand@linux.microsoft.com>
 <0fb304f4-21ff-3adb-48be-d7e5268d2abb@linux.intel.com>
From:   Jordan Hand <jorhand@linux.microsoft.com>
Message-ID: <14ef4f46-392d-9cab-cea9-9db128a7ccb7@linux.microsoft.com>
Date:   Fri, 24 Jul 2020 10:39:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0fb304f4-21ff-3adb-48be-d7e5268d2abb@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/23/20 10:00 PM, Bingbu Cao wrote:
> 
> 
> On 6/30/20 12:05 PM, jorhand@linux.microsoft.com wrote:
>> From: Jordan Hand <jorhand@linux.microsoft.com>
> ...
>> @@ -371,30 +373,32 @@ v4l2n command can be used. This helps process the raw Bayer frames and produces
>>   the desired results for the main output image and the viewfinder output, in NV12
>>   format.
>>   
>> -v4l2n --pipe=4 --load=/tmp/frame-#.bin --open=/dev/video4
>> ---fmt=type:VIDEO_OUTPUT_MPLANE,width=2592,height=1944,pixelformat=0X47337069
>> ---reqbufs=type:VIDEO_OUTPUT_MPLANE,count:1 --pipe=1 --output=/tmp/frames.out
>> ---open=/dev/video5
>> ---fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
>> ---reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=2 --output=/tmp/frames.vf
>> ---open=/dev/video6
>> ---fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
>> ---reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=3 --open=/dev/video7
>> ---output=/tmp/frames.3A --fmt=type:META_CAPTURE,?
>> ---reqbufs=count:1,type:META_CAPTURE --pipe=1,2,3,4 --stream=5
>> +.. code-block:: none
>> +
>> +    v4l2n --pipe=4 --load=/tmp/frame-#.bin --open=/dev/video4
>> +        --fmt=type:VIDEO_OUTPUT_MPLANE,width=2592,height=1944,pixelformat=0X47337069
>> +        --reqbufs=type:VIDEO_OUTPUT_MPLANE,count:1 --pipe=1 --output=/tmp/frames.out
>> +        --open=/dev/video5
>> +        --fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
>> +        --reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=2 --output=/tmp/frames.vf
>> +        --open=/dev/video6
>> +        --fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
>> +        --reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=3 --open=/dev/video7
>> +        --output=/tmp/frames.3A --fmt=type:META_CAPTURE,?
>> +        --reqbufs=count:1,type:META_CAPTURE --pipe=1,2,3,4 --stream=5
>>   
> Just notice indent will exceed 80 characters.

In v2 I fixed this up, except for a couple lines where just one option 
is present and the line is slightly over 80 characters.

> BTW, need a backslash at each EOL.

Added in v2

-Jordan
