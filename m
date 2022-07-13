Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A4357300C
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 10:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbiGMIFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 04:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiGMIFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 04:05:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B86E146E
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 01:05:35 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l23so18457318ejr.5
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=FH2CUkr39K9tYj33cKGhozXLfFjGPC2MS2KESbmwvHg=;
        b=hRP4p1qA4SbOzGr36aykU8GdBuvAHgnX7ZD50cV335gQkk3jbndoU6CRwEb7w+/jL3
         iJh6BqxmdckUvNM+niIB2OOV1Si3zXa519RXAlm8a5wQIbVthOsQCQ0xcTT4PwS7b+Ca
         gb/zVysnWBgmy7zLB8P/7IgeIMD4mVNxaegPwrlub4DvnUHtht4iypiCBjs/5XDisENP
         /a4TvJoNX9DXtBzXRF0KDToYERLXiFVIRS7JyGvRJXJywSnWKJHEL3vFE/Bdvve0IxlP
         WVzu3g2eZYpDew6OQNVQkeFxiN2KTLsAwb5DzesLiqylu2KlEy56n+VUS4qmLES52Os6
         eqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FH2CUkr39K9tYj33cKGhozXLfFjGPC2MS2KESbmwvHg=;
        b=NJ1eWt84HVSIP4SiXxH+1unxRHKCWydlRHd5V9rEE5WB1zkef3TnGY1OcJecgRF/jc
         8Yjw57YzQNs+ISPIxGvb81Vo8MTFCngVUk9EaMD0qC3WH9iTJcPIsR6qpa7OG3OHxUC7
         ZAAOzrzC8xsdYj3U+VP0hbYCsn60/2r9J1ZecwOMi27JkwZBB2IVqU8BO39kohce+6pI
         InQXboqeBPgyKZXn9a/sUVhUClfGzQ9YMZXfUr2CnT9MRWPIBXP3k4TTqyFddzPPhN7E
         qgvpi6B/S1ifjY5GPMpxk2DKJU2m4E5hFdpb6mHF5ToHiCg6jkvDpNWz7Lq53ngTtCi4
         vlmA==
X-Gm-Message-State: AJIora/uxg9maxp55b1neiGVerbC5WEO6pD7pJZMI+1erHSqP7TujAqY
        D85dmrctPUHnnVMn+O2N8uNfdw==
X-Google-Smtp-Source: AGRyM1vmXypvilqkmeA2w7ipHHrg/mb6SKIIgK2/O/evfFXo+c/F5xBQmN0zK/FACYKI+qfRbA7yrw==
X-Received: by 2002:a17:907:6e13:b0:72b:509e:bd6b with SMTP id sd19-20020a1709076e1300b0072b509ebd6bmr2230626ejc.202.1657699533878;
        Wed, 13 Jul 2022 01:05:33 -0700 (PDT)
Received: from [192.168.1.11] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id kv21-20020a17090778d500b0070abf371274sm4633505ejc.136.2022.07.13.01.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 01:05:33 -0700 (PDT)
Message-ID: <5d2d6d5b-5b01-9578-d598-5e0e96dc7f0f@linaro.org>
Date:   Wed, 13 Jul 2022 11:05:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv2] media: venus: venus_helper_get_bufreq(): req is never
 NULL
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <d9184cd6-6cef-0df4-5247-8119d7bdb25b@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <d9184cd6-6cef-0df4-5247-8119d7bdb25b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/12/22 13:47, Hans Verkuil wrote:
> Fix a smatch error:
> 
> drivers/media/platform/qcom/venus/helpers.c: drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
> 
> After checking how venus_helper_get_bufreq() is called it is clear that
> req is never NULL, so just drop the checks.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
