Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC15700929
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 15:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240965AbjELNYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 May 2023 09:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240424AbjELNYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 09:24:45 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C271715
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 06:24:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-306281edf15so9341909f8f.1
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897882; x=1686489882;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NjGE8WwW/yR2rdpfAJdNZBDQImFOs7yrgxhZDMk8cj0=;
        b=yRGK4hmv+EaNpk6Kaan5c7SX52J0pH0QbzNHHbjyhepbi8GkiuoG9Io8s3mAqE1oyq
         RJonYBCqzwEZ3ga4L3YWoymKAC1yoQ8z5i/ycnV3Z310eYRTQDUuuiFb3DY+pfjKVSFe
         KcETKbaj5gIhMjIocCNJ0682yQQD5AsdGoZbbdvAvYXu1U6pDvibcwKBdA7y/yEjBPuv
         0pjpG+exX8yJweNbX+zTsLBlSZqKc9i4Q9DuBwdRrl+vkUIXskJBoCgTrUCZMP4d08wX
         MA0azUgV4bAVV8GGEw/QNp7CEZNarfDEM2IebaHJAJvXbj8DOgTTvP4xBj070/kjjjdm
         XbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897882; x=1686489882;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjGE8WwW/yR2rdpfAJdNZBDQImFOs7yrgxhZDMk8cj0=;
        b=HKHQdnwVOVl1OPJ87GKwvbVDa5b5DoEme6zdHOLwitVkSHOCpz6irOk++aRyWEpW/0
         4KN9fYKXVlWRSFJCEl8hdEGmFsUOliP24Mbd+yP8nSGmxgcRDviFKgdWkqcMsiEZp7sa
         pSnZ1177HZ0/U7mxVjFgifoHb8rgv4BF+kNGTea1Yo3WGWG1e38/Y311FEZGIOj+t5bz
         5a6pDWcGNMmW6F5eirHgtWtO2iVg+fPGK0jCx1velISTHa0GwHzk9VGSQfMjMXFSGCLD
         Bw+yfGXJiqGfuTLNtw0LBymaSCFk+FiJY1OnBaUKU/dFOSFxUmGYpYqZxzozJI3bSyMP
         5CBA==
X-Gm-Message-State: AC+VfDwptQdR+kPOLn3Luq8SBkNv8/JmV4f4AGWyLQThHb9logj+VozX
        YNaGw2WSmD1UKwEtJA3VBHnavcAQomNOth3L2CGwiA==
X-Google-Smtp-Source: ACHHUZ7Rj/rACci1qxAfrJWGMGmvg23yzLCaNpJeGfJZ5NT5HuNZIiqw5SFyJV9tYX1WNDzj8c2jaQ==
X-Received: by 2002:a5d:428b:0:b0:307:82e3:70cd with SMTP id k11-20020a5d428b000000b0030782e370cdmr19025530wrq.14.1683897881710;
        Fri, 12 May 2023 06:24:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:95e3:a02f:1d34:8191? ([2a01:e0a:982:cbb0:95e3:a02f:1d34:8191])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000008200b0030630120e56sm23210099wrx.57.2023.05.12.06.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 06:24:41 -0700 (PDT)
Message-ID: <8f2091b0-6974-c631-a07b-4379f1311021@linaro.org>
Date:   Fri, 12 May 2023 15:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] media: rc: meson-ir: support MMIO regmaps to access
 registers
Content-Language: en-US
To:     Zelong Dong <Zelong.Dong@amlogic.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230511034333.26800-1-zelong.dong@amlogic.com>
 <62dd9a2f-6417-746c-0c8b-7424bda9e151@linaro.org>
 <712e2962-073a-b6c2-8f58-d1ceffdc77d2@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <712e2962-073a-b6c2-8f58-d1ceffdc77d2@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/05/2023 14:19, Zelong Dong wrote:
