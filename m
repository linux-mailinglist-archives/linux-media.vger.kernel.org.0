Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95EEA6B8BA3
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 08:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjCNHEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 03:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjCNHEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 03:04:02 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5619A2659D
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 00:03:45 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id f11so13311177wrv.8
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 00:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678777424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kn2fGwJZKDLC3NranQ3ChxZGwvFH+NqBZkMAG0z5pZE=;
        b=Dgh+JZnGXiQYv8bSxvdjUj143FE6LeaMfsJX+Qdm4VgFqDM1Fo2FLLs+Hfva0zY+DL
         Rvd6ROCxyCb/dSLn18s0ofweJQ70s/iYKTnrBQ9TAHuBW2eaKbwh+axOFkkbdfWfMPlY
         xMlV0AFWFHAO0uPzUe0h4JUI4He3jW6UzyhlG1E5vc9rA8KBK8C1qxNQeZi12rV3mdqJ
         lHLhtr+wiX1mXQdow2CTyPlEO4mP8WiyhHhdSJ9Q9xsYFkB1D2oqZQ7lgs0T5gAYCnx4
         afQ3A/Anrx+jv2HSH4ZE4dHFT/EKIX2XlxNWfsl+EqQ1kW4sH7HYifVKw2q1SZt0JKH3
         h0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678777424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kn2fGwJZKDLC3NranQ3ChxZGwvFH+NqBZkMAG0z5pZE=;
        b=ha+vH43DX5tGNzUeUVQMqP3KbkaxTAIMw0LJ4BmDQFyT7Il6ui/NZMSjL8q2Y2SCaq
         NnzvAwrBRyR3La9qLsSkAGc575xeXjVKbr/rIOaSWn8pd/0TqSgOFs/lME4cNJJStrGv
         9eZoou8eHSHGR4j0Wa1VLQYWuTz22Ud6XPB+ixVOa7eLbs6T5wyRr1Tz4vvyMrvCOaga
         jN1xU8qfxs++P6/aIRpd6efJWCiH3hcMtTcCr8E1EYRp1Ri4b9YOSMCoNDnv3W3BuNPm
         x6FhxIhWemR66qHLuIbdPZuYiK/I+j6e3sFk8DfJQqdt1hgQaLZ+DHoMHhMmO7FCWrfb
         C8RA==
X-Gm-Message-State: AO0yUKWxWzw64XVIER9uKknHRUb4VRVW5mGr77GOmH034hAeKcGXnasl
        t+HbP/Q1Tci8CY0/yArMNM6TrE6Y06c=
X-Google-Smtp-Source: AK7set9B2+syRnT79wUL0lYb8v1AY0hqN8r1imJl3JNyGilhi0qSouyCy1omYFg+GDZtaPUEOWFzgA==
X-Received: by 2002:adf:ee90:0:b0:2c8:9cfe:9e29 with SMTP id b16-20020adfee90000000b002c89cfe9e29mr23335925wro.38.1678777423593;
        Tue, 14 Mar 2023 00:03:43 -0700 (PDT)
Received: from [10.228.210.75] ([80.156.160.146])
        by smtp.gmail.com with ESMTPSA id q4-20020adff944000000b002c552c6c8c2sm1240166wrr.87.2023.03.14.00.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 00:03:42 -0700 (PDT)
Message-ID: <7d321523-bef2-f89d-7420-4597b7ce26d6@googlemail.com>
Date:   Tue, 14 Mar 2023 08:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
 <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
 <20230312144903.GO2545@pendragon.ideasonboard.com>
 <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
 <20230313081100.GD2545@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <20230313081100.GD2545@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 13.03.23 09:11, Laurent Pinchart wrote:
> If you want to give git-send-email another try (which is still the
> recommended option), https://git-send-email.io/ provides instructions
> tailored for different distributions and e-mail providers.

I re-did the setup at home and it worked as expected. Turns out that 
it's the company firewall which blocks git-send-email. Surprisingly 
Thunderbird works with the same host and port.

Thanks for your help.

-Gregor
