Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D01067F6F1
	for <lists+linux-media@lfdr.de>; Sat, 28 Jan 2023 11:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbjA1KLk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 05:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjA1KLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 05:11:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913527B40A
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 02:11:35 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so6980582wmb.0
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 02:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYZy0bSeqCyAVzkN1iIc6hGTs17GfYuf+6TH4kdK9SE=;
        b=EaolpHNB+MJT3EL3I8eCq9P3ihfm5wYqYwNh8g64DG5hBTCS7Rjfo/cS1boYdcz5BH
         B6tIgmSWE1N+hJLHiMzdIFXbCCEzxP6dSLh2D7L+TLOm3u2UnJ79n5E3vkk8Tpl8/I6h
         mlBHjFUTz3vxYRAkb/gm0cAWmEgiKSNVXZufSetBL273s3OG6JLihcJy7/HQnl5HHHR+
         txJvmBM8FAvmbeZp5urzFa+Vmplh59IPWLKDtG0iIatNo2xjzl+8dqZspCiy60E6o4zF
         Nfo3fHI9/orX4nWX0LuxlprUTMSR6BWM87XWiq3seOrWixUHAHNZC+vPmSdexgEcs18r
         XXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYZy0bSeqCyAVzkN1iIc6hGTs17GfYuf+6TH4kdK9SE=;
        b=OS9O7MBsLr17XDwgq2Y39JcVGpA3kpwU9ws18ojgHkiUW5pbd29UOF+ljrsjB2KN56
         2CC63EBVctz2IwFLJIofhtSCQFmvis+c+/yB6B4uCZYWvoeUBqOQpKRMY/atXKzSPKtd
         iL/VH2yPqqLW6ycAv4yZ+HS9yCyiLYNnGEKEZ5lRs+Tw7i42btu+gsRRpaWNRFOnlXIf
         WO89SKqwvKOn2QCNSCPfjPSMR5szvqTkBoK9iE03xn78cPwPJPA1oz3x0upRZ6l2GVB7
         5UoA6Vudrrb19xqOCRxaFhlWp6cxl1SXjSauwlaVP2Ocl+QyV6ej8U7kAUo4LNW7jWiV
         JHeQ==
X-Gm-Message-State: AFqh2koa+YYvBQDjOC5DktPnJDu3JDWr2cZ9hXQMwT4aAKSBKskyCH4p
        pIpjj9ge24pFqNUOUg8hEHHMsA==
X-Google-Smtp-Source: AMrXdXt5GsZtzusluw7XQKW9O8qapNZ6cwT+opS7GMxqxsgnUDFn3OpT+YLOtkqyavCdSGQWvaDcFA==
X-Received: by 2002:a05:600c:4ab0:b0:3da:f959:4737 with SMTP id b48-20020a05600c4ab000b003daf9594737mr44122088wmp.36.1674900694154;
        Sat, 28 Jan 2023 02:11:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003dc1300eab0sm11419541wmq.33.2023.01.28.02.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:11:33 -0800 (PST)
Message-ID: <6e953652-4a24-6f3c-74e7-07c25fa1c6c1@linaro.org>
Date:   Sat, 28 Jan 2023 11:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: rc: add keymap for Beelink Mini MXIII remote
Content-Language: en-US
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230128034117.3983105-1-christianshewitt@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128034117.3983105-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/01/2023 04:41, Christian Hewitt wrote:
> Add a keymap and bindings for the simple IR (NEC) remote used with
> the Beelink Mini MXIII Android STB device.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../devicetree/bindings/media/rc.yaml         |  1 +
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  drivers/media/rc/keymaps/rc-beelink-mxiii.c   | 54 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  4 files changed, 57 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-beelink-mxiii.c
> 
> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index 266f1d5cae51..f390a5d2c82d 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -39,6 +39,7 @@ properties:
>        - rc-avertv-303
>        - rc-azurewave-ad-tu700
>        - rc-beelink-gs1
> +      - rc-beelink-mxiii

Bindings are separate patches. Didn't you get such feedback already?

Best regards,
Krzysztof

