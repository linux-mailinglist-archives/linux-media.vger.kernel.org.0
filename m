Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B05CE66573F
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 10:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjAKJUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 04:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjAKJTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 04:19:50 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705BC114B
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 01:19:39 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id ay40so10639142wmb.2
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JkE8k+zb6V8XAsdWBYWdOcqpT4YkPRqlcEpPrFh1Mg=;
        b=NN8bbzG32j/Fvv6jjEGG9bL8osozCnlyMafcRK3SkjAW3nn6SLlG75IJ8PfqZmf2W/
         WqlJokplJSTsJL9GoNnUrTRVSUaLFKVyH0w/8U9KWzzGrR4bh8eh2WQXagEcWRfoOIu8
         QwvasTG4ypvW3CNjN0BzinfOIdBnERXF/ca7FUIC1CO+3vVmsLd0fW8Ju5rm1DeJ+8EO
         c1EvGLqVTfDBYQzml0XBYpcZaM7WTJKudiuos98/hTetLMnuKzvYNzvCeXu8ldIDLNE4
         MnhjugfAolunskgCgaDIRMYx/D6B/lJTTu7zMW32EwpL9sDFPr6Lm34PqanEuPGwCMTv
         Eddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JkE8k+zb6V8XAsdWBYWdOcqpT4YkPRqlcEpPrFh1Mg=;
        b=156skVz038G+nmNRStU+Pdbd2ZYLMUn2XOlManUFy3F72QQPV8m2cENsNcRNcQKEff
         hsMv+AC+ju6+2OO6MfDPXOcfaHGaiXKa8pjPT6YVwh7BdEKRGCz6p1aUyN6ZVL9MdAmL
         lrmI5v6JWg+WvisQLZG7y0TMJlOFFD4N204eG8ua6nNnsA9sC79FMdOidyahTzgPY6zU
         4bYddNNznZKpy5zfJY6RDJfVNeQYbxyrnKBtC1SWhcqnpQWCaWJGk/pDVPSVgUJWlu/3
         xdOC+6mhIyXtFltv/LNkRrkpNSHNqF6CqmZFwnARtde3MkNBUjgvVBxaPE8esnKsr5iT
         ACQg==
X-Gm-Message-State: AFqh2ko9sHHNjG1X5MWgbGc409QYP5uJy5jc0rTbS7n69gdk/iuwL1Ks
        G3I6PJSo/+pGZ92wP3Vg+lYC+Q==
X-Google-Smtp-Source: AMrXdXueETs+9QMmUplpsdR2JoM7cnnfCNkCjsejlTKSruG40GsXye6Bu9UvxFfBHAdM4QOI2zwzVw==
X-Received: by 2002:a05:600c:4f96:b0:3d9:ed3b:5b3e with SMTP id n22-20020a05600c4f9600b003d9ed3b5b3emr8928750wmq.19.1673428778035;
        Wed, 11 Jan 2023 01:19:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c4f8e00b003c6b7f5567csm5442557wmq.0.2023.01.11.01.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:19:37 -0800 (PST)
Message-ID: <a5aa6c41-941c-8337-d83a-ead2775ba864@linaro.org>
Date:   Wed, 11 Jan 2023 10:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/6] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface bindings
Content-Language: en-US
To:     Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230111022433.25950-1-yuji2.ishikawa@toshiba.co.jp>
 <20230111022433.25950-2-yuji2.ishikawa@toshiba.co.jp>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111022433.25950-2-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/01/2023 03:24, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the Video Input Interface found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> Changelog v2:
> - no change
> 
> Changelog v3:
> - no change
> 
> Changelog v4:
> - fix style problems at the v3 patch
> - remove "index" member
> - update example
> 
> Changelog v5:
> - no change

No change? so all comments got ignored?

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

