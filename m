Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19D55BA383
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 02:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiIPAcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 20:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiIPAcL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 20:32:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B7A7A743
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 17:32:09 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t14so33472524wrx.8
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=txJDbkoHGfIvoZdZftHHJnPfnau/xwXH/wkJ/LyYbFQ=;
        b=EfBdQCR4HWnv/6LbUho9a3DDOU3bm4zn8F087JaWSYhRz2G8XB1yaSzh90+yxOAdte
         QyWw7tQd+paKyhmJmT8aINSdBEGYLhQMm7k5GLv4qY8EPeS5FnBAakBgESQ4zZoEG98g
         ZTM036DiD2B0FjUY1KB1vEg3eJlVwrc83pUvmm94loht1D4rM0waNKfT1k0HJO/G789R
         eVj73jYQIhBv+5r1qUprJjL1+T6D/MmkA4okULhp3k42P11w0PBpuSZrGdI0vIvX+OLb
         oiLGOaTN16N5++PpuI3trHcTOZpGsmwn5qzBDz5kMYNS7hAE+lo6H/pUcS4ja8y0pwlr
         ow9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=txJDbkoHGfIvoZdZftHHJnPfnau/xwXH/wkJ/LyYbFQ=;
        b=2hwXYVtKFiowveQJrDgjsJgbMnE21Hix7EyCJ8RjUdonaWMv905elrO3e46N3bApa0
         6PlVByKGEv0NQEzt7RSMwadQ8suZg9s9Zixh26mgfbpznLNslolaf8G2CdfDA0M2PfeY
         giyfy+TtUDS2Kwxgz97hkYokCgj8bL/G+scjmhsEJKnX9iWpmErq9YR2mt3jYYhwET/L
         IH1k2t8sd0xYElITPgQS4cAPdYx0z5xPiekNwBDhwLG4rVayiu6vUIWouVjazbEZCElp
         SfTtE4dmJkybaS6FxMtHFJb4eWC281o0VV2Cktou7nmqu3cUk9CsDXAolk9LsDjF+vBp
         KaWA==
X-Gm-Message-State: ACrzQf1YVhVgUG6QH/14i1w6QHoPmi7Gz3QyPbZMZWUz9nQZiklndtc/
        HhBeeeQsFdIB10knayg7Dm7rmg==
X-Google-Smtp-Source: AMsMyM6wznKv+ZDKAJnNtzoLsudN2ebovOPORWyNnE8x3EDlAiaLDScLJEG/kiQ2CKBY9fiLVvpyJA==
X-Received: by 2002:a5d:6245:0:b0:225:3e24:e5b1 with SMTP id m5-20020a5d6245000000b002253e24e5b1mr1306626wrv.698.1663288328476;
        Thu, 15 Sep 2022 17:32:08 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d6e90000000b0022ac38fb20asm3773478wrz.111.2022.09.15.17.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 17:32:07 -0700 (PDT)
Message-ID: <e29e5573-13b6-0a29-20c7-ba780d825a37@linaro.org>
Date:   Fri, 16 Sep 2022 01:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] media: i2c: imx412: Add imx477 compatible string
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
 <20220915003522.1227073-5-bryan.odonoghue@linaro.org>
 <CAPY8ntCmRy_BSQW6QajrRMLpQBzMimcQPvZw1ocazxhr2dOd0A@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAPY8ntCmRy_BSQW6QajrRMLpQBzMimcQPvZw1ocazxhr2dOd0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/09/2022 23:03, Dave Stevenson wrote:
> Hi Bryan
> 
> On Thu, 15 Sept 2022 at 01:36, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> The Sony imx477 uses the same silicon enabling reference code from Sony in
>> the available examples provided.
> 
> Have you had any conversations with Sony on whether the same register
> settings are genuinely valid for all of these sensors?

There's alot to unpack here but... this shows me the main thing

https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/media/i2c/imx477.c#L37

The vendor driver reference code I have expects 0x0577. I've discussed 
with Daniele previously - that imx412 and imx577 both return 0x0577 in 
the chip id field and this imx412.c driver won't work with any chip 
reporting anything else.

Your chip though is returning 0x0477 so it will need to have its own 
upstream driver anyway.

So the conclusion I drew from the Nvidia/Leopard stack is wrong they 
call the driver imx477 but pointedly and suspiciously comment out the 
check for chip id.

And its pretty clear why, its so the "imx477" driver they have with work 
with chips identifying as 0x0577 and 0x0477.

> IMX477 is the sensor in the Raspberry Pi HQ camera, but the register
> set that we have from Sony has many undocumented (to us at least)
> registers for image quality tuning that aren't in the imx412 driver -
> we're up at 417 registers vs imx412's 231 [1].
> 
> Raspberry Pi has previously had discussions with Sony regarding IMX378
> vs IMX477, which is also in the same family. Whilst nearly identical
> in register setup, they gave us 3 additional registers that have to be
> set for IMX378 to avoid image quality issues. I wouldn't be surprised
> if something similar weren't true for IMX412 and IMX577.
> 
> I'm not saying it's impossible to remove a load of duplicated register
> settings by combining these sensors into one driver, but this current
> patch looks a little simplistic, and probably needs to be looking to
> have a struct for sensor specific registers, not just changing the
> compatible string and advertised name. Or perhaps we extend that later
> once the compatible string has been added?
> Merging them does bring issues with regard to testing as it is
> unlikely to be practical to test any new features across all variants.

No so you're right the init sequence for imx477 is different or 
different enough that Sony spun new silicon for it so you can tweak it.

So, I'll drop the imx477 for V3, thanks for catching this and FWIW I 
will take your suggestion will reach out to my board vendor and see if I 
can convince them to share documentation with me or put me in contact 
with a Sony person who is authorised to do so.

We should get a definitive answer on imx412 (v) imx577 - is it different 
silicon or is it a packaging / optics filter level difference ?

---
bod
