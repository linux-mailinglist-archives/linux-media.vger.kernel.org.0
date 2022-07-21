Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C92757CED4
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 17:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiGUPYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 11:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGUPYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 11:24:50 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 066267969B
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 08:24:50 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id z13so2739624wro.13
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YVr2IKhsxf7FzUsIc3oKVTt7FYgSJO7w/A8+2xRNas8=;
        b=yNxXGIZmaAYQwhT65024nKI3koBMVnEdLo9ueWlDpF3FbAYjeaJT+gIzaZSLgs7oxG
         AbmC/8TMvUoR2VE1rwFWB3bZD55XNoEcSzxaoLwkrnHJ3NVoAZKLPzGZZ3LBP3K4ZOBp
         wKRGjf8gr8qlr07BKhuEzDDNtpkV1BYmBSPMD1K8K2oM62czDh02kP2UJMiCpply/wWB
         d5uA3nc6GCQePdqG654lTe/mnt1FzL0EIWETFJV1UXa6/cMLGdALmqvRDLICu0JKM6L5
         uoj1btj0fW7IHJkQgmL4pyRZ32Pi7AnaI4/jian8HhtW4isc/RauverWtu38DWC7XCDP
         jVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YVr2IKhsxf7FzUsIc3oKVTt7FYgSJO7w/A8+2xRNas8=;
        b=PkcrLMInP/Qr9UM5TcBVF4nIP0aozqA4GRhkSfdup5Xqb8oekidq8235PFOmkC2gAE
         TCE5XO/k2SKR2w2lgIM8J+UiZiO8AqR/EmLVG5k7RsLrfC0rMrt/if6lfguD3djS2WAL
         6oiNKVFPYkrGBC2EEO/0Cj+zLNAgZS775tW2Kiq1hfuxnsbaZVYLuVliL6ECpoIlHYpZ
         ktzqZPA3mIpNzhqy6MQs2LlXAKpn5TFHHQUt5Ei9lfIxn6z2Bu/JlKtDvigKqZ+jTONS
         iuWf5vGFsXbQSQ2eFpVsdgUi2W51X5n13S4L9KzEurV/2qkeJ0ZkK/nCD3jfpa+0ZV7g
         /exw==
X-Gm-Message-State: AJIora89vCk4Gm2vCAP1chcItdufK1zQhLVU+0j18ISOiw6o6j1pk6DJ
        T8okPua1uqNGzgSEPbjPDRs1Cg==
X-Google-Smtp-Source: AGRyM1vvVKsmf0OJtKL5CZ6BS+EIa/t8QzMXDg2uLRX3p969f36Uueivq32YmjG0oJccKgt3xdfVFA==
X-Received: by 2002:a5d:4529:0:b0:21d:ce8e:7888 with SMTP id j9-20020a5d4529000000b0021dce8e7888mr25523786wra.705.1658417088453;
        Thu, 21 Jul 2022 08:24:48 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b003a31f71c5b8sm7605043wmq.27.2022.07.21.08.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:24:47 -0700 (PDT)
Message-ID: <3bfd6b12-cd8f-5697-13db-0e30477e8f35@linaro.org>
Date:   Thu, 21 Jul 2022 16:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/3] Add imx577 compatible to imx412
Content-Language: en-US
To:     "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
Cc:     "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "andrey.konovalov@linaro.org" <andrey.konovalov@linaro.org>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
 <fe14541568ab201abac5cfd4914b750d54ef4aa6.camel@intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fe14541568ab201abac5cfd4914b750d54ef4aa6.camel@intel.com>
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

On 21/07/2022 16:15, Alessandrelli, Daniele wrote:
> In the meantime, would you be able to check what 16-bit value the
> imx577 sensor reports at offset 0x0000 (which, on some IMX models,
> seems to be another ID register)?

Looks like it is zero.

[   10.422064] imx577 20-001a: Register @ 0x0000 0x0000 register @ 
0x0016 0x0577

