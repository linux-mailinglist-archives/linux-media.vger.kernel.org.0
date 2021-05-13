Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFC937F13B
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 04:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhEMCVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 22:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhEMCVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 22:21:21 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8187DC061574
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 19:20:11 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id h127so20288928pfe.9
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 19:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nkSn4a2LombnxEdXcRnOLrSxk+/qCpYZC5FFdG62AXs=;
        b=IsQ6SZYlsP4HM+GY1tw39YEJnboAxO/ygVr1RPfPWkqiWT1URvAaXJ8XQcprLiNySR
         KIuXXJ1Rs//iddFdEBzLDD00cfUj+uEleU3uXOSHNHIppIU09+TjPhF5D8oy4b+d8FWa
         d+jdbTot4BDZa2YkG8jR9+MXZopRxBUHOylI8P40cXppm29ceJpnAXW6T60RkrOIQz6k
         k6yCBZSDd6FqJ4ffPrnnhuH3mB9KgMCi/sgy2lhIQ962fPmtHh1Pu+DcVYT+7H0J5Ggy
         O8tCto9z9yOQRT/o1Aujb31R71uro+oU/l4qyfAwlan5ybuLY9VkH2JniScN3AWjUqGd
         jl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nkSn4a2LombnxEdXcRnOLrSxk+/qCpYZC5FFdG62AXs=;
        b=Hd2fXzdM9IQU/lfUZFBZXJFax/Ukxr/A2SG2vKVBmsfRilT8YOtpJ9hZtqTnX+A8CG
         9Ti3G4cLrHfJx1IUa1fDHGPx6/uNvHmbpJMQ0LmtCZMqehpyBWTCJ4N61BngKYuJzaAU
         bwzuUvZx+6SFZkIU7UUoYmUoXJeuuXEmNeNPmFSmK24mcT9gplA5PPHs2hVWEVtQZc4k
         Ei0Kfi9UxjJ7do6C+B2FaJwbWwY/koQ1DIYPscGfPsIAVHSS8zRNzaq7W6N0hi2DidT7
         i3Sv15C6OzGwEWGk930JzkpHvNgKAFNhrAEler4yWZOy3dfJNEaJ0GxQ5J0Fdau5ssf6
         4mHA==
X-Gm-Message-State: AOAM532l+sr54ESMbXScfc1d4Mn/Be+uMLXit/gtK3pOWEBW4OS7h+uK
        ikhZOvBtW0rti/kTQWPgCNs=
X-Google-Smtp-Source: ABdhPJwDJpQRWUOx9hV81WH879ws1yrL1aIEyRmkLwm/cyJHDuo/8UggeQs+P89ft1OFzLacf0lZ2g==
X-Received: by 2002:a63:104a:: with SMTP id 10mr28460186pgq.66.1620872411072;
        Wed, 12 May 2021 19:20:11 -0700 (PDT)
Received: from [10.69.1.18] ([45.135.186.136])
        by smtp.gmail.com with ESMTPSA id j16sm911505pgh.69.2021.05.12.19.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 19:20:10 -0700 (PDT)
Subject: Re: [bug report] media: tuners: fix error return code of
 hybrid_tuner_request_state()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        hverkuil-cisco@xs4all.nl
References: <YJvgLgZAEo5NtM2x@mwanda> <20210512141612.GA1922@kadam>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <ec6ac4ef-057f-22a2-f2be-1773b2c50c8e@gmail.com>
Date:   Thu, 13 May 2021 10:20:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20210512141612.GA1922@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thanks for your report.
I check the code again, and find that returning zero should indicate an 
error here.
Good catch of Smatch :)

Sorry for my mistake in my patch...
Please revert the incorrect change caused by my patch b9302fa7ed97.

CC to Mauro Carvalho Chehab and Hans Verkuil.


Best wishes,
Jia-Ju Bai


On 2021/5/12 22:16, Dan Carpenter wrote:
> On Wed, May 12, 2021 at 05:03:26PM +0300, Dan Carpenter wrote:
>> Hello Jia-Ju Bai,
>>
>> The patch b9302fa7ed97: "media: tuners: fix error return code of
>> hybrid_tuner_request_state()" from Mar 6, 2021, leads to the
>> following static checker warnings:
>>
>> drivers/media/tuners/tuner-simple.c:1112 simple_tuner_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
>> drivers/media/tuners/mxl5007t.c:885 mxl5007t_attach() error: potential null dereference 'state'.  (<unknown> returns null)
>> drivers/media/tuners/tda18271-fe.c:1311 tda18271_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
>> drivers/media/tuners/xc4000.c:1685 xc4000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
>> drivers/media/tuners/xc4000.c:1699 xc4000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
>> drivers/media/tuners/xc5000.c:1397 xc5000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
>> drivers/media/tuners/r820t.c:2350 r820t_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
>> drivers/media/tuners/tuner-xc2028.c:1500 xc2028_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
>>
>> drivers/media/tuners/tuner-i2c.h
>>     109  /* The return value of hybrid_tuner_request_state indicates the number of
>>     110   * instances using this tuner object.
>>     111   *
>>     112   * 0 - no instances, indicates an error - kzalloc must have failed
>>
>> The comment says that hybrid_tuner_request_state() returns an error.
> I meant returns zero on error.

