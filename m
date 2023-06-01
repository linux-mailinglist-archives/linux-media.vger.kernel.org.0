Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98FE071F485
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 23:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjFAVTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 17:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjFAVTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 17:19:08 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61568184
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 14:19:07 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f606a80d34so13380385e9.0
        for <linux-media@vger.kernel.org>; Thu, 01 Jun 2023 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20221208.gappssmtp.com; s=20221208; t=1685654346; x=1688246346;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of/XrkXjYj+o/AeSmwOwIp8GlnWTvjMR5t2AdN/ZBRs=;
        b=f4fU5sUN4379BHHJ5FIiRW3x0J29UE+nOp4gBGoFq5nPWGQu1up+enM0DTwadk/JvA
         NfaWedqcxmaT7A1G3/zLjM9INVmZiesNI0C+Zz3Xuf4CH1EInUukVeEYL3I/tYvxwT/G
         QxaZY7ItWUpJIAwsbElGiiXtqpYCZTjNe7Ud6s088uD08u61WBL/xbsNCZHJq3jZJyUI
         5eNewKDYl8V8SIkBxLEduGNY9csiuWtKic/mYhnLelm7Ltk9YHFtIAhJt9cyHuvjdxix
         YnuSmXWkCZdIn8H3iBKp8YCAYm4ABRC0gKw7OJxwfTHzn4EYThXLaGdwJ1JrhPTAoMDh
         Gpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685654346; x=1688246346;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=of/XrkXjYj+o/AeSmwOwIp8GlnWTvjMR5t2AdN/ZBRs=;
        b=kIohXo0mpY131AsJUcl3fRc6J1OhMRih6j+R43eyN1Og7AmtO2dOHlNcXmU6yCDQ+4
         5DunEidUaFqnqb/oIhFmI/JZf9dyCwCxSui0UPcZW/BOjSKTqXUaX9Gn5QVBMDhpG4Du
         BjO9yqQ7YyRMuezvm2g0QgwomiaJq8hZsKO+lYEzsBhXaWr7twBZs1yTm5+DPJ9xsU0/
         NgWQGbDtNhC6p/SOzQVz+n2k18yskukD9U3S+90aqFdfCZddhXFYSSqnR6XFC/vsCABp
         WDRaDszHI2btal4BysFaI2wy2KhY9Ggi3lFW6y0JtbjXhbKu3tzw3hb9YYO8BEB3yiMM
         lzug==
X-Gm-Message-State: AC+VfDy0cKJRUTJeYCvugXR9hPzUNeZDDxpQoVyBBEjnaruPRDY9dsoE
        OyzJosLvnY9GJwvyuV5yXL69qg==
X-Google-Smtp-Source: ACHHUZ5GQ6DQe4pOcH7HZpe3BSlh9JLpN/xfx6XaRRZ7dknhrzPa+3roiiN6P3H3nrJzdCB88leFVg==
X-Received: by 2002:a05:600c:224b:b0:3f5:ff24:27de with SMTP id a11-20020a05600c224b00b003f5ff2427demr399052wmm.32.1685654345915;
        Thu, 01 Jun 2023 14:19:05 -0700 (PDT)
Received: from ?IPV6:2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e? (2a00-bba0-120c-9f00-7a8e-8795-650f-7c4e.static6.cust.trined.nl. [2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e])
        by smtp.gmail.com with ESMTPSA id f15-20020a7bcd0f000000b003f4272c2d0csm3440377wmj.36.2023.06.01.14.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 14:19:05 -0700 (PDT)
Message-ID: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
Date:   Thu, 1 Jun 2023 23:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To:     regressions@lists.linux.dev, paul.kocialkowski@bootlin.com,
        jernej.skrabec@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
From:   Martijn Braam <martijn@brixit.nl>
Subject: [REGRESSION] breakage in sun6i-csi media api
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It seems like this commit:

media: sun6i-csi: Add bridge v4l2 subdev with port management

Has changed the way the media pipeline on a64 devices, in my case the 
PINE64 PinePhone works. Since this is an API towards userspace and 
there's active applications that use it I think this counts as a regression.

#regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43

Greetings,
Martijn Braam

