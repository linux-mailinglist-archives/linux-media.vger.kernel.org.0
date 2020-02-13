Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8723915BD32
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 11:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbgBMK6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 05:58:31 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42839 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgBMK6b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 05:58:31 -0500
Received: by mail-ed1-f66.google.com with SMTP id e10so6263329edv.9
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 02:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=hKmIyTZckPM3C4c4BZyMsyokvXvSDkspuvtCgm1Af20=;
        b=A6HLDUcpnOVfAx6z+vgeLNHY0hCB9L8CoQtJQjxGy1MUnqPOPS6xIPG5XsVP/dVaAw
         VGBIenN4Rs0tPva66uc4ZjoxsqigZyMzh/M+zN8u2DgTfH2ZG2IT4HCe7GXOkvp/LBsE
         f9Q3Hur2IHGiaMu9NhXIhvaj0keVminNdLsrQ4LSuH2aqt21lolfG6lB/uw8tycEwaNo
         Es0kPfkU8IQM2QlfaKaLsyhNqjIrr9idxAuyy3NMHjm/FpA1ciWYmb6WUcjrYrnRF3gN
         J5qlMJFJQERsm1W79K7NRPT07tEnv3+4rH9p6yZGYbQIcIr0ctfgTROrqnC89Pf054sN
         GdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hKmIyTZckPM3C4c4BZyMsyokvXvSDkspuvtCgm1Af20=;
        b=T5YbYv9jjdUhn8YLDywBdM3vjcak7cZpBhhGUG37r7yBBrZfyogFWKHcCWRtp6ihUE
         djQNPl3f6ExpNaVaeedrr6/7ocSJKyATHuTG6rbg27eCLjn6TVL+Oo40FTSMpSZbuzGm
         aUqdvs3U62D0YkVTeNBQURxXf82/kUyREADfvEu1ImSUtjkCV/etUAWDddGvcg1Vvx4l
         K7idgt4J/nAoi5GuLm07wBsTpHk2+WeKnxXPy65B39oHB54gW0qrEk98i3iTTTWYvN06
         UYf94KTUHDK8uUdu92wuth9hbp/yk1mHkeg98g4BBBRyh0+Ld7/MarCiK5f0LDXNto1Q
         5dBA==
X-Gm-Message-State: APjAAAVHcTwDWMlyOuQqBJuEvnbvBRnp1Y/vUQlde03bkkA7sZnHmcMv
        ThX5JYq1CxNilWFHxjwh3ad/hQ==
X-Google-Smtp-Source: APXvYqy6qHw0vLFjuteMoULu99J0Mj7Y7NfACCh2+aD0Lsv92P7wLsA2QhKG3+U6RCFBQEjb4OTqGg==
X-Received: by 2002:a17:906:f10a:: with SMTP id gv10mr15144150ejb.260.1581591507766;
        Thu, 13 Feb 2020 02:58:27 -0800 (PST)
Received: from [192.168.27.209] ([94.155.124.210])
        by smtp.googlemail.com with ESMTPSA id q18sm170794eds.7.2020.02.13.02.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 02:58:27 -0800 (PST)
Subject: Re: [GIT PULL for v5.6] Venus updates
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200110144017.16648-1-stanimir.varbanov@linaro.org>
Message-ID: <96897fba-6952-886b-6374-3bc6f698f06d@linaro.org>
Date:   Thu, 13 Feb 2020 12:58:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200110144017.16648-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

As this PR did not get merged, I will send a new one for v5.7 with some
more commits when the media_tree master is updated to v5.6-rc1.

On 1/10/20 4:40 PM, Stanimir Varbanov wrote:
> Hi Mauro,
> 
> The Venus driver updates include:
>  - re-design pm-domain and clocks handling
>  - added core assingment for Venus IPs with more than one vcodec pipeline
>  - dt-binding convertion to yaml DT schema
>  - added decoder handling of 10bit bitstreams
>  - few fixes
> 
> Please pull.
> 
> regards,
> Stan
> 
> The following changes since commit 2a0a0bc7020ef7e66c9569d8229d79fa72e3d659:
> 
>   media: MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 16:45:01 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.6
> 
> for you to fetch changes up to e91ebb35b94ef8cf5988cfb2f4802422fbd5f4ec:
> 
>   dt-bindings: media: venus: delete old binding document (2020-01-10 12:37:29 +0200)
> 
> ----------------------------------------------------------------
> Venus updates for v5.6
> 
> ----------------------------------------------------------------
> Andy Shevchenko (1):
>       media: venus: firmware: Use %pR to print IO resource
> 
> Aniket Masule (2):
>       media: venus: introduce core selection
>       media: venus: vdec: handle 10bit bitstreams
> 
> Stanimir Varbanov (8):
>       venus: redesign clocks and pm domains control
>       venus: venc: blacklist two encoder properties
>       dt-bindings: media: venus: Convert msm8916 to DT schema
>       dt-bindings: media: venus: Convert msm8996 to DT schema
>       dt-bindings: media: venus: Convert sdm845 to DT schema
>       dt-bindings: media: venus: Add sdm845v2 DT schema
>       venus: core: add sdm845-v2 DT compatible and resource struct
>       dt-bindings: media: venus: delete old binding document
> 
> Stephan Gerhold (1):
>       media: venus: hfi_parser: Ignore HEVC encoding for V1
> 
>  .../bindings/media/qcom,msm8916-venus.yaml         | 119 +++
>  .../bindings/media/qcom,msm8996-venus.yaml         | 153 ++++
>  .../bindings/media/qcom,sdm845-venus-v2.yaml       | 140 +++
>  .../bindings/media/qcom,sdm845-venus.yaml          | 156 ++++
>  .../devicetree/bindings/media/qcom,venus.txt       | 120 ---
>  drivers/media/platform/qcom/venus/Makefile         |   2 +-
>  drivers/media/platform/qcom/venus/core.c           | 122 ++-
>  drivers/media/platform/qcom/venus/core.h           |  31 +-
>  drivers/media/platform/qcom/venus/firmware.c       |   3 +-
>  drivers/media/platform/qcom/venus/helpers.c        | 437 +++-------
>  drivers/media/platform/qcom/venus/helpers.h        |   4 -
>  drivers/media/platform/qcom/venus/hfi_cmds.c       |   2 +
>  drivers/media/platform/qcom/venus/hfi_helper.h     |   6 +
>  drivers/media/platform/qcom/venus/hfi_parser.c     |   1 +
>  drivers/media/platform/qcom/venus/hfi_parser.h     |   5 +
>  drivers/media/platform/qcom/venus/pm_helpers.c     | 964 +++++++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.h     |  65 ++
>  drivers/media/platform/qcom/venus/vdec.c           |  84 +-
>  drivers/media/platform/qcom/venus/venc.c           |  75 +-
>  19 files changed, 1854 insertions(+), 635 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/qcom,venus.txt
>  create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.c
>  create mode 100644 drivers/media/platform/qcom/venus/pm_helpers.h
> 

-- 
regards,
Stan
