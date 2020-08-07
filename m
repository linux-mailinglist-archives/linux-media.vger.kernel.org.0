Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B7423F43E
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 23:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgHGV33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 17:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbgHGV32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 17:29:28 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01591C061757
        for <linux-media@vger.kernel.org>; Fri,  7 Aug 2020 14:29:28 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id jp10so3505118ejb.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2020 14:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yecGcmW1H4YPmsU+YTc6bYsirnPkC2akIxfo68Ph3IA=;
        b=gVBBXSHyNzt8rNePfxY1ncMz7C4eDz4YWTWWTL23EgpsUmW0Gtu+IKVQzZZPPajUsm
         p+OLXMUQs7aok7cm7IafP4KTyvjZ2lMscp0WHC6AWnh+T5kKyC6VdzIPuVb3JbmIPi0N
         MRZXC0Hsmo+yByNOzIxP7XAR4M6tykynCQNxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yecGcmW1H4YPmsU+YTc6bYsirnPkC2akIxfo68Ph3IA=;
        b=lQwGoGUJPi4rvqHsufoxhJyDFWlMJUfsXfg8gdry6qiQ1UU/0idohZnIMmBqk3D+6v
         uGW/F587Fp18YTyDiwbSt9Lj/VW9yLLDbk0KPxx7PXG/W/f7H7uE09LP8Q4PDg3V/EsB
         mSTjDBTuqzr3Y7L4c+BL2XuOkD33iEb3v9VuUllXpUayG0PCNXhl7L38gxNLAdf0Z8Md
         aSc7PZ8x5bOUJaBdUjvnMxhLU1DrtvtQmnzdSvYdUMU0GprElzMqCPA9EqE8iZw/ZybS
         31TBnZPDpbIggpSnNrm1HPMIAB9Gsp56YYpAx/DtbGGgh0hNbpn/Y/bwgIdFA+c/TZ3S
         ynYg==
X-Gm-Message-State: AOAM531Lh1a5bJVRp25Zmiww3XAJi7GpFYSMCavclAjs3D9B3B4v+/M0
        bgnu47+jVvd7NNdNYTleEgZb3glz/nSUPg==
X-Google-Smtp-Source: ABdhPJwThx/rDiSnUNjjcaBoyO2hJXufeD5XDEJQG1lMqxsSbwWS2oRE5FlDxExyz/faYMh0etZmlg==
X-Received: by 2002:a17:906:6d54:: with SMTP id a20mr11832282ejt.501.1596835766495;
        Fri, 07 Aug 2020 14:29:26 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id h13sm565631edt.30.2020.08.07.14.29.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 14:29:26 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id c15so2858309wrs.11
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2020 14:29:25 -0700 (PDT)
X-Received: by 2002:adf:dfc7:: with SMTP id q7mr13741548wrn.80.1596835765510;
 Fri, 07 Aug 2020 14:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200730114632.6717-1-stanimir.varbanov@linaro.org> <20200730114632.6717-3-stanimir.varbanov@linaro.org>
In-Reply-To: <20200730114632.6717-3-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 7 Aug 2020 14:29:13 -0700
X-Gmail-Original-Message-ID: <CAMfZQbxUxm0FSjZUgrb7a_j_W2S1W=p2KQZT-hpOf2UyaVPNOw@mail.gmail.com>
Message-ID: <CAMfZQbxUxm0FSjZUgrb7a_j_W2S1W=p2KQZT-hpOf2UyaVPNOw@mail.gmail.com>
Subject: Re: [PATCH 2/3] venus: Rework recovery mechanism
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
> After power domains and clock restructuring the recovery for
> sdm845 and v4 did not work properly. Fix that by reworking the
> recovery function and the sequence.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c      | 24 ++++++++++---------
>  drivers/media/platform/qcom/venus/hfi_venus.c | 11 ---------
>  2 files changed, 13 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c6538044f..46f6e34d435a 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -6,6 +6,7 @@
>  #include <linux/init.h>
>  #include <linux/interconnect.h>
>  #include <linux/ioctl.h>
> +#include <linux/delay.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -40,13 +41,7 @@ static void venus_event_notify(struct venus_core *core, u32 event)
>         mutex_unlock(&core->lock);
>
>         disable_irq_nosync(core->irq);
> -
> -       /*
> -        * Delay recovery to ensure venus has completed any pending cache
> -        * operations. Without this sleep, we see device reset when firmware is
> -        * unloaded after a system error.
> -        */
> -       schedule_delayed_work(&core->work, msecs_to_jiffies(100));
> +       schedule_delayed_work(&core->work, msecs_to_jiffies(10));
>  }
>
>  static const struct hfi_core_ops venus_core_ops = {
> @@ -59,23 +54,30 @@ static void venus_sys_error_handler(struct work_struct *work)
>                         container_of(work, struct venus_core, work.work);
>         int ret = 0;
>
> -       dev_warn(core->dev, "system error has occurred, starting recovery!\n");
> -
>         pm_runtime_get_sync(core->dev);
>
>         hfi_core_deinit(core, true);
> -       hfi_destroy(core);
> +
> +       dev_warn(core->dev, "system error has occurred, starting recovery!\n");
> +
>         mutex_lock(&core->lock);
> +
> +       while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
> +               msleep(10);
> +
>         venus_shutdown(core);
>
>         pm_runtime_put_sync(core->dev);
>
> +       while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
> +               usleep_range(1000, 1500);
> +
> +       hfi_destroy(core);
>         ret |= hfi_create(core, &venus_core_ops);
>
>         pm_runtime_get_sync(core->dev);
>
>         ret |= venus_boot(core);
> -
>         ret |= hfi_core_resume(core, true);
>
>         enable_irq(core->irq);
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 0d8855014ab3..3392fd177d22 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -986,13 +986,6 @@ static void venus_process_msg_sys_error(struct venus_hfi_device *hdev,
>
>         venus_set_state(hdev, VENUS_STATE_DEINIT);
>
> -       /*
> -        * Once SYS_ERROR received from HW, it is safe to halt the AXI.
> -        * With SYS_ERROR, Venus FW may have crashed and HW might be
> -        * active and causing unnecessary transactions. Hence it is
> -        * safe to stop all AXI transactions from venus subsystem.
> -        */
> -       venus_halt_axi(hdev);
>         venus_sfr_print(hdev);
>  }
>
> @@ -1009,10 +1002,6 @@ static irqreturn_t venus_isr_thread(struct venus_core *core)
>         res = hdev->core->res;
>         pkt = hdev->pkt_buf;
>
> -       if (hdev->irq_status & WRAPPER_INTR_STATUS_A2HWD_MASK) {
> -               venus_sfr_print(hdev);
> -               hfi_process_watchdog_timeout(core);
> -       }
>
>         while (!venus_iface_msgq_read(hdev, pkt)) {
>                 msg_ret = hfi_process_msg_packet(core, pkt);
> --
> 2.17.1
>
Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
