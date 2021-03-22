Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0CE343EB5
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 12:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhCVLAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 07:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhCVLAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 07:00:06 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B43C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 04:00:05 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id j18so16184948wra.2
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ICnw4Q6ScWNL6PtyPFFk5rheoDGuTa0jd4eD1tJjj40=;
        b=Afb95JlguiDobG2yj7FOJuKQ352X+2frVQRdcq8CqU1hzq3pICVHmCg6VA5kLwjnMk
         0mE/KkVSPq9WdL9T8/HBRqmc62vaFChm7t+OksSw0aUaHMbsyPIIBzoFeDF/AkSKMiih
         y+sHWdBPfMfZDNPIhqzp+bE0/NGW0daa/iXBWco1Nl8BpHLNkfeHflryeMyblfp6WKbs
         OwctomfFT3IlBjwHVYaygRknCXbYzHYwPs/ZlsDDHhzHLjuHxlDqs1R/3geihmzcx/3R
         oEjJdjlbnM+MKxNbDPleTP17rFW7Gp/QC3k/FDD23iLYCSEO+EQQP2LHnVi0RB6eVlHd
         1w8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ICnw4Q6ScWNL6PtyPFFk5rheoDGuTa0jd4eD1tJjj40=;
        b=kgop+gTH281D8zLfDxvw4riM0kZGZAGJF2SrYJsn1vyUKb18HNKQYZt/vKTSY237qK
         NZCLrP/79jmKKA4KolHVVP7wbY14u2+JDnLh6E3ON6KAs+XANZj+/ybwwrkXjX+mViH6
         bpOip9uYULQQFPywOH9RoM79eyqQqVA1qWeo62M97wPMV0Kij7suExSVN880V9/oG6Xn
         GnlU6LgjOtzj719/vncNLyAbLP82KXNta/AKDl9jRGWS22gzssHF/9+1Vxd5aHQC3gea
         YFnD8k8p5d7YkOrtHhEfheDoiChiSKEfV15aVhUDWyfOKWWFmbfGZZN3iG0h8rpBwP7D
         SpMg==
X-Gm-Message-State: AOAM533rduw8JWogOhcCVwKNByH2PZwjQZhfXAh4lhJPNapuA2nBDXaw
        BK4nxW+QWp6si8kuZpSNjIzChyb/UxzW0Dxy
X-Google-Smtp-Source: ABdhPJyYi+mIGf66dkBMggGfDkqIkSxKw82mIBURXl3Qtw6nNdQPuOHONxcbl8IXK4/cuqciZ63dqg==
X-Received: by 2002:adf:e60a:: with SMTP id p10mr17671576wrm.291.1616410803989;
        Mon, 22 Mar 2021 04:00:03 -0700 (PDT)
Received: from [192.168.1.19] (hst-221-90.medicom.bg. [84.238.221.90])
        by smtp.googlemail.com with ESMTPSA id i17sm18722758wrp.77.2021.03.22.04.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 04:00:03 -0700 (PDT)
Subject: Re: [GIT PULL FOR v5.13] v2: Venus updates
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <20210312085716.2435846-1-stanimir.varbanov@linaro.org>
 <20210322111309.2b3ce16a@coco.lan>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <4d95bef0-c5cc-0bfb-8c25-36e918af5b75@linaro.org>
Date:   Mon, 22 Mar 2021 13:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210322111309.2b3ce16a@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/22/21 12:13 PM, Mauro Carvalho Chehab wrote:
> Em Fri, 12 Mar 2021 10:57:16 +0200
> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> 
>> Fixed checkpatch warn/errors.
>>
>> Supersedes https://patchwork.linuxtv.org/project/linux-media/patch/20210306162903.221668-1-stanimir.varbanov@linaro.org/
> 
> Don't do that. Instead, reply to the patch you sent earlier, or change
> it at patchwork to "Superseed", as I handle pull requests in the order
> they arrive. 
> 
> So, by the time I handled this PR, the previous one was already
> merged, and another PR was added afterwards.

Sorry about that. Note taken.

> 
> So, too late to revert it.
> 
> Please rebase your PR on the top of upstream and resend it.

Sure will do it. Thanks!

> 
> Thanks,
> Mauro
> 

-- 
regards,
Stan
