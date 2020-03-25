Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A73191DFB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 01:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgCYAXD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 20:23:03 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43261 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgCYAXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 20:23:03 -0400
Received: by mail-lj1-f193.google.com with SMTP id g27so604580ljn.10;
        Tue, 24 Mar 2020 17:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ct/V5EnftFkGN3WYxrNnLQpcXQ4Aalb0V9/m+SiHKIE=;
        b=tzYV6AXBdVjWcAGYDlnJbhS//oa5DHQFSKfMASl7NuXw4AodL//Be/sLiLinQD85bS
         ahhnozUcmu+Nrq6aF8Tu0p/pQLjLRUJSabIldxD3GSQow9Dp7gypCVeF4c/ao9g9/eAp
         wVrSanIWv8FY0fzHgb9P2L7cIBBG6rD+vzRR0TbLx+FPb92+rSXg+de/7fcSTuIoEMNS
         TeQNWpUtHBRvwcCKVUsznod8o7S6/PUSGePKAm6tyDl05pFp5HYn52dlMmYJO/aNCuGN
         xF46CZ2mdmP2nd7dN0xnga1k4FACvHm6+SF04shzuOqUyLZCC1ygbWpSWQ5gl9et0f21
         DKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ct/V5EnftFkGN3WYxrNnLQpcXQ4Aalb0V9/m+SiHKIE=;
        b=tG5Cphfaa9MFI0maj3d2a5wz3eGqjEabV2EPMwrNx/n5mKfA3URpuvBkLleOiwOzbc
         KA9xFixcAAkvtd1PRV2aOWi/UCmzsf8Xl9eyVEF440kLlKPq8BgJuW0+UolNrPh3cMak
         XjS3viB8y4B7PHLa/k12OfgoJHSf55RBgweomvtejspsQ7k8Tzid8HKZCtFZBfE46RF0
         SdVwipTOcNAeuR1VhIDLRJ/oFXGadAcQ+DKS/KzuxWFyrXW8grfaTvYWtSCE9p25suNj
         EJask+kII4fUs/mSAi623IC2VQWEGxBbV03WRVDwanm4eRJrSANibIXvEAM7TViz7YQD
         1/wA==
X-Gm-Message-State: ANhLgQ0KSc1sfWe57fhsvMINFZ7lXNFksuH9vG6pHZTSsDXEbFWwWumj
        UpoAHzFl7p1XbK1ni5X+MhWPo/e/
X-Google-Smtp-Source: APiQypKH2RBu/eqHvdIujKLPytbWL/hPORDcJLKVesrNFS6S7uug4Yi0HP/L1SteXLoI4lcvrq4r6g==
X-Received: by 2002:a2e:330e:: with SMTP id d14mr193463ljc.153.1585095779507;
        Tue, 24 Mar 2020 17:22:59 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id k18sm10757172ljc.92.2020.03.24.17.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 17:22:58 -0700 (PDT)
Subject: Re: [RFC PATCH v5 9/9] arm64: tegra: Add Tegra VI CSI support in
 device tree
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-10-git-send-email-skomatineni@nvidia.com>
 <672819ea-01d3-2eca-8bb7-84ffd64256d4@gmail.com>
 <a218142f-295e-6bd5-b1d7-47d9ab8eba3e@nvidia.com>
 <fee09e1e-48a3-e0a0-12dc-9aeeb3438ded@gmail.com>
 <7d7c982e-7755-5f3d-cb90-9622f87df283@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b757b06f-3ee1-1c8b-ae47-38211da667bc@gmail.com>
Date:   Wed, 25 Mar 2020 03:22:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7d7c982e-7755-5f3d-cb90-9622f87df283@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

25.03.2020 03:01, Sowjanya Komatineni пишет:
> 
> On 3/24/20 3:48 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 25.03.2020 00:04, Sowjanya Komatineni пишет:
>>> On 3/24/20 12:19 PM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 23.03.2020 20:52, Sowjanya Komatineni пишет:
>>>> ...
>>>>> +                     pd_venc: venc {
>>>>> +                             clocks = <&tegra_car TEGRA210_CLK_VI>,
>>>>> +                                      <&tegra_car TEGRA210_CLK_CSI>;
>>>>> +                             resets = <&mc TEGRA210_MC_RESET_VI>,
>>>> The MC resetting should be needed only for a hardware hot-resetting. It
>>>> should be wrong to add it to the power domain.
>>> TRM recommends to do MC client hot-reset during VE power gate and
>>> ungate.
>> Could you please tell what TRM it is and what's the page#?
> Tegra TX1 TRM Page 425, Section 12.2.7.14 Procedures for VE Power Domains

Okay, thanks.
