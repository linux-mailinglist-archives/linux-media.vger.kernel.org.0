Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDCF76910B
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 11:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjGaJEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 05:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjGaJDq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 05:03:46 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72D2199B
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 02:02:49 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3177f520802so2788593f8f.1
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690794161; x=1691398961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+r1edqKvURhfyiI4qxFZeIDXLazkhBYvA4uXUjqgCc=;
        b=eK+Mtf+lWF87Z3McC7LVXrzCWa3aO4dn00FQAoWzKnGoXt0FzcwsP5T6/PMH5OJhxG
         iieZfY53Ncm0AvMu1q+eLGxhYmGg4VKFjYy/WEyjMwVq+URaegtdF0nB7XCPQGcisNx5
         cNN0W7Ck1QWmFWRB/y+NEw2LrgUF4EeaXeOZ2MAXruOMRA1nHjg/i7RLgPSgrx9Rj3Oi
         Nyn9EDpfwxUgWpVDzHYPGWxRUS5eVNyG1qMCxWeDVoEHZmvIX1GDf5diHTTHgaJRBzNL
         ZDIOCloXQVxPzDqPs8cR1PmEiwG2fVdPm1ul1f+Ua189LNxvMzXjXxHpR4ahvOIUbrRC
         /uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690794161; x=1691398961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+r1edqKvURhfyiI4qxFZeIDXLazkhBYvA4uXUjqgCc=;
        b=OrNzI39u1jMEx/I1kDZ4VUbSsCcXs9HUppEji0niv2gMbkAuDx2v/Lumfx/9sySCRj
         ziWsKrpQAq/jf9SWiI5ie5wV7dvkC5J4ZHdYog40G1yPubDlkeXhPv8JykPSUZ0R75OX
         1mZKh74+d8x7ScMNcwFfTpZ7LjSJ4GdqL2sR/hMBaHSGrHlcfnHxn/KPRAs3DmFuUP/T
         JHtdv+V076iZI6hxcdQPvy6+dYymhDINN2KSejfG/ShQmjhoL8FQtBN/hkwpCjU9AS73
         DgI7pAVJWq5hNgCqUTGldaySuhyd5cBd09pGyLwIGYWYvxjxSBjqEWFNvqzisXmS9yz1
         hnHA==
X-Gm-Message-State: ABy/qLYoktB5bLGTNpPGaHhGVhy5W4gSJXb19PHdFbE/ylEPRhJQCbHN
        dKVug7zYcrE7hP9yQjU6agpUhA==
X-Google-Smtp-Source: APBJJlG7k6zNm0qkX1tUYP66PohWIF4pMduDAAJNCIb8TGjiznz6duHx0bJf8eizICNgirbhzLLAbg==
X-Received: by 2002:adf:f182:0:b0:314:3f1:cebf with SMTP id h2-20020adff182000000b0031403f1cebfmr10863530wro.28.1690794161015;
        Mon, 31 Jul 2023 02:02:41 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b00313f031876esm12442715wro.43.2023.07.31.02.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 02:02:40 -0700 (PDT)
Message-ID: <7ca35e2c-d5b7-021f-dbe7-d4e953d0fa10@linaro.org>
Date:   Mon, 31 Jul 2023 10:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 18/33] iris: vidc: hfi: add Host Firmware Interface (HFI)
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     quic_dikshita@quicinc.com
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-19-git-send-email-quic_vgarodia@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1690550624-14642-19-git-send-email-quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2023 14:23, Vikash Garodia wrote:
> This implements the interface for communication between
> host driver and firmware through interface commands and messages.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>

More dead code here

drivers/media/platform/qcom/iris/vidc/src/venus_hfi.c:542:	//if 
(core->last_packet_type != HFI_CMD_SYS_PC_PREP)
drivers/media/platform/qcom/iris/vidc/src/venus_hfi.c:543:	// 
core->skip_pc_count = 0;

---
bod

