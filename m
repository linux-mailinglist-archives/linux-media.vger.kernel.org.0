Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CED3266367
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 18:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgIKQPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 12:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgIKQPp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 12:15:45 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EBBC061573;
        Fri, 11 Sep 2020 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=no4R54jk2kWX56pztkCJXU7Nb87KrmM26tVrWGBSpzs=; b=tjYRWMJxLl3JQZEaoSU4CTVmd9
        vYvCIKl738oRwt6L/IRE0i2HCxcpGjqjeieimoju3oZUcoJ4+wwUD1j7p5ntAJ7NtfZD2xEIhNavs
        2OAkmQaGvOJxdUygKlBX4AEzX0h/EYkRXLaDcpYwrZ7SW2OO8FlxPWooHDPhIXA3EUpgTgs3K4t6n
        B8vjfXrvsYPZpq/JqvNptnjWRtosnpQGyzjy432F6Bok9t1ZtttfIbqWkXhNeViccT8gEv++nPgXF
        1bsKhQIJAGDftyYZFwhr9xD5l7ZQGmBDTHEN87BsxT70DBFn8MrhUSqRtC3pmBVg6wE4kSiY/7g1z
        9aPNpKkg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kGli9-0005GB-Ui; Fri, 11 Sep 2020 16:15:42 +0000
Subject: Re: linux-next: Tree for Sep 10 (drivers/media/pci/ttpci/dvb-ttpci)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
References: <20200910174252.0698c743@canb.auug.org.au>
 <97f03d35-acd3-1c65-0c93-4ca4cabf6613@infradead.org>
 <20200911093156.15282b69@coco.lan>
 <1bf30e26-cd8d-a2dd-aaf3-97c2dbc1875a@infradead.org>
Message-ID: <c94227cc-5f0f-07da-865a-40a75a70ebd8@infradead.org>
Date:   Fri, 11 Sep 2020 09:15:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1bf30e26-cd8d-a2dd-aaf3-97c2dbc1875a@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/11/20 8:52 AM, Randy Dunlap wrote:
> On 9/11/20 12:31 AM, Mauro Carvalho Chehab wrote:
>> Hi Randy,
>>
>> Em Thu, 10 Sep 2020 09:02:35 -0700
>> Randy Dunlap <rdunlap@infradead.org> escreveu:
>>
>>> On 9/10/20 12:42 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20200909:
>>>>   
>>>
>>>
>>> on i386:
>>>
>>> ERROR: modpost: "__floatunsidf" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
>>> ERROR: modpost: "__ltdf2" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
>>>
>>>
>>> Full randconfig file is attached.
>>
>> I was unable to reproduce it here with the .config file you sent.
>>
>> I suspect that the only difference is the compiler version. Here, I'm
>> using:
>>
>> 	gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
>>
>> While you're using:
>>
>> 	gcc (SUSE Linux) 7.5.0
>>
>> Yet, the only patch that could possibly have affected it is
>> this changeset 13c129066845 ("media: av7110_v4l: avoid a typecast").
>>
>> It sounds to me that gcc 7.5.0 only does the right math at compile
>> time if there is a typecast. Could you please check if the enclosed
>> patch fixes it?
> 
> Hi Mauro,
> Yes, this fixes the build for me.  Thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>


Aha, added bonus:

This patch also eliminates this objtool warning:

../drivers/media/pci/ttpci/av7110_v4l.c:163:11: error: SSE register return with SSE disabled


>> Thanks,
>> Mauro
>>
>> [PATCH] media: av7110: don't do float point math
>>
>> It sounds that earlier versions of GCC have troubles when
>> doing const math at compile time, if no typecast is used:
>>
>> on i386:
>> 	ERROR: modpost: "__floatunsidf" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
>> 	ERROR: modpost: "__ltdf2" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
>>
>> The warning was generated on gcc (SUSE Linux) 7.5.0.
>> Gcc 9.2 compiles it fine.
>>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>
>> diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttpci/av7110_v4l.c
>> index 6d9c908be713..c89f536f699c 100644
>> --- a/drivers/media/pci/ttpci/av7110_v4l.c
>> +++ b/drivers/media/pci/ttpci/av7110_v4l.c
>> @@ -160,9 +160,9 @@ static int ves1820_set_tv_freq(struct saa7146_dev *dev, u32 freq)
>>  	buf[1] = div & 0xff;
>>  	buf[2] = 0x8e;
>>  
>> -	if (freq < 16U * 168.25)
>> +	if (freq < 16U * 16825 / 100)
>>  		config = 0xa0;
>> -	else if (freq < 16U * 447.25)
>> +	else if (freq < 16U * 44725 / 100)
>>  		config = 0x90;
>>  	else
>>  		config = 0x30;
>>
> 
> 


-- 
~Randy

