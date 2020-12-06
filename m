Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02BF42D00DF
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 06:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgLFFdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 00:33:06 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9120 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgLFFdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 00:33:05 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CpZnN2gFCz15XHT;
        Sun,  6 Dec 2020 13:31:52 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sun, 6 Dec 2020
 13:32:17 +0800
Subject: Re: [PATCH 1/5] media: dt-bindings: add the required property
 'additionalProperties'
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Stafford Horne <shorne@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201204093813.1275-1-thunder.leizhen@huawei.com>
 <20201204093813.1275-2-thunder.leizhen@huawei.com>
 <2c36ef4c2d022f6f83ec5c78a951d5e76f95378e.camel@pengutronix.de>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <c2be6704-e3f8-ec52-9114-c3fa3c235a3c@huawei.com>
Date:   Sun, 6 Dec 2020 13:32:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2c36ef4c2d022f6f83ec5c78a951d5e76f95378e.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2020/12/4 18:56, Philipp Zabel wrote:
> On Fri, 2020-12-04 at 17:38 +0800, Zhen Lei wrote:
>> When I do dt_binding_check for any YAML file, below wanring is always
>> reported:
>>
>> xxx/media/coda.yaml: 'additionalProperties' is a required property
>> xxx/media/coda.yaml: ignoring, error in schema:
>> warning: no schema found in file: xxx/media/coda.yaml
>>
>> There are three properties defined in allOf, they should be explicitly
>> declared. Otherwise, "additionalProperties: false" will prohibit them.
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> 
> Thank you, there already is a patch to fix this:
> 
> https://lore.kernel.org/linux-media/20201117200752.4004368-1-robh@kernel.org/

OK. I found it temporarily during do a JSON conversion，I have not subscribed the
dt-binding maillist.

> 
> regards
> Philipp
> 
> .
> 