> Thanks for your review.
> 
> 在 2023/5/11 16:31, Neil Armstrong 写道:
>> [你通常不会收到来自 neil.armstrong@linaro.org 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
>>
>> [ EXTERNAL EMAIL ]
>>
>> Hi,
>>
>> Thanks for splitting the regmap conversion in a separate change.
>>
>> On 11/05/2023 05:43, zelong dong wrote:
>>> From: Zelong Dong <zelong.dong@amlogic.com>
>>>
>>> Supports MMIO regmaps to access controller registers in Meson IR driver.
>>> And rename register macro for identify more clearly. >
>>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>>> ---
>>>   drivers/media/rc/meson-ir.c | 128 ++++++++++++++++++++----------------
>>>   1 file changed, 70 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
>>> index 4b769111f78e..045d78f0862c 100644
>>> --- a/drivers/media/rc/meson-ir.c
>>> +++ b/drivers/media/rc/meson-ir.c
>>> @@ -14,6 +14,7 @@
>>>   #include <linux/platform_device.h>
>>>   #include <linux/spinlock.h>
>>>   #include <linux/bitfield.h>
>>> +#include <linux/regmap.h>
>>>
>>>   #include <media/rc-core.h>
>>>
>>> @@ -24,57 +25,50 @@
>>>   #define IR_DEC_LDR_IDLE             0x04
>>>   #define IR_DEC_LDR_REPEAT   0x08
>>>   #define IR_DEC_BIT_0                0x0c
>>> +
>>
>> Please move the cleanup/renames to a separate patch
>>
>>>   #define IR_DEC_REG0         0x10
>>> -#define IR_DEC_FRAME         0x14
>>> -#define IR_DEC_STATUS                0x18
>>> -#define IR_DEC_REG1          0x1c
>>> -/* only available on Meson 8b and newer */
>>> -#define IR_DEC_REG2          0x20
>>> +#define IR_DEC_REG0_BASE_TIME        GENMASK(11, 0)
>>>
>>> -#define REG0_RATE_MASK               GENMASK(11, 0)
>>> +#define IR_DEC_FRAME         0x14
>>>
>>> -#define DECODE_MODE_NEC              0x0
>>> -#define DECODE_MODE_RAW              0x2
>>> +#define IR_DEC_STATUS                0x18
>>> +#define IR_DEC_STATUS_PULSE  BIT(8)
>>>
>>> +#define IR_DEC_REG1          0x1c
>>> +#define IR_DEC_REG1_TIME_IV  GENMASK(28, 16)
>>> +#define IR_DEC_REG1_ENABLE   BIT(15)
>>>   /* Meson 6b uses REG1 to configure the mode */
>>> -#define REG1_MODE_MASK               GENMASK(8, 7)
>>> -#define REG1_MODE_SHIFT              7
>>> +#define IR_DEC_REG1_MODE     GENMASK(8, 7)
>>> +#define IR_DEC_REG1_IRQSEL   GENMASK(3, 2)
>>> +#define IR_DEC_REG1_RESET    BIT(0)
>>>
>>> +/* only available on Meson 8b and newer */
>>
>> Same, please move new comments/cleanup/renames to a separate patch.
> 
> OK, and can I append more register macros?
> These macros are unused in this patchset, but they should be used in next patchset about HW IR decoder.

OK so add them in a next patchset with the new support added.

Ideally you should send the following patches:

- cleanup
- rename of macros
- switch to regmap
- add new macros for new HW
- add support for new HW

It's ok to send the first 3 now, and the last 2 later on.

> 
>>
>>> +#define IR_DEC_REG2          0x20
>>>   /* Meson 8b / GXBB use REG2 to configure the mode */
>>> -#define REG2_MODE_MASK               GENMASK(3, 0)
>>> -#define REG2_MODE_SHIFT              0
>>> -
>>> -#define REG1_TIME_IV_MASK    GENMASK(28, 16)
>>> -
>>> -#define REG1_IRQSEL_MASK     GENMASK(3, 2)
>>> -#define REG1_IRQSEL_NEC_MODE 0
>>> -#define REG1_IRQSEL_RISE_FALL        1
>>> -#define REG1_IRQSEL_FALL     2
>>> -#define REG1_IRQSEL_RISE     3
>>> +#define IR_DEC_REG2_MODE     GENMASK(3, 0)
>>>
>>> -#define REG1_RESET           BIT(0)
>>> -#define REG1_ENABLE          BIT(15)
>>> +#define DEC_MODE_NEC         0x0
>>> +#define DEC_MODE_RAW         0x2
>>>
>>> -#define STATUS_IR_DEC_IN     BIT(8)
>>> +#define IRQSEL_NEC_MODE              0
>>> +#define IRQSEL_RISE_FALL     1
>>> +#define IRQSEL_FALL          2
>>> +#define IRQSEL_RISE          3
>>>
>>> -#define MESON_TRATE          10      /* us */
>>> +#define MESON_RAW_TRATE              10      /* us */
>>> +#define MESON_HW_TRATE               20      /* us */
>>>
>>>   struct meson_ir {
>>> -     void __iomem    *reg;
>>> +     struct regmap   *reg;
>>>       struct rc_dev   *rc;
>>>       spinlock_t      lock;
>>>   };
>>>
>>> -static void meson_ir_set_mask(struct meson_ir *ir, unsigned int reg,
>>> -                           u32 mask, u32 value)
>>> -{
>>> -     u32 data;
>>> -
>>> -     data = readl(ir->reg + reg);
>>> -     data &= ~mask;
>>> -     data |= (value & mask);
>>> -     writel(data, ir->reg + reg);
>>> -}
>>> +static struct regmap_config meson_ir_regmap_config = {
>>> +     .reg_bits = 32,
>>> +     .val_bits = 32,
>>> +     .reg_stride = 4,
>>> +};
>>>
>>>   static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
>>>   {
>>> @@ -84,12 +78,12 @@ static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
>>>
>>>       spin_lock(&ir->lock);
>>>
>>> -     duration = readl_relaxed(ir->reg + IR_DEC_REG1);
>>> -     duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
>>> -     rawir.duration = duration * MESON_TRATE;
>>> +     regmap_read(ir->reg, IR_DEC_REG1, &duration);
>>> +     duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
>>> +     rawir.duration = duration * MESON_RAW_TRATE;
>>>
>>> -     status = readl_relaxed(ir->reg + IR_DEC_STATUS);
>>> -     rawir.pulse = !!(status & STATUS_IR_DEC_IN);
>>> +     regmap_read(ir->reg, IR_DEC_STATUS, &status);
>>> +     rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
>>>
>>>       ir_raw_event_store_with_timeout(ir->rc, &rawir);
>>>
>>> @@ -102,6 +96,8 @@ static int meson_ir_probe(struct platform_device *pdev)
>>>   {
>>>       struct device *dev = &pdev->dev;
>>>       struct device_node *node = dev->of_node;
>>> +     struct resource *res;
>>> +     void __iomem *res_start;
>>>       const char *map_name;
>>>       struct meson_ir *ir;
>>>       int irq, ret;
>>> @@ -110,7 +106,17 @@ static int meson_ir_probe(struct platform_device *pdev)
>>>       if (!ir)
>>>               return -ENOMEM;
>>>
>>> -     ir->reg = devm_platform_ioremap_resource(pdev, 0);
>>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +     if (IS_ERR_OR_NULL(res)) {
>>> +             dev_err(&pdev->dev, "get mem resource error, %ld\n",
>>> +                     PTR_ERR(res));
>>> +             return PTR_ERR(res);
>>> +     }
>>> +
>>> +     res_start = devm_ioremap_resource(&pdev->dev, res);
>>
>> Use devm_platform_ioremap_resource() instead
> 
> OK.
> 
>>
>>> +     meson_ir_regmap_config.max_register = resource_size(res) - 4;
>>> +     ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
>>> +                                     &meson_ir_regmap_config);
>>>       if (IS_ERR(ir->reg))
>>>               return PTR_ERR(ir->reg);
>>>
>>> @@ -131,7 +137,7 @@ static int meson_ir_probe(struct platform_device *pdev)
>>>       map_name = of_get_property(node, "linux,rc-map-name", NULL);
>>>       ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
>>>       ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>>> -     ir->rc->rx_resolution = MESON_TRATE;
>>> +     ir->rc->rx_resolution = MESON_RAW_TRATE;
>>
>> This should go in a separate patch with a Fixes tag
> 
> Why it need to be with a Fixes tag?
> MESON_RAW_TRATE is same as MESON_TRATE, I rename it for distinguish HW and SW decoder timing resolution.
> MESON_HW_TRATE is 0x13, which was used in the nether modification.

Ok sorry, i though it was a fix, I was confused with the rename mixed with the
regmap transition.

Neil

> 
>>
>>>       ir->rc->min_timeout = 1;
>>>       ir->rc->timeout = IR_DEFAULT_TIMEOUT;
>>>       ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
>>> @@ -153,24 +159,28 @@ static int meson_ir_probe(struct platform_device *pdev)
>>>       }
>>>
>>>       /* Reset the decoder */
>>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, REG1_RESET);
>>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, 0);
>>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
>>> +                        IR_DEC_REG1_RESET);
>>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
>>>
>>>       /* Set general operation mode (= raw/software decoding) */
>>>       if (of_device_is_compatible(node, "amlogic,meson6-ir"))
>>> -             meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
>>> -                               FIELD_PREP(REG1_MODE_MASK, DECODE_MODE_RAW));
>>> +             regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
>>> +                                FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
>>>       else
>>> -             meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
>>> -                               FIELD_PREP(REG2_MODE_MASK, DECODE_MODE_RAW));
>>> +             regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
>>> +                                FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
>>>
>>>       /* Set rate */
>>> -     meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, MESON_TRATE - 1);
>>> +     regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
>>> +                        FIELD_PREP(IR_DEC_REG0_BASE_TIME,
>>> +                                   MESON_RAW_TRATE - 1));
>>>       /* IRQ on rising and falling edges */
>>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_IRQSEL_MASK,
>>> -                       FIELD_PREP(REG1_IRQSEL_MASK, REG1_IRQSEL_RISE_FALL));
>>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
>>> +                        FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
>>>       /* Enable the decoder */
>>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, REG1_ENABLE);
>>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
>>> +                        IR_DEC_REG1_ENABLE);
>>>
>>>       dev_info(dev, "receiver initialized\n");
>>>
>>> @@ -184,7 +194,7 @@ static int meson_ir_remove(struct platform_device *pdev)
>>>
>>>       /* Disable the decoder */
>>>       spin_lock_irqsave(&ir->lock, flags);
>>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, 0);
>>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
>>>       spin_unlock_irqrestore(&ir->lock, flags);
>>>
>>>       return 0;
>>> @@ -204,14 +214,16 @@ static void meson_ir_shutdown(struct platform_device *pdev)
>>>        * bootloader a chance to power the system back on
>>>        */
>>>       if (of_device_is_compatible(node, "amlogic,meson6-ir"))
>>> -             meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
>>> -                               DECODE_MODE_NEC << REG1_MODE_SHIFT);
>>> +             regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
>>> +                                FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
>>>       else
>>> -             meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
>>> -                               DECODE_MODE_NEC << REG2_MODE_SHIFT);
>>> +             regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
>>> +                                FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
>>>
>>>       /* Set rate to default value */
>>> -     meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, 0x13);
>>> +     regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
>>> +                        FIELD_PREP(IR_DEC_REG0_BASE_TIME,
>>> +                                   MESON_HW_TRATE - 1));
>>>
>>>       spin_unlock_irqrestore(&ir->lock, flags);
>>>   }
>>
>> Thanks,
>> Neil

