Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63F21919CA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 20:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgCXTUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 15:20:05 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39454 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgCXTUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 15:20:05 -0400
Received: by mail-lj1-f194.google.com with SMTP id i20so7794941ljn.6;
        Tue, 24 Mar 2020 12:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=skcCG2QHTd+EzEBtFrASrhFP0Iy2GqsEnBeidQvJs00=;
        b=lNnPCzPVQ23JfLuXiGDK1zzejW9N7ZjGsOBuBBj5/Mo8tHopaI9xdhmNJkp7cjDfr2
         +GfMKXI13LF8LrC8iwuP+4I2CjAc6N/I1ZYahcNLNsqVg58Xz5eKiyjLoPMIylJ4DXRc
         rit6/Zloqe4yM6aZUJKR7B90BrvhFmekimUb5kFLMLkJ/Ov+8ZXLWFQoyZlklhLH2TMT
         6l1pr67QAC0+9EkPawhKyscWrJ+Wu2VqkipUEM38gZCL/q4lZoFEA3LCsKZsiMc+TcRN
         E0LD6QDyR3iFLzUgfKuiP4oJVp9h29AkwqFLkDETqnG9Zx8HoJX6eu7gjlZ5znQijthS
         hwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=skcCG2QHTd+EzEBtFrASrhFP0Iy2GqsEnBeidQvJs00=;
        b=S+rks27hVwdID1oKdeNBhH7J/1sS/08fr/86rWZEysSeweZXycGFjpW6WCBEBAHny4
         Upy99TwxTAc7mezB3NoReb1p2rNgSHA6j3Zsnc1vWcYx0/bL9vaZPVCcf1cxitPrgRcR
         ld7dZtBoKNxrRIWeA7tRDzV901+4bVWrQTzYyD5F7liUiLVNhVcu97paL50pJGvQHAMc
         kK8FgCW2YNj01sc43FZ/06A1jnT4dSTK3bxwhTZ3pYf8UNDu1CNbzs5Fi1YcY21fzSBP
         87K+FDPgRzmY3jg1rEDU/z303LyWS/EGbYwJNZ794VqC3rKq5PNPgQQNkT7AZeqErk7/
         092Q==
X-Gm-Message-State: ANhLgQ1jxuvoyfejSgB4QOHOoG8xfcCw3689Oww4XsMFQuEPgdU+jhdX
        enHgveLBinYa5Y5wtCWmL/9Lacyy
X-Google-Smtp-Source: ADFU+vt3z3fmr5IIMuRF8uor2xaYwQG2ck/m7Ac6qsciHHZxdL/2i5Re16nQGaFl6kTdI3iURuH+yw==
X-Received: by 2002:a2e:81c9:: with SMTP id s9mr2169449ljg.69.1585077602671;
        Tue, 24 Mar 2020 12:20:02 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id a22sm3245335ljm.28.2020.03.24.12.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 12:20:02 -0700 (PDT)
Subject: Re: [RFC PATCH v5 5/9] dt-binding: tegra: Add VI and CSI bindings
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-6-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2256dc66-f3f9-3400-85e9-0641729b1316@gmail.com>
Date:   Tue, 24 Mar 2020 22:20:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584985955-19101-6-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.03.2020 20:52, Sowjanya Komatineni пишет:
> Tegra contains VI controller which can support up to 6 MIPI CSI
> camera sensors.
> 
> Each Tegra CSI port from CSI unit can be one-to-one mapper to
> VI channel and can capture from an external camera sensor or
> from built-in test pattern generator.
> 
> This patch adds dt-bindings for Tegra VI and CSI.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 67 +++++++++++++++++-----
>  1 file changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 9999255..9421569 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -40,14 +40,25 @@ of the following host1x client modules:
>  
>    Required properties:
>    - compatible: "nvidia,tegra<chip>-vi"
> -  - reg: Physical base address and length of the controller's registers.
> +  - reg: Physical base address and length of the controller registers.
>    - interrupts: The interrupt outputs from the controller.
> -  - clocks: Must contain one entry, for the module clock.
> +  - clocks: Must contain an entry for the module clock "vi"
>      See ../clocks/clock-bindings.txt for details.

> -  - resets: Must contain an entry for each entry in reset-names.
> -    See ../reset/reset.txt for details.
> -  - reset-names: Must include the following entries:
> -    - vi

This should be a wrong change because ARM32 Tegra SoCs do not use power
domain.

> +  - power-domains: Must include venc powergate node as vi is in VE partition.
