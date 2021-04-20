Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA82365569
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 11:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhDTJbx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 05:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbhDTJbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 05:31:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30860C06174A;
        Tue, 20 Apr 2021 02:31:22 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 906181F4277A
Subject: Re: [PATCH v9 03/13] media: hantro: Use syscon instead of 'ctrl'
 register
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lucas Stach <l.stach@pengutronix.de>, ezequiel@collabora.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
        kernel@pengutronix.de, kernel@collabora.com, cphealy@gmail.com,
        linux-arm-kernel@lists.infradead.org
References: <20210407073534.376722-1-benjamin.gaignard@collabora.com>
 <20210407073534.376722-4-benjamin.gaignard@collabora.com>
 <7bcbb787d82f21d42563d8fb7e3c2e7d40123932.camel@pengutronix.de>
 <ffe9b3f5-94f5-453e-73f0-4b42d0454b63@collabora.com>
 <529b61b1b1e6030c92a7944c4864246521b2ccdd.camel@pengutronix.de>
 <36008691-d075-203d-0cac-2a012773ea34@collabora.com>
 <43a767f8-77f5-7937-c484-753a3123f6a2@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <e7064bb1-69e6-4214-380d-c464b7832da5@collabora.com>
Date:   Tue, 20 Apr 2021 11:31:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <43a767f8-77f5-7937-c484-753a3123f6a2@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 20/04/2021 à 11:16, Hans Verkuil a écrit :
> On 20/04/2021 11:10, Benjamin Gaignard wrote:
>> Le 16/04/2021 à 17:14, Lucas Stach a écrit :
>>> Am Freitag, dem 16.04.2021 um 15:08 +0200 schrieb Benjamin Gaignard:
>>>> Le 16/04/2021 à 12:54, Lucas Stach a écrit :
>>>>> Am Mittwoch, dem 07.04.2021 um 09:35 +0200 schrieb Benjamin Gaignard:
>>>>>> In order to be able to share the control hardware block between
>>>>>> VPUs use a syscon instead a ioremap it in the driver.
>>>>>> To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
>>>>>> phandle is not found look at 'ctrl' reg-name.
>>>>>> With the method it becomes useless to provide a list of register
>>>>>> names so remove it.
>>>>> Sorry for putting a spoke in the wheel after many iterations of the
>>>>> series.
>>>>>
>>>>> We just discussed a way forward on how to handle the clocks and resets
>>>>> provided by the blkctl block on i.MX8MM and later and it seems there is
>>>>> a consensus on trying to provide virtual power domains from a blkctl
>>>>> driver, controlling clocks and resets for the devices in the power
>>>>> domain. I would like to avoid introducing yet another way of handling
>>>>> the blkctl and thus would like to align the i.MX8MQ VPU blkctl with
>>>>> what we are planning to do on the later chip generations.
>>>>>
>>>>> CC'ing Jacky Bai and Peng Fan from NXP, as they were going to give this
>>>>> virtual power domain thing a shot.
>>>> That could replace the 3 first patches and Dt patche of this series
>>>> but that will not impact the hevc part, so I wonder if pure hevc patches
>>>> could be merged anyway ?
>>>> They are reviewed and don't depend of how the ctrl block is managed.
>>> I'm not really in a position to give any informed opinion about that
>>> hvec patches, as I only skimmed them, but I don't see any reason to
>>> delay patches 04-11 from this series until the i.MX8M platform issues
>>> are sorted. AFAICS those things are totally orthogonal.
>> Hi Hans,
>> What do you think about this proposal to split this series ?
>> Get hevc part merged could allow me to continue to add features
>> like scaling lists, compressed reference buffers and 10-bit supports.
> Makes sense to me!

Great !
If the latest version match your expectations how would you like to processed ?
Can you merged patches 4 to 12 ? or should I resend them in a new shorted series ?

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
