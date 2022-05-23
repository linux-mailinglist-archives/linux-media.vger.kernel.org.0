Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF8D5312AE
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 18:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbiEWPa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 11:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237879AbiEWPaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 11:30:18 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380F45FF17
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 08:30:14 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id k30so21898344wrd.5
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ki3nds2SQ94u+QBYsM2M4nRb9kIMl7mDNBezsS/vkEM=;
        b=rO9GbfvfUDpR9XSGaMJqCDjRuDT9PA5XwA39wI3I3qGonALuDWn/2a4bfMlKjQq2p0
         Mux1YrI+RbwOYPtyOz5SaKGnHtPYTIvIIFRrEISd8mrBfNCYVb1364u8X0D1LxnJRwL4
         gVJQ/rGnnimhnnhY+gSKEnr6SQxblnz8WLXciIeVsIKg3/ZEODkbkJbV77QDTIZDwjF4
         it8hegHYVjDsHANXb3P8XH5TU04PpJAEgxEJR9lRCOsmURJatQEng/dHfZ8VsBa6nil9
         fJNlr1sj8RAZYXFihHC7uaZUoMmvg+udvBeOR2yxXsyRW2vP+qYEE01X/io87as3sQU3
         H0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ki3nds2SQ94u+QBYsM2M4nRb9kIMl7mDNBezsS/vkEM=;
        b=6/Z+vVpozC3USCTNMk1NxWnghqouRJ0xUFEpFQzgjywQKtyuH5XvBERbioblkHEVfP
         iGUCzZfVIsBKF9XhtOPZJ2giFRsF38WatseoSm618nR7rmPpYITCIgbfOkBrm+/IhWhb
         XgDn2Mi5Cs5ImNkKZs/7Zp4mNNAZ7DE26JqBjewXx/upjxYuYHbA2IaxAJ/cOIHRJri7
         QQKzOtrTNbjFFz7k+YSUAPHlOeuVt3ATaaCSmCRH233Nb7lM7Eo/XNlJmob01fFHLLuL
         GLCuF+KD+lF7VYfb1kyKlZRVkOVxhXxUhP96l2C4wOR8yr3t22nHFlP3Cf44oWYERBvN
         jntA==
X-Gm-Message-State: AOAM5326Z2W4XesTFZzq+7qqCSbkKOT96wEPO4GA4O8lnjq93JRxCR7u
        7GQvs5DCdAnsRvtvNKFk5HNP5Q==
X-Google-Smtp-Source: ABdhPJwAJmOXRtRNxDFU4DMCZoOjdk2vta2oozn3g6xqMgmjEBCafG5oHJTXYfnCa7somrhPoe6ccw==
X-Received: by 2002:a5d:4f08:0:b0:20f:c7dc:8477 with SMTP id c8-20020a5d4f08000000b0020fc7dc8477mr9794083wru.713.1653319812641;
        Mon, 23 May 2022 08:30:12 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l24-20020adfa398000000b0020fcaba73bcsm7125690wrb.104.2022.05.23.08.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 08:30:11 -0700 (PDT)
Message-ID: <625094db-a1e7-b62c-9862-6e5b20420c97@linaro.org>
Date:   Mon, 23 May 2022 16:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on
 cam1
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
 <20220518133004.342775-2-bryan.odonoghue@linaro.org>
 <33abcc93-13f1-d6f5-36a3-6ab796f124f9@linaro.org>
 <19c92f9d-fa1c-fbe8-50ef-324da3e00695@linaro.org>
 <e7bbe076-a1d1-a005-8110-5d35bc0d80de@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e7bbe076-a1d1-a005-8110-5d35bc0d80de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/05/2022 14:50, Vladimir Zapolskiy wrote:
> it's some kind of a race related to probes of CAMSS, CCI and IMX412 
> drivers.
> 
> Since I'm able to reproduce it, I'll take the analysis on myself, and it 
> does not
> interfere with your patch series.

Ah, I think I have it pretty much narrowed down now. Needed to switch 
off modules entirely.

First probe fails, second probe succeeds.

Thanks anyway, I think I'm close to fix.

---
bod
