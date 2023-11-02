Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA9E7DF5C0
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 16:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbjKBPKQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 11:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbjKBPKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 11:10:14 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811F7DC
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 08:10:08 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32f78dcf036so1316608f8f.0
        for <linux-media@vger.kernel.org>; Thu, 02 Nov 2023 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698937807; x=1699542607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNK2GQHWfe5YMcBEjay8r8xRhUtJVbBwtNv+okJL5yQ=;
        b=aSxDgRPaGw1VcYUnTTe3Hg+MCQLsjDCEN76OtdmV4E4TK+eGFDeCrl7hVd5sjE0kmI
         A5yfvxAEHf+wr2yPtQFrkp+TJbdWqrrPpMAnOSsYBJlw7uM/2xOakVV5aDza5r0SNZfN
         wlQIZtAHcVGKrSpHa+OYaL0djRPlrHCnll/ibF8QZEc34qEoLeBGnT831XjvRSa+hD8P
         Wucs01hOpUXougifNFIWfefY+4P5r1e9jtDgWoTtTfUB1+631lIIMrPLc4bCkUzziAz+
         4I2WRS6+mP3DWfYdAlj7Hm+2GJuYNVsxrxJM6JaRatY4FOl/G4dWBVl90lI6k/yK4V8N
         +u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698937807; x=1699542607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNK2GQHWfe5YMcBEjay8r8xRhUtJVbBwtNv+okJL5yQ=;
        b=KE1E8JoqjfrRWklhkzYMqIAJXF6jLCaY8zQGce1zjGH4SxPTL387RdEkKYfDzIZ4YW
         DtQrkgxlE8z38UIHWPqRC85Fq/1UqbuR4NWoq9tAILxL0iyrxkOwJj5cYmXEHyRrl2ko
         F3l9BgbK2bCOGSO0EY9aRMnkR4+hOL75z7OEOpDauQqdvTb40CpmFSDl7dIpmRa1VRn0
         cuOy78bm66a/hDieNmgvqsbtjyuSjJDxxibtfLVltn36mlKAIlKEoVGLC7ge8J/pp8RB
         xF/d65FnECq77++CoOpWcNavTJLfxzWC57ggbDHUh10oasj6txigL3lOI+6sdTqL6YB7
         g+Uw==
X-Gm-Message-State: AOJu0Ywhfhw48447e6A8vsFlIR7KHFkMiAjTDYlhO8QSQlbF8F0kN5+q
        BNT4mpmjIPCzFrEHuhQuW0nRLw==
X-Google-Smtp-Source: AGHT+IFCLwJ0wtlPI5OeaOXc0LxK1eK0sQ4PjFE4BmFekTvyBQglibG0Xap2hY6WGP9j7gBCvc373w==
X-Received: by 2002:a05:6000:1cc:b0:32f:7e96:b1a2 with SMTP id t12-20020a05600001cc00b0032f7e96b1a2mr56326wrx.33.1698937806952;
        Thu, 02 Nov 2023 08:10:06 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t2-20020a05600001c200b0032da4f70756sm2701136wrx.5.2023.11.02.08.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 08:10:06 -0700 (PDT)
Message-ID: <16a0abd4-33c9-4a40-9c50-5be5c72eb1f4@linaro.org>
Date:   Thu, 2 Nov 2023 15:10:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Move VFE power-domain
 specifics into vfe.c
Content-Language: en-US
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        matti.lehtimaki@gmail.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231101-b4-camss-named-power-domains-v3-0-bbdf5f22462a@linaro.org>
 <20231101-b4-camss-named-power-domains-v3-4-bbdf5f22462a@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231101-b4-camss-named-power-domains-v3-4-bbdf5f22462a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/11/2023 10:54, Bryan O'Donoghue wrote:
> + if (camss->genpd_num <= camss->res->vfe_num)

So based on code I saw in another series form Matti, I'm going to change 
this LOC to something that counts has_pd.

I'll send an update for this series shortly once I've validate the change.

---
bod

