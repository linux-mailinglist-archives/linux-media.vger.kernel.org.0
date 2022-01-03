Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC644830F2
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 13:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiACMVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 07:21:10 -0500
Received: from meesny.iki.fi ([195.140.195.201]:50872 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230005AbiACMVK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jan 2022 07:21:10 -0500
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 6BC3120191;
        Mon,  3 Jan 2022 14:21:04 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1641212464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RlysE7ifdYwKFTT8mNeEIBZAGLDXuKqusHP+O584iaY=;
        b=OLj3XFe7o3afZ1+Xx/e9qZvB7qZXivHx4eeKJFbac6EPIWSoGFuc0v8SaCLsQ9Hq/WNurO
        40XYYh0xr09+wWiMCjhq9rNp8bZ0ia2ogOrmyvSGCAdCX4OvggdyTE/LxstVEykpAeWI7l
        aCqM/mSpBlwgWVStzks5vWC+r6nAbXI=
Date:   Mon, 3 Jan 2022 14:21:03 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YdLqL2ViSwWzS/Ig@jyty>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220103110743.GA22001@gofer.mess.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1641212464; a=rsa-sha256; cv=none;
        b=TXSG3JYFkvhJDDAKwwTx96o7j/u/ke1n2AIOOdg5NznDSeGaIOLvBU8hQ8tK9CYBCalZpp
        WBZgfv7NGgyWtQGO2pEvNV5M3xTNLHi80BPeINzJRxAS5JC1cOwEKRQ/Z+Q2C/haYScWPW
        NAgcZ9VDmYqRn5BE647PFaBgkw9snRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1641212464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RlysE7ifdYwKFTT8mNeEIBZAGLDXuKqusHP+O584iaY=;
        b=IF6+ruw2a5+dz4e0kUfhbL0pYwfsQcA2AzF9h9LDkwtr498Ec0DVCq3EFJ2PFGjxA6SYUB
        yp352B4qKiNTZ8Oslz1fxy5bjVn0nSYW1peWHaOVPT1VByFOrRTXQZ9gfuP56ss0B6HyXN
        8GD2IsSsDmEv4VS6yKRSVEowEh8WIKI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Mon, Jan 03, 2022 at 11:07:43AM +0000, Sean Young wrote:
>I am not sure if the naked eye can observe a delay of 200ms rather than 
>100ms.

I thought that I might be able to distinguish "fast blinking" (5Hz or 
200ms) and "very fast blinking" (10Hz or 100ms), but I am not so sure 
anymore.

>This is the timeout field on rcdev. I think it is set here:
>
>https://git.linuxtv.org/media_tree.git/tree/drivers/media/usb/dvb-usb-v2/rtl28xxu.c#n1810
>
>I think the interval is to set to value which is much to high; I think 
>the 211 ms comes from this 200 value here. So, I think if you lower 
>this to 100 then your problems might go away.

According to my old notes from this RCU, the repeat period was slightly 
less than 110ms. In fact, the 212ms value from my output could be 
2*106ms.

>I had forgotten that that for the delay between key down and key up, 
>this also adds the repeat period for the protocol, see
>https://git.linuxtv.org/media_tree.git/tree/drivers/media/rc/rc-main.c#n857
>
>So actually that is 110ms + 9741us ≈ 119m, which is near enough the 
>values seen above. I suspect the issue is the interval but please 
>experiment.

If the correct threshold is 106ms and your suggestion of 100 does not 
work, I will try a lower value, such as 94 or 95, to get 94+9.741 < 106.

I will get back to you once I have tested the change, hopefully during 
this week.

	Marko
