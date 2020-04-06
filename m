Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFBA19FFF4
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 23:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgDFVLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 17:11:19 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38205 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFVLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 17:11:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id v16so1321178ljg.5;
        Mon, 06 Apr 2020 14:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BLFfj2ck0MQtzj26NMFplS6l4cmd6DLaFaHtSAPxxaI=;
        b=hL1ZoGrZsgb0I8HNso0c0WiLYTwVsFKm6wqzdXT8kzWpLZL47a9qF2UI00ftizEgy2
         VDYFlZssv5FoINjrvS+y8swT8CCmSeYOwwooXeLd3rXr2Nzvgi1o2F4/XtVjpgOAvO5w
         MalwQMOvgIS72ApEYe6ODUsBv/GPmCooftFkz7DtQYkmoUJRvKLAxbl85HkU7o4mXL6T
         gaa6Yaw/BLngInnjszekYPOeH7B/4RaZmYP0JB+4ag3gAgt8aMfjcJ49rvMeSuLm03Ge
         h6/PMbbxgNxaIEGjtDyJ65vy8srxUEH1joq4drbTWDH0WI5/ntNPjcHzYASc9LIHcKDQ
         3sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BLFfj2ck0MQtzj26NMFplS6l4cmd6DLaFaHtSAPxxaI=;
        b=qgFLE2Zmxo3jn0dpkqAWDww7Mu2DFHFyNSpZoePhYXlHE6Ey7yjMWDzvL6J9CNiUM4
         8BA4d/ZPeC17NHq8Awqy2iQm1BPT91rhs2HntezqQ8Lo7ww8+4CRb+C0FJmLAWbCYjII
         LNSW2bl9OhneEgHJOkPITKiu6Zi86ck0T17o/BwFg2GNYOFRPOYz6oX3rgz3dt+w/YW0
         PqNu1fkPKxgvkrGSWUcF16se5JbpVoXwohrYRibKe/fNH2evL6+fT9w3uI3DEDlKMlVu
         JeP1E4TKtmNdgYF96QeEsTdXb2NG2hVbJo5u+4GIjs/MvcWxOHoBj0M0RRCqv+kTIuqN
         el6w==
X-Gm-Message-State: AGi0Pua45sgOUIM5Or5IgPnisXCuuZoPEK0boo/IA2qIApWFORE3BCuI
        3KsrpQXPh3Nyx+5LelJFj2EFCEYA
X-Google-Smtp-Source: APiQypILGKh47GhOUeTOUq39iuuxxtQkTWa2ixzbKDJgnTXPVV82LRf26aFJWl5KHUeLt2/IK7Yd9w==
X-Received: by 2002:a2e:8e3a:: with SMTP id r26mr731670ljk.233.1586207475793;
        Mon, 06 Apr 2020 14:11:15 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id y16sm10306806ljc.78.2020.04.06.14.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 14:11:15 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <200bb96e-2d07-764f-9e14-55538dc742fd@gmail.com>
 <23bfab09-b464-6e51-9843-06d13000e9b9@nvidia.com>
 <be77b0ef-d605-8357-4180-f40b2886d07a@gmail.com>
 <08cd31d5-e8b9-4d3a-fb0e-0e4462947d96@nvidia.com>
 <12a834ac-52b1-6dc0-7d3a-3e6a1fa85a2a@gmail.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
Date:   Tue, 7 Apr 2020 00:11:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

07.04.2020 00:02, Sowjanya Komatineni пишет:
>>>>>> Am I understanding correctly that this thread will take 100% CPU,
>>>>>> spinning here, if more than 2 frame-captures queued?
>>>>> on more than 2 frames captures, it breaks thread and on next wakeup it
>>>>> continues
>>>> The wait_event() won't wait if condition is true.
>>> condition is checked when waitqueue is woken up
>> https://elixir.bootlin.com/linux/v5.6.2/source/include/linux/wait.h#L462
> 
> process is put to sleep until the condition evaluates to true or signal
> is received.
> 
> condition is checked each time the waitqueue head is woken up.

This is a wrong assumption in accordance to the code.
