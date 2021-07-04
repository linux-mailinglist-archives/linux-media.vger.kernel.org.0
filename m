Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4AF3BAD3C
	for <lists+linux-media@lfdr.de>; Sun,  4 Jul 2021 15:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhGDOAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 10:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDOAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jul 2021 10:00:49 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A95C061764
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 06:58:13 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id w13so9597153wmc.3
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=peVQlgAuI5gkYWsPGWsMpKMwMbGy8VbXwAvEnwV33sc=;
        b=pZCtNNLKX0dyXJx268hpQEX4T7tBZeH/yhIJwK39iZ9biqlAuBd3rXsN/piETw20hq
         883k8IncemeG5P4DQ3/O1ha2spPpj5vsIIt2hxsnQpitKhPVPMEWAp1NAM8UKz7Fzf0W
         kTeYCxKWy9rbKNhvWy0jf0+Wr/B/TU9txw25dwRsSFFDGVxJFE5A0PiCsgfbnVqPFKau
         /761rZVFnQ/KsRke+/Vd23fbg+JZiWYu8feMkftielg+hmgTvi8rvjmtq8ZK4HVmlYBg
         YpkimxjJZBzBtYT/JLfB/QwE2d1PGjtE9tccnBgUrJANcBUwM3GMtKjouriPbAcIXytz
         jl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=peVQlgAuI5gkYWsPGWsMpKMwMbGy8VbXwAvEnwV33sc=;
        b=A9zMEvoOTnRQM6db2U1nkwtntYgWg6Nf5enWVcVLME7nNxBkjcqg9HGBRarB+O48eA
         iX5yUNqxMeXVNObWE4Dcz05Hd54C52arOYFNp9tkccPJvvjqyJj/oElFwB2w6Nn0KXuX
         HYCkeqWJIdukdW0YYySeIca1bDiODrWM2bJIqTaOokXAg8EWnzYuEXVpumXXPRM+aHXD
         YIfKTJO/sR0JpRfmpONBaaGxS3tC/tGviAxRfXOC/+ujKUr1dXuvuNy+EtOTW7yBszqt
         DemzJxWMRRZm2SgOwE9C0wpFMnU1sHmncUaD4UUPXx08dk922BJXHhcxBcpdCGuxBvii
         Y/FQ==
X-Gm-Message-State: AOAM533vp/DSugTiKn0nJmPV8I89DgkxLTk+qYytn1Kd4ncFCohC+9zT
        J1UKoIXXF0rKo7mZDfhY4nNJZQ==
X-Google-Smtp-Source: ABdhPJwnhV14VXeXgp+GI7enKPTisXpz3vnGi/SpdWSsm3jJJvKc7G0FswrrqpLsf1d+yltwy5cDSQ==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr7411278wmj.101.1625407091623;
        Sun, 04 Jul 2021 06:58:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t17sm9502969wrs.61.2021.07.04.06.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 06:58:10 -0700 (PDT)
Subject: Re: [V3] venus: helper: do not set constrained parameters for UBWC
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org
References: <1625202979-23232-1-git-send-email-mansur@codeaurora.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <3c3051aa-c897-266e-9648-ca6be933fda0@nexus-software.ie>
Date:   Sun, 4 Jul 2021 15:00:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1625202979-23232-1-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/07/2021 06:16, Mansur Alisha Shaik wrote:
> plane constraints firmware interface is to override the default

nitpick this should be "Plane constraints"

> alignment for a given color format. By default venus hardware has
> alignments as 128x32, but NV12 was defined differently to meet
> various usecases. Compressed NV12 has always been aligned as 128x32,
> hence not needed to override the default alignment.
> 
> Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual plane constraints to FW")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> 
> Changes in V3:
> - Elaborated commit message as per comments by Bryan
> - As per Bryan comment alligned fixes in single line.
> ---
>   drivers/media/platform/qcom/venus/helpers.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 1fe6d46..601ee3e 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1137,8 +1137,12 @@ int venus_helper_set_format_constraints(struct venus_inst *inst)
>   	if (!IS_V6(inst->core))
>   		return 0;
>   
> +	if (inst->opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC)
> +		return 0;
> +
>   	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>   	pconstraint.num_planes = 2;
> +

zap this newline, its not adding anything to your patch

>   	pconstraint.plane_format[0].stride_multiples = 128;
>   	pconstraint.plane_format[0].max_stride = 8192;
>   	pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
> 

then please add my

"Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>"

---
bod
