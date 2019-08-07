Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 330BD847DA
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387672AbfHGIqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:46:37 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:53141 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387452AbfHGIqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 04:46:37 -0400
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747] ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vHabhjtKZAffAvHach7Mxn; Wed, 07 Aug 2019 10:46:34 +0200
Subject: Re: next-20190806: arm64: adv7511 3-0039: failed to find dsi host
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>, mchehab@kernel.org,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        linux-media@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, agross@kernel.org,
        david.brown@linaro.org, lkft-triage@lists.linaro.org,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <CA+G9fYus+cW4775Y2_Xqpc+G6YP_KfjGeCMzoSQq6o2yVY8Q3w@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a9f7c007-8639-0202-c35d-219d371a1842@xs4all.nl>
Date:   Wed, 7 Aug 2019 10:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYus+cW4775Y2_Xqpc+G6YP_KfjGeCMzoSQq6o2yVY8Q3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfApS0b/lMPm7rop7sg4zrGCd+8i5M4UPTpKak97B2soWM1lDxIqMEISdnpCsJMglPti5bkjxmU2Axw9lKEqQw4HCmMOx113b51Z7Ji58DjsbuiIF5JAp
 2hpTdBYYwQ90Rrq3A8U2qoCTM6Z/JttrqM5JxCTBNphIfY/AuA7m0KHVCvE1pI1IThCds62OiVpyDbYYyzKvnIs52V68cd1UB0l9j4cC+XqxAeAYZmG1mK7w
 xaad+EklKa6qrQnuLMDsiMmDGrhJg+DDCeSMfzRXxZw4ebYXnUtwlo3aYNb5CQR41tCTT/ESrJt/IPPxWzyET4o3F4/YppkFLZgfoIfB5Y3ZQ7IpElrhZz4r
 hV57N0/Yuuoq0T9x7kA9dTXm+F3NWk3J5WKmiB365qLjkOgSI63bfUxmkWT7m+jgjqVzq/TGfjOwkqqmmPirOtmj69K2yV/grgKxrXhMroiuaJ6glk2kq2e+
 BLuAfNaMYLMy6RNaPAwL6o6xAQg0mXGKT+wSjoXbDC1yeypR0ZeSIBVS1myDswQDidoHIohjuLYJN8a7QRZ7dz1F7/rPyRKUZquqdWxLOIlTNnedR96BVikJ
 /APKCq63uC5PmQQtGFwLXihb7WzA7QXNLVXwxAoWFoWdS2ygZkf0LLnZA8ngSsCuDBI/oZMdrqaX8YUMpDr0WRRCF+7SlvbH+O6oUDgqh3ZABG2uX1I1Dq2n
 2xbI43RkHTE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding dri-devel since this appears to be drm specific and not media
related.

Regards,

	Hans

On 8/7/19 10:17 AM, Naresh Kamboju wrote:
> arm64 devices dragonboard 410c (QC410E) and hi6220-hikey running Linux
> next-20190806 loading modules causing floods of kernel messages.
> 
> We have enabled few extra kernel configs for testing.
> CONFIG_DRM_I2C_ADV7511=m
> CONFIG_DRM_I2C_ADV7511_CEC=y
> ...
> 
> Please find below boot log and config file link.
> 
> [    0.000000] Linux version 5.3.0-rc3-next-20190806 (oe-user@oe-host)
> (gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Tue Aug 6 05:49:36 UTC 2019
> [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> ....
> [   10.051193] adv7511 3-0039: 3-0039 supply dvdd not found, using
> dummy regulator
> [   10.051633] adv7511 3-0039: 3-0039 supply pvdd not found, using
> dummy regulator
> [   10.076257] adreno 1c00000.gpu: Adding to iommu group 0
> [   10.090929] adv7511 3-0039: 3-0039 supply a2vdd not found, using
> dummy regulator
> [   10.101703] msm_mdp 1a01000.mdp: Adding to iommu group 1
> [   10.102563] msm_mdp 1a01000.mdp: No interconnect support may cause
> display underflows!
> [   10.139492] adv7511 3-0039: failed to find dsi host
> ...
> [   33.065744] adv7511 3-0039: failed to find dsi host
> [   33.076721] msm 1a00000.mdss: 1a00000.mdss supply vdd not found,
> using dummy regulator
> [   33.078344] msm_mdp 1a01000.mdp: [drm:mdp5_bind [msm]] MDP5 version v1.6
> [   33.083862] msm 1a00000.mdss: bound 1a01000.mdp (ops mdp5_ops [msm])
> [   33.090892] msm_dsi 1a98000.dsi: 1a98000.dsi supply gdsc not found,
> using dummy regulator
> [   33.097756] msm_dsi 1a98000.dsi: 1a98000.dsi supply gdsc not found,
> using dummy regulator
> [   33.106606] msm_dsi_manager_register: failed to register mipi dsi
> host for DSI 0
> [   33.114579] msm 1a00000.mdss: failed to bind 1a98000.dsi (ops
> dsi_ops [msm]): -517
> [   33.121263] msm 1a00000.mdss: master bind failed: -517
> [   33.135547] adv7511 3-0039: 3-0039 supply dvdd not found, using
> dummy regulator
> [   33.139360] adv7511 3-0039: 3-0039 supply pvdd not found, using
> dummy regulator
> [   33.143646] adv7511 3-0039: 3-0039 supply a2vdd not found, using
> dummy regulator
> 
> Full test log
> https://lkft.validation.linaro.org/scheduler/job/860208#L956
> 
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: 958eb4327c1761c609bde8e9f7c04e9d1c6fbb96
>   git describe: next-20190806
>   make_kernelversion: 5.3.0-rc3
>   kernel-config:
> http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579/config
>   kernel-defconfig:
> http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579/defconfig
>   build-location:
> http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579
> 
> Best regards
> Naresh Kamboju
> 

