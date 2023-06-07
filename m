Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 124E87258D0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 10:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239516AbjFGI4a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 04:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235490AbjFGIz5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 04:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9E719B6
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7SKAjUFFT7ri9T35JHkPStLUyk878RZQEUaCELj/NK4=;
        b=jQQcm7B1RRYLQXUu/gP8PypXI+NGauFcd9jy0K+cSS7tBacfplw8HGKUoNhAeLFNWq7It1
        YXImlOBEZxenk84kO+yrk2L47DzICf90TwMf5iCHU/arnpCnHE9bqmCyPb6JIGFNUnOsL/
        9QSmkNhBWZTl44SCn7MIlHGPqujFpsw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-h4A1EGtFP3-1c5XiGtySzA-1; Wed, 07 Jun 2023 04:53:57 -0400
X-MC-Unique: h4A1EGtFP3-1c5XiGtySzA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9715654aba1so55298666b.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 01:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128036; x=1688720036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SKAjUFFT7ri9T35JHkPStLUyk878RZQEUaCELj/NK4=;
        b=IvwUyuMW6UaOVEXbnWWJ2U+/Ji8l3I6QDwSKxlw+OgU4wYvuNfDK6bv49RFGr1OFWR
         n9JAxts2h6AX8/BjlDgmQF5TBKhG+NU1RuLcR2mO8z8oB+1+IXtJ3/FZoqxfoZdQgbwV
         I1AhPpYbZDd+5J0k/Vr1+pxgkC31UQf3Soay+ShIfylENIbw8/JYAqPgF/K8UoFdKqrD
         sbyQAboliwX56A3VbD+Xdg+mZ7Suonx3FN3rWtWZFlrAwD/w0onevhEffH8+UhRgT9AD
         7B+ZVv4ssp8pWhwhtt69sPxOO0COKlfUKqn/JMmzXQSJXV6LGyAODCIYCBX2HnbDHepx
         4Whw==
X-Gm-Message-State: AC+VfDxjP4zOlznauioMrbExrMvnzpZ/SqMfC/U1i7RYRuaMOE37VwxE
        w7zgTg9+xXBIUrLDqEV5zYbGV1mMmy2MUMMEwP6pRgwL1mwb2CyQrytrgJrIm1KTYrBjOSjETSn
        ORHrugPCAdq7G/p0atoGGhGk=
X-Received: by 2002:a17:907:e86:b0:96f:add6:c1ed with SMTP id ho6-20020a1709070e8600b0096fadd6c1edmr9847821ejc.38.1686128036101;
        Wed, 07 Jun 2023 01:53:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5i5rZbG4Xb+Vu6OvDKqr+Lfbbu/ZNZ8xl71Z+YqB0MYDf7yFsWUFWhZceFsDfVrIOql47hhA==
X-Received: by 2002:a17:907:e86:b0:96f:add6:c1ed with SMTP id ho6-20020a1709070e8600b0096fadd6c1edmr9847807ejc.38.1686128035852;
        Wed, 07 Jun 2023 01:53:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lc5-20020a170906dfe500b00977e0bcff1esm3365087ejc.10.2023.06.07.01.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:53:55 -0700 (PDT)
Message-ID: <c34ca549-8d07-35db-0635-a5c60728dfc2@redhat.com>
Date:   Wed, 7 Jun 2023 10:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] media: atomisp: ov2680: Convert to new CCI register
 access helpers
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-3-hdegoede@redhat.com>
 <CAHp75VeqeA4GA0_r_KgH0wv0_TQ4rQUdTY99DFFR_oWfdiDxfw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeqeA4GA0_r_KgH0wv0_TQ4rQUdTY99DFFR_oWfdiDxfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/6/23 22:53, Andy Shevchenko wrote:
> On Tue, Jun 6, 2023 at 7:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Use the new comon CCI register access helpers to replace the private
>> register access helpers in the ov2680 driver.
>>
>> While at it also switch to using the same register address defines
>> as the standard drivers/media/i2c/ov2680.c driver to make merging
>> the 2 drivers simpler.
> 
> ...
> 
>> +       cci_write(sensor->regmap, OV2680_REG_SENSOR_CTRL_0A, sensor_ctrl_0a, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_START, sensor->mode.h_start, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_START, sensor->mode.v_start, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_END, sensor->mode.h_end, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_END, sensor->mode.v_end, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_OUTPUT_SIZE,
>> +                 sensor->mode.h_output_size, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
>> +                 sensor->mode.v_output_size, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_TIMING_HTS, sensor->mode.hts, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_TIMING_VTS, sensor->mode.vts, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_Y_INC, inc, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_X_WIN, sensor->mode.h_output_size, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_Y_WIN, sensor->mode.v_output_size, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_FORMAT1, fmt1, &ret);
>> +       cci_write(sensor->regmap, OV2680_REG_FORMAT2, fmt2, &ret);
> 
> I know that &ret thingy was discussed before and Laurent is keen to
> have this, but has anybody actually tested how bad or not at all the
> code generation becomes?

The cci_write function is in another module, so it won't be inlined and as such I don't see how the code generation can become bad. We loose all the if (ret) return ret; checks here, so the code should become smaller.

Or are you worried about having to pass the 1 extra parameter ?


> 
> ...
> 
>> +       struct device *dev;
>> +       struct regmap *regmap;
> 
> Isn't the same device associated with regmap? If so, one of them
> probably duplicates the other.

You are right, but the entire atomisp-ov2680.c file is going away real soon now. I plan to post a series to get drivers/media/i2c/ov2680.c ready to replace it later today.

So I'm not even sure if this patch should be merged, as I mentioned in the cover letter this one is mostly here to illustrate use of the new helpers.

I also wrote this patch to make porting recent atomisp-ov2680.c changes over to drivers/media/i2c/ov2680.c easier. Part of the series to get drivers/media/i2c/ov2680.c into shape is converting it to the new CCI helpers so that I could then easily copy over bits from the also converted atomisp-ov2680.c.

So it might be interesting to still merge this so that the latest state of atomisp-ov2680.c is easier to compare to drivers/media/i2c/ov2680.c if the need arises.

Regards,

Hans




