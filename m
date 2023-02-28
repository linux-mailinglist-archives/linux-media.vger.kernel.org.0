Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4D36A5DB6
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 17:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjB1Qyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 11:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjB1Qyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 11:54:38 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588C13A90
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:54:12 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id t15so10474598wrz.7
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYp2p3X93FeaEj7oEUGNtbHjsSB1NBY4xkEV8MTn+HA=;
        b=zQXQRE51CrDrBo29vO1Tc5fTWXPSm2IxiCK7swYieR+p8LZ9HmM5fU3n8M0kcUe9Nd
         bLBf0u8CD5Iu+TMQ/b+vMdHcZ4uzYsN1R2/WT5t20eyKieynuW6y67BUyP68Eb72QPv1
         WKVeXgb1nKdiHateM0XSZNG/AFFaGik+qiGFQZ9ZxILrIAxlOICl62RQqf3X49XSmj8V
         IV/d1p4FhqktIWeGvE7YbrfkKZtKq8EECm5+VPeb7RoKmzTYhm+Xdp0qBMklotytQ/tH
         luIzG76/BjgrKK4zc7TqplA4zsUUgy3i2vd8Tce4z0vsn2iuY5jE4ArDDFtyderm3U0j
         usQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYp2p3X93FeaEj7oEUGNtbHjsSB1NBY4xkEV8MTn+HA=;
        b=2uMjWDJBM5mE9unbD+aiLfZEl4osGJGUzck+KWPEkPdURYZpyykbAgMqKp3K33Llzm
         km+OCKrNBrwm7bWsoYADfp3V0kXUjnVJk2PJ1JwUVCBwKmz8oJRizuJHUGCuGPrRcrOQ
         SiM3fWALj5v7xcMmCuEqmsRMfEsYou8TUqvtxHFfBTTDDUFkuWKVsNXrxdYQJnUH9jv6
         NbJTFuCaEjdjDCqzEfSa3TB4XjNqoqT1WvIKmeSYkP9fFE/GoqxIt6gmruFLrrQBDYyn
         p980XN+SOGDqUTif+92mlALoe9up6hPyvKqVGtzt8guioSecX5sUd1eJDv6N5zRs8qgj
         Za8w==
X-Gm-Message-State: AO0yUKXsMediQ2QotH6s4+vciLchHNBdmcexdODpTGZtyGojjwB8mF61
        f/qlfIdAfvQ4ix0Cl6lCWA+sLg==
X-Google-Smtp-Source: AK7set9O1W8IF9/4cQ+nKRo+YTR7FO1qRItxfIH2oXmuYMagy2Ku0heeyAaJCNf8HhzveTSSwdXUig==
X-Received: by 2002:a5d:4e0c:0:b0:2c5:5234:882c with SMTP id p12-20020a5d4e0c000000b002c55234882cmr2670053wrt.7.1677603215619;
        Tue, 28 Feb 2023 08:53:35 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b002c58ca558b6sm10357018wrs.88.2023.02.28.08.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 08:53:35 -0800 (PST)
Message-ID: <aa8db9a1-ac11-acbe-1a05-b60c39989bc1@nexus-software.ie>
Date:   Tue, 28 Feb 2023 16:53:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/18] media: venus: hfi_venus: Set
 venus_sys_idle_indicator to false on V6
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
 <20230228-topic-venus-v1-1-58c2c88384e9@linaro.org>
 <99eeebc6-69aa-c6ba-139b-92672c299747@linaro.org>
 <893851c9-c8be-ed7f-ebde-5d90b9313f6d@linaro.org>
 <48ac4272-0e11-d943-e950-0be8d93fb036@linaro.org>
 <b7f0c568-72b7-3342-decc-784cd5f68b1a@linaro.org>
 <1091d8b4-3dd3-427b-2fcb-c3e0d32b0a3b@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <1091d8b4-3dd3-427b-2fcb-c3e0d32b0a3b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/02/2023 15:41, Konrad Dybcio wrote:
>> Can you test it and make sure ?
> As I mentioned in the cover letter, 8250 still seems to work with this
> patchset. I have no idea how one would go about validating the
> functionality enabled through this call.

We offlined about this.

I think it is correct to say you don't have access to a display to test 
this on sm8250.

I do so, I will try this out for you, though I'll wait for your V2 for 
this series.

---
bod
