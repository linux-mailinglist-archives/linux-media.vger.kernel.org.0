Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C562305B63
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbhA0M3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 07:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236779AbhA0M1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 07:27:37 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79ADDC06174A;
        Wed, 27 Jan 2021 04:26:57 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id o18so1178541qtp.10;
        Wed, 27 Jan 2021 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wNeqy1eeb9t2veXPrSrcgYkXO41oWKgjj1xWqs7fT1c=;
        b=bT5qFKL/FMCfuSZAYwivgiYjFfSVtz9v6C2G9I17avfiVA1USlROhQ9ow4v/IPjjQr
         fdUOHgNWc58lCXO3F+nBrQYadnztfHbKVGoPe2PdWfipenKUoyqo+f5TIE6/MTHK3SlI
         nkPcmuPtJi/adw9QVwZeAZkrmkEjS8XsYPjDvjlPLI8WFuu34fewXxupIq8TmYruU4Pf
         MuuURUxCC3tjTqTyWCuTeiYC6+iTqV627BOUcN7jbaakJwb0taPm+1uisk44hlkusveF
         Mt4KtKit9Vs1oFhrJIiCakgGcu09M9e73r6CuIic3FSE739GxhVegKyFzZP1JOYCnjP8
         UgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wNeqy1eeb9t2veXPrSrcgYkXO41oWKgjj1xWqs7fT1c=;
        b=JcYSrbdNMXDgvjcRlFKhKBhbfzngLzBh2T7f1rH9zvCDVzq1i1sYJWQ93FZpjAYcFq
         L30vgAW5qSLh0iYC6nEPw7sd5ZQnPsUuAXM1FNF9nx/YP+oUXuqO7jIRsyJb1Ampnls/
         P5eWDi30WVE7J20ob3NPNqa1mP6a1LnnHxju9QCnHQBq+KcKQzjwre76CfkrKmTOCJYF
         +MiDk7cRRm/OpDiG2brVz5+glMeMWRGMluEElqX/4rL4NnxwA3Gm489CuICJgu74+UZh
         eikhiPMVV+K0O6QoyZqhI/15YdYR7FGckBRaJbLAhVfsjSJoe/H2vDjqF4VitKOhSIDY
         bVSw==
X-Gm-Message-State: AOAM5317EebQ4HZRVyvExBPnqvno7wyFBdl6FCYRafL/6z24dNDwk4Pb
        uZ7kV+7aW3zKg5slk8/lcM7LPvsxOX0xNQ==
X-Google-Smtp-Source: ABdhPJwAPfMgibzBdxGcMRRj2Jsc+Ks+647ibyMoMELCOt9nutHYAQJkyIoQbkjN9/kbQd1527885Q==
X-Received: by 2002:ac8:5942:: with SMTP id 2mr9410165qtz.117.1611750416415;
        Wed, 27 Jan 2021 04:26:56 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:b057:7dfc:eb51:9d42? ([2804:14d:72b1:8920:b057:7dfc:eb51:9d42])
        by smtp.gmail.com with ESMTPSA id b72sm1038900qkc.60.2021.01.27.04.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 04:26:55 -0800 (PST)
Subject: Re: [PATCH 3/3] media: vidtv: add initial debugfs interface
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.o,
        linux-kernel@vger.kernel.org
References: <20201224150402.1945788-3-dwlsalmeida@gmail.com>
 <20210127120623.7f018471@coco.lan>
From:   Daniel Almeida <dwlsalmeida@gmail.com>
Message-ID: <ded2b580-be92-e309-28ca-fc6635a3af4f@gmail.com>
Date:   Wed, 27 Jan 2021 09:26:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127120623.7f018471@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro! Thanks for the review.


Just one more thing though: what did you think about the way I chose to 
inject the errors? (e.g. drop packet, shift bytes, create 
discontinuity...etc etc)

I was just trying out a few ideas in this patch so if you also have any 
input on this please let me know.

As of now writing to any of these files will cause a myriad of errors on 
dvbinspector.


>> +
>> +#. dynamically inject errors at runtime by interacting with the files at /sys/kernel/debug/vidtv/*
>> +
>> +#. read some dvbv5 statistics from userspace more easily
>> +
>> +.. note::
>> +	This is entirely optional and the driver will work without this option selected.
> Please keep lines <= 80 columns, except when there's a strong reason to
> use longer lines. The same applies to other parts of this patch.
>
I was under the assumption that this had been bumped to 100 recently.


-- thanks

-- Daniel


