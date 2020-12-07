Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F93C2D0CD7
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 10:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgLGJR6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 04:17:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9124 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgLGJR5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 04:17:57 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqHkP483qz15Rgx;
        Mon,  7 Dec 2020 17:16:45 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 17:17:14 +0800
Subject: Re: [PATCH 0/4] dt-bindings: media: eliminate yamllint warnings
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "Shawn Guo" <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201207042400.1498-1-thunder.leizhen@huawei.com>
 <20201207090825.gbgpqidxyxfujqmg@uno.localdomain>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <15b36b9f-ed0b-1d25-834b-5592eae4feea@huawei.com>
Date:   Mon, 7 Dec 2020 17:17:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201207090825.gbgpqidxyxfujqmg@uno.localdomain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2020/12/7 17:08, Jacopo Mondi wrote:
> Hi Zhen,
> 
> On Mon, Dec 07, 2020 at 12:23:56PM +0800, Zhen Lei wrote:
>> These patches are based on the latest linux-next code.
>>
>> Zhen Lei (4):
>>   dt-bindings: media: adv7604: eliminate yamllint warnings
>>   dt-bindings: media: nokia,smia: eliminate yamllint warnings
>>   dt-bindings: media: ov772x: eliminate yamllint warnings
>>   dt-bindings: media: imx214: eliminate yamllint warnings
> 
> The adv7604, ov772x and imx214 bits have been addressed by:
> https://www.spinics.net/lists/linux-media/msg181093.html

OK

> 
> Thanks
>   j
> 
>>
>>  Documentation/devicetree/bindings/media/i2c/adv7604.yaml     |  4 ++--
>>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml    | 11 ++++++-----
>>  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml | 12 ++++++------
>>  Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml | 12 ++++++------
>>  4 files changed, 20 insertions(+), 19 deletions(-)
>>
>> --
>> 1.8.3
>>
>>
> 
> .
> 

