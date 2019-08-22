Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3013598EF3
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfHVJOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:14:32 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:42491 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733031AbfHVJOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:14:31 -0400
Received: by mail-wr1-f44.google.com with SMTP id b16so4657086wrq.9
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2019 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=XtOL8gNtG+hmvgLUTNARZ9IJPPatmS0hR06XQs4cIx8=;
        b=md3I0Cf2sYPPrCeWRJx/YU455jLgbpfe32HlAwsUrXyp79by/dCLP1FlpJInnIHmG4
         tEobR0ezLBX49CbNR+BED3nKNO9xzL8t4cWeGfvcoXtchBfccKlmy9jktgTOHpi/f/mP
         lpFo6YdLl8V/LY2IEPRYNxyJQstTCzhJFWA2srYzWPyZR569A8m8eprSuS6QimaJdC0r
         XDx6o5bvSILXY/khZVMmMg8/9CAfRC/H/OfwF+1h0YCblXmuKN4KHNd20qpsVN/iM8A3
         a+VLslsforNI7/+PEo1n07c5wTqOk0xBP/QP89ddu8FIDYQdNN40ZdQDQ8qkN7RckoFb
         qUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=XtOL8gNtG+hmvgLUTNARZ9IJPPatmS0hR06XQs4cIx8=;
        b=A0lfsC/dj6hxS6VDS2WeYi1CoCKlVb3cnGgGhRQ+qk4GbwHOvQbimYR9YYKtTHa6LW
         kVRq9KKTp2dLXRMWEavUkZN+/7qzNcULoysZextLs0vbM/fvBwgsUKbl3GsoK+thfFFw
         YeTG4nL6w9ox8A0XTi8w/6wtwDGR0F2U4bbiFAKDxPXV+Gzs/Rg7wJOeGzcsbnJGfNWt
         gejkg3tdKwjfccP8R1NO3WzdO3fNsuwc61gQGCoIcK+GkdDXoRf7Z3jNLawSrp7Nb33w
         +oYBpPSqYKZj3t5+mQufXYZXyi78tTP5w5c3z3K+C8lUPUgjYRQ14TRwo9AZ01+tpxka
         IXhA==
X-Gm-Message-State: APjAAAWScXFjKrkmd11n3itjW/4r4LajfeSPsf9S18Ijfdq1ssbbtBNt
        ndC/psWrHv11qlOrQDwoyQ2jM6za
X-Google-Smtp-Source: APXvYqy+KJzFiStV4RUvRR1wqwN49akFiyyYPp9S1YCSkTvE81mGV9LfPJTLQHYZqIkHYJsJIezaGA==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr46614516wro.302.1566465269850;
        Thu, 22 Aug 2019 02:14:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id c187sm7114923wmd.39.2019.08.22.02.14.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 02:14:29 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [RFC] replacing dma_resv API
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <156641829139.20466.3485292236947741339@skylake-alporthouse-com>
 <CAKMK7uFAreLt64Y9btk4VNxo6a2YMgXrg136z0uuyy5B3SMS+A@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03244148-a560-47e2-e992-a3ea873e7bd1@gmail.com>
Date:   Thu, 22 Aug 2019 11:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFAreLt64Y9btk4VNxo6a2YMgXrg136z0uuyy5B3SMS+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.08.19 um 22:22 schrieb Daniel Vetter:
> On Wed, Aug 21, 2019 at 10:11 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>> Quoting Christian König (2019-08-21 13:31:37)
>>> Hi everyone,
>>>
>>> In previous discussion it surfaced that different drivers use the shared and explicit fences in the dma_resv object with different meanings.
>>>
>>> This is problematic when we share buffers between those drivers and requirements for implicit and explicit synchronization leaded to quite a number of workarounds related to this.
>>>
>>> So I started an effort to get all drivers back to a common understanding of what the fences in the dma_resv object mean and be able to use the object for different kind of workloads independent of the classic DRM command submission interface.
>>>
>>> The result is this patch set which modifies the dma_resv API to get away from a single explicit fence and multiple shared fences, towards a notation where we have explicit categories for writers, readers and others.
>> Fwiw, I would like the distinction here between optional fences
>> (writers, readers) and mandatory fences (others). The optional fences
>> are where we put the implicit fence tracking that clever userspace would
>> rather avoid. The mandatory fences (I would call internal) is where we
>> put the fences for tracking migration that userspace can not opt out of.
> I think this would make sense, and is kinda what I expected here.

Yeah, exactly that's the intention here.

Basic idea is to group the fences into the categories of "you always 
need to wait for when doing implicit synchronization" (writers), "you 
only need to wait for them when you want to write to the object" 
(readers) and "ignore them for implicit synchronization".

> If (and I think that's a huge if) we can agree on what those internal
> fences are. There's a huge difference between internal fences for
> buffer moves (better not ignore those) and internal fences like
> amdkfd's eviction fence (better ignore those).

Yeah, that's exactly why I want to get away from those exclusive/shared 
naming.

For readers/writers I hoped the semantic would be more clear, but that's 
doesn't seems to be the case.

> So whatever we do add, it better come with really clear docs and pretty diagrams about what
> it's supposed to do, and how it's supposed to be used. Or we're just
> back to the current mess we're in, times two.

Well documenting it in the end is clearly a good idea, but I don't think 
we should start with that before we actually know what we want to 
implement and how we want to implement it.

Otherwise I would write tons of documentation which can be thrown away 
again in the end because we decided to don't do it this way.

Christian.

> -Daniel

