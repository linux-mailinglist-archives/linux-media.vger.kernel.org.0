Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E613B5A64C7
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 15:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbiH3NbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 09:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbiH3NbI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 09:31:08 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241E6B81CE
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 06:31:02 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id u6so14180443eda.12
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=h2d7blOj4TSvhaTzgSJFju33mH8yAmqKLraDsofPDeE=;
        b=MpsFuZ6mTJhUIoAWa9HmjLd4fjUg6q3KxVbMkloAi6lqOCjsxQzwHC6IrzDLc1LscY
         eSY14xHwx3cVvkk4S0FkCYEsXDp7tiaz7Kpdq9A9tb0hIA80Sxp1mxayLC/IF0E1d+iy
         x0ZPpT9voF27GtQBidVb3+YEM9C3mQGhqbn5IPUKxMOKOwsZKQuFAKDcfJFEiNO8PZir
         3VtbEDmwk/eabI4z5IfINu3CWyOh5Lp/4G+45lsScjjLFdIa606ZtLU+QyAbZ7jC3aWL
         KdTW/U6yXgPhWEMHM0+rAWQA8BqnKML7/sxELFJBDCdwcS0RqE2/0MwgQM81SMjLgslh
         lwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=h2d7blOj4TSvhaTzgSJFju33mH8yAmqKLraDsofPDeE=;
        b=cPbqexGoO64mBOLpG8pa26dJbRaCzilDBDGmdnWh9elRCeIZKnev+09xy1X51HM/UG
         inZraV2tqZhK9gOayl8RPrADahQxuodIWJO17J0BZ2SktQ6W5K3Jox+KiU5xE/ofpuU1
         dzi5F6Bjfi0X517XRY5+qoWz/8hB7Nd5ONavygDIeGvr6218lipwy3ASjapWt8EQJ8gw
         C+vAIl5cWrKlCLZsrtzqFmsYliRqN2mD5Yh5774lOg76Nsey5pnPQsp1pyjyhtwSi5nZ
         Rn56eq1r3lm/Ey2Vp2zRyyQTThDBPJ4N20eZgs1H5XDdnxCjRJSAv56la6XbOTwjkcRV
         WfQg==
X-Gm-Message-State: ACgBeo1Uy+C1TJYvXr1zf4kgM6exyd5+Opeh/U61TfqqCTumxoFUeG13
        cBDh1QzyBNd01Jkv3FKJ9hCvYA==
X-Google-Smtp-Source: AA6agR57JV4+ufIIN6B16zlZLM3UrsEAxYqKmsRXM0dJigRVdsEQ3DbKlCVolOI/MSQoRnO3NTrt3w==
X-Received: by 2002:a05:6402:350e:b0:448:4918:af81 with SMTP id b14-20020a056402350e00b004484918af81mr10392436edd.384.1661866260635;
        Tue, 30 Aug 2022 06:31:00 -0700 (PDT)
Received: from [192.168.1.11] (hst-221-18.medicom.bg. [84.238.221.18])
        by smtp.googlemail.com with ESMTPSA id c17-20020a17090618b100b007311eb42e40sm5830507ejf.54.2022.08.30.06.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 06:31:00 -0700 (PDT)
Message-ID: <03dac1f6-de08-d0e6-4e16-520c3bd23e4a@linaro.org>
Date:   Tue, 30 Aug 2022 16:30:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 6/7] venus : Remove the capture plane settings for
 venc_g_parm/venc_s_parm
Content-Language: en-US
To:     quic_vboma@quicinc.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <quic_vgarodia@quicinc.com>
References: <20220712122347.6781-1-quic_vboma@quicinc.com>
 <20220808092834.29775-1-quic_vboma@quicinc.com>
 <20220808092834.29775-7-quic_vboma@quicinc.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220808092834.29775-7-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/8/22 12:28, quic_vboma@quicinc.com wrote:
> From: Viswanath Boma <quic_vboma@quicinc.com>
> 
> v4l2 compliance expecting settings for out buffer only and the same
> values will be propagated to capture buffer setting by h/w encoder .
> settings on cpature plane are optional , required only if
> offline-encoding supports.
> 
> error details : fail: v4l2-test-formats.cpp(1350): !ret
> 
> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>


-- 
regards,
Stan
