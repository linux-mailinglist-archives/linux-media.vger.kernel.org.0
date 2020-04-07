Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50DA81A0EEC
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 16:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgDGOKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 10:10:21 -0400
Received: from a1i135.smtp2go.com ([43.228.184.135]:49301 "EHLO
        a1i135.smtp2go.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728970AbgDGOKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 10:10:21 -0400
X-Greylist: delayed 439 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Apr 2020 10:10:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=smtpservice.net; s=m6sda0.a1-4.dyn; x=1586269520; h=Feedback-ID:
        X-Smtpcorp-Track:Date:Message-ID:From:To:Subject:Reply-To:Sender:
        List-Unsubscribe; bh=szH0dr7fGk6BBGPp1cSodMSc7V+G/xJTo4qB/FSZIWo=; b=WuonCiGc
        zlhP+i7OUN0aktLGhcYf2D+WcEq55q+QycUprNbWfChrEuktBZSGbI7XLxoHEKDex4cBLndt5BIpv
        Sf6oIsK0UiQqM3FVuKdKvfH7mnZEuiiByik208wWdiACKMQm+DabCRyL/8pHm+XhffLYQvTRvGYfF
        XTCT/e8Abp+wJCR6bWLo3cVYI9/oNyWdG9UJKLAKwM/Z8bn9Ht4JJ6M6ZsENrpGvejzlnznU3ZJCg
        IodoJSgK125Qff6OtL+MazTFzOgI3WXVyYGemucKkTCtKITCClUMerIUDxVCfRjVgqD47+o51zNpl
        PQqxBmSqPkBaOZcjmZNHp00lKQ==;
Received: from [10.45.79.71] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <paulb@blazebox.homeip.net>)
 id 1jLooa-NaPSnZ-G0; Tue, 07 Apr 2020 14:02:56 +0000
Received: from [10.162.83.196] (helo=mail.blazebox.homeip.net)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92-S2G) (envelope-from <paulb@blazebox.homeip.net>)
 id 1jLooZ-Duuf7a-Ed; Tue, 07 Apr 2020 14:02:55 +0000
Received: from blazebox.homeip.net (localhost [127.0.0.1])
 by mail.blazebox.homeip.net (Postfix) with ESMTP id CBCAE61D014;
 Tue,  7 Apr 2020 10:02:53 -0400 (EDT)
