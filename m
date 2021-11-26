Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD4445EAC3
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 10:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376517AbhKZJ4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 04:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbhKZJyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 04:54:09 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C20C061574
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 01:46:10 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso10252542wmr.4
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=e6k6xjpySUBGdUs0OpRln+98OUKCAYvnUvUw6UwBCXU=;
        b=RyqxM9f7zRUVMiYjg6J69yqPeMSp3+IMFFiSXLTt4bAbcWAg94FoAHy7R9N6xhjpBk
         9OrCI3STjtzes91FcoN+JG58yyEokDtouwKgiCZl3e0T8Pehhr5aQBmCUH9Iqle4loXc
         F0X27WcLfcygcT0Dx4ByTtgNXbCrXvvv26zVPIHnMuhL6uVAZ9RlUhwrCU5hU7jCj8Rp
         LXkuJxQlO23VKajt2ZGWNVVHPV3eNhzc0pLnpWyxkycwiqJ/abt8aewbUk4Vs694FKwj
         P1fjyQc2J9bbtAwf/9x9ZWUcAA3ScVvZw8RZdlj36BzslFk1YcIpBRab9ZpHqmEDodbn
         FEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=e6k6xjpySUBGdUs0OpRln+98OUKCAYvnUvUw6UwBCXU=;
        b=zuk3jSCLt5PbpTeI7aQ5SsMM5Z5SOEZ7cFWFGO2tPP/OF+JaJNBLirJvuk7ZsHeJuO
         rzz4HgailtkplPqYlfp6uHhWZK6fj3yODBOIM4asXgwE2gWRL1yr57gmQW8ef1TBFTxU
         xO3sOtaBjWExQT9IFrI3MozsiXy5DaoawDZeG7FkiaaF7AN7DrSx61ryh5JYAooUePkB
         Gxtq0/TF969UQWbBIQKIEnADUWnsbFbqIhd/G2jjsv8wAPVmqMm/0ZUpW3RDMutXnZO9
         HucbUVHOaqOIA9dVpjLEI6U4AK3nTUwMAARy4+3azELV1CLZkDuavhYZSgsU9hg3JWQ4
         jMHw==
X-Gm-Message-State: AOAM533FtCUljpU2ucD8Ip2CJWbKxpuFFszoMhIjJitGZSHKB12/qhGO
        p+I7K7nezC003Is+tidOmTAg9NA5VQI=
X-Google-Smtp-Source: ABdhPJwlZTXpUrNir/hosk49SoPrGu8BPO2fbEZTTtTcGd9jAHE61ObvFgnYQ/O73KR4dJywuxW5Dw==
X-Received: by 2002:a1c:80c6:: with SMTP id b189mr14494246wmd.40.1637919969599;
        Fri, 26 Nov 2021 01:46:09 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id t17sm8675058wmq.15.2021.11.26.01.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 01:46:09 -0800 (PST)
Subject: Re: [RFC PATCH 0/2] Introduce ancillary links
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hanlinchen@chromium.org, tfiga@chromium.org,
        kieran.bingham@ideasonboard.com
References: <20211126001603.41148-1-djrscally@gmail.com>
 <YaBNlpcr+i6s5rng@pendragon.ideasonboard.com>
 <de31fd62-b6f9-e042-9d26-6c3feb3faaa4@gmail.com>
 <f6982c60-3bf1-aa6c-2705-4d7315d77039@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <6e46686f-6447-26d1-3a4f-4787c9a15867@gmail.com>
Date:   Fri, 26 Nov 2021 09:46:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f6982c60-3bf1-aa6c-2705-4d7315d77039@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 26/11/2021 09:41, Hans de Goede wrote:
> Hi Daniel,
>
> On 11/26/21 08:58, Daniel Scally wrote:
>> On 26/11/2021 02:59, Laurent Pinchart wrote:
>>> On Fri, Nov 26, 2021 at 12:16:01AM +0000, Daniel Scally wrote:
>>>> Hello all
>>>>
>>>> This series is not yet ready to merge, but I wanted to share it as I know some
>>>> other folks are working in similar areas at the moment (and I am including the
>>>> libcamera devel list for the same reason)
>>> Seems you forgot to CC libcamera-devel :-) Let's fix that on v2.
>>
>> Argh! Sorry, will do
> First of all, thank you very much for this RFC series as well
> as for the matching libcamera series.


My pleasure

> For v2 of the series can you please also add Kate Hsuan to the
> Cc (I've added there to the To of this email). Kate is a colleague
> of me working on adding auto-focus support for IPU3 based setups
> to libcamera.


Oops again; I had intended to do that as well...sorry Kate! I'll be more
careful with the CC list next time

>
> Regards,
>
> Hans
>
