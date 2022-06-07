Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CF2542205
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 08:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381809AbiFHBER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 21:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1588838AbiFGXzK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 19:55:10 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874C64388EB
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 15:01:17 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id s1so2786114wra.9
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s6eUytmYYH9eaFCb5BVA3b/HOVsknK+p7KhgU38haew=;
        b=E2h+B4WVymgBM89H4QgZ9vQhnCsaEJYbb7lOrS2qb5RTeZ5udsn3fj8+TRDWNjFr1B
         bzmpDTl59hTJUgdcMAMeuT8IIA3506G3XtTcuS4+nSR0GjPFo2v6NpZ1DuTZPrACIBq/
         BT3zVg9x5BSj2CnyZAzcsT4ugBeHosgk4olwwFTyuqvciybGgYXHmOpRVYP/rt4YduCh
         F9tzLl9uEcFV7XCPi+CciXIuAahblG3Jm92S383mljC54/d8p37XrGv04aN4SWskswK3
         LMyL2+cVLgI7aZGhF1lo7sL95/JlS9B8EFTrOFZ+MgrI1PW9tvN5TVoKpmJkKKzXq2MI
         JIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s6eUytmYYH9eaFCb5BVA3b/HOVsknK+p7KhgU38haew=;
        b=aMTxXcvLwDPPCRwNpvPpoZohgOyXgxouCBB/Ea3+MLgO5c3oZT2EWnPdH7dlBLPguU
         OxDpN5q7rMHWOqG5sX8l7Y3OOrUcYPGwJgmt9MaxQzQNgByv6ljCBhUADa6CtqVC3mfg
         lu4zXIerne6pj6WboDOtAwCIWNUyt1xcJFtLtKdBSG9yi9rALJS17TvzP7duxxDci0ot
         GTIwtBAJcMaSsW35ogmpi2r1bOyVTEzuT1O7oU8rIlu+IeSSB83efIphDM+pJeUuWsMu
         FmEppv8PSfAR5lwW641H9XWSQfThiYzqyVZuKNd0CARogeCtMzzuKgWJxv2/9yWSb+9K
         0ndA==
X-Gm-Message-State: AOAM530SPNkiyAq4d2Je+e1mB1GqQ81Bzy4GQFWyFt5JhMIrrecMzaJX
        4OunWOrXL7LbvDojg6mzXOkRgQ==
X-Google-Smtp-Source: ABdhPJxZFR9ehraU6LkCn1t7uDVmpo6MoOSGm0Um+kWtjQ37jsrFZNmhCkkLVM0FY0gteaYaCbgGTA==
X-Received: by 2002:a5d:64c1:0:b0:20f:d995:f896 with SMTP id f1-20020a5d64c1000000b0020fd995f896mr29438432wri.180.1654639275977;
        Tue, 07 Jun 2022 15:01:15 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b002103cfd2fbasm20129267wrm.65.2022.06.07.15.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 15:01:15 -0700 (PDT)
Message-ID: <a57d2fac-5e56-f0df-a69f-7925fd92ca42@linaro.org>
Date:   Tue, 7 Jun 2022 23:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] Add imx577 compatible to imx412
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        daniele.alessandrelli@intel.com, devicetree@vger.kernel.org,
        jacopo@jmondi.org, linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.j.murphy@intel.com, sakari.ailus@iki.fi
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
 <165463899225.186364.3363631428060807036@Monstersaurus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <165463899225.186364.3363631428060807036@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2022 22:56, Kieran Bingham wrote:
> Quoting Bryan O'Donoghue (2022-06-07 14:40:55)
>> Right now the imx412 and imx577 are code and pin compatible however, they
>> are distinct pieces of silicon.
>>
>> Document imx577 as a compatible enum and add the compat string to imx412.c.
>> This allows us to differentiate these chips in DTS and potentially to apply
>> any future imx412 or imx577 specific changes appropriately.
> While I think this is probably fine to get things working, there seems to
> be quite a few extra features in the IMX577 [0] compared with the IMX412 [1].
> 
> [0]https://www.sony-semicon.co.jp/products/common/pdf/IMX412-AACK_Flyer03.pdf
> [1]https://www.sony-semicon.co.jp/products/common/pdf/IMX577-AACK_Flyer.pdf
> 
> I certainly agree though that it's better to declare the camera
> correctly in the DT - so it's better to add this support than 'fake' the
> DT to say it's an IMX412 on the platform.

Agreed the specs differ but the only silicon enabling code I have access 
to - from the qcom camx release is a 1:1 for 412 and 577.

The init process works for me on rb5 to obtain 10 bit bayer @ 30 fps.

Agreed the 577 does a whole bunch of extra stuff I just have no 
reference either in PDF or code on how to do any of it.

Its "good enough" for me in 412 mode.

---
bod
