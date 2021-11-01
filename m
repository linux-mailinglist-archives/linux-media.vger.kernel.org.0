Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B10C441D1D
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 16:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhKAPIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 11:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbhKAPIW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 11:08:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD83C061714;
        Mon,  1 Nov 2021 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=KEjSiPeQus1e5C5m4glvQm9hY/OA1aKif95A7YiVQtI=; b=2LGb6RpYGmcP87QrowtsGlb1CG
        MlNNkNVp7zrosbZMXSGbqsff+zVFddtxYJ0AwM45FBd0nEfPgeMcoZerqRhfkQKcsmvSqBtVRXYTI
        9F4kFpo3TJ1bR9YTKfIQ89iDY7ZYn9EX+qCOq8wvNergjFgNicLNKOIRjnxS3M1RU/uMtMIM5G3yi
        wvbeBtSXV214nJSnbJ9eHPHivKJDfjo7kipr+RUoApfqqu5X9Ng5AmLIhYmKYuABk3KeXQAlIYccf
        dufg8fg4bQWGA5deqm/TxMoiq49lywFjfdzog9V3YHefDkCBn0RHPFbCtYOi2/lAlx0VTEM3u4rPX
        473BS/HQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mhYse-00GdmR-PV; Mon, 01 Nov 2021 15:05:48 +0000
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
 <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
 <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
 <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
 <20211101143004.GD2914@kadam>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c0e25c48-84cc-6ad1-8312-1957f459148d@infradead.org>
Date:   Mon, 1 Nov 2021 08:05:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101143004.GD2914@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/1/21 7:30 AM, Dan Carpenter wrote:
> On Mon, Nov 01, 2021 at 05:58:56PM +0800, Dongliang Mu wrote:
>> On Mon, Nov 1, 2021 at 5:43 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>>>
>>> On 11/1/21 12:41, Dongliang Mu wrote:
>>>>> Hi, Dongliang,
>>>>>
>>>>> Did patch attached to my previous email pass syzbot's reproducer test?
>>>>> Unfortunately, I am not able to test rn :(
>>>>
>>>> Yes, it works. The memory leak does not occur anymore.
>>>>
>>>> But I am crafting another patch based on yours as there is a small
>>>> issue in the retval and I would like to make the error handling code
>>>> uniform.
>>>>
>>>
>>> Cool! Thank you for confirmation.
>>
>> Hi Pavel,
>>
>> Thanks for your advice. I have sent the patch and you are on the CC
>> list. Can you please take a look at and review my patch?
>>
> 
> What's the Message-ID of your patch so I can b4 it.

<20211101095539.423246-1-mudongliangabcd@gmail.com>

> This whole thread has no patches.  I don't know why I'm CC'd when the
> only part I'm interested in is not included...  :/  Hashtag Grumble.
> 
> regards,
> dan carpenter
> 


-- 
~Randy
