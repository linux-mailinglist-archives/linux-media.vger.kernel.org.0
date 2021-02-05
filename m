Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BC33116A5
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 00:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhBEXJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 18:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbhBEMPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 07:15:31 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0C9C06178C
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 04:14:50 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id 7so7512865wrz.0
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 04:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2sVpw/Ilm0KnpiFsmLHbM4e+ReVA/N71RFFlYJCi6Jc=;
        b=BB7ALc7sbCHtH1mv+N60GaVRHeBWzmnWHyy9GHAu0+HnEZRTe2hDxu60TGg/CntGow
         PXwmSKAren/fPwW78lkaDllUHZ2ZnCEkxXh4EQ+cVQTU39vLdkBJ2docqsa74xECOm5D
         tHXU45AE03NZSQiVv6yl01GUf/2ux2ytvffYlNyWsJFm8/UyoRaaPwgU1/0U9LNLO6st
         yQx0UYGMOs24EOf9Kk97ely+uuGzEgGL4/6CgLZ5ideldCoZbBsnvSgRhwsC2v02ptYi
         HdHJKWu3/eKIzjqKey6BBl2ImTn/qy7CkWiluMVpeaKsmTF16UwiZGSe+xTNfJA3gWtt
         H5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2sVpw/Ilm0KnpiFsmLHbM4e+ReVA/N71RFFlYJCi6Jc=;
        b=dFJWPQO4NuhS3pgmVPzDVAZVcvgm39H89oLvilxy9qCYSClk5lro9TJTtOcO/8EVo5
         2hrJNTiVgZ+NAMOeI0uvcIf5KOi+ixECVvy/vZBI1LguxLgHgXOTE35/dQ2nAcUW7mNP
         ek0gQu/jB2X3ku55ynJvfuDuRSxHGII3XW+UV1U0wtPUUbkQwS3FSelWyZ6lmhiZZ9Y0
         MxmW01YT+lgonqVlHWEBnpm8LFKuKT9aSijq9MqXjeVUTAE/xvgmrz3gEMg9ZoGcPkyG
         Eka1LRcACLak6aMn3/AQMu4vI0TNSQ8Qm8YKtTw61OKRqMHGKyIQA0UlmL1Rc8CQB8JK
         5tWA==
X-Gm-Message-State: AOAM532cxMFUc5TCTIUDf4H/uN82MeopwI9KG2Oo7+5wKujttNxAFV39
        pa3S4zZ9aEbPM9ZZpvGUN7Ekrw==
X-Google-Smtp-Source: ABdhPJzKK4p9VlSBCj/6RXVnS8gpIG2x+6hUraDqzjA2Wwgll9c+czXiR3yHJjjrNuwF8J5hBM5t/Q==
X-Received: by 2002:a5d:414c:: with SMTP id c12mr4845606wrq.251.1612527288915;
        Fri, 05 Feb 2021 04:14:48 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 23sm8549833wmo.47.2021.02.05.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 04:14:48 -0800 (PST)
Subject: Re: [PATCH] media: venus: core, venc, vdec: Fix probe dependency
 error
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org
References: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
 <836fac64-81b3-2048-c440-8c41cd185e94@linaro.org>
 <e2d89409-6691-e98c-1f68-fcdc63d26be4@linaro.org>
 <b0adc363-c5b0-e7f0-5e1c-ea4d33f6d0f7@linaro.org>
 <d7d114fe-6255-5672-e91c-2558d56da745@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <2a905877-9475-683b-7ecf-7328c1f6cfa4@linaro.org>
Date:   Fri, 5 Feb 2021 12:16:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <d7d114fe-6255-5672-e91c-2558d56da745@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/02/2021 11:52, Stanimir Varbanov wrote:
> Wait, venus_runtime_suspend|resume also relies on that
> dev_get_drvdata(). Can we call v4l2_device_register() earlier in
> venus_probe?

I can give it a go
