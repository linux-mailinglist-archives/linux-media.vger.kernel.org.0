Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED40C2FF1
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 11:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387479AbfJAJUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 05:20:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56135 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733159AbfJAJUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 05:20:03 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so2438951wma.5
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JsxepM4k1NM6up/OlcOc/SGBBqZdlwz8TBNuFCbrPCI=;
        b=ZvKh0C68UtPHgdzLGwrGJ8VAO+Vs1cEymm4srIvZU5y4HPNbPL+OATgzK0D0otaOaI
         01Y/D3rf6U37kAdUxsFjqsgeX8BP4uyc+Ge56TJu2nFTNnhTGHr7YVeCJCTwIkLLbOOx
         C91+FK0qzGpZ7jNgRbJ1c2FYF4JZPkIG+lU/6N6UP+fP/NoKzkeSD8GZ/o3mrgDNZO1U
         QsIL3xnAo2y5ldI2HeqcQ0r5cRBTmmt2E901ayTKKo+AfJ0aoawgJxqIB6G1WII584NL
         v9YPcxIEGQI0apKC2Sf1j74sFR0P4Jz5b0kwJfe5ZFyjKqqf4su98KsCCxWS+S4Nle0W
         +obQ==
X-Gm-Message-State: APjAAAUZm7oxlcgrhD+8fcYUT7Az0NMvRQzUMSY01nVTVyOVWPcGppDd
        hcwpLCSrUEQgsuaMQnNYVi1s4vka
X-Google-Smtp-Source: APXvYqwRf1OCRWXFnChFkOzOV/3zG5VLVYTskiqlX8YggGe6OOVBD0Z7ZaMgiWNbYGbSi9/rlbjXng==
X-Received: by 2002:a1c:3bd6:: with SMTP id i205mr2705394wma.135.1569921600491;
        Tue, 01 Oct 2019 02:20:00 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0c1:1609:54:45db:20c6:d537? ([2620:10d:c092:200::1:486c])
        by smtp.gmail.com with ESMTPSA id n1sm26331948wrg.67.2019.10.01.02.19.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 02:19:59 -0700 (PDT)
Subject: Re: [PATCH v2] edid-decode: Avoid division by zero
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
References: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
 <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
 <e9bae40c-9a2c-067b-d547-cd1f1a528e25@debian.org>
 <3f362e23-7cf9-e93b-8c88-b7b6c5197230@xs4all.nl>
 <94eae8a9-54bb-8110-b6b8-ef4bca2e7fc8@debian.org>
 <45b50c7f-a1ea-89a7-8484-a7332244944d@xs4all.nl>
From:   Breno Leitao <leitao@debian.org>
Message-ID: <ef66bd5b-daf0-20a0-739e-f5de2fd79eab@debian.org>
Date:   Tue, 1 Oct 2019 10:19:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <45b50c7f-a1ea-89a7-8484-a7332244944d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/10/2019 10:16, Hans Verkuil wrote:
> On 10/1/19 11:15 AM, Breno Leitao wrote:
>> Hi Hans,
>>
>> On 01/10/2019 09:39, Hans Verkuil wrote:
>>> On 10/1/19 10:10 AM, Breno Leitao wrote:
>>>> There are some weird monitors that returns invalid data, as zeroed
>>>> Horizontal/Vertical Active/Blanking.
>>>
>>> Do you have an EDID that does this? I'd like to add it to the collection
>>> of EDIDs in edid-decode.
>>
>> Yes, This is an example. Is this what you want?
>>
>> # cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-HDMI-A-1/edid | hexdump
>> 0000000 ff00 ffff ffff 00ff 8f15 4600 72f0 0000
>> 0000010 171e 0301 6680 7839 602a a19d 4954 269b
>> 0000020 470f 234a 0008 c081 4081 8081 0095 00b3
>> 0000030 c0d1 c08b 0101 3a02 1880 3871 402d 2c58
>> 0000040 0045 3dfa 0032 1e00 2166 aa56 0051 301e
>> 0000050 8f46 0033 3dfa 0032 1e00 0000 fd00 3000
>> 0000060 1f3e 0f50 0a00 2020 2020 2020 0000 fe00
>> 0000070 3100 3242 3343 3050 3430 3035 200a a101
>> 0000080 0302 401b 1647 0431 0119 1803 0923 0707
>> 0000090 0183 0000 0366 000c 0020 0180 001d 2e7c
>> 00000a0 a090 1a60 401e 2030 0036 0ba2 0032 1a00
>> 00000b0 0000 f700 0a00 ca00 60e0 0000 0000 0000
>> 00000c0 0000 0000 fc00 4500 4f4c 4520 3454 3036
>> 00000d0 4c30 2020 0000 0000 0000 0000 0000 0000
>> 00000e0 0000 0000 0000 0000 0000 0000 0000 0000
>> 00000f0 0000 0000 0000 0000 0000 0000 0000 c100
>> 0000100
> 
> Yes, that's fine. What is the brand/model of the display?

This is a touch panel manufactured by Elo, model 4600.

https://www.elotouch.com/4600l-discontinued-aug-2013.html
