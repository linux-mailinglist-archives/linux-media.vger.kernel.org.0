Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F80423F44C
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 23:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgHGVaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 17:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgHGV3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 17:29:54 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E14C061A2E
        for <linux-media@vger.kernel.org>; Fri,  7 Aug 2020 14:29:53 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a14so2239429edx.7
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2020 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDDWZstNpjGOtdGZCLFEkYVcrKkQad8l/sIeiWx0PNA=;
        b=kHFrwOCm6+H+Lg18Azi6wrn6sp7VnwHKw1qI4a4DgR+2tVfsZWWKguiTnjvT//xN5m
         +s9DfRDsLw8w887oSLClL8uUsRIm2zFWNFSWNKeboOq3831NZe/9N+n5q54bwRWTy6RP
         PhMZZMCgFwBpUwFvhCUk94uzEWzm1PLiMKV38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDDWZstNpjGOtdGZCLFEkYVcrKkQad8l/sIeiWx0PNA=;
        b=S4srR53vDzCJLcL41Y/D9nDK2jp8tkpNUI2x9lo+QPnvpceDp7uDBAKSxU8bx4tcJU
         jR0wuiZZbSWL6Ma01QVeP0R3rmpmYOrAiUdlyOFv4OkIf2Kld2G1KHhWLIW9OAd1LWjI
         ZuhhcdaLSYl7y0YWtSowFrQSEmYRx54FrLSKISHgHuN9axesGXLgJkoAb3qtpJ0hKwQA
         qmzQAlf7Mh/KoZ0UD1sNiLbOGU5iJVSvcY07bXcztzwyfKLu4jTlASAQbOppTbCEimk4
         xVZibveRcbbutiVor79/9T8qNMcGQPKfl31tduM082Au1vfBNg7v3RYRkYH0UUEcj0If
         cj4g==
X-Gm-Message-State: AOAM530InBqo4YdhU9/Lk3bqBPTsyxC2+/UYB5GaUicAU7lQFmuXNmul
        99a3YpQnuTX12sqPc4swYuV8ULTK80c=
X-Google-Smtp-Source: ABdhPJz0Akk/E+udhCxmh2bNiIe+ZOlo11ptnWOULXNBVx+yFSLNzMhfrS5eLVIeEP1xld8zMLO/pg==
X-Received: by 2002:a50:d51e:: with SMTP id u30mr10719290edi.296.1596835791870;
        Fri, 07 Aug 2020 14:29:51 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a101sm6473304edf.76.2020.08.07.14.29.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 14:29:51 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 9so2847766wmj.5
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2020 14:29:51 -0700 (PDT)
X-Received: by 2002:a7b:cb50:: with SMTP id v16mr10118993wmj.11.1596835790795;
 Fri, 07 Aug 2020 14:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200730114632.6717-1-stanimir.varbanov@linaro.org> <20200730114632.6717-4-stanimir.varbanov@linaro.org>
