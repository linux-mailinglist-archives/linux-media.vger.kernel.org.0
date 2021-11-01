Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5DE442252
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 22:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhKAVIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 17:08:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30357 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230519AbhKAVIv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 17:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635800776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TQgvJe1cepFDe4icXoTKdCQ9OFnmjUFubPLtiHuzRwE=;
        b=Rb7OZhLqhJAmx9jyCC4UUlbkOkHKek53g9VmcM2i0lK9Zt/CDgji1DGA4IYURPi7qIQqOv
        J5XBdScdOPWWJd9WWEqPDEUoWdF9sRyhp3r67SJStN3ZfViYOJmCNX66daZLuK1CqFKSxQ
        ZuH9dyYmCO3uqA4A6CohnsysYd0IrlA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-0gOV-kfQMLmfewHZs0C_Iw-1; Mon, 01 Nov 2021 17:06:15 -0400
X-MC-Unique: 0gOV-kfQMLmfewHZs0C_Iw-1
Received: by mail-ed1-f72.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57so16752418edv.10
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 14:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TQgvJe1cepFDe4icXoTKdCQ9OFnmjUFubPLtiHuzRwE=;
        b=kIBGWE7cudxvaKSGztDsCzOaYvJX7yGGlyS3kDruAIwsyIZvsikee31g2iPaPKwuh/
         YLKY/2rU6ZVhofQhtxu6+vAbP18+pZAoUMT/m6tkF7V5P2dWmKJEwrpZm6vKklTJSP97
         CvsgKsJo5/YrORnYRoi55Jd3fHy5dhffKEhS5YPjYJdlBfclZb5iv/jio/jvR+sgHQhx
         pdlgNIuyO0ue8eKswKs6UVbNMmsUzRagkxP8MiCwuItEs4/NFzVCveStIux2PLSwJQgG
         c01J39p6AwoCW6VyDxjf8vWvAPSHbJ9HG5vQnQvFaZms/Sz1UEIi6yPR2AwlwM0XfxCm
         e41Q==
X-Gm-Message-State: AOAM532Kp2yvtdPAaO7iA2fSurWyK5wQ8M/5hg/G99Uabur2teqewHKn
        QDcj6fZcyh0oiDeFanRzJLgwUEczPPxCscJx5Qm07e52da8X8IdqtOTiNOnksTZIjMzFUo1W0fU
        4TAQJkzstmtf3fbA7CpZgpfI=
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr16796026ejc.363.1635800774141;
        Mon, 01 Nov 2021 14:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7B3F/WuXivDXcMsQVHWmnjOpyhs30E4Vl20y17n1wnE9ef345TKyurGX36aGs8GVxBRd/rA==
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr16796004ejc.363.1635800773984;
        Mon, 01 Nov 2021 14:06:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gn16sm3917022ejc.90.2021.11.01.14.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 14:06:13 -0700 (PDT)
Message-ID: <8b81025d-a35d-da91-b059-eab1108013e8@redhat.com>
Date:   Mon, 1 Nov 2021 22:06:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
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
 <20211101200347.2910cbc7@sal.lan>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211101200347.2910cbc7@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/1/21 21:03, Mauro Carvalho Chehab wrote:
> Em Mon, 1 Nov 2021 20:06:52 +0100
> Hans de Goede <hdegoede@redhat.com> escreveu:

<snip>

>>    -Patch to not load atomisp_foo sensor drivers on !BYT && !CHT
> 
> Not sure if it is worth doing it, as there are a lot more to be
> done before being able to use a generic sensor driver.

As you may know, I'm also working on IPU3 support for $dayjob atm
actually :)

So the drivers for e.g. the ov5693 sensor conflict, by adding
a small (one line) check to atomisp_ov5693.c to not register
the driver at all when not on BYT/CHT we can avoid the conflict
on most devices for now. And when actually on BYT/CHT the user
will need to blacklist the non atomisp sensor-modules which, well
sucks, but atomisp is in staging for a reason ...

So the idea here is that with some small added ugliness to the
atomisp_foo.c sensor drivers we can make the 2 drivers co-exist
a bit more, allowing e.g. generic distro kernels to (maybe) enable
the atomisp2 stuff without regressing the IPU3 support.

###

Since we are discussing this now anyways, the atomisp_foo.c
patches would look like this:

#include <linux/platform_data/x86/soc.h>

        if (!soc_intel_is_byt() && !soc_intel_is_cht())
                return -ENODEV;

In the probe() function and change driver.name from
e.g. "ov5693" to "atom_ov5693".

Before I spend time on writing patches for this, would patches doing
this for conflicting drivers be acceptable ?

Regards,

Hans

