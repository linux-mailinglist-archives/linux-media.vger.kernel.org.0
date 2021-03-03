Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A006132C739
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349574AbhCDAbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35762 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359556AbhCCOta (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 09:49:30 -0500
Received: from [IPv6:2a01:e0a:4cb:a870:30e8:5098:73c5:2bfe] (unknown [IPv6:2a01:e0a:4cb:a870:30e8:5098:73c5:2bfe])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5F13F1F459FA;
        Wed,  3 Mar 2021 14:48:46 +0000 (GMT)
Subject: Re: [PATCH v3 4/5] media: hantro: Use reset driver
To:     Philipp Zabel <p.zabel@pengutronix.de>, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        ezequiel@collabora.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
 <20210301151754.104749-5-benjamin.gaignard@collabora.com>
 <29bf66f4b531ec701e85c23a411e40e3621b0ff8.camel@pengutronix.de>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <ef2b0aff-cca3-6c75-1f25-176332e3162b@collabora.com>
Date:   Wed, 3 Mar 2021 15:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <29bf66f4b531ec701e85c23a411e40e3621b0ff8.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 03/03/2021 à 15:39, Philipp Zabel a écrit :
> On Mon, 2021-03-01 at 16:17 +0100, Benjamin Gaignard wrote:
>> Rather use a reset like feature inside the driver use the reset
>> controller API to get the same result.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/staging/media/hantro/Kconfig        |  1 +
>>   drivers/staging/media/hantro/imx8m_vpu_hw.c | 61 ++++-----------------
>>   2 files changed, 12 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
>> index 5b6cf9f62b1a..dd1d4dde2658 100644
>> --- a/drivers/staging/media/hantro/Kconfig
>> +++ b/drivers/staging/media/hantro/Kconfig
>> @@ -20,6 +20,7 @@ config VIDEO_HANTRO_IMX8M
>>   	bool "Hantro VPU i.MX8M support"
>>   	depends on VIDEO_HANTRO
>>   	depends on ARCH_MXC || COMPILE_TEST
>> +	select RESET_VPU_IMX8MQ
>>   	default y
>>   	help
>>   	  Enable support for i.MX8M SoCs.
>> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> index c222de075ef4..d5b4312b9391 100644
>> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
>> @@ -7,49 +7,12 @@
>>   
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>> +#include <linux/reset.h>
>>   
>>   #include "hantro.h"
>>   #include "hantro_jpeg.h"
>>   #include "hantro_g1_regs.h"
>>   
>> -#define CTRL_SOFT_RESET		0x00
>> -#define RESET_G1		BIT(1)
>> -#define RESET_G2		BIT(0)
>> -
>> -#define CTRL_CLOCK_ENABLE	0x04
>> -#define CLOCK_G1		BIT(1)
>> -#define CLOCK_G2		BIT(0)
>> -
>> -#define CTRL_G1_DEC_FUSE	0x08
>> -#define CTRL_G1_PP_FUSE		0x0c
>> -#define CTRL_G2_DEC_FUSE	0x10
>> -
>> -static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
>> -{
>> -	u32 val;
>> -
>> -	/* Assert */
>> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
>> -	val &= ~reset_bits;
>> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
>> -
>> -	udelay(2);
>> -
>> -	/* Release */
>> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
>> -	val |= reset_bits;
>> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
>> -}
>> -
>> -static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
>> -{
>> -	u32 val;
>> -
>> -	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
>> -	val |= clock_bits;
>> -	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> The way it is implemented in the reset driver, the clocks are now
> ungated between assert and deassert instead of afterwards. Is this on
> purpose?

No and that could be changed on next version.

Benjamin

>
> regards
> Philipp
>
