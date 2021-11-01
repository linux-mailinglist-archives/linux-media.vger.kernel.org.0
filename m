Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C7C442116
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 20:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhKATzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 15:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56270 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229723AbhKATzJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 15:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635796355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uo0myOPmex77ZheHOc5fgFaOVvECJMd4nJSYqqf6SIY=;
        b=AfDPPGVg0INyOMLrCqd32eSreE1kQMKEYKOQ81J8FToe82uV/D9Aspnj+eSn4MdddpJhEM
        6G01piGTqxZYAl+VaviTEQBf9wDl9Tr5ml6/TLMAisiTPrKvnlK1Nz75ncdrfwIfQv5OeA
        bg9HCdck+Fdb+ebR3Be7egXhohIMx2k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-Pc8wKbQDPdOpD4qtsMVhdA-1; Mon, 01 Nov 2021 15:52:33 -0400
X-MC-Unique: Pc8wKbQDPdOpD4qtsMVhdA-1
Received: by mail-ed1-f70.google.com with SMTP id x13-20020a05640226cd00b003dd4720703bso16592947edd.8
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 12:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uo0myOPmex77ZheHOc5fgFaOVvECJMd4nJSYqqf6SIY=;
        b=YupcgKH/ZRXzBs5/J34A3P0/gxwxcdfW8dEetZULUI+nJ5qIc+epgnWOdM1Op4GLFE
         /uWbqJOylBvLA5lb5yO2aVDRZ9zrZ+7f8/Z2CwS42AsHDPx7ZbYlqVkRiTvg/w6vye/I
         t3Ql88bW8JNu39NwWThfbfAVl2qxmayapM4tVKaZl8gwKa5WT1XBkS9OGQlvO+F+hvm/
         MI1qZX6Hhuno30/XhX0/iEWyCrbWWZQKWUdtmL0H+HH6Eb8l0cMmjNMyqcbai84dAD1E
         bsj2LIRmkPx90/l1NCN7oSTnvhaAEAzHKjgF+pOU4Ss1ZvjzwotL2VcZHIb/0mUFF/zU
         kf7w==
X-Gm-Message-State: AOAM533vyN0dZyVfWU43/n7B5bQdUBijpT7T764Vt7PrnxajlVcmLOnx
        czSEHC3xX+8+nMnucv0AH0wtfyu87AbC0gZcljRMUtGgFDisG24E5ICgfGou56UPr4aBXbkH5ZR
        /sNrqb9XNGo4NVFR9nitEA0Q=
X-Received: by 2002:a05:6402:4303:: with SMTP id m3mr43698332edc.328.1635796352446;
        Mon, 01 Nov 2021 12:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyIO1sEculhVTlDh29zsirt2jle73+pfsvGAdkAM0Fc7IjkSU14BNo6oiuMXKyFaDOZ+3usg==
X-Received: by 2002:a05:6402:4303:: with SMTP id m3mr43698313edc.328.1635796352331;
        Mon, 01 Nov 2021 12:52:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g10sm8543883edr.56.2021.11.01.12.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 12:52:31 -0700 (PDT)
Message-ID: <c233b38e-ec06-741f-d0e6-43067ab7f27a@redhat.com>
Date:   Mon, 1 Nov 2021 20:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-5-kitakar@gmail.com> <20211026092637.196447aa@sal.lan>
 <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
 <20211028123944.66c212c1@sal.lan>
 <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
 <20211101141058.36ea2c8e@sal.lan>
 <2b81ca7e-fcaa-5449-5662-4eb72e746b02@redhat.com>
 <CAHp75Vca4vuqyv0Y4vc1uv4OZhHipK8bM5yqGvMbJRs7-qh==Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vca4vuqyv0Y4vc1uv4OZhHipK8bM5yqGvMbJRs7-qh==Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/1/21 20:27, Andy Shevchenko wrote:
> On Mon, Nov 1, 2021 at 9:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/1/21 15:10, Mauro Carvalho Chehab wrote:
> 
> ...
> 
>> Testing BYT support definitely is on my radar. Note that BYT
>> also has the additional issue that the atomisp2 on BYT can be
>> enumerated as either a PCI dev (which may work) or an ACPI/platform
>> dev which is unsupported in the original atomisp2 code-drop and
>> seems non trivial (because of pci config space writes) to get to
>> work.
>>
>> On the T100TA the device is actually enumerated as an ACPI/platform
>> device and the BIOS option to change this is hidden. In the mean
>> time I've gained quite a lot of experience with changing hidden
>> BIOS options though, so I can easily put it in PCI mode for
>> testing. But eventually we also need to tackle ACPI enumeration
>> support...
> 
> Not sure if you saw my very far from being even tested patch...
> Share it here just in case. I believe you will have a better idea on
> how to implement it.

I don't remember seeing that, it is great to at least have
a starting point when I get around to looking into this, thank you!

Regards,

Hans

