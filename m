Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0165B3795
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 14:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiIIMXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 08:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbiIIMXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 08:23:19 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB24F4103
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 05:22:08 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id bn9so1600449ljb.6
        for <linux-media@vger.kernel.org>; Fri, 09 Sep 2022 05:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VeCVev6JRkF0fILhhxR4f7k8RVgJJHglXUA1RDYH9oo=;
        b=Rec0AlVqDR12djEEP1hx102YHNght8n8dZGMt5nz2eCzYMQqOvh+lBswI0ot9q1VeO
         Wf0vHhz/SOmC6ioYEPPT6qiHdbmB5gwIiydxA0iO/ABZHizp25BibFA1JjCwRFYwvXBO
         38KZhB/2qa0W3SLNo5eFdjlaOWgGON/rs1+YZ7WH0+XqtUJwyRrVTRO7q2nDEvSoD5BB
         afu9lDTcgT/EOtA2gi/ucO7cMFtJj0wIdo04GpDakAKamkdVEruyLA2ZmdQThTyCTPVu
         J1BADXaN/i0WinEw/HvqDvM275czDHmPS6whIItSwOVCapv2FJzi5SA3iWp6xtbhUl9g
         c63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VeCVev6JRkF0fILhhxR4f7k8RVgJJHglXUA1RDYH9oo=;
        b=LSNA9B4kdVZbBwF54xhTRR0oCdBT6csLpJAELKzuDXTQmEUfr5n/gSaBX/wIP5fQmh
         tW67VrvKFBrvrW2qcHGpM5EG1IXfEfbkftCW3/1DMJA/svwBU6cxZ3YKHf331cEISN2H
         GKu406aL906EMcFQKzMJfTalA8uBYsBAwUCw0HTnnDUMjHkj/DuW7Uq9YAckthHBz9SH
         p+8d534i3jrLulPr69EDAc1mwQ44DA9feFfk57bXuGGevOzCncQcS052T3xj3kHsjcgT
         I1KtS/EbFVLfbosGe4JwGs/bIvgoIVartAjvdJK5yJ+CzKQLuBkJ8HZFc4cYR0Qqr00S
         1/Tg==
X-Gm-Message-State: ACgBeo3WRBMiSo6eCWfnTkG5lLAhcW2uAAPAMI3JlKxhlghjpbX0rJb8
        2kMlxGilIS1CkpELl3QEAr3Rcg==
X-Google-Smtp-Source: AA6agR5lXR8yxhVZdUuw1UBWIm3PxMyGTH+43HbjTVfR6oBVo7dFGyvpomIDSHxnZ4rel5W5mGcFDg==
X-Received: by 2002:a05:651c:d1:b0:26b:66d3:21f2 with SMTP id 17-20020a05651c00d100b0026b66d321f2mr2482373ljr.59.1662726126582;
        Fri, 09 Sep 2022 05:22:06 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id c7-20020ac25f67000000b0049462af8614sm61329lfc.145.2022.09.09.05.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 05:22:05 -0700 (PDT)
Message-ID: <8bfa851f-6db6-47f1-35e7-806dd51666b4@linaro.org>
Date:   Fri, 9 Sep 2022 15:22:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH 0/2] media: camss: Simplify and improve power management
 of VFEs
Content-Language: en-US
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Robert Foss <robert.foss@linaro.org>
References: <20220704221548.629302-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704221548.629302-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/5/22 01:15, Vladimir Zapolskiy wrote:
> Since a rework of CAMSS power domain management for newer platforms done in
> commit 2f6f8af67203 ("media: camss: Refactor VFE power domain toggling"),
> all operations over CAMSS imply enablement of all power domains described
> in the correspondent device tree node. Apparently it's too excessive and it's
> quite a complicated scheme to allow simple addition of newer platforms with
> even more power domains.
> 
> I would appreciate, if somebody can test the changes on db820 for any probable
> regressions.
> 
> The change is based on changes in clock framework [1] and on a recent fix-up [2]
> in camss.
> 
> [1] https://lore.kernel.org/linux-clk/20220519214133.1728979-1-vladimir.zapolskiy@linaro.org/
> [2] https://lore.kernel.org/linux-media/20220704220814.629130-1-vladimir.zapolskiy@linaro.org/
> 
> Vladimir Zapolskiy (2):
>    media: camss: Collect information about a number of lite VFEs
>    media: camss: Split power domain management
> 
>   .../media/platform/qcom/camss/camss-vfe-170.c | 20 +++++++-
>   .../media/platform/qcom/camss/camss-vfe-480.c | 20 +++++++-
>   drivers/media/platform/qcom/camss/camss.c     | 50 ++++++++++---------
>   drivers/media/platform/qcom/camss/camss.h     |  1 +
>   4 files changed, 66 insertions(+), 25 deletions(-)
> 

Gentle ping, I hope the changes are good to be included.

--
Best wishes,
Vladimir
