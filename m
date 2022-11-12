Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87FF3626C0A
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 22:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbiKLVqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 16:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234695AbiKLVqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 16:46:14 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AAA165BF
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 13:46:13 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id e13so3235762edj.7
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 13:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ousspL5H+Y4YkP5KS7IKRN5D9hYbTsm8n9QOMnzyVo=;
        b=qgQX7lEqo7P7D4k1RdUA1b6jB8d1erbxug1M+raWSOQ7XlVODmbL8mf6kiH8mROX1i
         BRuc8nVE9QzYYY1OAT8r4ZKxltPOGJJW5s+uHaDRuzhAZhIkF+8JuL1RRMBJb7JjF40N
         KzM96i9MvHO0udRPFIpJO6daStRmESEsokn+ZRuvjMU5cNyXlTESV+LOpfq9Anjnudqs
         MbMHIpE8VRHqveLZe2Rt0663JarcXwYnpMayoWzlrKlqI+lD+Ki22GkOsaLWxqviiCsF
         0dRxv3pKxcHc+IaOCnq0ILJeqAyv7SEPtV2+jBhYuUK9G5YwGmwyNXutxAd2Kb4sgi1N
         kyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ousspL5H+Y4YkP5KS7IKRN5D9hYbTsm8n9QOMnzyVo=;
        b=zpDLYG4+p5y75Uitna8ToABb1P4L/NkcpFBDjtC/pArYX43Uyq2kkHET46TlnFupP4
         CKxbWeX+6feBGs/oEJgYgpiEiXhk2MCi6SDGAIEIFT4QSd5KONvjWrkdJRpHFBbSAJRV
         1WYilQ8GZqymM4TWAtr/sSbxSq8iAf1F/TXtPdmYNLkPob0OUpnjdjqRJuhWB+5bwMGj
         m3EKp24/TVOBawUHeCW29Xp2HzLPDkhDJ5rjeapuurH3GulqN7fptOlarwPjaXQEAFxE
         IGll6U1AbS7daIsGuVCvn5r3OqsJQyqESoYRDt7RFLriIomS5J70/pa4daEbr8yMmY0t
         6IHA==
X-Gm-Message-State: ANoB5pmpjAklkESpU8d3dSEuNnf7xg1OgIw2VH9GrSVAahdeeFnDR/iB
        b7iLck1Bd67Ub8EJ3h3E0v6p+A==
X-Google-Smtp-Source: AA0mqf6xK7R8pH6g48/+C0j9a414nU03f4v6WBselL7JEfnjOjCRi4CPMOcQaXM4JlCkUH1UZamq2g==
X-Received: by 2002:a05:6402:1241:b0:461:e3e1:bc3b with SMTP id l1-20020a056402124100b00461e3e1bc3bmr6530645edw.145.1668289572352;
        Sat, 12 Nov 2022 13:46:12 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:316d:3d05:f910:22aa? (2001-1c06-2302-5600-316d-3d05-f910-22aa.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:316d:3d05:f910:22aa])
        by smtp.gmail.com with ESMTPSA id 3-20020a170906308300b0073de0506745sm2272125ejv.197.2022.11.12.13.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 13:46:11 -0800 (PST)
Message-ID: <009e81ce-2d67-acd8-144b-b72ead88fcd7@linaro.org>
Date:   Sat, 12 Nov 2022 21:46:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org, sakari.ailus@iki.fi,
        hverkuil@xs4all.nl, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-5-bryan.odonoghue@linaro.org>
 <Y3AOHy6W72/nuHQY@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y3AOHy6W72/nuHQY@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/11/2022 21:20, Laurent Pinchart wrote:
> Does the mezzanine board have two camera sensors ? Why is this one
> disabled ?

Two sensors yeah. A full colour sensor and a b+w sensor.

https://www.thundercomm.com/product/qualcomm-robotics-rb3-platform-sda845/#

At the moment this sensor isn't working on this board.

Overlay would be nice/best. I'm not sure how difficult/easy it would be 
with the lk bootloader.

I'll look into it as a separate topic.

---
bod
