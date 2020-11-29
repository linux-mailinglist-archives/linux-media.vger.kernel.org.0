Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5120E2C7834
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 07:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgK2GJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 01:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgK2GJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 01:09:27 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59357C0617A7
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:08:41 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id bo9so14269050ejb.13
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wt+i8mCuCik4YSJ0kM//c8mqY8ZlAwEjQilfu5+58jE=;
        b=QnkG6tHZpsm7stG82Y/AGjsPdf4vitr0uJ5ICNCnZ5wuKuQJro4vd/FvhGlRFZBc8R
         6iebDWJ/oMEF5rw6NOZ1eo+b6YQVnvy/462GBGSJcpI/asxCiq9LImNJxxtk9MvRKEK9
         hiQfbidc74wwYNgEqO93ji3L8h0FRQaEMfScQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wt+i8mCuCik4YSJ0kM//c8mqY8ZlAwEjQilfu5+58jE=;
        b=f+J/pd99Fkk8nVPmd/fa6A18PjsYj7yiLt6tc5HxUMjHGDuZ116HT2cumdOabhYtto
         vBmGL1uCY3pkNQzVL/sVs7xDmK5r8yO3yYXt69s1UhvuOhUgAFk/pSoo8OkxczzRetio
         6B/NfpXdyFFkag53pCDYh42yXyzgibDMj+VAf0pBdriTByJ1e0XjO9pf+7V4BbQAqany
         HzN5Ley1Gx55s9Sk29+P3hnyJRSgIczdKnxP8sDWJXrIQ5uM2FtRQ0Js5EHqTDhbC4DQ
         AFShd2NABBGtlvHCkxJ2xXZvq5Q3CdsxRA+MuuViZ+Wt5kQu6/zP2feRY9EzJv573ugz
         6EUQ==
X-Gm-Message-State: AOAM530a4174+BJA5gAsFa3XxqqisWlMTtNeo8HlPH8WyvkLmdAbKWXN
        uK/Wv04Yq9a1fF9djHQiC/zPyafX6nOINA==
X-Google-Smtp-Source: ABdhPJwaiJnC0gYluhczSXILd/Q8oE8K4OyC4GxfBgyoU16X8M2Ra7SIv2JPcDody5S2Op8nBVv+pw==
X-Received: by 2002:a17:906:46d2:: with SMTP id k18mr14724072ejs.33.1606630120006;
        Sat, 28 Nov 2020 22:08:40 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id f19sm7290925edy.13.2020.11.28.22.08.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:08:39 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id d3so8698187wmb.4
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:08:39 -0800 (PST)
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr17108061wml.11.1606630119035;
 Sat, 28 Nov 2020 22:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-6-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-6-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:08:26 -0800
X-Gmail-Original-Message-ID: <CAMfZQbxfLw_Rwz9jjpzvEO7bnBdQoW_UbA45G1UmBjADEUHfFw@mail.gmail.com>
Message-ID: <CAMfZQbxfLw_Rwz9jjpzvEO7bnBdQoW_UbA45G1UmBjADEUHfFw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] venus: pm_helpers: Check instance state when
 calculate instance frequency
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Skip calculating instance frequency if it is not in running state.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index ca99908ca3d3..cc84dc5e371b 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -940,6 +940,9 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>
>         mbs_per_sec = load_per_instance(inst);
>
> +       if (inst->state != INST_START)
> +               return 0;
> +
>         vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>         /* 21 / 20 is overhead factor */
>         vpp_freq += vpp_freq / 20;
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
