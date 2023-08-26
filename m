Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E54F789696
	for <lists+linux-media@lfdr.de>; Sat, 26 Aug 2023 14:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjHZMM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Aug 2023 08:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbjHZMMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Aug 2023 08:12:31 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1052106
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:12:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31aeee69de0so1457051f8f.2
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051947; x=1693656747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLR4lKpSrBGh74bNs1ZhoMsFZ4xpCfbewSlODAvo1xI=;
        b=xHU1xQ9Ca0ACJM3r6gSHiErpFVs0Yar3gLcqp8TdzfhHc38SIsy8qVy9+zy1MF8NZk
         gwHkOahFcFptFtgrQB4Pw1WE/6Aip5ZqI3wx866f9jg6tNYyRtetkOqfKgAu6nTkxlVl
         RTaxY3eQGvF4ctsK6dHwldj4QFdRhtroOJ3qDpx8umpa54O5yJepJ7boP3CPFCKu7kyx
         hI0YBmikjFbJjZf7RDQiP0kHObUhx8wJnucaPPPnm7AxelYiEFI379AIvkXlT2oRmEWE
         nLEbhA3HxcHSG91eP0w+RXNb7LwrvvcHTnmy4IbAL3NrK3CJmaOgQag6HR51Ae7ROv/P
         iBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051947; x=1693656747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLR4lKpSrBGh74bNs1ZhoMsFZ4xpCfbewSlODAvo1xI=;
        b=evKvylMqWUc+JOGleOz+pLp7rG3oQi+JayM+aTulZJs7Rlip6Gi0hjZnxGzOUc+10s
         TXS7WbifLL5oGshtt2gjb+4WwRx3y9SHLbrH7QjiPYnrYWkPYMdSTKjX/YAUgHHnpRdR
         GulYQewOv2vyY0r9OX+OJau+UUsg0LyHWNY3/WSRgo+5+lft8io0wrZquLX4NFOZyT51
         5b2V4SeRnmpJI3Mq4YjfSAS+vrTImci6Qab8W8He2+KAuhwjhMAvVsNDf8QaYJ1dt9RC
         PiZgeQf7dMl2XXZNMIKCQdc5QdGQz3Xd8CwCmmPJXABIwehSslkDX5CVEB13SH9/QLdv
         Mdqw==
X-Gm-Message-State: AOJu0Yy0lJ7EYlEiCwlzUyisLkghYfdfx3HQICeBiYFdTputh4nbLHz4
        wCxqh7BGwo0zTS2xotdM0wre6g==
X-Google-Smtp-Source: AGHT+IHu8mB0iHzMojvDALhi+tbFwky4s75VV+xoLfdKurAr4mztVjj9KSRQxkrUdm1YG++fzS9I+Q==
X-Received: by 2002:adf:f9c4:0:b0:317:690e:7b39 with SMTP id w4-20020adff9c4000000b00317690e7b39mr16519965wrr.12.1693051947627;
        Sat, 26 Aug 2023 05:12:27 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r6-20020adff106000000b003197c2316ecsm4785661wro.112.2023.08.26.05.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:12:27 -0700 (PDT)
Message-ID: <bf419311-5931-e8d9-a785-0bf9df3c884d@linaro.org>
Date:   Sat, 26 Aug 2023 13:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 07/15] media: qcom: camss: Capture VFE CSID dependency
 in a helper function
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-8-bryan.odonoghue@linaro.org>
 <a84f33f5-cf46-48ef-a9a9-01acb926c145@linaro.org>
 <b2f8285d-30af-c8b1-92ce-f9370ac55a98@linaro.org>
 <95db5a14-87dc-4f08-b8e2-52bce140354d@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <95db5a14-87dc-4f08-b8e2-52bce140354d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/08/2023 13:04, Konrad Dybcio wrote:
>>>>   From sdm845 onwards we need to ensure the VFE is powered on prior to
>>>> switching on the CSID.
>>> And what's the symptom if we fail to ensure this? How can someone
>>> adding support for another platform tell whether the match-list
>>> should be expanded?
>> That person has to understand the dependency.
> If we need this workaround, there surely must be something that doesn't
> work without it, a measurable symptom. What is it?

The CSID lives inside of the VFE therefore the VFE must be power prior 
to the CSID.

The symptom will be .. the CSID doesn't come out of reset.

---
bod
