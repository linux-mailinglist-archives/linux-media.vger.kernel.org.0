Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D245345DF0
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 13:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCWMUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 08:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhCWMUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 08:20:38 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D2BC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 05:20:37 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id w3so26742904ejc.4
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+kPWGmzbCspTLXAVKHCwgdYcvI0SCT12ak/v67mHLwk=;
        b=phyN3gn9Si4fh/6wDuTX4Y38Qaw44RoOfSeQ6XiXr0CMwLixc+kilRnaBrLM11F/Fc
         RbzeZxQKteCN/vg+uXMtVCvwhOo+8AVSgO6P8ZE+joJREMw4IyW+1JjXBeng3eusLf1R
         L612hc+ub49d9KYwKnPtClvXZGQA+vFUyFMWhTZBiv3ut8DE98CLhSS1IfhOPvH7bQU5
         EeW4jc9xf0Yqht0BBjsKTpcydxbXt2IUK012BM5yu6gSX0oW8icNRV52LeoIlXUeJNtW
         /fSK6wewIG5v0YGzuPU4k7RwGk/rOV0ig6l/G4+YHPFQP2nHVcoH+kK/qw1uAFm21xLd
         PYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+kPWGmzbCspTLXAVKHCwgdYcvI0SCT12ak/v67mHLwk=;
        b=Su9MFXWNw83tQYgWTUM+wIchehMpz/rhGAUQmc/pi8PSIG99nDynbkv0SXRtvnfWKh
         3JV6bjkVhOJqFL/pxQ1nk5PjAlQZEe248FJaZ6UWv79AOAx6xoN5BsvP1wx7Op22wudG
         ZOy7hRrXu/Z3Quop64z9Vd3mmwJ5lxF1glnGVFCHfDMAcU20vtK3jqWud/6A/YdNpxUj
         v08gCFS8wxzpAbzRK/6mq5OF91tcr5S5ykTx6KuZsmjwpWmUnsYzIaobu4BEqZyQyaXD
         TVIX373yxjk94PL7SPprpUD6JMrbhwu9WKA7CLJmSpm57UX1jxaF/8UNByhak8AOMVzQ
         THfw==
X-Gm-Message-State: AOAM533LVUPVIHDtoJoml7VHAh7PoqFhkOFbpT4kyZGDRq5bevSP0Y/U
        xc6InWwxPHndrh3n8kg5brI7kw==
X-Google-Smtp-Source: ABdhPJzBsUba4XYx0J816vREMkrE2uHlRl4Y4BjSGXwDsFFU0jOpTARZhEsmamqSlODDSJdkgJUepw==
X-Received: by 2002:a17:906:6703:: with SMTP id a3mr4596859ejp.240.1616502036505;
        Tue, 23 Mar 2021 05:20:36 -0700 (PDT)
Received: from [192.168.1.54] (hst-221-7.medicom.bg. [84.238.221.7])
        by smtp.googlemail.com with ESMTPSA id 90sm13147004edf.31.2021.03.23.05.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 05:20:36 -0700 (PDT)
Subject: Re: [PATCH v2 00/25] media: venus: Enable 6xx support
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d7f250f7-65dd-9dc5-7b6e-d304a879f5e7@linaro.org>
Date:   Tue, 23 Mar 2021 14:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Thanks for your work!

On 3/12/21 7:30 PM, Bryan O'Donoghue wrote:
> V2:
> - Adds Acked-by as indicated - Stan
> - Fixes typo in patch #1 22000000 -> 220000000 - Stan
> - Fixes setting of clk_set_rate in core_clks_enable
>   unbreaks regression for 1xx/db410c - Stan
> - "Add 6xx AXI halt logic"
>   * Polled read removed - Stan
>   * Redundant comments removed - Stan
>   * Delay assocaited with LPI write removed entirely
>     experimentation shows a delay is not required - Stan/Bryan
> - Unifies intbuf_types_6xx_enc and intbuf_types_6xx_dec into
>   intbuf_types_6xx
>   Looking at the code the separate arrays was a NOP anyway - Stan/Bryan
> - Ensures venus_helper_set_format_constraints() runs for 6xx only
> - Differentiates stop address between 6xx and >= 4xx
>   0xdeadb000 >= 4xx
>   0x00000000 == 6xx - Stan
> 
> With the fixes in place for db410c I've verified this code now on
> sm8250/rb5 sdm845/rb3 and msm8916/db410c

You have my ack for all patches

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

except 21/25 and 24/25 who have comments.

> 
> yaml: pending - acked waiting application
> https://www.spinics.net/lists/devicetree/msg406892.html

