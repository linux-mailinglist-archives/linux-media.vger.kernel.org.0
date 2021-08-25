Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2A03F71B6
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 11:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239405AbhHYJaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 05:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233076AbhHYJaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 05:30:01 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B50FC0613C1
        for <linux-media@vger.kernel.org>; Wed, 25 Aug 2021 02:29:15 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s3so42447220ljp.11
        for <linux-media@vger.kernel.org>; Wed, 25 Aug 2021 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J2/OQEffn/ha/SHF1AP1mfEI0+u4GaQpxzyiwpPvr08=;
        b=HgnFsVv3taOdV0Fwq/Gg1EnGRV5idZHsFWLEzxJQs2i3eqnAirD/0prcm+4Z0uJQ4n
         C4cYOQh246/Ec6+zrhFhMl04DJ2tAbNoPi1TCYbZi6IYhjvvlsI02UtvUJ/VPx67l9lR
         oRVrRPAwyMg9+MbM5wzBmnGRncsDS+KNKYh6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J2/OQEffn/ha/SHF1AP1mfEI0+u4GaQpxzyiwpPvr08=;
        b=PoR9A3gRkbOBfWxLOic30kugLDMbQQRo/EBuP0siqxs6YU+nbE/kMl2zUMMcaqOr9F
         K/RWg0eSi9r0/S6gTrWr5g2F28CpZLKJSaG1gZfvtE7q6XUR/ojzujhafr4bhdks58cD
         VWJ+iWWQkX6CZBarNxI4WIjBvepfQ9fQpavFetaHYasIEyrqLU2wvrRnZTchzXbG3GlG
         V6KoD9KbtW4iwV21e/3aDF6W0sAi2M8B+7i/cw1SVte6Fo4B3jM3N/LcsZEUS3NjrkW7
         IoiMSgiYs4kNQbvK04k3VPQ5LaRJsugWb/ald4ywob2rs1Kh66qihtj3AefYfF6Kck5F
         qt8Q==
X-Gm-Message-State: AOAM531U15NzuF7SNgUOaZnONTbUT9/Quot7F5JY8+WymmsBHM1R3l0A
        x9OAKxP5YaFJN1iTthqqSvKaBA==
X-Google-Smtp-Source: ABdhPJzJ03y84acKkitqDj2TH2dOhiplmNOK5xQOC2FECadNDLsegJ9CbL4G62c7gZ/OWtbS34L71A==
X-Received: by 2002:a2e:7005:: with SMTP id l5mr22066141ljc.355.1629883753790;
        Wed, 25 Aug 2021 02:29:13 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id u20sm490639lfr.272.2021.08.25.02.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 02:29:13 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] lib/sort: Introduce rotate() to circular shift an
 array of elements
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
 <20210824133351.88179-2-andriy.shevchenko@linux.intel.com>
 <4078b7a3-2ec2-ba87-d23c-b8daed7386fe@rasmusvillemoes.dk>
 <20210825080832.GN3@paasikivi.fi.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <8bc8d977-5204-6f5b-8a1c-f2338c141993@rasmusvillemoes.dk>
Date:   Wed, 25 Aug 2021 11:29:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825080832.GN3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2021 10.08, Sakari Ailus wrote:
> Hi Rasmus, Andy,
> 

>>> + * @num: number of elements
>>> + * @size: size of each element
>>> + * @by: number of elements to rotate by
>>
>> Perhaps add (0 <= @by < @num) or something like that, and/or start the
>> implementation with "if (num <= 1) return; if (by >= num) by %= num;"
> 
> The latter could be done unconditionally.

Yes (provided num is tested at least for being non-zero first, but then
it's mostly free to check <= 1 instead), but in the vast majority of
cases the caller would pass a sane value of by, and an unconditional %=
would thus waste 100+ clock cycles for nothing.

>>> +	struct {
>>> +		size_t begin, end;
>>> +	} arr[2] = {
>>> +		{ .begin = 0, .end = by - 1 },
>>> +		{ .begin = by, .end = num - 1 },
>>> +	};
>>
>> I see you just copied-and-adapted, but I think the code would be much
>> easier to read without all those plus/minus ones all over.
> 
> Now that I think about it, they can be just removed. In that case end
> refers to the element following end, rather than the last element.

Yes, as we almost always do array indexing in C... the math simply ends
up coming out more naturally that way in the majority of cases.

>> Perhaps add a small self-test, it's not at all obvious how this works
>> (perhaps it's some standard CS101 algorithm for rotating in-place, I
>> don't know, but even then an implementation can have off-by-ones and
>> corner cases).
> 
> I don't know, I wrote this to fix a bug in the ipu3-cio2 driver. ;-) The
> hardware, and so the arguments, were static. Nice to see it would be useful
> elsewhere almost as-is.

Well, Andy hasn't actually shown that it would be useful anywhere else.
I think I'd like to see another user. Just doing "move this helper to
lib/ because we can reuse choose-a-proper-swap-func and thus implement
this perhaps a tiny bit faster" without considering whether it's even
performance-critical in the sole user is not a good idea IMO.

Especially since it can affect code generation of the much more
important (at least, has many more users) sort() function - the
do_swap() function grows another user, so could make the compiler end up
choosing not to inline it anymore.

There's another slightly simpler way to implement rotate(), which might
end up having more users (though I can't find any currently): Add a
reverse() helper, then rotate() can be done as reverse(a, 0, n);
reverse(a, 0, k); reverse(a, k, n-k);. If my math is right, the current
suggested rotate() ends up doing n-gcd(n,k) swaps, while the
implementation in terms of a reverse() would do n-1 if either n or k is
odd, otherwise n, calls to swap().

Rasmus
