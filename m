Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7AD583DDB
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 13:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236175AbiG1LmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 07:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236803AbiG1LmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 07:42:01 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4EC117B;
        Thu, 28 Jul 2022 04:41:56 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D23C41B0016E;
        Thu, 28 Jul 2022 14:41:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1659008513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+5elZeXVBWz+zkVqczTnToRpFM6h6TAE4ahktROaBYs=;
        b=j2RaW6y09+IKlMiPG6gfcQqWJgaZmsjYCToz9cv7+uMeMuIq9z1Svo+1IaZVNhBpKGTmaj
        3cMvpsjytzWH5e5td0nw08z0M5h942W36dqMceaMGxSa9dlhdZfuIWziP1b/Q1Bu2O/gSg
        PehSDAqEaN/wrDVk/t58X5P4CEzqceiHVfNqxDtXrYevF8RKlNTcKtfDKboSJfpExSO+Pf
        x/LEhB16d0IaaPi3VC6eObHfjuhMmCUgTTPBd/f1QdXlTrF35HHlS69JSBqPAQQkjxwWgm
        DxBzBtDqDWT1pTF+FzSlXCOTDI34jnrb4SfcWd90aGi5xlgy3DZAfzu2L0FtbA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5DB78634C97;
        Thu, 28 Jul 2022 14:41:53 +0300 (EEST)
Date:   Thu, 28 Jul 2022 14:41:53 +0300
From:   "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "andrey.konovalov@linaro.org" <andrey.konovalov@linaro.org>
Subject: Re: [PATCH v2 0/3] Add imx577 compatible to imx412
Message-ID: <YuJ2Aa9b6JL1GEQn@valkosipuli.retiisi.eu>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
 <fe14541568ab201abac5cfd4914b750d54ef4aa6.camel@intel.com>
 <57f8897de98b5433a66983d2e175b855c6c38d5c.camel@intel.com>
 <87c0cdee-688a-7c32-9957-f0ac305a6965@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87c0cdee-688a-7c32-9957-f0ac305a6965@linaro.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1659008513; a=rsa-sha256;
        cv=none;
        b=cZZLzgcaCiqm2Y6BYEbv1mMkQgYQP1ILv4OBXJaaC9/GRgfjG8IWyfvW73SsfU+/ebUQWe
        5BUXzkM8gRHqU0lKZA0HbuwtJQjaHRmx/TNuh9Z2JgU5oqHt51XyfbIm3wGo5sGkt8i+3J
        sUl9py40hlfOYSw8lRwRGAHQMlnZfoLcirTtdLF9omxQvPpj+nSY/9C0tfHBqmQNNhz2MQ
        BmoQrdtmPRmFN7CsAkfQbYAMLvCbuiNjuVTDYg0+huFVitnyPy4nltIQgT9MoQP0N/Tcu6
        F3JydNLIk0AT8S/IUFsAyJ9kAHRWiFRgQZx5ddyLZKnnWEm+Xlkd4nJfHbxfXA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1659008513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+5elZeXVBWz+zkVqczTnToRpFM6h6TAE4ahktROaBYs=;
        b=C1saLklnm/PcgiXwWWguQ/yiouzijPPzrEebfThLyyf9ToR59oLiXVXNzxOURkV1dcv6fO
        Yasmz5lLyMvUWa3FfXeuSx2DSV5AmuiLqpzxAPX/GSgXOUDl1pBbdOxURILVVkdixoQBu/
        LJpliIyag4kNHguE2KQUcdhGXz4rUPuEojwCU8fWr0LZJZBNoUyqIhyUTlP93ifrimtVS6
        L6ZYM1UQSYgONxeq9f5WQvZu9ZwjDhCf43l065ATA11ASn64DW18TXGSdhkmg1nplwJAO7
        0WQ+zeLHNTGNjKmqrZgmUI3J5C12RlpJx8s9/QPP9Fz7imBAX6jnY4cRwSxhFw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On Thu, Jul 28, 2022 at 03:01:38AM +0100, Bryan O'Donoghue wrote:
