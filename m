Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E2752191B
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 15:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243266AbiEJNoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 09:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244630AbiEJNmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 09:42:02 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F18A2CE216
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 06:30:20 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id i19so32944867eja.11
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EYtYwlz2KPXmVu+njbcewGhC8fMqY+Dy5OCbzouBYQo=;
        b=XFUvOxgiQR78YUbV8REgK2ViRkKX7EkAyva7X50Xa6UHoA2pLqEhgl+Ynmz6Tfs4qb
         HWg8aiTvL4kJ4qTzR+sNRQ81J8qANDBoncI0vy+viOXojJzRNFVPYlk6CiOPpq4ytdQF
         RqYsJjgbUbry87AasVKZ56V00bYF+Ng47N1ra0iu68fcQPAJM4pTzzP3Kz0JYX3T0Mu6
         eE/JQ+h4kvRxp8u94q77tQlzKsEebcYIm2oidjYM29Bb0N9vuf0s2oPGa6RuCv2+iiq0
         EMwAb8f5af1DHTWsghLWc75BF8J6luPYlrO1PMkfmHGvIUqRsjSrwYX0qjkQmAI4H5NX
         qN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EYtYwlz2KPXmVu+njbcewGhC8fMqY+Dy5OCbzouBYQo=;
        b=nwl4IxWEhl4P4nGujETFCSas0ULT/+2otnRyZGkfzKYcQnvfYgfpbtyx01RtIgG/Ir
         +Kra+Xf6Y8KOU/UYzOGLNowN0hCkppLzsYjq8duE2kvhLDRb4oH4CFho0TfhAcN/GZVU
         y6Mo8KWJiN2k2g5fp+6nRxbzV8mtaGef7cp6D9Kyi6uRWT+aKDSKxWVt8okLT1GYNAUf
         xhLmUY8SgFI24Hr2MMYG/su7BamgYHkn4iVD/mVHb6b2pHTYMPquOscYyLfZBUVd7B8W
         GtAg/mV/J5QmPKIwzJ6kH6Uc/d54/Pok5GOrri2otjMPVcYPLL0Zigig3x9Vb0UDOwYi
         RhPg==
X-Gm-Message-State: AOAM532Q3R2lIaFUF9KFTu05SBduQq6+SllE0uRvIRqne9uJyhozXJ5k
        Fik6tr4l+KfKuVkNbwO/AEXGrA==
X-Google-Smtp-Source: ABdhPJz51i+DK9WKBMW2jvke8/AQ9bcDkq6DkUeG6a37vidtAoW3AWZAjecAM/UEy4O6QPtfASKGIQ==
X-Received: by 2002:a17:907:80c8:b0:6f4:3177:a0c9 with SMTP id io8-20020a17090780c800b006f43177a0c9mr20879712ejc.188.1652189416932;
        Tue, 10 May 2022 06:30:16 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id yl26-20020a17090693fa00b006f3ef214de2sm6121263ejb.72.2022.05.10.06.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 06:30:16 -0700 (PDT)
Message-ID: <8f814e9f-2060-7361-8d36-4a34f2aece1a@linaro.org>
Date:   Tue, 10 May 2022 15:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] media: dt-bindings: ov5675: document YAML binding
Content-Language: en-US
To:     Quentin Schulz <foss+kernel@0leil.net>
Cc:     shawnx.tu@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220509143226.531117-1-foss+kernel@0leil.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220509143226.531117-1-foss+kernel@0leil.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/05/2022 16:32, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This patch adds documentation of device tree in YAML schema for the
> OV5675 CMOS image sensor from Omnivision.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
