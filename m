Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90779501E7B
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 00:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240271AbiDNWfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 18:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235739AbiDNWfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 18:35:14 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A973C55A9
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 15:32:49 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o20-20020a05600c511400b0038ebbbb2ad8so4121871wms.0
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UFIRxq0l3P41n43NuZnwMq/zIHx91U9NMxsc5GFePPs=;
        b=JPwhBYp2b+cnRmynszCgl0OaB2hunKoai93i2UDWaYiga4+NCdpDxUCSlx7aQzouR7
         juoTxGSBLReDDPh8UXhDhXg16n9t7x2BFTBmJUn9HTa8EMuo5Z/h6rdDz9/jnajch+Jw
         9oyc4OU9pC9DYsJbr1nTRI+98MtWzHuQns3vZ9zq6G/pu8fMTrvdr0CSLlAgB+Wo7C4U
         O9ww4cJY9gjF0Cihs4rW7bxfWQ2O6jDjf3vnfG4G98UBKoPBxJSiAWkhR/VcijcEH4H/
         xfIIsPxDJChffZz+TN+TY4fZWQDwfxDp026qNa4AiveDOaurHaLOqojxrHFJMvJ04BP6
         6c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UFIRxq0l3P41n43NuZnwMq/zIHx91U9NMxsc5GFePPs=;
        b=qtSftgdLdYFs7MAQIc9X3WOxXWqmtPINLDocGSCus/xFSE1Ecdvgsw4/A5Ih6mLrca
         SS/fRahBZ3ReNv5co/F+nSyyWlgAQqmmGDjI7/IidlDelDLtUyDriswJ6U+bJWKLXNNE
         t9VZS6cByKDd4CU+eskhpybSE5FvIRpK4LmlEKQbRCeyEUiGZc0VxAKII94VgpJuWhSx
         AiaE3jIOonESE0wePCkJQ2LavGTcgmTiWoKWy3f9t3ol/Jxbh2x3a6cI84RN1xQXcWDf
         JN5BeL6ghQ7qSqtYi63WzZtNXOV8OtoOfuaJeFZBlJ1/dJv04jSOS/iEHpIjsI4dhl6I
         9kcg==
X-Gm-Message-State: AOAM533q0ECZvq4470U6vk051RQ4rvysvyhxKsK+74/JUwz7DqjUfJK/
        nIb8+0eIFZ1fw1eJ97YiJmuiXw==
X-Google-Smtp-Source: ABdhPJx+N5gTLVs1VE+DLX1v1GF3Advq9KuGMx9sOv/+jvTlg7K62Im1ejIbcnITDVZcf6wKSJ/Kew==
X-Received: by 2002:a05:600c:4ec6:b0:38e:c0bf:882e with SMTP id g6-20020a05600c4ec600b0038ec0bf882emr605983wmq.50.1649975567490;
        Thu, 14 Apr 2022 15:32:47 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d6da7000000b00203d9d1875bsm3098816wrs.73.2022.04.14.15.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 15:32:46 -0700 (PDT)
Message-ID: <418b73f1-a5b9-ce07-1fc1-736107f36c41@linaro.org>
Date:   Thu, 14 Apr 2022 23:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/2] media: i2c: imx412: Add bulk regulator support
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robert.foss@linaro.org, hfink@snap.com,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
References: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
 <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
 <Ylga7FVsbK6znD/+@valkosipuli.retiisi.eu>
 <39cae749-67ef-13d7-2648-01c6e9603887@linaro.org>
 <Ylgn8u5Au0EqUkLj@valkosipuli.retiisi.eu>
 <831e3857-9ee7-c760-ef2e-3b235b57b907@linaro.org>
 <YlgssKI+WVeRTda6@valkosipuli.retiisi.eu>
 <784b5caf-1e1a-e57c-126e-4b28bc6ff7f8@linaro.org>
 <YliZIqg201pDH1aH@valkosipuli.retiisi.eu>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YliZIqg201pDH1aH@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/04/2022 22:58, Sakari Ailus wrote:
> It's still wrong and should be fixed. It seems there are no boards in the
> DT source in the kernel using this sensor. These changes seem fine to me.
> 
> I'm not really worried about ACPI: it's unlikely the GPIO is even declared
> for the sensor, and instead is controlled in AML. There can of course be
> bugs in ACPI tables, too...

Hmm.

OK well I'll add the GPIO patch in for V5 but with a putative guard in 
for ACPI, inverting the logic.

We can always pull the guard if it turns out not be necessary.

---
bod
