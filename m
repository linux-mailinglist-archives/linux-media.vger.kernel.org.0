Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B109E365521
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 11:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbhDTJR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 05:17:27 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46179 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230090AbhDTJRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 05:17:21 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id YmUllUgtKw8UmYmUpl1rqj; Tue, 20 Apr 2021 11:16:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618910208; bh=Wx1b4HRfaZ+r/6ReWVRSHeFPp1P3g6TFkUyUkSeo2UI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gPsYn8b1c2epmHciLLZqj4RU6D/7VDgeFWXvH9Jc/tI77RwCdZ8MUBZzXKbf7iAEY
         93Kdph32ov2MaeQ8+/mAur+oqiSFjQFV4Ipvyz1Z/EzRuUEuVvwhyB9QF+mJA+AM04
         XtrlvOsMPoBd5uWKuoy/98yZBsDIt7X7NTEfeXzxPPZlHP/7unv/bXLHinCvRDGX8h
         mKmk+OIOEPgReV/aybXBqgJac4i1JIU3pqTb+gx51jOzC3RvtnH644JB/fpSeiX1sa
         s81zKOSMmL3tk6Fx5abobsbfjkGsxXF6rhveYSTjHoFDTM0xUXlWY1cfzSf1degZPo
         MwxJNcdiWHjsQ==
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <43a767f8-77f5-7937-c484-753a3123f6a2@xs4all.nl>
Date:   Tue, 20 Apr 2021 11:16:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <36008691-d075-203d-0cac-2a012773ea34@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGZKFRcQnHrrB8Ipsf1CNmQf/Flx92YqSYDdOPDeZztqOUClUbawsWCu5A9lWIwXKcgePCyFjcQJwnPrdsJQ581cu0O+/K5cc8vdEdnlVnBbBOWkeAxR
 xn7b0OpspojT5H+gVub8bgWR4QgtN/BKiSmbzMSQBI9vjK1f4N7lM3aSQrKfZiRoCsB8mpe5uURTYC+TOrhO65fcqUvPiGoZ8Oj9FM/1OZ0vU82342Ha44nz
 9ZM5w8MK6vrwqjVSF+ExkbNir/qCbvSxlkfkM+Wuy8q/9XrK5f4KHLWhsRCtIUpYuHlsuhath92nvMZqJinZipkBZlMqaQcUC9eoEWkSt1dhWUZC9U92xvbb
 8N24zp7jFCVUwLShy2QvxK2OCbWgvXGalLXabR+v8bty0BdimuRk9yFTyqAeAgSCf1xBuCa9GQaGhgAnXYCGNJTMOx0u7JKlBLbONBKp1UojBFKsRsIJ4vsL
 PbrdK3xaBInoMdtEZTBH7+gSW78CbyzH6kCAG6LrVlZXTQFXO7wkMXZZB+rDLefpDV1FpGTxqkfXUkFpPdCusEPRk9nmlmeT9V82vcP3ztK8g8XGBjTCRBhE
 CaqFLu7YJ+60+jBzUCP7c6PINBSG6GHXoH31Zjaqfz1UlHr8/age7N7xIlGvNPdcbRxa86WI9DxOgQW2Hm2OqjWjjI5sZiymulMw/T6Xr05TuKZOez2ZBm99
 CGT+I1VWC1rWeshCf5HQND5qVauqaTw/1BumWrmDZosG3LtHNhFO7G1QyvL82vWV+CQcQT3TvAWPojjgYfQsoNSpxaMg/rH0pnUVT9eLDUJU8e5s+E2zKNzl
 CpV25Pho0RD1R5pZBR2wP3iNBOnaJOUOIMdKCnM1cWDEgq9b2mW6wRr7udhvF2PcKhFm+kLWp2d8aBnFJkdriwC/sFktbmn2wl/dZi+3DnXh0xwpgu2dGE8M
 7lvx3DYzaPlOYsPXNxSzy2hCbNn1+5o3bEEZWUksr8r7onstlnX2QHZ2cwJZd9HZmIVIvr2cE7KAMtgtzIt4mnFS6Xi25UDJ02nwEfhOOXehxhUceHfV/eq6
 RcVpiaZxfMZsGT6uKNiQd1bzHDnVQO6dYV19j2fqSyzKJB8Jl1Mza7dp8Eb9Qu7xNsrHQF7bVdJylvnf/04qV6XigCcweSUd5Ew=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 11:10, Benjamin Gaignard wrote:
> 
> Le 16/04/2021 à 17:14, Lucas Stach a écrit :
>> Am Freitag, dem 16.04.2021 um 15:08 +0200 schrieb Benjamin Gaignard:
>>> Le 16/04/2021 à 12:54, Lucas Stach a écrit :
>>>> Am Mittwoch, dem 07.04.2021 um 09:35 +0200 schrieb Benjamin Gaignard:
>>>>> In order to be able to share the control hardware block between
>>>>> VPUs use a syscon instead a ioremap it in the driver.
>>>>> To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
>>>>> phandle is not found look at 'ctrl' reg-name.
>>>>> With the method it becomes useless to provide a list of register
>>>>> names so remove it.
>>>> Sorry for putting a spoke in the wheel after many iterations of the
>>>> series.
>>>>
>>>> We just discussed a way forward on how to handle the clocks and resets
>>>> provided by the blkctl block on i.MX8MM and later and it seems there is
>>>> a consensus on trying to provide virtual power domains from a blkctl
>>>> driver, controlling clocks and resets for the devices in the power
>>>> domain. I would like to avoid introducing yet another way of handling
>>>> the blkctl and thus would like to align the i.MX8MQ VPU blkctl with
>>>> what we are planning to do on the later chip generations.
>>>>
>>>> CC'ing Jacky Bai and Peng Fan from NXP, as they were going to give this
>>>> virtual power domain thing a shot.
>>> That could replace the 3 first patches and Dt patche of this series
>>> but that will not impact the hevc part, so I wonder if pure hevc patches
>>> could be merged anyway ?
>>> They are reviewed and don't depend of how the ctrl block is managed.
>> I'm not really in a position to give any informed opinion about that
>> hvec patches, as I only skimmed them, but I don't see any reason to
>> delay patches 04-11 from this series until the i.MX8M platform issues
>> are sorted. AFAICS those things are totally orthogonal.
> 
> Hi Hans,
> What do you think about this proposal to split this series ?
> Get hevc part merged could allow me to continue to add features
> like scaling lists, compressed reference buffers and 10-bit supports.

Makes sense to me!

Regards,

	Hans