I'll take this through media-tree once driver patchset is ready.

-- 
regards,
Stan

> 
> dts: pending - will resend when above is applied
> https://lore.kernel.org/linux-arm-msm/20210222132817.1807788-1-bryan.odonoghue@linaro.org/T/#t
> 
> Reference tree:
> 
> ssh://git@git.linaro.org/people/bryan.odonoghue/kernel.git / tracking-qcomlt-sm8250-venus
> 
> This tree incorporates two sets of patches from Stan - plus the two
> yaml/dts sets mentioned above.
> 
> svarbanov-linux-tv/venus-for-next-v5.13
> svarbanov-linux-tv/venus-msm8916-fixes
> 
> There's a small integration error between the 5.13 and msm8916-fixes which
> I resolved in favor of the bugfix in 5.13 pending - other than that this
> tree and these patches apply on tip-of-tree and run as indicated on rb5/rb3
> and db410c.
> 
> https://www.spinics.net/lists/linux-arm-msm/msg81291.html
> 
> V1:
> This series enables support for 6xx venus encode/decode as found on the
> sm8250.
> 
> The new silicon has different base addresses for existing functional blocks
> within the venus address space. We add a base address offset mechanism to
> handle this. The offsetting mechanism has been validated on 6xx and 4xx
> hardware.
> 
> The sm8250 supports:
> 
> - h264
> - h265
> - vp8
> - vp9
> 
> The driver changes are contingent on yaml and dts patches already
> in-flight.
> 
> yaml: pending
> https://www.spinics.net/lists/devicetree/msg406892.html
> 
> dts: pending
> https://lore.kernel.org/linux-arm-msm/20210222132817.1807788-1-bryan.odonoghue@linaro.org/T/#t
> 
> clk: applied
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/clk/linux/+/clk-next
> 
> Applies on top of 
> 
> https://git.linuxtv.org/svarbanov/media_tree.git / venus-for-next-v5.12-part2
> 
> Bryan O'Donoghue (11):
>   media: venus: Update v6 buffer descriptors
>   media: venus: core: add sm8250 DT compatible and resource data
>   media: venus: core: Add io base variables for each block
>   media: venus: hfi,pm,firmware: Convert to block relative addressing
>   media: venus: core: Add differentiator IS_V6(core)
>   media: venus: core: Add an io base for TZ wrapper regs
>   media: venus: core: Add an io base for AON regs
>   media: venus: core: Hook to V6 base registers when appropriate
>   media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
>   media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if
>     locations
>   media: venus: pm: Hook 6xx pm ops into 4xx pm ops
> 
> Dikshita Agarwal (12):
>   media: venus: hfi: Define block offsets for V6 hardware
>   media: venus: hfi: Define additional 6xx registers
>   media: venus: hfi: Add a 6xx boot logic
>   media: venus: hfi: Add 6xx interrupt support
>   media: venus: core,pm: Vote for min clk freq during venus boot
>   media: venus: hfi: Add 6xx AXI halt logic
>   media: venus: pm: Toggle 6xx wrapper power in vcodec_control
>   media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
>   media: venus: helpers: Add internal buffer list for v6
>   media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
>   media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
>   media: venus: helper: Decide work mode
> 
> Stanimir Varbanov (2):
>   media: venus: core,pm: Add handling for resets
>   media: venus: vdec: Fix decoder cmd STOP issue
> 
>  drivers/media/platform/qcom/venus/core.c      |  78 +++++++++
>  drivers/media/platform/qcom/venus/core.h      |  19 ++
>  drivers/media/platform/qcom/venus/firmware.c  |  34 ++--
>  drivers/media/platform/qcom/venus/helpers.c   |  73 +++++++-
>  drivers/media/platform/qcom/venus/helpers.h   |   3 +-
>  drivers/media/platform/qcom/venus/hfi_cmds.c  |  15 +-
>  .../media/platform/qcom/venus/hfi_helper.h    |   9 +-
>  .../platform/qcom/venus/hfi_plat_bufs_v6.c    |   2 +-
>  .../platform/qcom/venus/hfi_platform_v6.c     | 138 +++++++--------
>  drivers/media/platform/qcom/venus/hfi_venus.c | 164 +++++++++++++-----
>  .../media/platform/qcom/venus/hfi_venus_io.h  | 118 ++++++++-----
>  .../media/platform/qcom/venus/pm_helpers.c    |  92 +++++++++-
>  drivers/media/platform/qcom/venus/vdec.c      |  17 +-
>  drivers/media/platform/qcom/venus/venc.c      |   2 +-
>  14 files changed, 567 insertions(+), 197 deletions(-)
> 

