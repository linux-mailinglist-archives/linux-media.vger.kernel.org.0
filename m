Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7241E330027
	for <lists+linux-media@lfdr.de>; Sun,  7 Mar 2021 11:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhCGKoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Mar 2021 05:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhCGKoM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Mar 2021 05:44:12 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABC8C06174A
        for <linux-media@vger.kernel.org>; Sun,  7 Mar 2021 02:44:11 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id b7so10215772edz.8
        for <linux-media@vger.kernel.org>; Sun, 07 Mar 2021 02:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1L22nSALcMx6xDY0rD3F8rEHl69lGd1zqnXWGsmD2SI=;
        b=bsXT1UAyLmdJkKGECN4F/anELdrXqs0Ct23sakhVvvcOvUC8cySY/y8iFmPeOTFpNH
         fxju8cfScueYzdh3GxISmNrS9ARPCC6slsxW0dztkdHzOiTEYQaPufCn+/bwi8kf8pZl
         PAmQF/JGVM3NXKrkjifQujk9FTLmg7E8XAqHKwoGwjn2AqbiujGMJPVh76vX2jUQKxiq
         1wobWFNGVyfm21pnTA8L+y7BRXVhLCN0S89UkGvf+llMKynKNcBA3d7b1MuujihBGysR
         34YmZzedjw2OWEHCEF6lrzbJ461NiJMYhWBfyj8jncyMbnYlAtkLn3WKQGMk5bfiRC0k
         uxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1L22nSALcMx6xDY0rD3F8rEHl69lGd1zqnXWGsmD2SI=;
        b=bH0a5LA2gt/NtINBnb3RhoMmmEa70XLehhNM0QdFhueDeNCwxkOGZ2JCSgtd8RLf4+
         T/8ExmoPhvhwzLsbxoGQvjIpUBWHyTE2X43pysXyovSkWY62IBGgm4fwrjNkq1FgDd6x
         rXpsYBZn5aDIHbC2Ujso7mnwGZ0UWtNRL9P2w1mzXbTPwSF0E9//SLYtCINDUY7Jthuo
         T3mZFY/mPgcJjHxRzlhzzhy/E0rvRS2WOtvgHqaOlRBe7Bq7zOYw9SKty9AM5kLeQ5Gh
         AuHfRECruZgh3lya2p/7fQ7UCHogEE1QVb918H2OvgZTmKeYTVnzjYRQTR6+ANvXB4JY
         BlDA==
X-Gm-Message-State: AOAM531iU0ePVQtT40YsMpoPMaySg5HhQcTLT1ZTROzxXyyxzSRVhLT+
        kvj8vv9oWXVKyvbnH0oMlL6fIg==
X-Google-Smtp-Source: ABdhPJzseGcZRPkmGP5yOzwj3KqFP7N6WaeEuvWI8Aa7DmVB/9hjXrOk7jTuBKO6cSIy9jo4WBe8Jg==
X-Received: by 2002:a05:6402:26c9:: with SMTP id x9mr13303089edd.322.1615113850382;
        Sun, 07 Mar 2021 02:44:10 -0800 (PST)
Received: from [192.168.1.16] (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.googlemail.com with ESMTPSA id k9sm2808558edn.68.2021.03.07.02.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 02:44:10 -0800 (PST)
Subject: Re: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during
 venus boot
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
 <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
 <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
 <3e259bbd-66ee-f50f-f9eb-e788c9c311af@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <6f0ae7bc-f01a-f10c-aa41-6dbee4e80415@linaro.org>
Date:   Sun, 7 Mar 2021 12:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3e259bbd-66ee-f50f-f9eb-e788c9c311af@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/6/21 6:48 PM, Bryan O'Donoghue wrote:
> On 06/03/2021 15:01, Stanimir Varbanov wrote:
>> Confirmed. This produces regressions on db410c (I haven't tested on
>> other platforms yet).
> 
> db410c was broken for me on the reference branch prior to sm8250
> additions however AFAICT this change was fine on sdm845.

I found this after I fixed db410c issues.

-- 
regards,
Stan
