Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184E61F57A6
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 17:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbgFJPWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 11:22:08 -0400
Received: from ns.iliad.fr ([212.27.33.1]:57116 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728264AbgFJPWH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 11:22:07 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 87561202F1;
        Wed, 10 Jun 2020 17:22:05 +0200 (CEST)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 71E2D20187;
        Wed, 10 Jun 2020 17:22:05 +0200 (CEST)
Subject: Re: Scanning for TV channels over DVB-T and DVB-T2
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     linux-media <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jan Pieter van Woerkom <jp@jpvw.nl>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>
Cc:     LKML <linux-kernel@vger.kernel.org>
References: <11fbc112-c410-8c67-9bcb-9450924d12ef@free.fr>
 <4904d37d-1cd4-b8f3-9c3c-82eb4569bca7@free.fr>
Message-ID: <778d08be-b606-018a-c2bc-164fbbc33615@free.fr>
Date:   Wed, 10 Jun 2020 17:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4904d37d-1cd4-b8f3-9c3c-82eb4569bca7@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 10 17:22:05 2020 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/06/2020 16:31, Marc Gonzalez wrote:

> On 08/06/2020 17:30, Marc Gonzalez wrote:
> 
>> Suppose we know that several channels are transmitted on a given frequency
>> by terrestrial antenna. However, we don't know if the signal is "encoded"
>> (not sure this is the right term) in DVB-T or DVB-T2 modulation.
>>
>> Do we have to scan the frequency /twice/
>> first with DTV_DELIVERY_SYSTEM = SYS_DVBT
>>  then with DTV_DELIVERY_SYSTEM = SYS_DVBT2 ?
>>
>> Or is there some optimization where both modulations are handled
>> in a single step?
>>
>> Or maybe it depends on the tuner driver?
> 
> Digging a bit deeper...
> 
> My system sports a Silicon Labs Si2168 DVB-T2/T/C demodulator
> 
> The data sheet states:
> 
> "For DVB-T2 and T2-Lite:
> 	DVB-T2 versus DVB-T automatic detection"
> 
> "In DVB-T and DVB-T2 reception, parameters necessary for device synchronization
> are broadcast in the transmission parameters (respectively TPS and P1 symbol).
> When these transmission parameters are found and decoded, the demodulator is
> automatically and accordingly configured to achieve full synchronization."
> 
> 
> This HW is supported upstream by drivers/media/dvb-frontends/si2168.c
> https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-frontends/si2168.c
> 
> I have a nagging feeling because si2168_set_frontend() appears to
> behave differently for SYS_DVBT and for SYS_DVBT2...
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-frontends/si2168.c#L250
> https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-frontends/si2168.c#L297
> https://elixir.bootlin.com/linux/latest/source/drivers/media/dvb-frontends/si2168.c#L345
> 
> Maybe setting SYS_DVBT2 would also work for DVB-T transmissions?
> (TODO: test that)
> 
> Any insight would be greatly appreciated.

FTR, on IRC, Brad pointed out this patch of his:
https://patchwork.kernel.org/patch/10744999/
