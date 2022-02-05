Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D484AA613
	for <lists+linux-media@lfdr.de>; Sat,  5 Feb 2022 03:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352271AbiBEC6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 21:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbiBEC6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 21:58:44 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67BDC061346
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 18:58:40 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso10603493wmh.4
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 18:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iGtpqcp1nHTS80waP6AzkzibIOxQhqD+Ab5mRyforrU=;
        b=Mx7SrGWFZb350t8S4ZKdmBAAl81kfjQpbppGEMYVxgrpeouyUEM8ucUj/RzMMgBv9e
         OjFsqyGk3jZ72RrkEcWpJg6REmTtKG+5dZllyYe8SbkMwSPM6iztNdtvGY1yRN/axugV
         FZppoJQ3Ul0OwSiWinynLh7CxqvapjnTnmDGrvx0JD+c6Wlc3kQIIogYxbw8m/sskspH
         j8RzEm4exFw8BKwHfWsge6CfBg5hY2EyVnsU6SIaOPnPsOJNF3kHQWGH0FQQC27jYjqx
         9EviOEkieME90XE/wN8gb1BBiktYCjPMEk4Qbkpf6h4YIQnl1zaRJMyAnrR4wWeE8OUZ
         VNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iGtpqcp1nHTS80waP6AzkzibIOxQhqD+Ab5mRyforrU=;
        b=h9gfkdPaxiOhXu8sDL5Lr0s6JWcm54F09R+S9GutFXd30PwlYFLs9vg0zJHnX4myZe
         QmpJsfYD2WktxeGrCBq0iI/LoxNqXuA2TtZsZa/usvKj2TrvyrpoPyuUg+4JlUtxM0Qd
         dhdWmSr49N5/TG7EEESZysi+8sonJHBzaeOWgvCSW/n7X/AysODPCG1/uVoweYOYwLpp
         dxn6GfgVw1UEGhM5YZt6H363jqTlFg6wdId9YAbPPYe9RTVkfKKKZdCg9wftMf57fHCa
         mzXxPHr7ltbe3Z7siXzWS/rinUCSMe7jZKvesxUe2Pvs3T4WyaytUyp+Z0iPr8EN22jL
         RBNw==
X-Gm-Message-State: AOAM531ilG6cPYShd5zMLgpa7K6BqtN/yRfxLzHPQIdRHDfb5hC8Ivut
        NnZTtIqsQWDvzMW8HM3MCMCkVw==
X-Google-Smtp-Source: ABdhPJy2PjTZnYDHNFOhpwZFISfWQNB/U6N6fWmzQBFkOmx3Px5mK+uEBU37uS1cq25i4vPYVJ162w==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr1292714wmg.4.1644029919074;
        Fri, 04 Feb 2022 18:58:39 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h18sm3965302wro.9.2022.02.04.18.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 18:58:38 -0800 (PST)
Message-ID: <a71ea5e6-30f5-827b-413b-f2b39e285a6c@linaro.org>
Date:   Sat, 5 Feb 2022 02:58:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 0/8] camss: Fixup multiple VDDA regulator support
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/01/2022 12:52, Bryan O'Donoghue wrote:
> V3:
> - Adds Robert's R-B for 7/8 patches
> - 5/8 should be a NOP, for the sake of procedure left out Robert's RB

Hi Hans, Michael

This still applies and works on 5.18h any chance of getting a PR ?

ssh://git@git.linaro.org/people/bryan.odonoghue/kernel.git / 
br-v5.18h+camss-fixes

RB from Rob Herring and Robert Foss - included
Vladimir gave his tested-by too

---
bod
