Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4181439D3B
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 19:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbhJYRSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 13:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbhJYRSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 13:18:03 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C2FC061348
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 10:15:40 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g201-20020a1c20d2000000b00327775075f7so5752886wmg.5
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TUv9ZLhyPeiLA5e9mCDPN+eH77IxAWpHtAvBbtcYi+E=;
        b=q0ul8+l0c66kEq7GU+h4OytC/sWRKvNWw6JABwqmd0qB26iiRAa5dNLNqWA3WQOu0K
         i7hSqcwp+q7x4bdceWbS0EnxDvl/9MwONx0cDYQKyoSpr2ZKMkmfyDb0xR4Akbg6203/
         DAakQ0KmehSg3/Y3LJ32DtyTgG7/Bnnv8stZf+xQx2FVyy1DsnXtUhHyXACxay6yvCK4
         826Tye27PIyvoVVeOTXQqb8cYFWF9TI2mZyadNVH3trI0kXTDgalU0UsuDwIMlW2ySmi
         n4JFPwJ0uXmWzWWdSgPGdGFXPSLMZn4Syf0hqsucn2SUyCW3xJN0KMfSDS8aK4FB+uD3
         Brpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TUv9ZLhyPeiLA5e9mCDPN+eH77IxAWpHtAvBbtcYi+E=;
        b=bqRQ/lCQGr5K3wOAg+CpqCecUyTTePVsEzwWlEcWRP/F+FQPBB/7NBABirq6NRQZo4
         KC3A10Fbqle9eZ9Wrvyjr0vX4oGlZkXwTf4+lB6P1B4IhYn7CO9Ld1N7HEudAfKy2z+a
         yy2v6a7o0svlB3VNdFmkBq32IOobZZv4uPFodGcJ8zvEUJ7nO1BIuSZwYRnfvKAMllY1
         ESnTF5sW+3dLuJ3pKv1BGQdEIR2Hwb/nLQ0YsWleu9+0TJmh2pTcYnpPJJockCSyGRBz
         4NYnR1IDTGsmhWABS59x3sIT3NAWeyVOA8tycKxCIZ02vsyFzS/SdrJFWJN9g5RGCIHk
         6fkA==
X-Gm-Message-State: AOAM533KrqeHNmhceUlz8WBX4DWRjuaVNsarcVNDhK6W5pXqzOOFK36O
        /QEV8KHJL39cQuXIqd/Q3R/0Hw==
X-Google-Smtp-Source: ABdhPJyKUO7KJbcLmKgdW0slpjYxFo4/Vqi8UMU8JM7030QYXyq7MeAEbDy9hTrruVpAI19v0IRFXg==
X-Received: by 2002:a1c:155:: with SMTP id 82mr22571518wmb.191.1635182139160;
        Mon, 25 Oct 2021 10:15:39 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r1sm11855186wmr.36.2021.10.25.10.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:15:38 -0700 (PDT)
Message-ID: <fac70dcc-2dcc-6c1f-2f71-6936deedb091@linaro.org>
Date:   Mon, 25 Oct 2021 18:17:40 +0100
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
 <00b817a4-f1ac-6a94-5f1e-836d8d313406@linaro.org>
 <25da5210-8e1f-7183-a8e7-8584f8dd2cef@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <25da5210-8e1f-7183-a8e7-8584f8dd2cef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/10/2021 17:57, Tadeusz Struk wrote:
> agree, but I don't depend on of_platform_populate(). The ordering 
> between the
> three probe functions is enforced by the new sync mutex.

That explanation works for me.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
