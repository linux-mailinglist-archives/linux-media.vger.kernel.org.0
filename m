Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CFB2C37C3
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 05:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgKYDq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 22:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgKYDq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 22:46:26 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D783BC0613D4
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 19:46:25 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id d17so1126968lfq.10
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 19:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iWJ2PxSKNZHDS2Ua2u1Wmpd29m5i/L9+HSOLkHwMbCk=;
        b=R0WuyVaMjH2QJ8CY+HC7ldiC5un9Mr0EBkLuwvsaTOX2MsnoMgajoV5Op/CJH5/9V6
         OZymeQPRIlFeetVrKQ3UY5Sjf5VnmiB2ajiZhgBieJVEEhF2h9AwSx14a4KwKaR0hAwt
         gIs2lW9lFP6QTawQYIAxuG+q2MzLh2U4kzOSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iWJ2PxSKNZHDS2Ua2u1Wmpd29m5i/L9+HSOLkHwMbCk=;
        b=OAfwpXCNptLikXbogDlKoRQeKYjGOaXlWAZV04PQ89BRyyISO+Jiu7oqt1AijZdR1C
         5BWtJeia/MJx8HBnOGtnmbucd2r2veyfGr3qZokLuMn87kFPMqLfmCPrKjY0WCP1/C6H
         iLSwIguz7Tf0IuMXm4hr4lgiATYI9bf75zDWspx0zzu3RcaAd8fKj8Fp9o8r3Rczqcn0
         bwWU1TkAg93JabvX4tDWGJNdTemRxIOw31osn8D4BNLh0RmCpSwkPQ3UjwkRQZmb05nm
         MyFiynsesf/zl2qL7MJ9u6rXOpKgszzH++nADrTWWVb5KxZSWhaO6PNpYE0QjMBEgGIv
         Vo1w==
X-Gm-Message-State: AOAM530jauZhK981CLy2ReqtigXjJhXxIqzZT0PojaJ6tF44IQqBCxUA
        MncYOEveWhUisP117LrixoBIya7JASWDXQ==
X-Google-Smtp-Source: ABdhPJx9zsry76cf9UFNgswIlWiaTwfwkcR2lt25nDb3o0k+t0tACwj1LS3xd2lwaD6slp4rzYxGlw==
X-Received: by 2002:a05:6512:21d:: with SMTP id a29mr482957lfo.444.1606275983682;
        Tue, 24 Nov 2020 19:46:23 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id b8sm100869ljo.68.2020.11.24.19.46.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 19:46:22 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id s30so1161941lfc.4
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 19:46:22 -0800 (PST)
X-Received: by 2002:a19:7e16:: with SMTP id z22mr480929lfc.73.1606275982178;
 Tue, 24 Nov 2020 19:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org> <20201120001037.10032-3-stanimir.varbanov@linaro.org>
In-Reply-To: <20201120001037.10032-3-stanimir.varbanov@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 25 Nov 2020 12:46:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUnXmtSKy9NwikYXjafgB+WM9TKEFjkYK16T2V7KRx=JQ@mail.gmail.com>
Message-ID: <CAPBb6MUnXmtSKy9NwikYXjafgB+WM9TKEFjkYK16T2V7KRx=JQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] venus: Limit HFI sessions to the maximum supported
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 20, 2020 at 9:12 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Currently we rely on firmware to return error when we reach the maximum
> supported number of sessions. But this errors are happened at reqbuf
> time which is a bit later. The more reasonable way looks like is to
> return the error on driver open.
>
> To achieve that modify hfi_session_create to return error when we reach
> maximum count of sessions and thus refuse open.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h      |  1 +
>  drivers/media/platform/qcom/venus/hfi.c       | 19 +++++++++++++++----
>  .../media/platform/qcom/venus/hfi_parser.c    |  3 +++
>  3 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index db0e6738281e..3a477fcdd3a8 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -96,6 +96,7 @@ struct venus_format {
>  #define MAX_CAP_ENTRIES                32
>  #define MAX_ALLOC_MODE_ENTRIES 16
>  #define MAX_CODEC_NUM          32
> +#define MAX_SESSIONS           16
>
>  struct raw_formats {
>         u32 buftype;
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index 638ed5cfe05e..8420be6d3991 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -175,6 +175,7 @@ static int wait_session_msg(struct venus_inst *inst)
>  int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
>  {
>         struct venus_core *core = inst->core;
> +       int ret;
>
>         if (!ops)
>                 return -EINVAL;
> @@ -183,12 +184,22 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
>         init_completion(&inst->done);
>         inst->ops = ops;
>
> -       mutex_lock(&core->lock);
> -       list_add_tail(&inst->list, &core->instances);
> -       atomic_inc(&core->insts_count);
> +       ret = mutex_lock_interruptible(&core->lock);
> +       if (ret)
> +               return ret;

Why do we change to mutex_lock_interruptible() here? This makes this
function return an error even though we could obtain the lock just by
trying a bit harder.

> +
> +       ret = atomic_read(&core->insts_count);
> +       if (ret + 1 > core->max_sessions_supported) {
> +               ret = -EAGAIN;
> +       } else {
> +               atomic_inc(&core->insts_count);
> +               list_add_tail(&inst->list, &core->instances);
> +               ret = 0;
> +       }
> +
>         mutex_unlock(&core->lock);
>
> -       return 0;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(hfi_session_create);
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 363ee2a65453..52898633a8e6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -276,6 +276,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>                 words_count--;
>         }
>
> +       if (!core->max_sessions_supported)
> +               core->max_sessions_supported = MAX_SESSIONS;
> +
>         parser_fini(inst, codecs, domain);
>
>         return HFI_ERR_NONE;
> --
> 2.17.1
>
