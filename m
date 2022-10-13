Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5843B5FD945
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 14:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiJMMiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 08:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiJMMiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 08:38:21 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F1011D999
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:38:19 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id y10so1117578wma.0
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n98JEg0aU1YMdIAxv7Liv37PwlgbINKHuzKrarqY9oc=;
        b=iDrElDPw41gvQqgZ7TCAlQXfNmXe96Amnb7+vhhTeovAYPx4oTjcfZ051zH+LVawP/
         pliD9rHIbDthh33BiZWTDDwp9amDjROYQ6aBl7n2A0phJk0CDjqgsFxGxad9Zzzz/tkm
         G7lLj0DHttDzf4VOMG2TkHnxEvR4CfitJnAdCbK3ubOSX3CqbQEjzFHKFIrVFIz4Ux9u
         zRBR5mxWpf8IxBXTtxSZDqATLtC60CqjexUvfQ6qO37SBtZlc/rKe9AZs+nLrnuJ6Mif
         EgI/v1hbWPK3Q+nBJ+iuevV+hjPgfzQtG3mhrxC0HRgLpdhInNCa/bkDfjl8i/4b2MhI
         nM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n98JEg0aU1YMdIAxv7Liv37PwlgbINKHuzKrarqY9oc=;
        b=raat4aHOs/Cj+JRn+2FO7JxtawQLk7Vttn0Xe+aVSozVjiSwqZibzD31xQT78WXz/S
         WrshaR13Y5sAznd9iAMHvpqKcSczLiQm3iKTFQSNHlD41tFPEml62/kfPieOHQ7bH9wp
         OvZpF7m/i2x1BZEuw3fTXVuMK/fkwSmDgQccc599/QOreX3ZhzDheS52A9WAt1iW/ynl
         T44mQRZYh2WretulxPN7ocWqq0iXd1kyfqKu2z4ygOkZqG+zzogJQzXEprkejvOOpLen
         hsn+dma5yqEKfgsmPpX13LjfZhgE9LtbQR5+BwefknimcYaWj0dtYOefjJ6gdNhpUf7j
         2LIw==
X-Gm-Message-State: ACrzQf03gHxzR56iCI90gfft2ElWV3ZuISftcmrPRq0HdtplwJ9k3JyN
        PkZRHbcE/dkBb+etpV2I+HjLZw==
X-Google-Smtp-Source: AMsMyM6xvD7KaKmCY3+ro/8lfB0TUt9lb1jEjbicKFawRN/dFfDJGtC6Pxnpi9cJz+RClZlE3Bj/xg==
X-Received: by 2002:a7b:c056:0:b0:3b4:e007:2050 with SMTP id u22-20020a7bc056000000b003b4e0072050mr6443748wmc.38.1665664698341;
        Thu, 13 Oct 2022 05:38:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5945000000b00231893bfdc7sm2030004wri.2.2022.10.13.05.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 05:38:17 -0700 (PDT)
Message-ID: <a6558ad9-bd04-ca1a-fa20-8d1d55612887@linaro.org>
Date:   Thu, 13 Oct 2022 13:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for
 SM8250
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
> For v4:
> - fixes the warning reported by the kernel test robot
> - tiny code change to enable the vc functionality with the partially-applied
>    multistream patches on linux-next (tested on tag:next-20221010)

Ah.

I never groked I need to apply an alternative set on top to test this.
Doh !

Let me see if I can give you a tested-by

---
bod