X-Virus-Scanned: amavisd-new at blazebox.homeip.net
Received: from mail.blazebox.homeip.net ([127.0.0.1])
 by blazebox.homeip.net (mail.blazebox.homeip.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with LMTP id MulWGe1yJD6Q; Tue,  7 Apr 2020 10:02:48 -0400 (EDT)
Received: from [IPv6:2001:470:1f07:a3a:dc8:1e2:a6b:6125] (blaze
 [IPv6:2001:470:1f07:a3a:dc8:1e2:a6b:6125])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.blazebox.homeip.net (Postfix) with ESMTPSA id B022761D013;
 Tue,  7 Apr 2020 10:02:47 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blazebox.homeip.net;
 s=mail; t=1586268167;
 bh=szH0dr7fGk6BBGPp1cSodMSc7V+G/xJTo4qB/FSZIWo=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To;
 b=L9gaPg2WGH1BFpzsUgiKda2b6R5JxRCyY1n5R4CYLd+e4k8i8eJZ5oR5BHUNqJF/2
 ETFVhahigpAxxweOWEBVySKB95RpluLWjlqkLZXO6bzX9ozQiIOhTjLe6SM5UZsu7z
 e6pLnNuqBvgMG5Kz4HeOtMFxwWtufFQelZc2xuYuMUsLLIjDNMEUB1jwoF7GjFdOLS
 WNIviZ+CP16sv25jbNehbSzXy5CHZNdbo7Ny14h3g1yA67vhOPOQsX7JSFVRIySn6G
 uyqW/aI/Ap0Cpqvdq4ATjZpaqr8y9tZLHeNHFCl59+tTuviWL+/m9njnA75V+UKCuG
 NwocOdOZ1IXaw==
Subject: Re: [PATCH] drivers/dma-buf/Kconfig: correct typo in description
To:     Sumit Semwal <sumit.semwal@linaro.org>
References: <20200403183334.11440-1-paulb@blazebox.homeip.net>
 <CAO_48GEmjXyA0eEpJbHoeiHjLzYvnzhorWz2t+0o4B++HMH6AQ@mail.gmail.com>
From:   Paul Blazejowski <paulb@blazebox.homeip.net>
Autocrypt: addr=paulb@blazebox.homeip.net; prefer-encrypt=mutual; keydata=
 mQGiBEHIcSARBACppxS/Z8rEhKfsuYzIiwiiwH9q45OYqBTYQ1ODkTsGDk4UxD5yZysFTIuW
 2S3Sn+e1EckzI7Ks3hcw5Li2I2ujImovtFRXWRQlbndptKXllmxoCBHTwDX+wdvefR4d51N4
 KCxEAJCc84udtbEW7MorND/7hRUr1DlChV0sdGrDAwCgoqohbRpJSPT72H/DX/LUkrz27pUD
 /R8S2eUoaVhM3xEPVw+mZmjvrQpC1Ks6nyehIrQ3JmrTPD4X8TXWxEd6ZvxADkSFFrIaQh1H
 nEJSw1ZN31peicsi9WKSclsiY1qkGDvYrg1fEMJawpMqarcuYpBKEUXmHOMuAjGJyYImnhQc
 xzpDQcq0/HfBZTIDpETaWwyCKu+QBACSt/DCOLDB1/rfYQsezQU9PpF7nS+24D2ZMsB9RBXB
 xaEPQS/YzH8+ZFmlyNQ16VGWUOBkVC0+ZEkiDg3lOFTwpWzI82ZMuAYDl6VH6GKxfKYUW0K8
 JsMDYdkFzR77sVYulPbNnTofKvuDLYjQaS0a0QeBjrz6X+ynNDCtBtxomLQ1UGF1bCBCbGF6
 ZWpvd3NraSAoRGlmZmllKSA8cGF1bGJAYmxhemVib3guaG9tZWlwLm5ldD6IfgQTEQIAPgIb
 AwYLCQgHAwIDFQIDAxYCAQIeAQIXgAIZARYhBKazQONwZ4ALgSvlbMLuTZodz7IjBQJeZ/vq
 BQke1i1jAAoJEMLuTZodz7IjYAMAn2bD1TpGHT1FEfBKTcaaNr4njsjtAJ4rlAfjOhof09iS
 QaBQRi8chFEUt7kCDQRByHEjEAgAoR2oPZkLHDuYieLWce7+x2EN5q/LfOphxEkYDimz4apf
 hjEFZLQVG3jSA0kuYHWvdhn5JnIvpD131XDQ2rL+jXca2ilVoqmlSQbcVCf1jjFSvGR5pfik
 EljQqS7QGwJ75otZYHxOdcStdbY0lmd3qQx3ONd8hiJ43+/vlmCD9icLj39fYr7GpE1Kx6wa
 Gud8ViSC4aCoO361fjLvF6y7ikKPOeiIqcEMcalmZo6QH5PXEFx/lt3tbmpPZ7BOq0PqJxlt
 96uVs9SiWtOMlwtxyz3RuDOUwQyIW6g7zMgcaS3f+4olgQXAhs9goMWvwBvVar/KYfd/Hp/+
 rQtyUCaEgwADBgf9HX3aE5OU4iWU9a8T4ArJ9AmxgU1v7wH34AxJ7oLJcEAhN+3gbCehp9Bd
 B1gyDAVjkhQCAD3YrmMYDqQ1L/sVUYt2Efzbxp9JPgeswK0oPkxheFjumZ2ySdaP5+6Uid3p
 Em344ldGWDK8EUxptY71ABP0/5YmEQWQIH3e8rnyoo281KayJG4qg3G/iFdq59EeKAL4IaQt
 F0+ZDXXEmTnY5YntdD1QQ1X1Uv5QbJ7k1jCd7OFeA7MB+1MYB19uFgtGid2mGJgf0vDs226T
 45Mtahn1s4u300Y5bGy0nVd3KGoYk+baCXQTP4zfSId0dJYCiTOcFht+vRiUfOAt1/YT04hm
 BBgRAgAmAhsMFiEEprNA43BngAuBK+Vswu5Nmh3PsiMFAl5n/EAFCR7WLWEACgkQwu5Nmh3P
 siP3DACfZWB2q1msgya9L+DrIKWWs1vIifUAoJTW5hMOIIlGKcaK/Fa+5nF1pusO
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Message-ID: <9acaaa5e-ef08-8a56-abdf-dc0026c67c80@blazebox.homeip.net>
Date:   Tue, 7 Apr 2020 10:03:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAO_48GEmjXyA0eEpJbHoeiHjLzYvnzhorWz2t+0o4B++HMH6AQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Smtpcorp-Track: 1MLooZDIIf7aEd.Mugu8iqbK
Feedback-ID: 316702m:316702a3jAEqy:316702sHm0ryzyui
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/7/20 7:54 AM, Sumit Semwal wrote:
> Hello Paul,

Hi Sumit,

> 
> On Sat, 4 Apr 2020 at 00:03, Paul Blazejowski <paulb@blazebox.homeip.net> wrote:
>>
>> While running `make oldconfig` CONFIG_DMABUF_MOVE_NOTIFY
>> has a typo in Kconfig description, correct it.
> 
> Thanks for your patch.
> 
> May I request you to please run scripts/get_maintainer.pl while
> submitting patches? This allows all interested people to be able to
> review the patches.
> 

You got it! I will send a new patch, fixing another misspelling ... thanks!

>>
>> Signed-off-by: Paul Blazejowski <paulb@blazebox.homeip.net>
>> ---
>>  drivers/dma-buf/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>> index ef73b678419c..04dd09b1667b 100644
>> --- a/drivers/dma-buf/Kconfig
>> +++ b/drivers/dma-buf/Kconfig
>> @@ -43,10 +43,10 @@ config DMABUF_MOVE_NOTIFY
>>         bool "Move notify between drivers (EXPERIMENTAL)"
>>         default n
>>         help
>> -         Don''t pin buffers if the dynamic DMA-buf interface is available on both the
>> +         Don't pin buffers if the dynamic DMA-buf interface is available on both the
>>           exporter as well as the importer. This fixes a security problem where
>>           userspace is able to pin unrestricted amounts of memory through DMA-buf.
>> -         But marked experimental because we don''t jet have a consistent execution
>> +         But marked experimental because we don't jet have a consistent execution
>>           context and memory management between drivers.
>>
>>  config DMABUF_SELFTESTS
>> --
>> 2.26.0
>>
> 
> Best,
> Sumit.
> 

Cheers!
-paul
