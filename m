Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C6323DC1E
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 18:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbgHFQq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 12:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgHFQpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:45:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D1DC0A8921;
        Thu,  6 Aug 2020 09:45:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v4so42843573ljd.0;
        Thu, 06 Aug 2020 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ULS+dmM0AEMlQQMxcozaFfDaR9JxN5gUmDbcuK2poXI=;
        b=ssHYXLl75BAletdkGTRysoezhQ7GhZoRcCXxrcfVfXHWXVDElDW9q3WK7E9FXd/2p9
         Y4btKeyAh0MBTSVQLpVD3B1UApGNbZU4xiTpg4vUXUp+X0wpv3MDBX82iMKSgnnO4LNc
         xdcr3/7DgSghShtxoJ0BvPLJY3eS+lynwvMyO/7kPzzZSksXoYsu3XYrUXWNT+UP569W
         eB0GyXTfNSNezfK/hZFzN6TKvi0BTKeo+ndEYdIP2MsaOXyuYHKuspct4aW3/ZN/YXQ4
         7wFHnG9pc2l1o5iy7wKHiC/yu+TOznNgtaYl7NR49/g4QHOwx+HYgaIwd8+9v29mI1Wk
         yomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ULS+dmM0AEMlQQMxcozaFfDaR9JxN5gUmDbcuK2poXI=;
        b=piuFnMGxuezJqJ0qdulPs7ANaF/pSWxflQlJDlkbvgVsGNpi1XOHfkvLmR9xpTmpX+
         E7xqGovfU6WUiL62tmNjuMBqcuVWTnwaJrtQHt0w7DcM8+aFeNpfkvT62m0rAQx8HPPf
         A5sYC5qkA8IsbT+Z+72ttT2fPOCAyek6ctIxfBsGP5BCrkrzUhLLwjyEB1NuKdy5BDyY
         NnoBBz746vUDVWI6+PedGTbHF7dacHPA2Y+xgNenR85iqDRh8rghM/tKTwFM8SDT1COB
         1C9KgtnRQpOaOoyJ4FaX3Zta245aTPO7pM8Q/SN8X9BkVi60LhFB126R6V8JK5X6WW/N
         VyfQ==
X-Gm-Message-State: AOAM531vk24HcFOIM0d9IodUFnPWb++EnqlmIOd0og4ynyzCfy2B7alJ
        D6lqLRbZe8Aiq2RWdX2q8Op0APSX
X-Google-Smtp-Source: ABdhPJwMByj9oXpeH/pigQ82iDhhxhkgE29vp4nVuIDDzccgEWKuzvPUmwpaIcgvBHLB08c96IUgRA==
X-Received: by 2002:a2e:9f43:: with SMTP id v3mr4215124ljk.266.1596732335025;
        Thu, 06 Aug 2020 09:45:35 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id d10sm2164937ljg.87.2020.08.06.09.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 09:45:34 -0700 (PDT)
Subject: Re: [PATCH v8 08/10] gpu: host1x: mipi: Keep MIPI clock enabled till
 calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-9-git-send-email-skomatineni@nvidia.com>
 <20200805134600.GA3351349@ulmo>
 <103efe31-1abc-54f2-6004-490d7bb1b61a@gmail.com>
 <dcd58ae7-58ed-11d1-0e10-7f522b651b30@gmail.com>
 <addb92e5-7c7a-6fba-117d-c7880b2d4597@nvidia.com>
 <ed80bf2f-213f-286a-59b2-fc85e4181b3d@gmail.com>
 <6eede805-80fd-016f-22f8-b6d25f6587af@nvidia.com>
 <1c12e40e-de7f-0599-a941-82760b4c7668@gmail.com>
 <9ef0b875-e826-43e2-207e-168d2081ff6a@nvidia.com>
 <4689cfe9-e7c4-48bf-217f-3a31b59b8bda@nvidia.com>
 <0e78c5ca-c529-1e98-891d-30351c9aae81@gmail.com>
 <b2098a68-d02f-b406-fc57-56e3ff5d8d1a@nvidia.com>
 <309e3b66-9288-91ef-71b4-be73eacbbd62@nvidia.com>
 <fde2431a-0585-ac32-ac25-73e198aaa948@nvidia.com>
 <4025a458-fa78-924d-c84f-166f82df0f8e@gmail.com>
 <4f15d655-3d62-cf9f-82da-eae379d60fa6@nvidia.com>
 <b5612e93-f1c4-4762-baa1-5d85eb1edbe1@gmail.com>
 <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <04413bc8-8d89-7e57-9b34-84bb11ecb008@gmail.com>
Date:   Thu, 6 Aug 2020 19:45:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <412f8c53-1aca-db31-99a1-a0ecb2081ca5@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

06.08.2020 19:41, Sowjanya Komatineni пишет:
...
>> What about to add 72us delay to the end of start_calibration() in order
>> to ensure that FSM is finished before LP-11?
> 
> Why we should add 72uS in start_calibration() when can use same
> finish_calibration() for both pass/fail cases?
> 
> Only timing loose we see is in case of failure we still wait for 250ms
> and as this is failing case I hope should be ok.
> 

You said that calibration settings are applied to pads on LP-11, but if
LP-11 happens before FSM is finished, then what values will be applied
if any?