> On 27/07/2022 21:12, Alessandrelli, Daniele wrote:
> > On Thu, 2022-07-21 at 16:15 +0100, Daniele Alessandrelli wrote:
> > > Hi Bryan,
> > > 
> > > On Mon, 2022-07-18 at 02:42 +0100, Bryan O'Donoghue wrote:
> > > > V2:
> > > > Sakari wasn't especially satisfied with the answer imx412 and imx577 have
> > > > the same init sequence but, suggested setting the string for imx577 as is
> > > > done in the ccs driver.
> > > > 
> > > > https://lore.kernel.org/all/20220607134057.2427663-3-bryan.odonoghue@linaro.org/t/
> > > > 
> > > > I went to look at that and asked myself "how would I tell the difference
> > > > between the two silicon parts". The obvious answer is a chip identifier.
> > > > 
> > > > Luckily this class of IMX sensor has a chip identifier at offset 0x0016.
> > > > 
> > > > That looks like this for imx258, imx319 and imx355
> > > > 
> > > > drivers/media/i2c/imx258.c:#define IMX258_REG_CHIP_ID    0x0016
> > > > drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258
> > > > 
> > > > drivers/media/i2c/imx319.c:#define IMX319_REG_CHIP_ID    0x0016
> > > > drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319
> > > > 
> > > > drivers/media/i2c/imx355.c:#define IMX355_REG_CHIP_ID    0x0016
> > > > drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355
> > > > 
> > > > but then looks like this for imx412.
> > > > 
> > > > drivers/media/i2c/imx412.c:#define IMX412_REG_ID         0x0016
> > > > drivers/media/i2c/imx412.c:#define IMX412_ID             0x577
> > > > 
> > > > This made no sense at all to me, why is the imx412 driver not named imx577 ?
> > > 
> > > I tried to reached out to the colleagues who wrote the driver but it
> > > seems they are not in the company anymore.
> > > 
> > > However, I managed to get the imx412 register map documentation they
> > > used while developing the driver and the value at offset 0x0016 is
> > > reported to be 0x0577.
> > > 
> > > I agree this is strange, so, next week, I'll try to see if I can get my
> > > hands on an imx412 sensor to verify the value reported by the HW.
> > 
> > I managed to get one of the imx412 sensors that were used for the
> > development of this driver and I can confirm that the CHIP ID reported
> > by the HW is 0x577 (as specified in the datasheet I was given)
> 
> Did you happen to check the other offset we discussed, the one you mentioned
> @ 0x0000 ?
> 
> [   10.422064] imx577 20-001a: Register @ 0x0000 0x0000 register @ 0x0016
> 0x0577
> 
> > However, somebody [1] on the internet is reporting that their imx412
> > shows a different ID, so it's possible that different batches of imx412
> > have different IDs (perhaps Sony fixed the ID inconsistency at some
> > point). But I'd like to see more evidence of this.
> > 
> > [1] https://discuss.96boards.org/t/imx412-driver-troubleshooting/11350
> > 
> > Anyway, regardless of the ID, I think this driver shouldn't be renamed
> > because it was written for imx412, using an imx412.
> 
> Can't say I agree there.
> 
> Currently imx412.c
> 
> - Uses the imx577 init sequence
> - Uses the imx577 register id
> 
> if any thing imx412 should be considered a special case of imx577 not the
> reverse.
> 
> ./oem/qcom/sensor/imx577/imx577_sensor.xml<registerAddr>0x0136</registerAddr>
> <registerData>0x18</registerData>
> <registerAddr>0x0137</registerAddr>
> <registerData>0x00</registerData><registerAddr>0x3C7E</registerAddr>
> <registerData>0x01</registerData>
> <registerAddr>0x3C7F</registerAddr>
> <registerData>0x02</registerData>
> <registerAddr>0x38A8</registerAddr>
> <registerData>0x1F</registerData>
> <registerAddr>0x38A9</registerAddr>
> <registerData>0xFF</registerData>
> <registerAddr>0x38AA</registerAddr>
> <registerData>0x1F</registerData>
> <registerAddr>0x38AB</registerAddr>
> <registerData>0xFF</registerData>
> <registerAddr>0x55D4</registerAddr>
> <registerData>0x00</registerData>
> <registerAddr>0x55D5</registerAddr>
> <registerData>0x00</registerData>
> ...
> 
> drivers/media/i2c/imx412.c
> static const struct imx412_reg mode_4056x3040_regs[] = {
>         {0x0136, 0x18},
>         {0x0137, 0x00},
>         {0x3c7e, 0x08},
>         {0x3c7f, 0x02},
>         {0x38a8, 0x1f},
>         {0x38a9, 0xff},
>         {0x38aa, 0x1f},
>         {0x38ab, 0xff},
>         {0x55d4, 0x00},
>         {0x55d5, 0x00},
> ...
> 
> drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258
> drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319
> drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355
> 
> and then make this departure
> 
> drivers/media/i2c/imx412.c:#define IMX577_ID             0x577
> 
> I honestly think we should rename to imx577 here, it seems very illogical to
> have the imx577 init sequence, the imx577 register identifier but break with
> the established naming convention and call the driver imx412.

The device is called IMX412 according to Sony, so similarly the driver is
called imx412. What's in the model ID register is another matter. On IMX577
support, please simply add a new compatible string for it and mention in
driver's Kconfig help text it supports both.

If the driver would be renamed, MODULE_ALIAS() needs to be added. But I'm
not sure how useful renaming would be: neither IMX412 or IMX577 is more
generic than the other.

-- 
Sakari Ailus
