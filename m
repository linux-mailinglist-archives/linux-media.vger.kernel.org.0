Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2AC52A413
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 16:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343831AbiEQOAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 10:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348182AbiEQN76 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:59:58 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C9D3C701
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:59:56 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id bx33so21844371ljb.12
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LEsqb6iifvbd1vGQ2F4XBUPSxstBfEUVUDZg8Q1Sun8=;
        b=DdA+OmC0wz5YgtBt1uk29pnGFOo9cocstcx0c01D4Gt6aBXJ1itONLZ4e3gxzaHZfA
         ow7cvmw0uFuF41S2OBXAZiPivC7NxRJS4YY0+6KuIAzgOMXHSteBFR6LqRaBdmkCyy5p
         2kBOGatD9avctT1ETg3QAgtLJlgI2TEjLr6wNV3hW9FMGz7dcEOs5qwJlLgidL/VQNNx
         uCEp9RD50bUIXz6sNxxLMYsPB6Eb7dya3JwnC8RqBiwhwee4UMeN9Pt8fyOzm/OpAR48
         hELaCLsrup08W9pKmTxn3FQrXjy4vddlwgncgr6VHkCXMkfXWMdvcdBxoFbEsp84Q+fV
         /JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LEsqb6iifvbd1vGQ2F4XBUPSxstBfEUVUDZg8Q1Sun8=;
        b=79MiK4cOMoXkYHPiVwhKcuLxBgCWCrGtKUe/t82Aegdu+UJU2Xbo8D4/PMtAWUouNw
         vvpTHR128DydZwnKmxZMyqxS/Tf3I+ewtRN4zFiuDdEd4btAwonnQOyqg41qUq4KAUWZ
         8x06Lm3jyb8k/YWXTnyczmAS84VYghrScAo3PbcVgQUCvFoUrVUbrK31K1WvuU4ufG9G
         o4luqtRuVybb/w/K7D3xk/aFXeWUvgllq46maWPoOlf5qSztC1N3L7hf/WdMm3dkFKSr
         zCkctYn30ctPFKffmvR3iWvBSe967oelYgvfIcX0FZZBLvwD2fXYkaf+D8tpt4c6/ZVb
         ojsA==
X-Gm-Message-State: AOAM532uJdR8IzKyWciLBz+NRL77MtTN5qZVoFtI4Fo1rTluRmgZ8CLr
        4u3J7phsEpIy/x6Xy6LjRtL+sA==
X-Google-Smtp-Source: ABdhPJz7RfnaMB4s3XVzeGmho3fC74jbeCzLVypGz9aT7Ugi9qvsalkuXfrWE+QLQgyBiSWvUfDqdA==
X-Received: by 2002:a2e:934b:0:b0:24f:cce:5501 with SMTP id m11-20020a2e934b000000b0024f0cce5501mr14698187ljh.443.1652795995182;
        Tue, 17 May 2022 06:59:55 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v11-20020ac2592b000000b0047255d2117asm1596611lfi.169.2022.05.17.06.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 06:59:54 -0700 (PDT)
Message-ID: <08787027-4978-d03e-0d91-d70bb8e98f82@linaro.org>
Date:   Tue, 17 May 2022 15:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 15/20] media: s5p-mfc: DPB Count Independent of
 VIDIOC_REQBUF
Content-Language: en-US
To:     Smitha T Murthy <smitha.t@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, stanimir.varbanov@linaro.org,
        dillon.minfei@gmail.com, david.plowman@raspberrypi.com,
        mark.rutland@arm.com, robh+dt@kernel.org, krzk+dt@kernel.org,
        andi@etezian.org, alim.akhtar@samsung.com,
        aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220517125548.14746-1-smitha.t@samsung.com>
 <CGME20220517125641epcas5p48fc3d48ad5e4a02879a1063da36c0063@epcas5p4.samsung.com>
 <20220517125548.14746-16-smitha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517125548.14746-16-smitha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/05/2022 14:55, Smitha T Murthy wrote:
> This patch allows allocation of DPB buffers based
> on MFC requirement so codec buffers allocations
> has been moved after state MFCINST_HEAD_PRODUCED.
> And it is taken care that codec buffer allocation
> is performed in process context from userspace IOCTL
> call.

Please wrap your commit messages according to Linux coding style:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586


Best regards,
Krzysztof
