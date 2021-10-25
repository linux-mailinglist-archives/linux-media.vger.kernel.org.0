Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CCD439B18
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 18:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233844AbhJYQEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 12:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhJYQEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 12:04:15 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FE2C061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 09:01:53 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d10so9643315wrb.1
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zMkg/0xA2M5G/rhCUOwOXIDgsrNS6y7y/a+diRyWYzc=;
        b=x6efCHXNxaYrirQVpspZroKoKRD7/1SgHGFiUxfs4LIlHXrgby1/xhprQ9XHEfRHiO
         KgIje9no8GY375bClUsmuMiAqJHd1zqphUCi9ZcLISCqrgsWVNP4DYdb9qptXCqJpLfu
         xdCl4qAbJDSZVP+dYrxcAESmtkX1tSCtWP6nGmyxCZntSCgUBDsqXvAuTTUJ2+cg2f4g
         tYStffmQyW/K1uH/ftQtJv9zoDHPyNr5Rz6hIuMVOlWsKUdOSfHmTz1yGRgPDDDpkYHf
         rNvT14S1GkDZ1UKW3qww3WE6NIstZTmuwqU13idA4sJmAOgyy0UJA0U6Z1eMH3Ea4/6U
         9MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zMkg/0xA2M5G/rhCUOwOXIDgsrNS6y7y/a+diRyWYzc=;
        b=3FawRvh4jGfo2KwMRibzbMc8kOi1l4TmXazky6t+kolRIj214U5L6ZhVhmh76EARXO
         R5aKwgcAdmq+edEnQqgLX6VJUTfRFzaWLkbtQlViZ5huAYPPXKQUhzRzk+tbENGVP2ab
         RX2WwKh7oByg6siPNtZrHqETvkbVG19CIUXL4H+cOjeTgm9dyj8RWFp9Sgi1dpq96S9S
         EructF2We7HXqjxWd9dfH3TccRkeXeo5sDpv1DhesE9/wikyX00m41uSKRZvOeREXCmQ
         uZRgFc17SjewKUiWeWqFLGnabevTg20LFamkLeSgt8en2C1zB8SnJ1GgTuoyWaG5rKhh
         jU5Q==
X-Gm-Message-State: AOAM533QoRDHLolHzfqfOY3LJzcA45B5PLX/OA2jpkBOxVm+2eksdDb6
        8DchipRgN0PGKtLntz2XCY0PQQ==
X-Google-Smtp-Source: ABdhPJzhIfub+4l1wiD7yr36/+orUeB6LL3rR5ftkCBdo6TCfFkDiInNpCKTsodqMrJ3eu2Sixr3Sg==
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr24785718wrx.419.1635177711769;
        Mon, 25 Oct 2021 09:01:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r11sm2165904wrx.79.2021.10.25.09.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 09:01:51 -0700 (PDT)
Message-ID: <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
Date:   Mon, 25 Oct 2021 17:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and
 enc/dec
Content-Language: en-US
To:     Tadeusz Struk <tadeusz.struk@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
 <72f8dd7a-66c7-fb50-db23-f98ba753af1d@nexus-software.ie>
 <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bba3acc1-cfa1-0c53-75de-f4ffa0a2bc9e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 16:30, Tadeusz Struk wrote:
> No, we want a hard stop here. At this point the venus_core probe()
> has finished and it failed. Returning -EPROBE_DEFER here will just
> cause it to loop infinitely.

I don't think there's any guarantee at all, that core probe() has 
completed at that point.

of_platform_populate() doesn't guarantee ordering of the probe() 
completing before or after the probe() of the platform drivers that are 
associated with the devices in of_platform_populate().

When you think it about it can't do that and you wouldn't want it to do 
that since a device might have a legitimate reason to EPROBE_DEFER

As an example core could call of_platform_populate() and then as a 
ridiculous example go to sleep for five seconds - in which case it is 
perfectly possible the encoder and decoder probe() functions will bug 
out illegitimately waiting because of core->state != CORE_INIT

This is a problem we have and still haven't solved in 
drivers/usb/dwc3/dwc3-qcom.c::probe() and child devices 
drivers/usb/dwc3/dwc3-qcom.c

Here:
https://patches.linaro.org/cover/470387/

There's no serialisation guarantee between parent and child on 
of_platform_populate() - at least none I'm aware of.

---
bod
