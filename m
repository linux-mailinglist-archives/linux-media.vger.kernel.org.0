Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6A53AA305
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 20:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhFPSS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 14:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbhFPSSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 14:18:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42487C061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 11:16:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m21so5758098lfg.13
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W2b2jFEehNknJRq+OcnVlifnQjPyUsywazDun11Qz00=;
        b=RbIa8yy5N57ekFnm44RR4Wz17v63PQuvQ7iuEyEsAzjhP2pXfbm8K1mWUT9rce4TZ/
         E4KCWV3OWpfaA5Pki/doXwe5mXERlsCV49sfaeOZA7QiVRDQllM1bDlHVUQVwecGkpuB
         dAzqFbFNzFZRmagp0n0ESxf9CFGvY0lzvVnHHeb85GNZ2ba5Wz8jNOUfna3EKvpNMbPs
         jqbldkb5/5/1dUvQflwHc/hIHSJmPdAB9JGFjDxTYQQ+i5xCABXBNAJUre80xaUIp2TD
         Zb+6T1o/qGNN7HC1z+f//GpSaLto9lB1n5U+inX4YE/MiBCLymnLkwW+Vqf0PJnmx4He
         IKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W2b2jFEehNknJRq+OcnVlifnQjPyUsywazDun11Qz00=;
        b=RrnNOhWllAWdN7jUYEm6pbnz9/7Aj9JDyitrUbKzDzQNhOqB8kPjQMfdXF90XH2oHd
         OiF0qh82PCf3O9m6jwdB4w3DcnIukepaOztxF7ceOVXVpgWPOBZYax/vFswRlw2g9mGf
         pSKd8Q6l3dt0qTBEqJ/oxKd+kjtST2BEqItdTWOruPXzLRxGeNuXce3xoKJBX2CpvM5T
         wu3KVIZj0SGU5y9c0DH2QJaywae+zG9Lb6GI69WthwyCvd2XnDtPP223o7qgkc5v3F3c
         s8BhswbRkEC+S4ITBqvSxUc04zOcKmhKPcNMbo1lheUuq9ZROeAfxM2Q0aXR/OQaf0dt
         5dAQ==
X-Gm-Message-State: AOAM5310UeNNscWRZsL/0U3TJp4Rx0/pyBhpbVo70kIlBd4aAEWhaPPy
        FkGSw/Y6gyZNGMI8HX19ErW0ZA==
X-Google-Smtp-Source: ABdhPJyeUC5P2zVYSmtzIgWA4NvoIF5no5BuhXQhyQPVwfntBDU2HrGn40e9WtI3xYkaEMbQa9s24w==
X-Received: by 2002:a19:8c58:: with SMTP id i24mr709113lfj.121.1623867406491;
        Wed, 16 Jun 2021 11:16:46 -0700 (PDT)
Received: from [192.168.88.254] ([85.249.44.185])
        by smtp.gmail.com with ESMTPSA id s28sm367049ljc.34.2021.06.16.11.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 11:16:45 -0700 (PDT)
Subject: Re: [PATCH 00/17] CAMSS: SM8250 support (and some fixes)
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
References: <20210608223513.23193-1-jonathan@marek.ca>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <7a9b847c-34b8-c9ca-8232-88b6ecb23ff5@linaro.org>
Date:   Wed, 16 Jun 2021 21:16:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

I've given this patchset a try on RB3 board (SDM845) with ov8856 camera sensor - works OK,
no regressions.

Thanks,
Andrey

On 09.06.2021 01:34, Jonathan Marek wrote:
> This adds initial support for SM8250 and its 4 VFEs and 6 CSIPHYs.
> The only big change is the added camss-vfe-480.c to support the
> Titan 480 VFE.
> 
> v2:
>   - Fixed some typos in commit messages (patches 02 and 08)
>   - patch 03 ("media: camss: csiphy-3ph: add support for SM8250 CSI DPHY"):
>     - moved definition of CAMSS_8250 to this patch,
>     - removed unused lane_enable variable
>     - added a default unreachable case to avoid a warning
>     - added a is_gen2 variable (minor rework)
>   - Undo DECODE_FORMAT_PAYLOAD_ONLY change, add comment instead (patch 04)
>   - "ops" reworks in addition to removing dead code (patch 12)
>   - renamed csid-170 to csid-gen2, added defines for offsets, add missing
>     camnoc_axi clock to sm8250 vfe resources (patch 16/17)
> 
> Jonathan Marek (17):
>    media: camss: csiphy-3ph: don't print HW version as an error
>    media: camss: csiphy-3ph: disable interrupts
>    media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
>    media: camss: csid-170: fix non-10bit formats
>    media: camss: csid-170: don't enable unused irqs
>    media: camss: csid-170: remove stray comment
>    media: camss: csid-170: support more than one lite vfe
>    media: camss: csid-170: set the right HALT_CMD when disabled
>    media: camss: csid: allow csid to work without a regulator
>    media: camss: remove vdda-csiN from sdm845 resources
>    media: camss: fix VFE irq name
>    media: camss: remove some vfe ops and clean up dead vfe-170 code
>    media: camss: vfe-170: fix "VFE halt timeout" error
>    media: camss: Add initial support for VFE hardware version Titan 480
>    media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
>    media: camss: add support for SM8250 camss
>    media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
> 
>   .../bindings/media/qcom,sm8250-camss.yaml     | 399 +++++++++++++
>   drivers/media/platform/qcom/camss/Makefile    |   3 +-
>   .../{camss-csid-170.c => camss-csid-gen2.c}   |  32 +-
>   .../media/platform/qcom/camss/camss-csid.c    |  45 +-
>   .../media/platform/qcom/camss/camss-csid.h    |   2 +-
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 184 ++++--
>   .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
>   .../media/platform/qcom/camss/camss-vfe-170.c | 101 +---
>   .../media/platform/qcom/camss/camss-vfe-4-1.c |  25 +-
>   .../media/platform/qcom/camss/camss-vfe-4-7.c |  63 +-
>   .../media/platform/qcom/camss/camss-vfe-4-8.c |  65 +--
>   .../media/platform/qcom/camss/camss-vfe-480.c | 545 ++++++++++++++++++
>   .../platform/qcom/camss/camss-vfe-gen1.c      |  94 +--
>   .../platform/qcom/camss/camss-vfe-gen1.h      |  39 +-
>   drivers/media/platform/qcom/camss/camss-vfe.c |  29 +-
>   drivers/media/platform/qcom/camss/camss-vfe.h |  17 +-
>   .../media/platform/qcom/camss/camss-video.c   |   5 +-
>   drivers/media/platform/qcom/camss/camss.c     | 205 ++++++-
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   19 files changed, 1523 insertions(+), 340 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>   rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (95%)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c
> 
