Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3FA04F6C9A
	for <lists+linux-media@lfdr.de>; Wed,  6 Apr 2022 23:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235634AbiDFV0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Apr 2022 17:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235823AbiDFVZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Apr 2022 17:25:46 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A256B26E1
        for <linux-media@vger.kernel.org>; Wed,  6 Apr 2022 13:22:38 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id p15so6590283ejc.7
        for <linux-media@vger.kernel.org>; Wed, 06 Apr 2022 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YWIJLXiksS0VQuBG7+M96cyEaIHAtHP1yEeT6FSDVss=;
        b=eGr2KNoJev3o+7PUlkl/icPgBXus4or9iph30kRO0RlOpzieR/mJ+fg2qhm4/C95/9
         Ff+RcLhj/Yu39wFVQyeMJlC4BAhtG1fklhyUKR2XebizMWewgnJ+6Dbu9TG01O8gWGEI
         +z8+WbnJRKA1SIMV2xD6kZQ0kwxfeU/bJoAvfU2vGX6AcAPH5kPSeJ4rLL6Nkg322iDR
         q/r8te8TdvpiDi3iCrek1q1m9t5ZDyVQeFvuvtvQM0R9sVIJAOPCui6/KEUfywOZBRt0
         oxQ0xpiVnfZ3YRwYkmQyvu2PJi1ex/9CDXlG8RZKXuY02SeiWJs1Q9quyO06otaKPEa/
         Udlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YWIJLXiksS0VQuBG7+M96cyEaIHAtHP1yEeT6FSDVss=;
        b=X0gHqeBda0ggh9DftG1Y5bqresKzqIEEt2aA6Rgq8vXk4I35+gln5htp0Bg9UW74B5
         csHDXXAK7w86bjZBuCIoAQAG8nELqaIow4uas56jip4GTeyFYBKLEe3MubsBJjKcW24L
         4Blye1TzboylCmMCWHhxUhsEwAjJsGdJ8827j5WYGUFo9dGzmjAhB1FFMrjh0KqGZPJ7
         NZqExvoLiGWWJxTq2slQBH5KyFSl2FNBG3Hw47mvNSMFAEtQpfHXy5AxsPKSrxshu7Zg
         2LTPnRYNZtA+sqeSmMV+olrdY+d60PXsH6eJ4kaqtleDdNahv3lxW43K9QowC671wRXT
         wbQg==
X-Gm-Message-State: AOAM530GyeLkEVAEbQ1PfCEiVteEHGBK3xfzeJKZSxZq66i9j3AydBEz
        TY8ZdjPlCc+5iEVIFzXKUhx/8Q==
X-Google-Smtp-Source: ABdhPJwqFsV1Ew0Jt6UrdnI9S2NRhGLNSLS3IFoqLFvHb+dEkGDyquWATm6TiXZLoQgcbqhgLh/WoA==
X-Received: by 2002:a17:907:1c9a:b0:6df:bfc3:c9f3 with SMTP id nb26-20020a1709071c9a00b006dfbfc3c9f3mr10367726ejc.679.1649276557243;
        Wed, 06 Apr 2022 13:22:37 -0700 (PDT)
Received: from [192.168.1.9] (hst-221-122.medicom.bg. [84.238.221.122])
        by smtp.googlemail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm6971214ejm.103.2022.04.06.13.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 13:22:36 -0700 (PDT)
Message-ID: <3987e143-59c6-f5dc-77a5-f58043e84de3@linaro.org>
Date:   Wed, 6 Apr 2022 23:22:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/2] Introduce Intra-refresh type control
Content-Language: en-US
To:     quic_dikshita@quicinc.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-arm-msm@vger.kernel.org, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, quic_vgarodia@quicinc.com,
        quic_majja@quicinc.com, quic_jdas@quicinc.com
References: <1647252574-30451-1-git-send-email-quic_dikshita@quicinc.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <1647252574-30451-1-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dikshita,

I cannot find new version of this patchset with Han's comments addressed?

On 3/14/22 12:09, quic_dikshita@quicinc.com wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Hi,
> 
> This series add a new intra-refresh type control for encoders.
> this can be used to specify which intra refresh to be enabled, random, cyclic or none.
> 
> Change since v0:
>  Dropped INTRA_REFRESH_TYPE_NONE as it was not needed.
>  Intra refresh period value as zero will disable the intra  refresh.
> 
> Change since v1:
>  Updated the control name for better undestanding.
>  Also updated the documentation accordingly.
> 
> Change since v2:
>  Updated the venus driver implementation as well to use the  correct control name. Missed in v2.
> 
> Change since v3:
>  Addressed comments from Hans in v4l2 patch.
>  Enabled the support for cyclic intra refresh in venus driver.
> 
> Thanks,
> Dikshita
> 
> Dikshita Agarwal (2):
>   media: v4l2-ctrls: Add intra-refresh type control
>   venus: venc: Add support for intra-refresh mode
> 
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h           |  1 +
>  drivers/media/platform/qcom/venus/venc.c           |  6 +++++-
>  drivers/media/platform/qcom/venus/venc_ctrls.c     | 10 ++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  9 +++++++++
>  include/uapi/linux/v4l2-controls.h                 |  5 +++++
>  6 files changed, 52 insertions(+), 1 deletion(-)
> 

-- 
regards,
Stan
