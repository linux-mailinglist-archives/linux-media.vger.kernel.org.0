Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE842C449B
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgKYQDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKYQDE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:03:04 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C043C061A4F
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 08:02:48 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id x13so1846489wmj.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 08:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=faq1+9tTPdxCtY6FguahbIN67FRejTlywlCZQqt2oe8=;
        b=wh6ZKgptF2+qYD0yEthHOAgj7pIBNSvshKJII2U46GmfjCiXOs87Toyd06mWtOIPRZ
         gZgguxqEWZHChR41Q8h7pejygqsWzIiC7Gtpq8UF9pHIKzwW4vLB+kJ13J3MU4UZKtSx
         5UghkCEAH/JrOEjHtYSg6quRzQfNbxeECYLLe9JtVO0l3R5LdO5+EXRJ1i68QaqKCQzZ
         Wp7pDOPgit1s1rTCZy4UqrPeVYD/Pu/MCnCTRSaVA8QTmEIG08IpzJ/Hhajk9P6BolrC
         d8Ut7Xd1Wvd00VGgGgqRYZ1KMMfSSPL+P46QQjVt//IWvoQzDG6zs3iGkNR7hPk7y3en
         yoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=faq1+9tTPdxCtY6FguahbIN67FRejTlywlCZQqt2oe8=;
        b=NBIzTL9BN3DC34dXwHHsCIeOvoPfZD4F9sJUD+8MUXLdOJ3szzOMPE8QK638ZO17zW
         smEXqUan5KN7r+2W2XNP5Jkp+/jtKdv0jCEfNktTzjBC2h8Es+J+Rsfrums8/1ANY7IF
         /vSeXzyRy4NkY/K7y6OcpSlTFhNBsl4WuyqOwDs82o1O3OigVS5XRwbaJEVIyg9+d3eY
         9m5U617q3F3w49m9zgENROqfmDs4rDAE0y3ZSpPCIfzuyxYFw1UNFJRvzQJ5IclkxaME
         DUlFU7I+Q9qKfrXwH1fZSwa4hogfINBQCCYHhTXBZC8BskY5cFeYAJFQQDRcfJ4kmCNw
         TeSQ==
X-Gm-Message-State: AOAM5321jn+ARutAUz9CfG0dkESVfOPEgt1KKaMb66vKR2VW8cEs5/NB
        aY6JTAqMkZh7TqnwHIafR0Runw==
X-Google-Smtp-Source: ABdhPJyQNKoY/euMK6ZNcUesyn+9MjGKx1xKvWODLY1oc209ES/XbDBtdKUVvLPEyxPL5ITqdOlyWw==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr4703972wme.51.1606320166784;
        Wed, 25 Nov 2020 08:02:46 -0800 (PST)
Received: from [192.168.0.3] (hst-221-81.medicom.bg. [84.238.221.81])
        by smtp.googlemail.com with ESMTPSA id k16sm5581374wrl.65.2020.11.25.08.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 08:02:46 -0800 (PST)
Subject: Re: Update venus firmware files for v5.4 and v5.2
To:     asitshah@codeaurora.org, linux-firmware@kernel.org,
        linux-arm-kernel@lists.infradead.org, mchehab@infradead.org,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-media-owner@vger.kernel.org
Cc:     vgarodia@codeaurora.org, dikshita@codeaurora.org,
        sampnimm@codeaurora.org
References: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c7da805a-65a8-6011-e710-b7ffa29492a3@linaro.org>
Date:   Wed, 25 Nov 2020 18:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Asit,

with 5.2/venus updated firmware I see following errors while loading
venus driver:

Nov 25 15:57:50 linaro-developer kernel: [418683.609209] qcom-venus
aa00000.video-codec: invalid firmware metadata
Nov 25 15:57:50 linaro-developer kernel: [418683.616354] qcom-venus
aa00000.video-codec: fail to load video firmware
Nov 25 15:57:50 linaro-developer kernel: [418683.631439] qcom-venus:
probe of aa00000.video-codec failed with error -22

Please don't merge it in linux-firmware until we are not sure what is
going on here!

On 11/25/20 10:41 AM, asitshah@codeaurora.org wrote:
> Hi Team,
> 
> Please include updated Venus Firmware bins for v5.4 and v5.2 .
> 
> Snapshot of pull request is as below, let me know if anything is missing.
> 
>>>>>>>
> 
> The following changes since commit
> b362fd4cb8963ad75517dbcf424974f65a29a60e:
> 
>   Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24
> 09:55:03 -0500)
> 
> are available in the git repository at:
> 
>   https://github.com/shahasit/linux-firmware-video/tree/master
> 
> for you to fetch changes up to e6459dce893a5b8dbf684762d5396acc11149186:
> 
>   qcom : updated venus firmware files for v5.2 (2020-11-25 14:02:10 +0530)
> 
> ----------------------------------------------------------------
> Asit Shah (2):
>       qcom : updated venus firmware files for v5.4
>       qcom : updated venus firmware files for v5.2
> 
>  qcom/venus-5.2/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.2/venus.b01 | Bin 6600 -> 6808 bytes
>  qcom/venus-5.2/venus.b02 | Bin 837304 -> 856432 bytes
>  qcom/venus-5.2/venus.b03 | Bin 33640 -> 33648 bytes
>  qcom/venus-5.2/venus.mbn | Bin 883264 -> 902400 bytes
>  qcom/venus-5.2/venus.mdt | Bin 6812 -> 7020 bytes
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 873680 -> 873704 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>  qcom/venus-5.4/venus.mbn | Bin 919792 -> 919816 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  12 files changed, 0 insertions(+), 0 deletions(-)
> 
> <<<<<<
> 
> Regards,
> Asit

-- 
regards,
Stan
