Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1710448AC48
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 12:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238331AbiAKLSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 06:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238292AbiAKLSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 06:18:20 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECADC061748
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 03:18:19 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id a83-20020a1c9856000000b00344731e044bso1596850wme.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 03:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yIkz+qG4BbYTrRYFXUhW1f3GZfdv3394CoSG7W9Tr1Y=;
        b=hnQp0rmeww3oljFdQ2YMsZSe/wFs5dOMBvjlVGwOMszISR/IV5Rl8Gn1DjmZPKD8w0
         tJ4uVrq5ZetY3uEfcm+kEgw3Blgmz8JbyxlrcMIDOApvHTnNWsrFlQLjpGoDJJoc4kL+
         NLhTlyWfSrtyqugtTBCEwFrohJq2XBOGSDdsM10C3BJcoBjKmwkNCYzy+bVWTdXhawQl
         xOMDCYu2WHP51RjcBJgOm1fSGYq63ftNHaR992N5zSiPoro14EnE9jAPHUaiDjIYsMnx
         zD4o3hB/1dFGWJfk52Mabc1xeVXLbXqxoNaKKOeGB6PIRdawnidItwevCBVd7tiUul1n
         t8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yIkz+qG4BbYTrRYFXUhW1f3GZfdv3394CoSG7W9Tr1Y=;
        b=4TV4cbTBoyI3kSzATBjBpMyUrDni3P1dt3vNPGuppz6pLp8keOasSTSRTvEKBRGFGh
         wDh463QNPq4eln9+QXQ+xxjSdlK86sfnZe/Pp0V030MUJVMZsX8pCePkHKGxOYIS85I+
         87CUg7LL7STtJYlIlej9LBMbp28Afi2nO3/MnNtzS8KyKpMOhMYCGoBQWE3bCIVfYdV5
         BOkqjnvsrIAMObGpjC5wYPcDfQ9TNBYPxiB1XPiCgsdZVRjR3007H6lzSzQjcFK4PdI9
         AYailCqbe3jYWC4UuS3IrUUnU54cUj0KLLgvfi5kQqeeeGJKYGggy1G6RtFwkxNpxutH
         9V1g==
X-Gm-Message-State: AOAM530dV4Gu+/1vTlBZDUUIUgcGiz2Z1lak79lJrGDY2C47gMzZflzv
        Pi7eGO0zxbf4IYh/cUmYCXFTiQ==
X-Google-Smtp-Source: ABdhPJxd6eO4mogiAjrZXXzdIdsfvigrJ0tKFvmqZ9eeT+foxlMTHfh6y8jNfXCi1uHcz3kpaq/7Mw==
X-Received: by 2002:a05:600c:3489:: with SMTP id a9mr2008586wmq.45.1641899898395;
        Tue, 11 Jan 2022 03:18:18 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u17sm72949wrt.37.2022.01.11.03.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 03:18:17 -0800 (PST)
Message-ID: <bff073f3-4763-cbfb-b462-40e7d55dc1ee@linaro.org>
Date:   Tue, 11 Jan 2022 11:20:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 5/8] media: camss: Add regulator_bulk support
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, jonathan@marek.ca,
        andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, jgrahsl@snap.com,
        hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
 <20220109024910.2041763-6-bryan.odonoghue@linaro.org>
 <CAG3jFysaEh=ACt0SYun+8bgkMgts0JrgXkgt+VCtHBvqtUXj3Q@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAG3jFysaEh=ACt0SYun+8bgkMgts0JrgXkgt+VCtHBvqtUXj3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/01/2022 15:17, Robert Foss wrote:
>> +       for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
>> +               if (res->regulators[i])
>> +                       csid->num_supplies++;
>> +       }
> With the cleanup that Bjorn suggested, and was submitted as v2 6/8, I
> would like to see the above snippet simplified to the below.
> 
> csid->num_supplies = ARRAY_SIZE(res->regulators);
> 

res->regulators is declared as

char *regulators[CAMSS_RES_MAX];

which means ARRAY_SIZE(regulators) == CAMSS_RES_MAX

I could do something like this

  struct resources {
-       char *regulator[CAMSS_RES_MAX];
+       char **regulators;
         char *clock[CAMSS_RES_MAX];
         u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
         char *reg[CAMSS_RES_MAX];

+static const char const *csid_res_8x16_regulators = { "vdda" };
  static const struct resources csid_res_8x16[] = {
         /* CSID0 */
         {
-               .regulator = { "vdda" },
+               .regulators = csid_res_8x16_regulators,

  static const struct resources vfe_res_8x16[] = {
         /* VFE0 */
         {
-               .regulator = {},
+               .regulators = NULL,

then the ARRAY_SIZE() thing would work

If that change is made - then it would also make sense to change up 
*clock[CAMSS_RES_MAX]; *reg[CAMSS_RES_MAX]..

---
bod
