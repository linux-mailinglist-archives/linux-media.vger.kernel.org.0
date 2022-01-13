Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D16F48DB09
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 16:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbiAMPw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 10:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiAMPwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 10:52:25 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EE7C061574
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 07:52:25 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c126-20020a1c9a84000000b00346f9ebee43so3939324wme.4
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 07:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SgcOpXh1pxlgSzIp3XmGJm83Ks9LbrZSIgOjQSvINJQ=;
        b=Fp9xvKquNaJTX3rici5+6iSTVYL3Hs7wNSK2RAegVEBpZybov9/HTaRj0/uOLSRF5j
         m4sV9lRXCRXNQtVXf5pcgA2dBgVTXKRBfsu7plcUMDq2APkoJ54otJ5ukd2c0SpbDoZq
         R4NGRcwXnZyeKyo1lNEhfoQcE+56Z49XUy/GuwZTBQQophNDaESUQdXhhxS8BtlPzAZ0
         Ugp0sBcdCQs/ragzy9tPmE4gzgjPaEWcOnJ+L/fEIeYeFhblhR4UcWVy/A8no4V1oz39
         YoHLTK/xwBi4mg+opWnyifzxAUxmmasDx1vWf2kvuMTKrudBoTtxntb7QxQYYMAPsh11
         XchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SgcOpXh1pxlgSzIp3XmGJm83Ks9LbrZSIgOjQSvINJQ=;
        b=4vRL3NZXlUgt1bRfBYOfkiqShi4CEA/CDTcAFIj49l2AZk6yVlQ9eN46dTs+0dZ9Km
         fEuB3xRyq0Xn9DI/LXDHWeqoQV42rBpyXEtzRilVmPVlEclH+OJZruG2ZuZSqJf9sQ+S
         7u1auBtmcX+/IplUKaQJ4Q5wOtAu2o9wHIlXzjyR2oaDbtGeWny92z2zexkYwuR3Z97f
         satLWpH94JyLUdHMYeNWcGc1z03/Y6i+wVwWKnGqsXaay1afHGnkvGYBTGhFLM6d8c7/
         04umGHIlbtV08mijMsPR/zaq2nyfVadeDfq8c3bIn3aH8mpRCW2Gfw77e9pqLqEX3Mig
         x2Qg==
X-Gm-Message-State: AOAM530Kwl3WAOkRmjFu5ATlhpOLx36RANtOdsHjsR6baT2+bC+Vkx+n
        G92UaTUKEK6rIeBemdh/0zDjACQ1OK/tKw==
X-Google-Smtp-Source: ABdhPJxIJlhMMRkRBs4lCyJQrSjKQdyEa7ANS0wTvwh090E2AO2Wghq3FXxFQlLu93nX5hYpEhEeSQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr11687718wmj.169.1642089143464;
        Thu, 13 Jan 2022 07:52:23 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bece:ab45:7469:4195? ([2001:861:44c0:66c0:bece:ab45:7469:4195])
        by smtp.gmail.com with ESMTPSA id j11sm4009125wmq.23.2022.01.13.07.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 07:52:22 -0800 (PST)
Subject: Re: HDMI CEC on ODROID-N2+
To:     Stefan Agner <stefan@agner.ch>, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a072cbe4-f922-a98f-14d9-270fc4c72d8e@baylibre.com>
Date:   Thu, 13 Jan 2022 16:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


On 13/01/2022 15:36, Stefan Agner wrote:
> Hi Neil,
> 
> I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
> I was unsuccessful: As far as I can tell cec-client uses the right
> device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
> missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
> sub-driver"). But communication won't work, and dmesg prints timeout
> messages:
> 
> [   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
> [   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
> [   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
> [   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
> [   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
> [   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
> [   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
> [   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
> [   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
> [   89.566130] cec-meson_g12a_ao_cec: message 11 timed out
> 
> I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
> CEC seems to work there. So it does not seem to be my hardware setup.
> 
> A quick test with the latest Linux 5.16 shows the same errors.
> 
> Do you happen to have an idea? Do you know if HDMI CEC using upstream
> kernels worked at one point on that particular platform?

I was reported it works on Yukawa 5.10 kernel, I'll have a check it still works.

Neil

> 
> --
> Stefan
> 

