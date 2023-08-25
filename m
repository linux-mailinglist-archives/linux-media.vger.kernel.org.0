Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45ED0788690
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 14:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239734AbjHYMDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 08:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241560AbjHYMDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 08:03:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0472105
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 05:03:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fe8c16c1b4so1226155e87.2
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692965009; x=1693569809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taeO1AEsh0uP1pYQ9HGpFayxmjVLAo8NHH2wQoNtLFM=;
        b=rWU4iDDCZLjgqVS9HLbAQ2EG6MMqAi5q6+Twqdz6EWhrB8VyvX+wp5GTV7qVtAA0wx
         brwTIf7sgBl0ZQDb03cMVwIcWUJThoC/yh3YMFX4oAZpSaG8Wkaq24H0R5Bj2dNCASj6
         B8TLEYAUnr+vmQWQCAJWD/i7B39IAY2w4udR+Mb7ayGgSPGUf+teUxI4RBkTdRzfxa3W
         dRwXisdZORU4D0SPEIGtnElzHfxi9+N2x4OV7AiuQ5raQ0DuWAvUG/NF4rTsJiR28mw8
         H1Odj3dvv2gZz7Zu2Twew6WeC6ii4iHrVFr9kJLrtvtFCQH9g9EWYi0ktLK+Q88crxLu
         VHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692965009; x=1693569809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taeO1AEsh0uP1pYQ9HGpFayxmjVLAo8NHH2wQoNtLFM=;
        b=GxmflORs+RsUDOhkgjGtZqWE6Km3Arw5rrRxGAkJE781PNfW6g6HS3oYYxqgZEI5tz
         HiJpyIEABZe7Ir0rteZ3GmouXx0YpsgfpWEL5OedJBFf70ztgnqhDqAgyU+EwM+nZjP3
         Uncp19GWwsyZjL/ytmrXZOlm+AZAggxpfMDGfVMYhlNo9b2VUzTUpbMyUG7B1nQR7y8s
         +iUYdGxbEUZT/4+EnVr6OLeIA0E3z7B6U0dz/1+2PvnI3Wiw+7owM63tvU9aB+6yw3Xy
         4Iv3rRLB7z5tySIkmvx9y8+nk/vJR1j/X42KheHreDJIexmF7upF1nLPfnex1FLRFmmf
         K0Zg==
X-Gm-Message-State: AOJu0YyQhDA1um/VB4XSqOXjcNy0aLv/ryqckiiXxtAcvGZuII50m0Qr
        F/Z98IsimLr80zvv/MXiKIDs5Q==
X-Google-Smtp-Source: AGHT+IHHPBfuWhEiDj0swCd1J9tLfn5NS1BOsfFV68R8Yh/Yt91I78MzNDbsdRnRJzelo10BvYmKmw==
X-Received: by 2002:ac2:5a5e:0:b0:500:761b:72ff with SMTP id r30-20020ac25a5e000000b00500761b72ffmr11352182lfn.55.1692965008885;
        Fri, 25 Aug 2023 05:03:28 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id t21-20020aa7d715000000b00523a43f9b1dsm940874edq.22.2023.08.25.05.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:03:28 -0700 (PDT)
Message-ID: <851aa91b-dda9-c2df-0e8e-66dec6756899@linaro.org>
Date:   Fri, 25 Aug 2023 14:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Content-Language: en-US
To:     zelong dong <zelong.dong@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-3-zelong.dong@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825115310.39993-3-zelong.dong@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2023 13:53, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible for Amlogic's Meson-S4 IR Controller.
> Meson IR Controller supports hardware decoder in Meson-S4 and later SoC.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

