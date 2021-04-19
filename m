Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F62363F98
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 12:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhDSKaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 06:30:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45818 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238547AbhDSK3z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 06:29:55 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 293A1D4A;
        Mon, 19 Apr 2021 12:29:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618828148;
        bh=/OhZpU17kIakn3YueJOutzYTg+OENoG/I4sAUMO5I00=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZBByn+akRVe+jpJXvotzqVNfx4tEp3bTbBOVSmfwQgFn4k8Ky0ZK0lWxG6jvACMXM
         xojxAdjHvZwd6oKwPyavm3djQMyQP/8p1+luVrfMO8Uo4yiWoO+b5bej/qg+JO85rW
         ICoPMcBT5BmJY4UqScVufE3qx9P6HYpgOlvK87bs=
Subject: Re: [PATCH 13/28] media: ti-vpe: cal: clean up CAL_CSI2_VC_IRQ_*
 macros
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-14-tomi.valkeinen@ideasonboard.com>
 <YHwm9W5/tv0J7sU9@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <92c7d132-bedf-1882-8203-bec7e8a93a73@ideasonboard.com>
Date:   Mon, 19 Apr 2021 13:29:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHwm9W5/tv0J7sU9@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/04/2021 15:32, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:34:42PM +0300, Tomi Valkeinen wrote:
>> The macros related to CAL_CSI2_VC_IRQ can be handled better by having
>> the VC number as a macro parameter.
>>
>> Note that the macros are not used anywhere yet, so no other changes are
>> needed.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal_regs.h | 30 +++++-------------------
>>   1 file changed, 6 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
>> index 93d9bf1f3c00..ed658175a444 100644
>> --- a/drivers/media/platform/ti-vpe/cal_regs.h
>> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
>> @@ -406,30 +406,12 @@
>>   #define CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK		BIT(14)
>>   #define CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK		BIT(15)
>>   
>> -#define CAL_CSI2_VC_IRQ_FS_IRQ_0_MASK			BIT(0)
>> -#define CAL_CSI2_VC_IRQ_FE_IRQ_0_MASK			BIT(1)
>> -#define CAL_CSI2_VC_IRQ_LS_IRQ_0_MASK			BIT(2)
>> -#define CAL_CSI2_VC_IRQ_LE_IRQ_0_MASK			BIT(3)
>> -#define CAL_CSI2_VC_IRQ_CS_IRQ_0_MASK			BIT(4)
>> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_0_MASK	BIT(5)
>> -#define CAL_CSI2_VC_IRQ_FS_IRQ_1_MASK			BIT(8)
>> -#define CAL_CSI2_VC_IRQ_FE_IRQ_1_MASK			BIT(9)
>> -#define CAL_CSI2_VC_IRQ_LS_IRQ_1_MASK			BIT(10)
>> -#define CAL_CSI2_VC_IRQ_LE_IRQ_1_MASK			BIT(11)
>> -#define CAL_CSI2_VC_IRQ_CS_IRQ_1_MASK			BIT(12)
>> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_1_MASK	BIT(13)
>> -#define CAL_CSI2_VC_IRQ_FS_IRQ_2_MASK			BIT(16)
>> -#define CAL_CSI2_VC_IRQ_FE_IRQ_2_MASK			BIT(17)
>> -#define CAL_CSI2_VC_IRQ_LS_IRQ_2_MASK			BIT(18)
>> -#define CAL_CSI2_VC_IRQ_LE_IRQ_2_MASK			BIT(19)
>> -#define CAL_CSI2_VC_IRQ_CS_IRQ_2_MASK			BIT(20)
>> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_2_MASK	BIT(21)
>> -#define CAL_CSI2_VC_IRQ_FS_IRQ_3_MASK			BIT(24)
>> -#define CAL_CSI2_VC_IRQ_FE_IRQ_3_MASK			BIT(25)
>> -#define CAL_CSI2_VC_IRQ_LS_IRQ_3_MASK			BIT(26)
>> -#define CAL_CSI2_VC_IRQ_LE_IRQ_3_MASK			BIT(27)
>> -#define CAL_CSI2_VC_IRQ_CS_IRQ_3_MASK			BIT(28)
>> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_3_MASK	BIT(29)
>> +#define CAL_CSI2_VC_IRQ_FS_IRQ_MASK(n)			BIT(0 + (n * 8))
> 
> This should be BIT(0 + (n) * 8). Same below.
> 
> As they're single bits, I would have dropped the _MASK suffix.

All the BIT(x) macros use _MASK suffix in the driver.

  Tomi
