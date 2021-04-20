Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FC03657A1
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 13:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhDTLg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 07:36:28 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37037 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230290AbhDTLg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 07:36:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YofWlXS4Q8K3KYofZlzPTx; Tue, 20 Apr 2021 13:35:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618918554; bh=doq2K2ciyiMrj6S2cEcZtlgv25cz/m88RRkxLWtesi0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MeQVxCP+HH56vApGqKbqC5wUCSSWQGP9mNawk6Mk02oGP56yK+tCBQnJtmVAI9mCH
         TKeZA9gsE7s7v/jZJjdBi/p8sDDdMfgFUXldy7hOJVdugYNdylHPLXIhlc7GNgUOG0
         LlS+Q4T9uZLsVGfm/kujA39HiHl9Ndtv+X0Zu4lBz2FwhP3YYVJKNnZNj9vV0983Fo
         iT81rSskXhJWj0a62618wQduoFbNW8reougESlXqrPCo/JAXCxp/Vn6Mjz7IfRzcxc
         X3GaRMKVXT9ENB6INQAxZ0CUdLjA/wL/cQGhnq4b00oGj3HrHAQHxEJWdIJ1vWKjEl
         r3DdOOXYnszDw==
Subject: Re: [PATCH v9 03/13] media: hantro: Use syscon instead of 'ctrl'
 register
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
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
 <e7064bb1-69e6-4214-380d-c464b7832da5@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0f23d42e-b858-c57d-3bf7-32b511e919d1@xs4all.nl>
Date:   Tue, 20 Apr 2021 13:35:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e7064bb1-69e6-4214-380d-c464b7832da5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGZ13gHMa8gkiXjz8wgDyFzaYYCt9UUsYTPpCio4nZAkdDDxuKCKceeVqGxUSF/TqIr7N6FcI4GNAGxjmkU652ja4jvW2ByzAdmzDG7vM0WvbOQLToVt
 +mr75r84cLP2CO6ycEvczdsIhyMbPGyivQMF81Dk1z1w/MCH2xL3B2Pj9yGE+uFHVqCVUwwL8EdHJyq6n//fRi3m0eHmoDIVrcSHRSTVk1wFs3Fab5YV2D97
 3YIkQKISbzqaJeYyogGdeE8knqEpiFk/fYwiuSc/aSTT0qfrh9qmLrAyryJvItbse7nIlANMWfkNVeIsK6b1Uoc1+9+Fm+o0CYFLIPzLAggTUFyerXuWgwqk
 qqclmRbc7mo6E90K1AucAxaa9/s/LT8F/2to5S6UTEO63+spg6fMmDAI1YnCm/A2pW6lgtvsugovF2QKHfElcJuSLrY0X9whEo9a85W0qOD1bwFfpGwwf+H3
 pK/KHHQPZo42GVN9sY2vNauHBtESUNXdSNA+lorJBkj7VlDwUJL+8jq1WPuGlLwV7YWemR0ZZSEOQ/1mj3TaSDVLmellT2q1F3PYn1qnpxIKtc+K2XWJnWWH
 RAv9NS56n6kDsbfRKnYxZoeIpOh0psmezsRNAIvzUteOUMeJc9cFYX/6HzU3hbbYe3XdKTuqHXkAulupEOeRQ4xJnlXp0wPAQbSzWgJKz8pFvQEsPbXZO5gB
 D1hA43gaNvPivGfQBPep8U3dmOFT8+cCk6xQr+YuoSPlabY0HB4B5OYO5uFUUPqb1rxxRjwGnmRGRBAzPlCAjRL9snvPaRXdMopeT+G4EQG9aAtMyHRAk833
 MUi6eTmQAp4egsQoQk4yT50p3lAjq9eob2h/5HQtOxOs9GkQZer8sRzTfFp2dcRsqF25fIqkINBovF9M+QVjsZgAlULp9iRGXZxf00NjTsHW0ydseWWQQFxR
 3XqD/DPlAZmD4M3kUOuVTsa9LtHz1hsE5LKFNE89ZFuRfxMZ/IvuEsVNKFHv5GUrw18ATY4Eqrv9Q+gBgR+FlsbXPsI9xcBU3awWbqBxNp6YPjl1GBdnrSsQ
 UY/sfRYqzyGfdLHP/JnPNstLKjv5MlYB0d5ZyRqzbAOatkYa6rOB/9psCaL+n/9XBfClrWaF/gH1jooXhq4zn+gol4qMoXEF1nM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 11:31, Benjamin Gaignard wrote:
> 
> Le 20/04/2021 à 11:16, Hans Verkuil a écrit :
>> On 20/04/2021 11:10, Benjamin Gaignard wrote:
>>> Le 16/04/2021 à 17:14, Lucas Stach a écrit :
>>>> Am Freitag, dem 16.04.2021 um 15:08 +0200 schrieb Benjamin Gaignard:
>>>>> Le 16/04/2021 à 12:54, Lucas Stach a écrit :
>>>>>> Am Mittwoch, dem 07.04.2021 um 09:35 +0200 schrieb Benjamin Gaignard:
>>>>>>> In order to be able to share the control hardware block between
>>>>>>> VPUs use a syscon instead a ioremap it in the driver.
>>>>>>> To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
>>>>>>> phandle is not found look at 'ctrl' reg-name.
>>>>>>> With the method it becomes useless to provide a list of register
>>>>>>> names so remove it.
>>>>>> Sorry for putting a spoke in the wheel after many iterations of the
>>>>>> series.
>>>>>>
>>>>>> We just discussed a way forward on how to handle the clocks and resets
>>>>>> provided by the blkctl block on i.MX8MM and later and it seems there is
>>>>>> a consensus on trying to provide virtual power domains from a blkctl
>>>>>> driver, controlling clocks and resets for the devices in the power
>>>>>> domain. I would like to avoid introducing yet another way of handling
>>>>>> the blkctl and thus would like to align the i.MX8MQ VPU blkctl with
>>>>>> what we are planning to do on the later chip generations.
>>>>>>
>>>>>> CC'ing Jacky Bai and Peng Fan from NXP, as they were going to give this
>>>>>> virtual power domain thing a shot.
>>>>> That could replace the 3 first patches and Dt patche of this series
>>>>> but that will not impact the hevc part, so I wonder if pure hevc patches
>>>>> could be merged anyway ?
>>>>> They are reviewed and don't depend of how the ctrl block is managed.
>>>> I'm not really in a position to give any informed opinion about that
>>>> hvec patches, as I only skimmed them, but I don't see any reason to
>>>> delay patches 04-11 from this series until the i.MX8M platform issues
>>>> are sorted. AFAICS those things are totally orthogonal.
>>> Hi Hans,
>>> What do you think about this proposal to split this series ?
>>> Get hevc part merged could allow me to continue to add features
>>> like scaling lists, compressed reference buffers and 10-bit supports.
>> Makes sense to me!
> 
> Great !
> If the latest version match your expectations how would you like to processed ?
> Can you merged patches 4 to 12 ? or should I resend them in a new shorted series ?

A separate patch series would be easier for me.

Regards,

	Hans

> 
> Regards,
> Benjamin
> 
>>
>> Regards,
>>
>> 	Hans
>>

