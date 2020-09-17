Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFB126E759
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 23:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIQVZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 17:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgIQVZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 17:25:07 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97C2C06174A;
        Thu, 17 Sep 2020 14:25:06 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id q9so3326605wmj.2;
        Thu, 17 Sep 2020 14:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=int6IPu+Ne/qM9mU8wvD7H8uWFzoTOCi2HL6/Vd5TOA=;
        b=j1XdSqhDjoXl7V9YkEudgyoz6Qq1UeDe7d6SNxWgxi2AJ4fNrOeXjqBPQPU+7tQtr9
         U5C95Vx8PSD9Qr5+8Y62NA4Hk0b4IC+fArfp4ogiQojZ++b+s6ubHVLa3m0SSbVtdh7Q
         wOzj/hhuZyckYEky3xQMeWLNF9zgDeCpefna7UUDiiRUPX5uprQu8TxOaZk9AJOLMxjG
         SPZpi9IQ5Fyk91MWzUQxjV/GC55uTSeKCv6IgzcOUZTZL4kOhgBxNBI/lqyNixTBLOve
         AxIJ0YduNJtg+fMWaMf5KMpuJgHUabK4aIcRYqWEhyxsnuRsAUdI9vpoIDNY5elTAHSZ
         XiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=int6IPu+Ne/qM9mU8wvD7H8uWFzoTOCi2HL6/Vd5TOA=;
        b=XlVNMmcvclA5mw/XjxwkOW5qn64JZ+7PsZPXontpDDEtHFrbFZgD5GdicPQQEruf35
         9nW3q99rwlNO5b144L9uA7d0k5uSBKOKBANFamc2iBDHJWm18FAxIIgfp/4VbC4W0mN/
         uuLol00KTX6vkleyo8cF7++eBw+wGHq19wcNVvTbG3pDA10lqsqHlL2ieXPdIxpsjA/L
         q85hhvnMHAQso8x7NE9P962tsaotwxC4LFy6uyWGBFXbPSE5/h+v1hvFCuC79QnT3uPf
         lr5ZAOFsxyXGi1qRpRFqyND5aysgM24BXGSypiYWWUKbkbZ4eeD01mez1iPBF6fwKFyz
         53KQ==
X-Gm-Message-State: AOAM531RjlFDYhmuk3eeCl1BxsPrJci5Ia4yYZdeahekei18kBuI8oTe
        MU84Q/bMYhnL9fR2KcqhJMk=
X-Google-Smtp-Source: ABdhPJzvOGira0U3RA3uqlmppGoplowp5YeQvfqeSk3cXRt/7w48OcuJMt/JfLXejLhs3nvtha8gMA==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr12964887wmg.91.1600377905538;
        Thu, 17 Sep 2020 14:25:05 -0700 (PDT)
Received: from [192.168.1.158] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id i15sm1201529wrb.91.2020.09.17.14.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 14:25:04 -0700 (PDT)
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        jorhand@linux.microsoft.com, Tsuchiya Yuto <kitakar@gmail.com>,
        kieran.bingham@ideasonboard.com
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <8133a57d-ab4c-dccd-4325-9b10e7805648@gmail.com>
 <20200917124514.GK3956970@smile.fi.intel.com>
 <fea9d85a-7be9-0270-bd59-8e479a836ae6@gmail.com>
 <CAHp75VcWZMThc6BPNiqvvEUVUbShV-7+Xn11E6J7UwMLfnszpg@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <b85ec736-6e02-4dd8-d7ce-b71c673e2b05@gmail.com>
Date:   Thu, 17 Sep 2020 22:25:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcWZMThc6BPNiqvvEUVUbShV-7+Xn11E6J7UwMLfnszpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/09/2020 15:14, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 4:53 PM Dan Scally <djrscally@gmail.com> wrote:
>> Hi Andy, thanks for input (as always)
> You're welcome! I'm really impressed by your activity in this area.
Thanks - it's pretty fun so far
>>> Ah, I think you misinterpreted the meaning of above. The above is a switch how
>>> camera device appears either as PCI or an ACPI. So, it effectively means you
>>> should *not* have any relation for this HID until you find a platform where the
>>> device is for real enumerated via ACPI.
>>>
>> Ah, ok. So that was never going to work. Thanks. That does raise another
>> question; we have had some testers report failure, which turns out to be
>> because on their platforms the definition of their cameras in ACPI is
>> never translated into an i2c_client so the cio2-bridge doesn't bind.
>> Those have a similar conditional in the _STA method, see CAM1 in this
>> DSDT for example:
>> https://raw.githubusercontent.com/linux-surface/acpidumps/master/surface_go/dsdt.dsl.
>> Is there anything we can do to enable those cameras to be discovered too?
> It means that this
Is the rest of this comment missing?
>>>>>> +#define PROPERTY_ENTRY_NULL                       \
>>>>>> +((const struct property_entry) { })
>>>>> Alignment. Same appears to apply to other macros (please indent).
>>>> Yep
>>>>>> +#define SOFTWARE_NODE_NULL                        \
>>>>>> +((const struct software_node) { })
>>> Why?!
>>>
>> It felt ugly to have the other definitions be macros and not this one,
>> but I can change it.
> My point is that those macros are simply redundant. The point is to
> have a terminator record (all 0:s in the last entry of an array) which
> is usually being achieved by allocating memory with kcalloc() which
> does implicitly this for you.
Ah I see. TIL - thanks, I'll make that change too.
