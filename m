Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA385402449
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 09:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhIGH2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 03:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhIGH2N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Sep 2021 03:28:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0DB5C061575;
        Tue,  7 Sep 2021 00:27:07 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id h16so17704249lfk.10;
        Tue, 07 Sep 2021 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X0MR/JzbyhczX6Z4sq/vQDWWS/j750GwkAgqvzPOzPQ=;
        b=g+viYzimD1eABLGqXjiUFIXhGCSmnrN8Xz0wWqKRNddp9Bx1K1pvw+ay2GdXArvH2n
         QDW6talcveaugUo7UE8K2cl+tuZV64ZB6RuVnVWIDQW7qgBiH6s0mpi9HxRIyL6r96es
         FkNkGAFkKdfX/0+m8Ig6Jm+54m1jGOvuYRQaDiSxt6FRLvTJxZ4VqFqL3AeBPDGIOy/H
         C2eGpFvvRU04ls2HwXeuUfU6gxKFtmmkkoy366ED53xBhnpqgenxOenCeFmBZc82FgJQ
         TVGHKCk54fTOQ6Z7LWBa9lMXIZ3KlX2FwGxhV5QPqygEYqm/o9PKtPBrrTh6Oy1ZrVJH
         cSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X0MR/JzbyhczX6Z4sq/vQDWWS/j750GwkAgqvzPOzPQ=;
        b=akl/Ux7U9uPPpDDc1uYcx2lGyGH7ybuPif5q5w5IWT4BeiAQOwKzCizozrE3xwni1R
         5DGt/WSWk+H+jsdsb3Sw9xB8Saev7F0sIByInYRWe3Ot8SPxc/ZdR9Pn25mrBzE0Hbn1
         IEmUKg5LtrPJW8iACtNvg1e3XZ44KNJH9pm1Ui7InqTuzdsMCYafwqTLeTxAYDSQ+ZeJ
         qAXYPMm4C+Q58dUry96xa189KaaOJMJBn+IL9R0L9w3q0XBBtg1HPAL1LVE8gEEI9GTZ
         /wayWrWElqSE/oW4FeuVVtnNo4py9uef+H0tzPONk4GXWl1PaLyR3Teoyyx8KIJJxaGn
         pgkg==
X-Gm-Message-State: AOAM531UH7HGcLJOomk3YzJPTrR9cNlANuEnojCUwVuL7AjDXiWKtEQM
        ApvsVak6fKdpRNRlZAnwq7A=
X-Google-Smtp-Source: ABdhPJxAzR4mxfzUI7fkRkSnRmwRuPJXTNBPzjgMakhWbclZDfa626xjtWU8BOghFGTsr5yxUwn97A==
X-Received: by 2002:a05:6512:344c:: with SMTP id j12mr11970692lfr.594.1630999626100;
        Tue, 07 Sep 2021 00:27:06 -0700 (PDT)
Received: from [192.168.0.192] ([194.146.248.73])
        by smtp.gmail.com with ESMTPSA id y14sm1341773ljm.39.2021.09.07.00.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 00:27:05 -0700 (PDT)
Subject: Re: [PATCH v2] media: s5p-jpeg: rename JPEG marker constants to
 prevent build warnings
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-media@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org
References: <20210907044022.30602-1-rdunlap@infradead.org>
 <20210907081125.21c311f1@coco.lan>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <6c69dd69-9ace-114a-f887-3fe0fdd5d500@gmail.com>
Date:   Tue, 7 Sep 2021 09:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907081125.21c311f1@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

W dniu 07.09.2021 o 08:11, Mauro Carvalho Chehab pisze:
> Em Mon,  6 Sep 2021 21:40:22 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> The use of a macro named 'RST' conflicts with one of the same name
>> in arch/mips/include/asm/mach-rc32434/rb.h. This causes build
>> warnings on some MIPS builds.
>>
>> Change the names of the JPEG marker constants to be in their own
>> namespace to fix these build warnings and to prevent other similar
>> problems in the future.
>>
>> Fixes these build warnings:
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c:14:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>>        |
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-s5p.c:13:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c:12:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> In file included from ../drivers/media/platform/s5p-jpeg/jpeg-core.c:31:
>> ../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
>>     43 | #define RST                             0xd0
>> ../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
>>     13 | #define RST             (1 << 15)
>>
>> Also update the kernel-doc so that the word "marker" is not
>> repeated.
>>
>> Fixes: bb677f3ac434 ("[media] Exynos4 JPEG codec v4l2 driver")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
>> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>> v2: change all JPEG marker macros to be in their own namespace (as
>>      suggested by Mauro)
> 
> Applied, thanks!

You can add

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> 
> Regards,
> Mauro
> 
> Thanks,
> Mauro
> 