In-Reply-To: <20200730114632.6717-4-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 7 Aug 2020 14:29:38 -0700
X-Gmail-Original-Message-ID: <CAMfZQbxXdNZV8e9o+=0oZ2rvM-QGJwuJpMiMmsQQ7NhG8Y35=w@mail.gmail.com>
Message-ID: <CAMfZQbxXdNZV8e9o+=0oZ2rvM-QGJwuJpMiMmsQQ7NhG8Y35=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] venus: Add new interface queues reinit
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 4:47 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Presently the recovery mechanism is using two hfi functions
> to destroy and create interface queues. For the purpose of
> recovery we don't need to free and allocate the memory used
> for interface message queues, that's why we introduce new
> function which just reinit the queues.  Also this will give
> to the recovery procedure one less reason to fail (if for
> some reason we couldn't allocate memory).
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c      |  3 +-
>  drivers/media/platform/qcom/venus/hfi.c       |  5 ++
>  drivers/media/platform/qcom/venus/hfi.h       |  1 +
>  drivers/media/platform/qcom/venus/hfi_venus.c | 51 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/hfi_venus.h |  1 +
>  5 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 46f6e34d435a..eda8f35425df 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -72,8 +72,7 @@ static void venus_sys_error_handler(struct work_struct *work)
>         while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
>                 usleep_range(1000, 1500);
>
> -       hfi_destroy(core);
> -       ret |= hfi_create(core, &venus_core_ops);
> +       hfi_reinit(core);
>
>         pm_runtime_get_sync(core->dev);
>
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index a211eb93e0f9..a59022adb14c 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -517,3 +517,8 @@ void hfi_destroy(struct venus_core *core)
>  {
>         venus_hfi_destroy(core);
>  }
> +
> +void hfi_reinit(struct venus_core *core)
> +{
> +       venus_hfi_queues_reinit(core);
> +}
> diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
> index 62c315291484..f25d412d6553 100644
> --- a/drivers/media/platform/qcom/venus/hfi.h
> +++ b/drivers/media/platform/qcom/venus/hfi.h
> @@ -145,6 +145,7 @@ struct hfi_ops {
>
>  int hfi_create(struct venus_core *core, const struct hfi_core_ops *ops);
>  void hfi_destroy(struct venus_core *core);
> +void hfi_reinit(struct venus_core *core);
>
>  int hfi_core_init(struct venus_core *core);
>  int hfi_core_deinit(struct venus_core *core, bool blocking);
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 3392fd177d22..90067cd8c892 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1603,3 +1603,54 @@ int venus_hfi_create(struct venus_core *core)
>         core->ops = NULL;
>         return ret;
>  }
> +
> +void venus_hfi_queues_reinit(struct venus_core *core)
> +{
> +       struct venus_hfi_device *hdev = to_hfi_priv(core);
> +       struct hfi_queue_table_header *tbl_hdr;
> +       struct iface_queue *queue;
> +       struct hfi_sfr *sfr;
> +       unsigned int i;
> +
> +       mutex_lock(&hdev->lock);
> +
> +       for (i = 0; i < IFACEQ_NUM; i++) {
> +               queue = &hdev->queues[i];
> +               queue->qhdr =
> +                       IFACEQ_GET_QHDR_START_ADDR(hdev->ifaceq_table.kva, i);
> +
> +               venus_set_qhdr_defaults(queue->qhdr);
> +
> +               queue->qhdr->start_addr = queue->qmem.da;
> +
> +               if (i == IFACEQ_CMD_IDX)
> +                       queue->qhdr->type |= HFI_HOST_TO_CTRL_CMD_Q;
> +               else if (i == IFACEQ_MSG_IDX)
> +                       queue->qhdr->type |= HFI_CTRL_TO_HOST_MSG_Q;
> +               else if (i == IFACEQ_DBG_IDX)
> +                       queue->qhdr->type |= HFI_CTRL_TO_HOST_DBG_Q;
> +       }
> +
> +       tbl_hdr = hdev->ifaceq_table.kva;
> +       tbl_hdr->version = 0;
> +       tbl_hdr->size = IFACEQ_TABLE_SIZE;
> +       tbl_hdr->qhdr0_offset = sizeof(struct hfi_queue_table_header);
> +       tbl_hdr->qhdr_size = sizeof(struct hfi_queue_header);
> +       tbl_hdr->num_q = IFACEQ_NUM;
> +       tbl_hdr->num_active_q = IFACEQ_NUM;
> +
> +       /*
> +        * Set receive request to zero on debug queue as there is no
> +        * need of interrupt from video hardware for debug messages
> +        */
> +       queue = &hdev->queues[IFACEQ_DBG_IDX];
> +       queue->qhdr->rx_req = 0;
> +
> +       sfr = hdev->sfr.kva;
> +       sfr->buf_size = ALIGNED_SFR_SIZE;
> +
> +       /* ensure table and queue header structs are settled in memory */
> +       wmb();
> +
> +       mutex_unlock(&hdev->lock);
> +}
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.h b/drivers/media/platform/qcom/venus/hfi_venus.h
> index 57154832090e..1b656ef2bf07 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.h
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.h
> @@ -10,5 +10,6 @@ struct venus_core;
>
>  void venus_hfi_destroy(struct venus_core *core);
>  int venus_hfi_create(struct venus_core *core);
> +void venus_hfi_queues_reinit(struct venus_core *core);
>
>  #endif
> --
> 2.17.1
>
Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
