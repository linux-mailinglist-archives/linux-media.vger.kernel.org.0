Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3395964C7BA
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 12:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbiLNLIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 06:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237788AbiLNLIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 06:08:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE50C08
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 03:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671016058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2NMzT5WxxanwVRj3ltZhzzgNHC+/kTxBdOPUCNNU8Ak=;
        b=TwKaFh7RCX8AcHA9aFQ8uk6/2ZQfOMJGUMbIIsVscOdCs1jV66mR7XHLSFgRzq4TXVcY3N
        WM9jtk99FyF5xk/2A9ixHX8nSfo62vyot8fg24AGaYJcl7+GN/oEjgpsWPTkoYHiMZRXGv
        Yng4B8DEkZvjU1i9sSOU1RfMa1sjCPk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-gCn_4UM8OB6xF2grKxlSZQ-1; Wed, 14 Dec 2022 06:07:37 -0500
X-MC-Unique: gCn_4UM8OB6xF2grKxlSZQ-1
Received: by mail-ej1-f71.google.com with SMTP id gn28-20020a1709070d1c00b007c177fee5faso5344293ejc.23
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 03:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NMzT5WxxanwVRj3ltZhzzgNHC+/kTxBdOPUCNNU8Ak=;
        b=Y64ShTpiGZupbilGjLR0fa8Okn0KOPPDZ1pJiAbIBx63l2ep4+i79CuwWZJnhKr9ek
         O+oEBzNIE8qikKh6Z+GXqYxmfXI1dqklLTqLhvhD97b4PtGjm48JVCWC1GhRjBAIy44C
         0u/azkS+9iOmDHgdaDtWXeUcGoTefVF4lAHJebGnVTBIeIvkUaf73mjR4r8yxYbDeBEi
         1Q6G/nXKHrRgxp/6r9NLwIS/J/q5F22Q895oJw/IYhCzEEgj7HN4ZY6nxXmokLaVpBrK
         4yLGXbdfO91M0afI7CABjHpuYuLU3RuvjXXxG0WyEavnfTcGGasMQZW7hzr+5HcLSjJs
         xGNw==
X-Gm-Message-State: ANoB5pnpJIo/HbYLtaE3T8i1lh6Kpe5e1N9bk47TkuXMXVCzq+aCMVGk
        8wm/3eOpHQjbIDAvjX+jPlbX1O/WeZydembHqGAsTV+SlKZjqbN0r0Uus+WplYy1COMePHTiz+C
        Dc2f/TW38fSSZGINsm6cike0=
X-Received: by 2002:a05:6402:2408:b0:461:f0a7:156 with SMTP id t8-20020a056402240800b00461f0a70156mr21772631eda.36.1671016055975;
        Wed, 14 Dec 2022 03:07:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Bzrmu8+Hyf8yFzKSh6TtL86SENQgPWgmQXPgzi7Krk9g7uVytmQSovpkSDJk4Qms/oW9dQQ==
X-Received: by 2002:a05:6402:2408:b0:461:f0a7:156 with SMTP id t8-20020a056402240800b00461f0a70156mr21772623eda.36.1671016055802;
        Wed, 14 Dec 2022 03:07:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w14-20020a056402070e00b00463a83ce063sm5991090edx.96.2022.12.14.03.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 03:07:35 -0800 (PST)
Message-ID: <cbc45885-3224-6c61-7058-9b6e99029695@redhat.com>
Date:   Wed, 14 Dec 2022 12:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Dubious usage of VM_SHARED in atomisp_fops.c
Content-Language: en-US, nl
To:     David Hildenbrand <david@redhat.com>
Cc:     "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <fbefc16e-84d3-8afc-8c8e-4229bded0c8a@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fbefc16e-84d3-8afc-8c8e-4229bded0c8a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On 12/14/22 11:22, David Hildenbrand wrote:
> Hi,
> 
> going over all VM_SHARED and VM_MAYSHARE user in the kernel, I stumbled over the following dubious code in drivers/staging/media/atomisp/pci/atomisp_fops.c:
> 
> 
> if (!(vma->vm_flags & (VM_WRITE | VM_READ)))
>     return -EACCES;
> 
> ...
> 
> if (!(vma->vm_flags & VM_SHARED)) {
>     /* Map private buffer.
>      * Set VM_SHARED to the flags since we need
>      * to map the buffer page by page.
>      * Without VM_SHARED, remap_pfn_range() treats
>      * this kind of mapping as invalid.
>      */
>     vma->vm_flags |= VM_SHARED;
>     ret = hmm_mmap(vma, vma->vm_pgoff << PAGE_SHIFT);
>     ...
> }
> 
> 
> We're converting a writable MAP_PRIVATE mapping ("COW mapping") into a writable MAP_SHARED mapping, to hack around the is_cow_mapping() check in remap_pfn_range_notrack().
> 
> We're not even setting VM_MAYSHARE and turn the mapping silently into something with completely different semantics.
> 
> 
> That code has to go.
> 
> 
> One approach would be to reject such mappings (no idea if user space relies on private mappings), the other one would be to remove this driver. Judging that the driver already was marked broken in 2020 (ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")), maybe it's time for the driver to go.

There is still quite a lot of hw out there (and being used
with Linux) which has camera sensors connected to the atomisp2.

Recently a community member finally managed to actually make
the driver work and I have been working on cleaning it up since.

For 6.2 I set of patches converting the driver to the videobuf2
framework will land and as part of that all the problematic code
you point to above has been removed.

If you grep for VM_SHARED under drivers/staging/media/atomisp
in linux-next you will find no hits :)

Regards,

Hans


