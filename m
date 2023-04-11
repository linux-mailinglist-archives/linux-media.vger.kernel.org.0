Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354AB6DD439
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 09:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjDKHbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 03:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjDKHbU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 03:31:20 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900B235AB
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 00:31:19 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id m18so6969594plx.5
        for <linux-media@vger.kernel.org>; Tue, 11 Apr 2023 00:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681198279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GzxsqcD6Sc+PmDKvNFlBYwFz6G7VU/UIKdRlK8mGXOM=;
        b=GRxxPaU22umS1uYCV+9yikXUTklhnJwXYsFyC7Ty2O1dg5zmMg2kENcTCdlrPLiXPt
         sMk+n2UUh2nEEhR6eKCuOYB2E/FwmkdR6s8zMeiADGzaIs1NsvobqoO28c3zk0KI3v6z
         70otlDgu1WUGcdQk5zkwC+W2OLkB+3fGpJL3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681198279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GzxsqcD6Sc+PmDKvNFlBYwFz6G7VU/UIKdRlK8mGXOM=;
        b=K3de/G08SrIemzjNnaesDku3aIEEKU8NG0nyJLbPbxJ0sLc/b8RKACqKNFFyTpOL0I
         F5TIGYAn1xXO1ROF5u2Y73AYpZlDC0HXMQfWbM+80nBhHPRLcc0STcTWTuXsyvlJuWpZ
         e+3/y4PPWGmRt8HiZSDz5liBTBoPpZtHItyc7TdXyi/wWtvXEQP1m7RUkHn7vmjwfZ+O
         m8nfTlR6rAcXj6zQHV74v5iAQoce22riSO1jJaLKe73CjqheJtMucIVHV2w+qu1ukqvZ
         x9WztxLtOw/xquwNaDN+gVPt1GQPmKZIw67UL+mWG4zQ96L+at4+EssDQbOEkR7YkUS1
         DujA==
X-Gm-Message-State: AAQBX9cttQ8KD7xmx0KzyUdqP88Ilk2Zt3y9E7eLpdVX44FYDUx1uqyd
        jZb6EeQuqe+jwEeHFlX+Hre+3w==
X-Google-Smtp-Source: AKy350aM66w5ZHFyQ8qUOmWgv3xl6EqbRj5xvGyndQBvZSs7W3lqF5xWQPnEQ0eXwHqWO2Gb0/KXQQ==
X-Received: by 2002:a17:90b:3b85:b0:23e:7254:e319 with SMTP id pc5-20020a17090b3b8500b0023e7254e319mr16975542pjb.39.1681198278987;
        Tue, 11 Apr 2023 00:31:18 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:44a9:ac98:7606:2cd0? ([2401:fa00:8f:203:44a9:ac98:7606:2cd0])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902a70200b001a04d27ee92sm7082700plq.241.2023.04.11.00.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 00:31:18 -0700 (PDT)
Message-ID: <c6d5be4c-42c9-b8fa-fbd7-108c5da694bc@chromium.org>
Date:   Tue, 11 Apr 2023 16:31:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] media: vivid: Add webcam parameter for (un)limited
 bandwidth
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <20230410063356.3894767-1-mstaudt@chromium.org>
 <20230410102350.382f7d02@sal.lan>
 <6aafad18-13a2-ef45-48a1-1f094554af31@chromium.org>
 <6ee01cf1-5a8b-081f-e218-8c7da39343bc@xs4all.nl>
From:   Max Staudt <mstaudt@chromium.org>
In-Reply-To: <6ee01cf1-5a8b-081f-e218-8c7da39343bc@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/11/23 16:26, Hans Verkuil wrote:
> I think we either use this bandwidth option and calculate the max fps based on
> that (basically the bandwidth divided by (image_size + some blanking factor)),
> or we keep it simple and instead of going down two steps in fps we allow up to
> 60 fps up to 720p, then 30 fps for 1080p and 15 fps for 4k.
> 
> The fps values currently used are a bit outdated w.r.t. modern webcams, so
> upgrading it wouldn't hurt. And this is a lot simpler than doing bandwidth
> calculations.

Do I understand you correctly, are you suggesting to simply update the 
FPS limits to a new fixed schema, and not have an option at all?

I'm happy to prepare an alternative patch for that, too.



Max

