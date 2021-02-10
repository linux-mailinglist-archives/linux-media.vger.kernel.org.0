Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710933170FF
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 21:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbhBJUPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 15:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhBJUPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 15:15:34 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22458C061788
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 12:14:22 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f8so4595891ljk.3
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 12:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GQdRqR/kJXRC2NOCKDiNUxAr2URFu/7kIkSURwm887c=;
        b=ebAplM68uk2DaRN48rgxuZ6/sjD9iIQ0PbgBr8StwIUdvNm4eUS7UJCRMEQZG47G+F
         3twX5CY/MpDOSiJuJ/ujNsRd5pZbhgQruLRab0SI92+X3982Yb550awNV2IqZX512IGm
         Vyj0p0fWRapHhOVSCZPiSKHkRsb6SJV55D0y6X5RgtA+EOqbLUdHc/n4eW8xRdixjFcP
         lrmcYtpkQu9D3LpM58W6yoxG5PuGytvI+pmfM0xQPIEo5VA66MyauteGdSgQYidXJJ4E
         Y15Kd3ol4b0XsDlNarPEocXeOs2MOIjRbBY0E89wz1uCQ2MO9TJpKb3cE4MXamBnT136
         Gx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GQdRqR/kJXRC2NOCKDiNUxAr2URFu/7kIkSURwm887c=;
        b=s1sx1G663v+HF02srV+/KbQM7vF+0EOEGClReN4zxh0dR05rLQbKMHAAi6he0GUrBO
         9MTj5l/gfDupZof1+xyRdt/NWcCnzM9NqN7bWR5lr7U0kMuR7ijItcnU5eeNpQk5b3fS
         kbw0DwcuCD+vm8WGCAQY+QHynL2EggA0St4hlUL+CxvI3CFrxZL22eip/CfosU1G62ED
         OiRrghCIwzJjF1nkFTAILxaKMFmYX+VtB7sPSRayqf/VeosZTsJUR386cBVJwiLUX7NV
         8Hlx6wAgQhNyNQYgRULnNG1rjB1VAWSHT82LzZ7ChvDIRYzas15GrppRUaFI7OipEgT7
         KkAA==
X-Gm-Message-State: AOAM532iypdMJ/2LvGhr4wWqoJ4BQJhzehXhY2XJIDcM3EbmQhk8twjk
        icEtYCaxnC3jOJUJB+1Xbvt3HA==
X-Google-Smtp-Source: ABdhPJwYCpd33SPFNGRkgEtcmIpVwqC7agC3qhM8NFsdk2q99adk0+MgdYCLvt4WUY2lkI/WpAU2IA==
X-Received: by 2002:a2e:9a8c:: with SMTP id p12mr3072594lji.196.1612988060226;
        Wed, 10 Feb 2021 12:14:20 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id v23sm447097lfo.43.2021.02.10.12.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 12:14:19 -0800 (PST)
Subject: Re: [PATCH v4 00/22] Add support for the SDM845 Camera Subsystem
To:     Robert Foss <robert.foss@linaro.org>, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210205104414.299732-1-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <5fea18b2-307b-2b45-4bc7-d327022642b0@linaro.org>
Date:   Wed, 10 Feb 2021 23:14:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 05.02.2021 13:43, Robert Foss wrote:
> This series implements support for the camera subsystem found in
> the SDM845 SOCs and the Titan 170 ISP. The support is partial
> in that it implements CSIPHY, CSID, and partial VFE support.
> 
> The Titan generation of the ISP diverges a fair amount from the
> design of the previous architecture generation, CAMSS. As a result
> some pretty invasive refactoring is done in this series. It also
> means that at this time we're unable to implement support for all
> of the IP blocks contained. This is due to a combination of legal
> considerations with respect to the IP and its owner Qualcomm and
> time & man hour constrains on the Linaro side.
> 
> The CSIPHY (CSI Physical Layer) & CSID (CSI Decoder) support is
> complete, but the VFE (Video Front End, which is referred to as IFE
> (Image Front End) in the Titan generation of ISPs) only has support
> for the RDI (Raw Dump Interface) which allows the raw output of
> the CSID to be written to memory.
> 
> The 2nd interface implemented in the VFE silicon is the PIX
> interface, and camss does not support it for this generation of ISPs.
> The reason for this is that the PIX interface is used for sending
> image data to the BPS (Bayer Processing Section) & IPE (Image
> Processing Engine), but both of these units are beyond the scope
> of enabling basic ISP functionality for the SDM845.

The problem is that for SDM845 the topology printed by media-ctl
still has the PIX devices. That is even though the PIX interface is not
supported for SDM845 in this driver, the msm_vfeN_pix subdevices
and the corresponding msm_vfeN_video3 devices are still created.
Your patchset is currently missing changes to the hardcoded:

