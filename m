Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8C677C3A6
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 15:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfGaNec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 09:34:32 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:54912 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfGaNec (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 09:34:32 -0400
Received: by mail-wm1-f42.google.com with SMTP id p74so60811342wme.4
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2019 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=i4RNuLmH2IdqRoXZtbWJ/OiiSdgrVFINGLD7VLcf79I=;
        b=idSKC1LrcP6KSggywxxWZE2tldyk0Hu9EdVDizSFI9VGQltD1RKuXItmz6uOrlPyv/
         vg+GQ6GGaY/QBbDNe855roiLaDXVXixWUNXjglnNP0m6+NTNe5lEy2HsLM8bfwIWhZw4
         8t8bOC4SUzFMYc3stXhibDzv7038m3AY2y35q69hY5hWmbOjmX3E4lTiDqsCpluefPhQ
         qecU7CPjoG9pj7pxcsU51GcvuFYZ9/ECC+8Avp5nIJ8ttk0O9CNPPT7z0GW19Dd0zI+j
         wyTEg40CJq/FIXXT8HugVY6JvS2/l6cLbe8v2z+rdmhWId77w1ywzb+9NqKUPJN2llOH
         2D4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=i4RNuLmH2IdqRoXZtbWJ/OiiSdgrVFINGLD7VLcf79I=;
        b=UFnbJBscmMtN50+IY/0xPMejHTc/dTvXV04tdlYgoBR150iGF1tbkiFssX1TKqr1Bb
         2UwBUbOK/Ifml/gVhS+fZ7GrkeMzXeIyI0Srudgj1c6BSslLwwLfw5TrclZ3JQ1FMY2B
         5oZBC9HSPrFsIXLwshHHIah9n42MUerIBWSTSivICsjrNVhQm9fnnw2NVy91/RXVFaiV
         pTNIXWkW196inZ7zGld2yGgMExWS5dxjOYqTIPI7WeZqR1mqSroAzeWTZJfIp7vrUPkc
         VCV+piBpPFqFrPHFYmJHdkDTe/laQ07YgkF2L7iI5QFuwZVVeI1PxbDLX0Gv5WSFbwn1
         Bvxw==
X-Gm-Message-State: APjAAAWc18KOlD308PM8D9k5xNvTvaHTzXzD1LL+5sNVZBbNNgum9CKB
        uJ8VGqiDjE3itEvUWS5AMkptkMOQ
X-Google-Smtp-Source: APXvYqxGpdFwuhY+fdgM2CZcJCMfAQRfJPr9pIwRtQatt/DbHMUfVJuDjo/5V3oBC21OKIW2jAL+Qw==
X-Received: by 2002:a1c:a019:: with SMTP id j25mr111460938wme.95.1564580070080;
        Wed, 31 Jul 2019 06:34:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id a81sm71625173wmh.3.2019.07.31.06.34.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 06:34:29 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH] dma-buf: add more reservation object locking wrappers
To:     Chris Wilson <chris@chris-wilson.co.uk>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190731113853.51779-1-christian.koenig@amd.com>
 <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6421ea80-2bdd-7f63-1cba-9c57157f3946@gmail.com>
Date:   Wed, 31 Jul 2019 15:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 31.07.19 um 14:33 schrieb Chris Wilson:
> Quoting Christian König (2019-07-31 12:38:53)
>> Complete the abstraction of the ww_mutex inside the reservation object.
>>
>> This allows us to add more handling and debugging to the reservation
>> object in the future.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Looks entirely mechanical,
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> Quietly opines for s/reservation_object/dma_reservation/

I was thinking about that as well because "reservation_object" is just a 
rather long name and not very descriptive.

But I'm not sure if dma_reservation fits either. How about something 
like dma_cntrl?

Christian.

> -Chris

