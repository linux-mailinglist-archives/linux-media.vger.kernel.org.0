Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A423210161
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 03:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgGABQt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 21:16:49 -0400
Received: from linux.microsoft.com ([13.77.154.182]:39264 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGABQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 21:16:48 -0400
Received: from [192.168.1.14] (unknown [76.104.235.235])
        by linux.microsoft.com (Postfix) with ESMTPSA id E33F920B717A;
        Tue, 30 Jun 2020 18:16:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E33F920B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1593566208;
        bh=tyQLy+aBttVw9vIO6s5YDhQ/J3ovQY5y7J2ptg9TN8A=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=pzg2MyzZrLin8Ghn9FRoEko6Tixa7LuU43hPxil/mrXu3zNQtIw/SbfIHJY01BsEV
         //C4DBit5r5NEJL7M2xv5He/EqsPslm2dYNkvNn8H+OHCE3ecGS2rwNzNbONyZypCX
         hkOmbxwvJJUwL/tDTGFo1nbCBd1wF+nU6Z90sK4c=
From:   Jordan Hand <jorhand@linux.microsoft.com>
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
 <20200517103659.GS17578@paasikivi.fi.intel.com>
 <20200520094400.5137e7f2@coco.lan>
 <20200520082608.GV20066@paasikivi.fi.intel.com>
 <20200520131830.3ff45919@coco.lan>
 <CAHp75VduEGyzobm0hkXzWmFfZb-uMAEWG-wc89b7M7zVzZ_4LA@mail.gmail.com>
 <20200522115736.10cca8eb@coco.lan>
 <20200526143110.GC3284396@kuha.fi.intel.com>
Message-ID: <6c24193c-0ba4-7c6e-1711-8221ee133826@linux.microsoft.com>
Date:   Tue, 30 Jun 2020 18:16:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526143110.GC3284396@kuha.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/26/20 7:31 AM, Heikki Krogerus wrote:
> On Fri, May 22, 2020 at 11:57:36AM +0200, Mauro Carvalho Chehab wrote:
>> Em Thu, 21 May 2020 11:00:19 +0300
>> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>>
>>> +Cc: Heikki (swnode expert)
>>>
>>> On Wed, May 20, 2020 at 2:19 PM Mauro Carvalho Chehab
>>> <mchehab+huawei@kernel.org> wrote:
>>>> Em Wed, 20 May 2020 11:26:08 +0300
>>>> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
>>>
>>> ...
>>>
>>>> As I said, the problem is not probing the sensor via ACPI, but, instead,
>>>> to be able receive platform-specific data.
>>>
>>> There is no problem with swnodes, except missing parts (*).
>>> I have Skylake laptop with IPU3 and with half-baked ACPI tables, but
>>> since we have drivers in place with fwnode support, we only need to
>>> recreate fwnode graph in some board file to compensate the gap in
>>> ACPI.
>>>
>>> *) Missing part is graph support for swnodes. With that done it will
>>> be feasible to achieve the rest.
>>> I forgot if we have anything for this already done. Heikki?
>>
>> Hmm... I guess I should try this approach. I never heard about swnodes
>> before. Do you have already some patch with the needed swnodes setup,
>> and the missing parts to recreate the fwnode graph?
> 
> Here you go.
> 

For anyone interested, I have taken Heikki's patch and attempted to use 
swnodes to patch the incomplete dsdt on my laptop to use with ipu3; the 
code is currently in a github repo[1].

In particular, patches 1, 2, and 3 setup the software_node 
infrastructure. Patch 5 shows how we might use software nodes where ACPI 
fails.

My sensor driver (in patch 4) doesn't actually work right now which is 
why I haven't brought any of this to the mailing list yet, but that's 
another story :)

I would just submit a patchset, but since my sensor driver doesn't work, 
I can't gully test the rest of it. But if someone has a system where the 
drivers in question are upstream and work, something like this could be 
a good path forward.

- Jordan

[1] https://github.com/jhand2/surface-camera/tree/master/patches
