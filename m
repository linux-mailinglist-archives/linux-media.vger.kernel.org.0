Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF3C79C6D1
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 08:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjILGTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Sep 2023 02:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjILGTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Sep 2023 02:19:44 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82B6AF
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 23:19:39 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so4809352f8f.3
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694499578; x=1695104378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtxyNVrqbqYRJntPYqZndFwb10b1oYoWvN2Bf9PQuYo=;
        b=GUQH8+ZxmTeeKoxqZWBBi1PbW82jumecnWfJSIRdZ22i54OWKSzy2g8NcPdB1Oqr/P
         JuORppIq+Il47kVjr/YJQ1gS3H4192yP5xszYn6hYzaVz6DVwgVKCGd/DojDaa/yMLLj
         fjdum30GcB7XhoqDTWBCis0+v/wLDPgwhSIvnujwzoi3MzVy+fIUxqOfB9c0XvMc9i0O
         l4E7cQpl3xoaSutArVP64AeGoT0OoeNtRchSIWI7HEwQsIV/RnTqcsHG9ZrIQHE6i+Oy
         X8BHwdjJe+CPxJ305iYkSgAvXFo5tZ3XAw65fnHCTEKaBYxMCPqWtLZ2h4YRyUAsjc/F
         0zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694499578; x=1695104378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtxyNVrqbqYRJntPYqZndFwb10b1oYoWvN2Bf9PQuYo=;
        b=xFV0nr+Ac7H1hnSrsz82k5ZA107pRfh6g69Is37Jh6At/Hghyc5OiqsrR8uJdvaLxe
         skgfzXUuldv2ZVyfAYviv0De1QuwPSySONQ/dWoBHceGFo89x1quLnR/70f0+lREIPZO
         hdwmfOnkPiGXVqfbeTGHe8ZdQl0vB0OKtadXr/nL61gksdQ2Vfm8mJklUu3/fd5ZeNXp
         yRRyVQIGCa0I3xfmaxvYnYg0RKleJbxCcBfYeI1LUiqKkb9/c5i/U8ozCz3s3zKojFOu
         vfdcVSq8PJxWjfYvbWHheeU7LRCEp5EJ3SIuEQZEKzbfthk0Uq9oMznsX1vF82sUxdeY
         XwFA==
X-Gm-Message-State: AOJu0Ywf4fK8YUiLsUqWKm41YamzjlIyHdDELQJXC7ccL88JXKKel1Cd
        QKUDJloCMCsRha7lwxjaJb+bRA==
X-Google-Smtp-Source: AGHT+IFoILfNqUC5S/cn8wwndgL995YGOyCzCehNmLqCcFugaMLUnmwzzE3PQaVZ2KiMh+6Cco4orQ==
X-Received: by 2002:a5d:688f:0:b0:317:dada:2417 with SMTP id h15-20020a5d688f000000b00317dada2417mr9990021wru.31.1694499578114;
        Mon, 11 Sep 2023 23:19:38 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d43c5000000b003180fdf5589sm12001027wrr.6.2023.09.11.23.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 23:19:37 -0700 (PDT)
Message-ID: <5d13f9c7-665d-4ff5-962d-940898b24754@linaro.org>
Date:   Tue, 12 Sep 2023 07:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 00/20] Venus cleanups
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/09/2023 16:10, Konrad Dybcio wrote:
> With the driver supporting multiple generations of hardware, some mold
> has definitely grown over the code..
> 
> This series attempts to amend this situation a bit by commonizing some
> code paths and fixing some bugs while at it.
> 
> Only tested on SM8250.
> 
> Definitely needs testing on:
> 
> - SDM845 with old bindings
> - SDM845 with new bindings or 7180
> - MSM8916
> - MSM8996
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Don't we have both a db410c and db845c in Bjorn's lab you could test 
this on ?

---
bod

