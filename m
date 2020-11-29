Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE022C7835
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 07:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgK2GKS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 01:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgK2GKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 01:10:18 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44507C0613D1
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:09:38 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id y22so2459566edv.1
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fu+OLgh33kd4c7uWtP+T5ynLNcOve17zeiTVDhx2z0E=;
        b=Qh2PVWDDKHbM51luphJ8s7JPsgXiObRyw72WqBT9N9N9or5ya0Z6xdKAxIwuNUEGY/
         nRDDC6DFhZvs5Tr3NxBaaAGWcbCV5CdvNRXmECCTBQFvGE0vsJCZrXTSkJPVV3YOCFzE
         Lmp+hcqE7JreKxxzd4FjCfh4cR29RXg3n1f/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fu+OLgh33kd4c7uWtP+T5ynLNcOve17zeiTVDhx2z0E=;
        b=ERQLmPWMH9Z5RvKyQUuLRRpwb4aNVpVUnlldVdqXarxpi1a2S/hElWUs8EJjentMNA
         G0jqc0FsC33+qvZqkbxxkAUq3ciNUGuHo3L8nWuV8EvHityRVkoVXRtfhl6jXLVfTUv9
         fuHvYwBrxvXGq8NDgJ0gHE5ySulHHYRipqzOSqlDtXGlDjrQauNs2sqbB1MGdr1kkNUl
         4Zq1sYscM6x1aczJIMjzS2eSkWUvXWX5JORbXahZxWhcoG8MuyUcAF52Jx6hlIUm2fLQ
         oV8Zs7NHegvf8rHCH/y0/sT+TOO+SZMzd/rKnp5eKFoZeTfFPv57/EEahXXmSDOdG5ji
         1XLA==
X-Gm-Message-State: AOAM531F8f3Aw4HZsh2Isy0xBN+r4Bf0yMLol1shaA34ADbOHYV3b2UH
        1d0Q8t7Adonr84fBPAQBavo0l+8mkpmV8g==
X-Google-Smtp-Source: ABdhPJwk7d95KnEMsIkw5gv8rp60s98NCMRfWMYMC54Hcv8Kow0Qxb1ZlC5Jcs4r0BTDa5ogRR91Lw==
X-Received: by 2002:a50:c2ca:: with SMTP id u10mr3525808edf.355.1606630176861;
        Sat, 28 Nov 2020 22:09:36 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id b21sm7220897ejz.102.2020.11.28.22.09.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:09:36 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id 10so11789563wml.2
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:09:36 -0800 (PST)
X-Received: by 2002:a1c:8155:: with SMTP id c82mr10594340wmd.49.1606630175847;
 Sat, 28 Nov 2020 22:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-9-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-9-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:09:23 -0800
X-Gmail-Original-Message-ID: <CAMfZQbyvWYAUF=+mR_E-X_P8TtiJnC2P-=vR-9mxVTn_hJmp7Q@mail.gmail.com>
Message-ID: <CAMfZQbyvWYAUF=+mR_E-X_P8TtiJnC2P-=vR-9mxVTn_hJmp7Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] venus: helpers: Delete unused stop streaming helper
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
> After re-design of encoder driver this helper is not needed
> anymore.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 43 ---------------------
>  drivers/media/platform/qcom/venus/helpers.h |  1 -
>  2 files changed, 44 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 490c026b58a3..51c80417f361 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1406,49 +1406,6 @@ void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_buffers_done);
>
> -void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
> -{
> -       struct venus_inst *inst = vb2_get_drv_priv(q);
> -       struct venus_core *core = inst->core;
> -       int ret;
> -
> -       mutex_lock(&inst->lock);
> -
> -       if (inst->streamon_out & inst->streamon_cap) {
> -               ret = hfi_session_stop(inst);
> -               ret |= hfi_session_unload_res(inst);
> -               ret |= venus_helper_unregister_bufs(inst);
> -               ret |= venus_helper_intbufs_free(inst);
> -               ret |= hfi_session_deinit(inst);
> -
> -               if (inst->session_error || core->sys_error)
> -                       ret = -EIO;
> -
> -               if (ret)
> -                       hfi_session_abort(inst);
> -
> -               venus_helper_free_dpb_bufs(inst);
> -
> -               venus_pm_load_scale(inst);
> -               INIT_LIST_HEAD(&inst->registeredbufs);
> -       }
> -
> -       venus_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -                                 VB2_BUF_STATE_ERROR);
> -       venus_helper_buffers_done(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
> -                                 VB2_BUF_STATE_ERROR);
> -
> -       if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> -               inst->streamon_out = 0;
> -       else
> -               inst->streamon_cap = 0;
> -
> -       venus_pm_release_core(inst);
> -
> -       mutex_unlock(&inst->lock);
> -}
> -EXPORT_SYMBOL_GPL(venus_helper_vb2_stop_streaming);
> -
>  int venus_helper_process_initial_cap_bufs(struct venus_inst *inst)
>  {
>         struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 231af29667e7..3eae2acbcc8e 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -20,7 +20,6 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
>  int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb);
>  void venus_helper_vb2_buf_queue(struct vb2_buffer *vb);
>  void venus_helper_process_buf(struct vb2_buffer *vb);
> -void venus_helper_vb2_stop_streaming(struct vb2_queue *q);
>  int venus_helper_vb2_start_streaming(struct venus_inst *inst);
>  void venus_helper_m2m_device_run(void *priv);
>  void venus_helper_m2m_job_abort(void *priv);
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
