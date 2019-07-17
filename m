Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E54576BF3F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 17:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfGQPni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 11:43:38 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36228 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfGQPnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 11:43:37 -0400
Received: by mail-lj1-f193.google.com with SMTP id i21so24124191ljj.3
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3jbOpJGViEoMZ/z1uklXsD0i54r1S51I050v7ZKNFBk=;
        b=q5qzlnCIimWC3UjOSITeeOXZCWpKBXlqKRVFQtULyVwTJBMXe291radTFmBCIOilo2
         rdufUMyO5g6sAT8Hny4/l/4T3ClB9Ox0fRDYQXzp+22fH24Xy/LfnWjZDlZOvtZx+s6t
         TdaZ9T6zjMZSU//SZ4bpGc37NhFZv/gpXGsZerE1y5w12nSA9savGldFQhS/x1c3DKM5
         q2DEO2JT52mEPuNlJwMtQNpepUdYfiytpmtMazVZ+7m9Hx23a7wioBqqEh6C57wftVfs
         oBxa4smkhe+cX+SXaTHhdRrm7gDnWqscQGkgAOM7YrCK5dJ//s0hNZZCKNloaYU9Eh6G
         MeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3jbOpJGViEoMZ/z1uklXsD0i54r1S51I050v7ZKNFBk=;
        b=ibuMyt5yodg7pveS5Cl763UvGyXwREgmlidosuAS7O6KrhEFRyuA8jXlFQBWVPMger
         ohA6n5F3L7IehOzYyts2IBhfFlRxzs7mYuCfSrZ3Kd0ILce6vQJOKI10yvTHnzILl+GF
         qeD0RfNh/1gyGPVBqEx8m4y3pd0yWsqP2bEalndey4l1QJzDW4CQCzICK+jZbaEZSUHj
         GlD2xgPYkzU0mB2L8cbaNg0yC3PgcAFV5UdY2K7wPIlWffNa/gERUK+7yQnXojT9RL2b
         Yk9XFmtH2+A4VBswf2BuXHMHIIousWoek6/Y1PLmgqx3S/geUGuWl1gYlimvZ3TyldJa
         auUA==
X-Gm-Message-State: APjAAAVwMjHFENdIDH/EPqD3Mq1nqVzJ8TNswfyJc0McyOBhWMrzHOSk
        FQrj9RbMuuA8V2GJG/C0KxlVdw==
X-Google-Smtp-Source: APXvYqyZAR4Yyv15+5pV6jQjFoFXs2SGDZkyijDlK7U2XKITXcR4+JjlldiqrmNTezn72knRlJTbvQ==
X-Received: by 2002:a2e:800c:: with SMTP id j12mr21250044ljg.22.1563378215666;
        Wed, 17 Jul 2019 08:43:35 -0700 (PDT)
Received: from [192.168.28.181] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id g5sm4578700ljj.69.2019.07.17.08.43.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 08:43:34 -0700 (PDT)
Subject: Re: [PATCH v5 4/4] media: venus: Update core selection
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1563253754-12003-1-git-send-email-amasule@codeaurora.org>
 <1563253754-12003-5-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d9584a56-41a5-3e52-55d0-a02c5d59b823@linaro.org>
Date:   Wed, 17 Jul 2019 18:43:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563253754-12003-5-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/16/19 8:09 AM, Aniket Masule wrote:
> Present core assignment is static. Introduced load balancing
> across the cores. Load on earch core is calculated and core
> with minimum load is assigned to given instance.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c    | 69 +++++++++++++++++++++++---
>  drivers/media/platform/qcom/venus/helpers.h    |  2 +-
>  drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
>  drivers/media/platform/qcom/venus/hfi_parser.h |  5 ++
>  drivers/media/platform/qcom/venus/vdec.c       |  2 +-
>  drivers/media/platform/qcom/venus/venc.c       |  2 +-
>  6 files changed, 72 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index edf403d..d479793 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -26,6 +26,7 @@
>  #include "helpers.h"
>  #include "hfi_helper.h"
>  #include "hfi_venus_io.h"
> +#include "hfi_parser.h"
>  
>  struct intbuf {
>  	struct list_head list;
> @@ -331,6 +332,24 @@ static u32 load_per_instance(struct venus_inst *inst)
>  	return mbs * inst->fps;
>  }
>  
> +static u32 load_per_core(struct venus_core *core, u32 core_id)
> +{
> +	struct venus_inst *inst = NULL;
> +	u32 mbs_per_sec = 0, load = 0;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if (inst->clk_data.core_id != core_id)
> +			continue;
> +
> +		mbs_per_sec = load_per_instance(inst);
> +		load = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;

shouldn't this be load +=  mbs_per_sec * vpp_freq ? We need to calculate
load for every instance on this core_id.

> +	}
> +	mutex_unlock(&core->lock);
> +
> +	return load;
> +}
> +

<cut>

-- 
regards,
Stan
