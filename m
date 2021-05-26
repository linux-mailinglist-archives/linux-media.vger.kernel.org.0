Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54600391881
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 15:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhEZNIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 09:08:45 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:60063 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231189AbhEZNIn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 09:08:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ltFalTghSWkKbltFdlDGHO; Wed, 26 May 2021 15:07:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622034429; bh=B6zxLn4uRG6Xzw55EhknNDwa5s9LCryD7nlMql2E84Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Z0gYKZupbgwY3M577zWhboFLscfaYZRNKD8CShrUDWaMo0Xl2n7rCRq41R3ubx5Sv
         iqJHxn5WUiJQaxOCO92JVzlHmJGmX4+jVj1E8j9hYiuxSOqruu7O9N8zj6vfeWpNii
         wFz+0sh2key4ttMCXyWjfAXDbbP5xXp8S7m2tr3TMUdblRT1hGmo23A+vSIJ92bNhg
         lQ+i5fueHtERJbh4on/R4MWkVpmKcb/Bv6xXX0TfY16v6luylXNFuBlJnSOFXOHyBe
         nYJK1koo0wMCrtWGNmFv5DTBd1BKblyb6a3dHKWFQDsNyIYKmNAlikhyXZolFK+Brd
         NeGZy9/EyJPgw==
Subject: Re: [PATCH] media: cobalt: fix null-ptr-deref when there is no PCI
 bridge
To:     Tong Zhang <ztong0001@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
References: <20210424005206.261622-1-ztong0001@gmail.com>
 <b84e0b87-4753-0513-9803-0cda4ceb4adc@xs4all.nl>
 <CAA5qM4BtejMqUa+eJLV+9q26E3Du-MiTasB=knCh+Qsw3HjApg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a6052f9f-5d2e-e713-1ab4-27d38d14fa99@xs4all.nl>
Date:   Wed, 26 May 2021 15:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAA5qM4BtejMqUa+eJLV+9q26E3Du-MiTasB=knCh+Qsw3HjApg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKWnk3IFAGQaBX9OfzJ9z7MsD2JYa1O0jJDNOAnkNl6JHHP8JuapGTiO0XgJ7iwnpWIhhi3GKLaqs1EvEVwrsDnHrrW09GSi+sV1xhPicCXdcZc1vcDl
 ZVV9Y4BC6YtTwDzspbNk5Hsg1d4bGUaG4GbkESABgmwWK7sGhp0xj3AnMkt2p9lUqRlNLRwM6wMvrOl2JUlq5JbwdUVoBiJ/OUlDij5eSO9GtQeC6AXXnjtf
 1J3kmlAPxF9WhJuoR56CfKBBnTp6vrwfIjFMXH1fO8SoYbp6WrBRhwitXIxC8B2PRjSIl5fnB4k8UMHdbKy9iQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/05/2021 00:32, Tong Zhang wrote:
> On Wed, May 5, 2021 at 2:18 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 24/04/2021 02:52, Tong Zhang wrote:
>>> the PCI bridge might be NULL, so we'd better check before use it
>>>
>>> [    1.870569] RIP: 0010:pcie_bus_link_get_lanes.isra.0+0x26/0x59 [cobalt]
>>> [    1.875880] Call Trace:
>>> [    1.876013]  cobalt_probe.cold+0x1be/0xc11 [cobalt]
>>> [    1.876683]  pci_device_probe+0x10f/0x1c0
>>
>> How did you test this? With some virtualized PCI bus or something? I'm not sure
>> how this can happen.
>>
> Hello Hans,
> IMHO bus->self is pci bridge device and we can have a system
> configuration that does not have such a bridge,
> in this case, bus->self is NULL.

That does not answer my question :-)

You show a backtrace in the commit message, how did you get that?

Regards,

	Hans

> - Tong
>> Regards,
>>
>>         Hans
>>
>>>
>>> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
>>> ---
>>>  drivers/media/pci/cobalt/cobalt-driver.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
>>> index 0695078ef812..5687ed4869ac 100644
>>> --- a/drivers/media/pci/cobalt/cobalt-driver.c
>>> +++ b/drivers/media/pci/cobalt/cobalt-driver.c
>>> @@ -189,6 +189,8 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
>>>       u32 capa;
>>>       u16 stat, ctrl;
>>>
>>> +     if (!pci_bus_dev)
>>> +             return;
>>>       if (!pci_is_pcie(pci_dev) || !pci_is_pcie(pci_bus_dev))
>>>               return;
>>>
>>> @@ -247,6 +249,8 @@ static unsigned pcie_bus_link_get_lanes(struct cobalt *cobalt)
>>>       struct pci_dev *pci_dev = cobalt->pci_dev->bus->self;
>>>       u32 link;
>>>
>>> +     if (!pci_dev)
>>> +             return 0;
>>>       if (!pci_is_pcie(pci_dev))
>>>               return 0;
>>>       pcie_capability_read_dword(pci_dev, PCI_EXP_LNKCAP, &link);
>>>
>>

