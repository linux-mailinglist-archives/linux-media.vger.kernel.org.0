Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7115F67F6F5
	for <lists+linux-media@lfdr.de>; Sat, 28 Jan 2023 11:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbjA1KL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 05:11:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbjA1KL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 05:11:56 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349F11E1ED
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 02:11:53 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q10so7045856wrm.4
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8j6dNJkxrSxDPyySBk6LQjeoSCY/+vQ+309wipikRk=;
        b=yofUgu9dsgjjoBzdQzX1j0o1oQFqnFTfHop6DP4ARzkjcznFtZ9nYNV3+HcCrKJ84Q
         W/TnNb+qKtj2/ky6CvrcSjdV17J6pinOnZH0tyoR6mkfszfYkrZbrZfIPseyCvfty9+K
         y9I+2PRqycwtxQDwSfvyRvPOQ8yaikRPASv22PUExpZyiHTSXp5bRY4y9XpHMfJcaljF
         cV+AtBS//kC9u+DMzJmiRrfWTD+3VFnopzqi3TQVJPqhKKLN+8QdehoU5xHhS7YNAhOj
         T9eUIGzUdWbloCNQLTi6sIaC9q/bZqc1AwE94qAEUWfQfePWv2+kt4TtLdfZf1wEFJ10
         KNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8j6dNJkxrSxDPyySBk6LQjeoSCY/+vQ+309wipikRk=;
        b=TD77merVEcagVUdzDXy7TiUqmxzgCb4qLHJj70MKFWfCGLo022MGXk1bWPePp4GJx1
         kZRlA+wlvJImtCMbx5znRPk7QE8LM+2A1cY0oz08HxACS9JgowTVuWeIZ/ZAxasPBtbx
         0opKyN9zzmATdhu95iCRlhVz9a6BGoBV60NlPhQoO08mGi55nlFULf+pDAdbzfxxQwsE
         8nm8dvc50LJL1GfeaZBfEpQWE8Q6JAy4Ltfyffd5Yts5l4Sj8+ucTXvCO7N8JUubch+W
         w+eUpz3nCNK7nk2WrgLR2hM12IRtxHEaNkfMW0FCjEWCrq+Yk/0QnsTRhbvYtewfay3I
         5PsA==
X-Gm-Message-State: AO0yUKXJoSyPvrX18AxgQ9DCQz0BIaMHJCDjcy8FJD3SmeI54olYPCmq
        oA9dA/+i6L6YgZ6TAY0ujD7bVPRtwtWyx5Tl
X-Google-Smtp-Source: AK7set8csJpI3Jrdi676MEVW/0FS2VL8Hm8S+9IfSSsv69G+8x3Qob9EKjHyWczs1KD9YuTZQxq2Xg==
X-Received: by 2002:adf:c7d0:0:b0:2bf:b113:8ae2 with SMTP id y16-20020adfc7d0000000b002bfb1138ae2mr14922505wrg.15.1674900711766;
        Sat, 28 Jan 2023 02:11:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d44c4000000b002bfcc9d9607sm5146510wrr.68.2023.01.28.02.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:11:51 -0800 (PST)
Message-ID: <bfe721ea-1ebb-48c3-0c99-ea6041183a2a@linaro.org>
Date:   Sat, 28 Jan 2023 11:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: rc: add common keymap for Dreambox RC10 and
 RC20/RC-BT remotes
Content-Language: en-US
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Emanuel Strobel <emanuel.strobel@yahoo.com>
References: <20230128033616.3982911-1-christianshewitt@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128033616.3982911-1-christianshewitt@gmail.com>
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

On 28/01/2023 04:36, Christian Hewitt wrote:
> From: Emanuel Strobel <emanuel.strobel@yahoo.com>
> 
> Add a common keymap and bindings for the RC10 and RC20/RC-BT remotes
> used with the Dreambox One and Dreambox Two DVB-S/T boxes. The maps
> are combined since the IR codes do not conflict and both boxes have
> shipped with both remote designs.
> 
> Signed-off-by: Emanuel Strobel <emanuel.strobel@yahoo.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../devicetree/bindings/media/rc.yaml         |   1 +
>  drivers/media/rc/keymaps/Makefile             |   1 +
>  drivers/media/rc/keymaps/rc-dreambox.c        | 147 ++++++++++++++++++
>  include/media/rc-map.h                        |   1 +
>  4 files changed, 150 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-dreambox.c
> 
> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index d4ef523cb3d5..f390a5d2c82d 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -56,6 +56,7 @@ properties:
>        - rc-dm1105-nec
>        - rc-dntv-live-dvb-t
>        - rc-dntv-live-dvbt-pro

Bindings are separate patches.

Best regards,
Krzysztof

