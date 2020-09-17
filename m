Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847A126D8EB
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 12:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgIQKYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 06:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgIQKYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 06:24:05 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC692C06174A;
        Thu, 17 Sep 2020 03:24:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c18so1445938wrm.9;
        Thu, 17 Sep 2020 03:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=h2LFimxoyNonSX50+U9lgU4xGUhF6TvhEo2cl22/6to=;
        b=YkdtHyyrqsnArPN1o1wdZM04OLHAjusxeyiU05bk6yIvyztJndYBnXlLqhaJkmmzI7
         /HRr0VoNUmuM3dqp0sXUcfRzfac1eYN3KRfsDoDNXnoAkhsHskyCtguu6p8fAsHDIk8r
         r8tvEcdgM5y8k+TdCPJf3KPtXjUmhPAMoyuemy+TiQG870NfHZRYZpudwP5UrVyy2rnH
         N4IZbg6ihAylKLrFoG4qTsXumf5hf8WfHh6g+bIzkwoBSEQzfduyF7R2oSs5lu3GePiY
         nEQzpABeCmyqJ+YgiGdu5yqQ+t9tizSBsQU0xMmK+bFe/jOXQ7fcaZ2R1vf+8W6lyCtP
         P0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=h2LFimxoyNonSX50+U9lgU4xGUhF6TvhEo2cl22/6to=;
        b=aa1VDcoQg6/RU6RCxC9Xf5zjxjHW2suoLto7MRVRWIeQ7IrlO1pLDC9EXDMHCmZUy6
         l1SneOpjqKGGuFjjx1LOPcjw0XVesiM25RRB8clq54cpZCgSmjysM4VxHuAHxrgdCfKN
         nxaB/5HUoW7qOzxEASrmYyZeX3S4OIjVsC9YcxropF+qFuXmrqrneQw8LlfZSRCFcm6G
         sAK364xM3gqitmNkJspEeFbsRCFKUeK7gkNHUUu0C7CLJxRD7aPYvJ48KM5wF8/LRq0C
         cTR+ySOGD16li+DcHf4UQ9A6JCAUX0ZPDeZ3Uc35mnB5oQ7BJv0q/rUBhSOur3Dx3WQh
         6qag==
X-Gm-Message-State: AOAM533zZ5JNTbTEukdjkswjdDtghYI7jPVBS4ODjZ4B0mIVfFgJy8Tl
        i0PqJoeGUouAUWpZ1HQy5bQ=
X-Google-Smtp-Source: ABdhPJxk4RL8Vf6mAUx1Otx9e8fG7C/3c0n7sGBIWdI5eI4rHJ+K/A7mw1Ff+ox2J0agrbCPqo54Ig==
X-Received: by 2002:adf:f14f:: with SMTP id y15mr30377971wro.69.1600338243397;
        Thu, 17 Sep 2020 03:24:03 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id l4sm10287901wme.43.2020.09.17.03.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 03:24:02 -0700 (PDT)
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org,
        robh@kernel.org, jorhand@linux.microsoft.com,
        linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        linux-kernel@vger.kernel.org, kitakar@gmail.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        mchehab@kernel.org, davem@davemloft.net, tian.shu.qiu@intel.com,
        yong.zhi@intel.com
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917075356.GA3333802@kroah.com>
 <d97fb93f-5258-b654-3063-863e81ae7298@gmail.com>
 <20200917101538.GO4282@kadam>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <36d3322a-3128-83b8-bd14-72da34b71e7c@gmail.com>
Date:   Thu, 17 Sep 2020 11:24:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917101538.GO4282@kadam>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/09/2020 11:15, Dan Carpenter wrote:
> On Thu, Sep 17, 2020 at 10:47:50AM +0100, Dan Scally wrote:
>> Hi Greg - thanks for the comments, appreciate it (sorry there's so many,
>> I'm new to both C and kernel work)
> It's pretty impressive work if you're new to C...
Thanks (and for your other reply too, haven't had time to go through it
in depth yet). I've been using python for a while, but this is my first
attempt at anything serious with C.
>>>> +			return;
>>> No error value?
>> The prototype for sync_state callbacks is to return void, so my
>> understanding is it can't return an error value.  I guess a better thing
>> to do might be call another function performing cleanup and unloading
>> the driver before the return or something along those lines though.
> Yeah.  I suspect you should be using a different callback instead of
> ->sync_state() but I don't know what... :/
Yeah, this is why I wanted to submit it now really; I too suspect I
should really be using a different callback but I couldn't find a better
option.
> regards,
> dan carpenter
>
