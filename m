Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FBB78DF74
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 22:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239164AbjH3Tds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 15:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242860AbjH3Tcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 15:32:36 -0400
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DFA359F
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 12:07:42 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-500cd6261fdso244955e87.3
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693422322; x=1694027122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qx5DJCNgJ8zJ230zq1kmkZEmDWRvp7rGzLqeHmcD04Y=;
        b=SQ0hjZEDKErUDt5/r6HAS5n+7v51Ihk6yWW79ZCbXvVgvJxT8/iLKgZssZGb4bmft8
         nD47iyj9x5JCkP9S+2KIXIr5msz1B0L7YH7gUXSe5RZoI2zM0vd/fZ/qtjEjRIz62Bvk
         Z2LmZ4sZYROFzs9rG175en43JkMxgbiOtnGcB0IOMMqC8KhoJeVsiAu16MociEFhTqbb
         u0avFrgq+PT0jwRZnT3FNPPEjG8BYMn6B5CMc5pHB+VG0sn+vL7oN4NUHbICoqCDsSWF
         10xK1LXmKfpdaIOLnKPt3g1xPtj2kZpXZf9l5LgkPX/UwpRLsNIjDdXSBN+ZIUVSbGGL
         nOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693422322; x=1694027122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qx5DJCNgJ8zJ230zq1kmkZEmDWRvp7rGzLqeHmcD04Y=;
        b=cTHBIi/5I7IkGc9YPrehy5sH6wZ3j7GLRiCwkzIsKuMOQeGaMzfBEX7Ox3rZcvFPUl
         i5t12bB4sMhUWKZCXfmnIjQVqYhfllox9wHczK0Vf0FaA3vQ1E8YHa1eazirOkMyXqVS
         pFWaAxpu438TaVIO7X9U3fF4xdID1GKBylNva4kT2iXSnGN/RmZF9hASNlu01paRczzb
         5uhFO3aFcF7glj5oE4v/GO9LWt6wSeVyPxMuhdEh6h6qj5wPei298Lug3vf/Xk3GpKOQ
         wNY2Ou66tRkFxtp2jaVQOGoKHNFrspzr5xYQMRi7kX+lHDOzZ9F+uSbnrUfsa1fkDtSD
         5jGw==
X-Gm-Message-State: AOJu0Yy/eSYnfn6pr7utRdfuWD2wyHQyfysiFUYZIfFTQSlF7i/DQXcy
        1dQeLaI+NEIe7NV1h35F4+sL1xTeWs+5rflyEwc=
X-Google-Smtp-Source: AGHT+IFXNZcyo4pUIk1PPXndLXO1UNfBpn1JrGCeRhJIxONMleDn656s7prFtG+aetDALvFjZFL6tw==
X-Received: by 2002:adf:e6ce:0:b0:319:74d5:a2d7 with SMTP id y14-20020adfe6ce000000b0031974d5a2d7mr2636773wrm.32.1693420543899;
        Wed, 30 Aug 2023 11:35:43 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b4-20020adff244000000b0031423a8f4f7sm17337600wrp.56.2023.08.30.11.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 11:35:43 -0700 (PDT)
Message-ID: <e0a4ba7d-7cc0-2b51-994f-9f48284dcf02@linaro.org>
Date:   Wed, 30 Aug 2023 19:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/10] media: qcom: camss: Bugfix series
Content-Language: en-US
To:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/08/2023 16:16, Bryan O'Donoghue wrote:
> V3:
> - Adds Reviewed-by where indicated - Laurent
> - Adds a new patch for genpd cleanup. TBH I completely missed this so thanks ! - Laurent
> - "media: qcom: camss: Fix V4L2 async notifier error path" stays the same fixes spalt in -next
>    Fixes: 51397a4ec75d ("media: qcom: Initialise V4L2 async notifier later")
> - I like the suggesting of using a common fix for vfe-17x and vfe-480 however, I believe
>    we need to support multiple write-master/RDI => VCs in 17x which currently we only do
>    in vfe-480 so sharing the code between the two here right now, is	n't possible.
> - Included other suggestions on vfe-17x and vfe-480 - Laurent
> - I didn't change the val |= 1 << CSI2_RX_CFG1_VC_MODE to BIT(2)
>    The reason for that is all of the code uses this odd bit-shifting and I'd rather do
>    the conversion from shifting to BIT(x) as a distinct series instead of piecemeal - bod

Pardon me I forgot to add a link to a tree for this series

Link: 
https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/c13bb323d4f081d634dca3a9f3f56fbee370e8f4

---
bod

