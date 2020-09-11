Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88361266291
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 17:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgIKPxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 11:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgIKPxB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 11:53:01 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF39C061757;
        Fri, 11 Sep 2020 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=yNNKD3aSjbTN0xK7a0jESH4osJEkyi0r7WDad6R8Z4M=; b=VcDcVXayb9NLhgWUiavKsddA66
        wkKREXL7VNw0LFva8kUzh47lmse2StS7H4y3bO9nh4GX5EvGdK2pNAQTHVXfyxE6lxGumhCd7PNJc
        l/G8NzyUVTnNAvdWVGhtEa5v6n5dXLLlAkmrDI9FBUoKwa1LG1kg9wCROYJa11pT54EcSCQIuoEAb
        CNju4Z6fhkTwqptCr4JQPn2LSmXN80dtUFCYiXD6Xlo5DjgmbCfruH8jtUCNC09/NvaOZfzWAouEo
        vDkb0r2um69/xCxAPyja6a4qm0RKuwDNf3sq8J7z1iFcclj5tkl/BrX7bDorWn22Stggs6ifKNGMu
        R3uis3Nw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kGlM1-0001Bq-ST; Fri, 11 Sep 2020 15:52:50 +0000
Subject: Re: linux-next: Tree for Sep 10 (drivers/media/pci/ttpci/dvb-ttpci)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
References: <20200910174252.0698c743@canb.auug.org.au>
 <97f03d35-acd3-1c65-0c93-4ca4cabf6613@infradead.org>
 <20200911093156.15282b69@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1bf30e26-cd8d-a2dd-aaf3-97c2dbc1875a@infradead.org>
Date:   Fri, 11 Sep 2020 08:52:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200911093156.15282b69@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/11/20 12:31 AM, Mauro Carvalho Chehab wrote:
> Hi Randy,
> 
> Em Thu, 10 Sep 2020 09:02:35 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> On 9/10/20 12:42 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200909:
>>>   
>>
>>
>> on i386:
>>
>> ERROR: modpost: "__floatunsidf" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
>> ERROR: modpost: "__ltdf2" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
>>
>>
>> Full randconfig file is attached.
> 
> I was unable to reproduce it here with the .config file you sent.
> 
> I suspect that the only difference is the compiler version. Here, I'm
> using:
> 
> 	gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
> 
> While you're using:
> 
> 	gcc (SUSE Linux) 7.5.0
> 
> Yet, the only patch that could possibly have affected it is
> this changeset 13c129066845 ("media: av7110_v4l: avoid a typecast").
> 
> It sounds to me that gcc 7.5.0 only does the right math at compile
> time if there is a typecast. Could you please check if the enclosed
> patch fixes it?

Hi Mauro,
Yes, this fixes the build for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> Thanks,
> Mauro
> 
> [PATCH] media: av7110: don't do float point math
> 
> It sounds that earlier versions of GCC have troubles when
> doing const math at compile time, if no typecast is used:
> 
> on i386:
> 	ERROR: modpost: "__floatunsidf" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> 	ERROR: modpost: "__ltdf2" [drivers/media/pci/ttpci/dvb-ttpci.ko] undefined!
> 
> The warning was generated on gcc (SUSE Linux) 7.5.0.
> Gcc 9.2 compiles it fine.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttpci/av7110_v4l.c
> index 6d9c908be713..c89f536f699c 100644
> --- a/drivers/media/pci/ttpci/av7110_v4l.c
> +++ b/drivers/media/pci/ttpci/av7110_v4l.c
> @@ -160,9 +160,9 @@ static int ves1820_set_tv_freq(struct saa7146_dev *dev, u32 freq)
>  	buf[1] = div & 0xff;
>  	buf[2] = 0x8e;
>  
> -	if (freq < 16U * 168.25)
> +	if (freq < 16U * 16825 / 100)
>  		config = 0xa0;
> -	else if (freq < 16U * 447.25)
> +	else if (freq < 16U * 44725 / 100)
>  		config = 0x90;
>  	else
>  		config = 0x30;
> 


-- 
~Randy