#define MSM_VFE_LINE_NUM 4

struct vfe_device {
...
         struct vfe_line line[MSM_VFE_LINE_NUM];
...
};

in drivers/media/platform/qcom/camss/camss-vfe.h.


Thanks,
Andrey

> Since the Titan architecture generation diverges quite a bit from
> the CAMSS generation, a lot of pretty major refactoring is carried
> out in this series. Both the CSID & VFE core paths are made more
> general and hardware version specific parts are broken out.
> The CSIPHY didn't require quite as radical changes and therefore
> keeps its current form.
> 
> Tested on:
>   - Qcom RB3 / db845c + camera mezzanine, which is SDM845 based
>   - db410c + D3 Camera mezzanine, which is APQ8016 based
>   
> Branch:
>   - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v1
>   - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v2
>   - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v3
> 
> 
> Due to the dt-bindings supporting sdm660-camss, this series depends
> the sdm660 clock driver being upstreamed. I've linked this series below.
> 
> SDM630/660 Multimedia and GPU clock controllers
> https://lkml.org/lkml/2020/9/26/166
> 
> 
> Robert Foss (22):
>    media: camss: Fix vfe_isr_comp_done() documentation
>    media: camss: Fix vfe_isr comment typo
>    media: camss: Replace trace_printk() with dev_dbg()
>    media: camss: Add CAMSS_845 camss version
>    media: camss: Make ISPIF subdevice optional
>    media: camss: Refactor VFE HW version support
>    media: camss: Add support for VFE hardware version Titan 170
>    media: camss: Add missing format identifiers
>    media: camss: Refactor CSID HW version support
>    media: camss: Add support for CSID hardware version Titan 170
>    media: camss: Add support for CSIPHY hardware version Titan 170
>    media: camss: Remove per VFE power domain toggling
>    media: camss: Enable SDM845
>    dt-bindings: media: camss: Add qcom,msm8916-camss binding
>    dt-bindings: media: camss: Add qcom,msm8996-camss binding
>    dt-bindings: media: camss: Add qcom,sdm660-camss binding
>    dt-bindings: media: camss: Add qcom,sdm845-camss binding
>    MAINTAINERS: Change CAMSS documentation to use dtschema bindings
>    media: dt-bindings: media: Remove qcom,camss documentation
>    arm64: dts: sdm845: Add CAMSS ISP node
>    arm64: dts: sdm845-db845c: Configure regulators for camss node
>    arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP
> 
>   .../devicetree/bindings/media/qcom,camss.txt  |  236 ----
>   .../bindings/media/qcom,msm8916-camss.yaml    |  256 ++++
>   .../bindings/media/qcom,msm8996-camss.yaml    |  387 ++++++
>   .../bindings/media/qcom,sdm660-camss.yaml     |  398 ++++++
>   .../bindings/media/qcom,sdm845-camss.yaml     |  370 ++++++
>   MAINTAINERS                                   |    2 +-
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   23 +-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          |  135 ++
>   drivers/media/platform/qcom/camss/Makefile    |    6 +
>   .../platform/qcom/camss/camss-csid-170.c      |  602 +++++++++
>   .../platform/qcom/camss/camss-csid-4-1.c      |  338 +++++
>   .../platform/qcom/camss/camss-csid-4-7.c      |  406 ++++++
>   .../media/platform/qcom/camss/camss-csid.c    |  620 +--------
>   .../media/platform/qcom/camss/camss-csid.h    |  178 ++-
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         |  182 ++-
>   .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
>   .../media/platform/qcom/camss/camss-ispif.c   |  117 +-
>   .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
>   .../media/platform/qcom/camss/camss-vfe-170.c |  804 ++++++++++++
>   .../media/platform/qcom/camss/camss-vfe-4-1.c |  123 +-
>   .../media/platform/qcom/camss/camss-vfe-4-7.c |  244 ++--
>   .../media/platform/qcom/camss/camss-vfe-4-8.c | 1164 +++++++++++++++++
>   .../platform/qcom/camss/camss-vfe-gen1.c      |  763 +++++++++++
>   .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
>   drivers/media/platform/qcom/camss/camss-vfe.c |  840 +-----------
>   drivers/media/platform/qcom/camss/camss-vfe.h |  118 +-
>   .../media/platform/qcom/camss/camss-video.c   |  100 ++
>   drivers/media/platform/qcom/camss/camss.c     |  419 ++++--
>   drivers/media/platform/qcom/camss/camss.h     |   17 +-
>   29 files changed, 6965 insertions(+), 2062 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h
> 
