Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F038D67E802
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 15:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbjA0OTR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 09:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbjA0OTO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 09:19:14 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFC17F30A
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 06:19:12 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id k16so3555009wms.2
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 06:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q90LqhbGnu+8NGoWHaROTF+dgNnQu0A3NfUHfPBol2I=;
        b=vDnSb6zzcf9fSflFaUewXVsO+IY5upzoyUgIX4p3oakESbRQfdiV4mfekjUeU+8hLs
         h9PR+HIgaVIkS1zFYuO4xFbq8fKfYgblN6YlyZLkvBS3ABkBJ/iKyKiLsYvwG5FmDCR7
         gwSa3X0LRi24JhoSDiTAvCh+ILT2NeTbi9aKbRfoBY3bammhNBiJ0jrCVfwVqwhzt0Mx
         pcvfJgwHnnnK4ig80oQ22X43T6zPHq+CFImtCc34SsAou1r+uDzoW86Z9sDwR4sFTfvB
         MVFeMI2COfLBkYQL8RmaFiCdqEVDCRAG8f7bMjK1ZPtqKH3Ux79QfdTFfgLzkINbA6ts
         Hqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q90LqhbGnu+8NGoWHaROTF+dgNnQu0A3NfUHfPBol2I=;
        b=zf044Y2Hyql9x+ev+P9d90HU634QtzLL9YwbW5NL9EwYSV2aUNNROV16kjLaOnS6pI
         aZsB4xkJwP8f8GBeNRf+2g98kT/eSQsy068OecEMdl7Ax8EK+OfzQkLxUOwCCC9noVcl
         q5gN1nz+pFf6Ljl/8qjabBBD17S/OgtseBJXhsRE/cv2NrCrvuviISkV4qjaG4779ahq
         XyZsUF/H3MLGzde2YzSu7rRCD2nLYapA7UD2GiL9yyo+j8CgK+rm6eq4niSaUYMi5Ypa
         uljrGb7SeDZkPMjNIiVGRhyf9/Y7Q9K87s7ZziqT5N4Oq1E+blJ4bPlcuYY4e0rKbFeo
         cfsQ==
X-Gm-Message-State: AFqh2kqy8joak4UD4abL4V5pIgS+wI02R9NxbkU+E5/hv+uKTGRe8v4i
        yyxB+T9Wnl6M0fMDN1pE8DsVFw==
X-Google-Smtp-Source: AMrXdXsrrhDYWnQRbfAB5CqXYb/vB5ZwubcX3m5L1cXbILamRp4UWD69ytbzEE8ymVPevzGLFClwoQ==
X-Received: by 2002:a05:600c:1d29:b0:3d9:69fd:7707 with SMTP id l41-20020a05600c1d2900b003d969fd7707mr47084813wms.2.1674829151161;
        Fri, 27 Jan 2023 06:19:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bg6-20020a05600c3c8600b003db06493ee7sm9092561wmb.47.2023.01.27.06.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 06:19:10 -0800 (PST)
Message-ID: <482b464b-c5fb-8af2-b0f7-4388fccea3fd@linaro.org>
Date:   Fri, 27 Jan 2023 15:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/9] media: dt-bindings: Add OV5670
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
 <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126165909.121302-2-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/01/2023 17:59, Jacopo Mondi wrote:
> Add the bindings documentation for Omnivision OV5670 image sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

(...)

> +
> +  dovdd-supply:
> +    description: Digital I/O circuit power. Typically 2.8V or 1.8V.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 2
> +            items:
> +              enum: [1, 2]
> +
> +          clock-noncontinuous: true

You do not need this. Drop.

> +

Best regards,
Krzysztof

