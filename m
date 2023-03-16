Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6554B6BCF9F
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 13:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjCPMiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 08:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjCPMiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 08:38:00 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18E318155
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 05:37:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bp27so2169539lfb.6
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678970277;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=et1TOxaAuO23Dnon/VyidpOKHbPw5JTTXg0EC2DDFBE=;
        b=XcnGQqD7HsW6KZttIoq+G5EPC61Q6wL/r9yN2cpO4Fi3JO1Sny3UNOeAutADEGpNuV
         BIlNyi1kh8qEou5WqHSXpSxHMVdpRx2vXmvmaqvuRoXCLrqVk8iyQjC1Gg6XdqSl//nP
         910A2s4fpV5WI29Pcfpc8L72lPAB9eNpP4K+sSQ4xiKNxb6P74Hus3mYrnWZfnZS9W8v
         ykpJCQHqF+TXKirt0ljw0gsOqrSjic6YsiXLkF0c38suKiKAoVNFriunfE0BAYcVj9uW
         x9B2rNYFfYgBun9iZxLUm0v0pDxe0/KZptGG9kfKQPLUeg8eOBZBiCT6v4QGOCmkMUrw
         LXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678970277;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=et1TOxaAuO23Dnon/VyidpOKHbPw5JTTXg0EC2DDFBE=;
        b=5iFHeX8oDwSpjrasvRfAQ1cNWd389+4gzwRz7zqczZ02H8nCjzLGOk3+KN2LhnaBDj
         BOpEeUtl7NEGXJhD03AwpVB2icTzn0anpqYB990cv4mwBheo8b1GJ3HkNHY8dnbBxRY+
         NMLiOcgB5K3DkauC8ahyBEYIsdZKipC0Zrdig/l2jBw8kfe0nUbX4jgZowk15v2PLTJN
         GlOEYwzNfL1MC94jjWRFKE6y9QDM2xgGuZ9RAFCgBsyuAXgs5mUQ7buYMxdiwOFuIP5k
         rozsZd4B5LXJJMnkqk25974R8zIjycdY38VZhvccgkD+qgC/NPbgGXRyIT7xxp8KjRjb
         uk6g==
X-Gm-Message-State: AO0yUKXzsJ8DVYCX12/sN1+kuZti70VrGFKsDkZP+7l5tHYd2i3hOvse
        yit4mfdxfVp4TU/t80hgHzx7g1nd0LvBUp0Ioi4=
X-Google-Smtp-Source: AK7set8kpJ1Q6vODGrPLPHfwgsqkvFRVBRQO6bHlN9i9oIf/N2IEuBqykwF89ubVVq/wFJJxheFGNQ==
X-Received: by 2002:a05:6512:988:b0:4db:19fb:6a7 with SMTP id w8-20020a056512098800b004db19fb06a7mr2517982lft.60.1678970277050;
        Thu, 16 Mar 2023 05:37:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c25-20020ac244b9000000b00498f67cbfa9sm1205423lfm.22.2023.03.16.05.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 05:37:56 -0700 (PDT)
Message-ID: <0a9e9729-aa5b-4ce6-fc68-394949c1b162@linaro.org>
Date:   Thu, 16 Mar 2023 14:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V3 0/1] Fix for VP9 DRC and Decoder STOP issue.
Content-Language: en-GB
To:     quic_vboma@quicinc.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202064712.5804-2-quic_vboma@quicinc.com>
 <20230316081509.12201-1-quic_vboma@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230316081509.12201-1-quic_vboma@quicinc.com>
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

On 16/03/2023 10:15, quic_vboma@quicinc.com wrote:
> From: Viswanath Boma <quic_vboma@quicinc.com>
> 
> Fixed indent comments, ensured rebase and checkpatch with --strict.
> Tested the changes on v5.15 and v5.4 kernels .

Was it tested on top of the recent kernels?

> For testing Chrome Utilities were used .
> 
> Viswanath Boma (1):
>    venus: Enable sufficient sequence change support for sc7180 and fix
>      for Decoder STOP command issue.
> 
>   drivers/media/platform/qcom/venus/core.h       | 18 ++++++++++++++++++
>   drivers/media/platform/qcom/venus/hfi_cmds.c   |  1 +
>   drivers/media/platform/qcom/venus/hfi_helper.h |  2 ++
>   drivers/media/platform/qcom/venus/hfi_msgs.c   | 11 +++++++++--
>   drivers/media/platform/qcom/venus/vdec.c       | 12 +++++++++++-
>   5 files changed, 41 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

