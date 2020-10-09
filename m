Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EFF288969
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387904AbgJIM5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732829AbgJIM5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 08:57:02 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B564BC0613D5
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 05:57:02 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id m128so10077413oig.7
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+2UjvYQEk6KM0AsuDZuOv+FGWV2KQ+KdyDRwReGjM4=;
        b=Tl8tAm9w5P9TK5QA4yY7Zk6i4bB/OBpkHel+TKMpNNmU+A1VpPpFpuz1C8crWi98+7
         Z0GNF06CV6eAtWET8brSORBZhLkgV3H7M1rR792YhlpNhW9CUjCS3dYK5+lLG/EvrbXj
         yE462SjjECA0jKJc6x5bniKEf4i9YNxDzspHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+2UjvYQEk6KM0AsuDZuOv+FGWV2KQ+KdyDRwReGjM4=;
        b=h2D/2uZwJOaAy+RJNvA7ROxUPFMyUWub6W/ecfSr72fx8J9apjUM1DDIHN1WI1Plfb
         73+pS2FZVC2290GqEC/K6IsojLmijOiUsjc9mOn+/FA9lNXKrqFwQFANXsrxYEZQl3Vo
         BAlebkRHkt3NnzE1JLnnGCW7paRYgVuSAgEV5f07DwDK9oG/sVplf5uDIIJEazK3rFJV
         N4WmyXTRZ/+/lfCqQSrQ6SAPFvb2gksAn4TF1n/801EIksaA+MzU1vX9U8fMB+F0T12i
         3cZWTNfXWbVze7xf6s8bLsjBNvd3Sx1yxqJrRdM8Qsow7+s2lhW0RYNLerbImxLQ2/GW
         sL8A==
X-Gm-Message-State: AOAM533jPn7qrUf2LkGs+SJIqDgEo6E9X61tUkgLw2e8HHXWqaCUEeHy
        py1rft2Ly4FdcYmZScf8PtiFbv/0aKtrDbwM
X-Google-Smtp-Source: ABdhPJxvAt2TLgaXry0WIcCfljuWXjWBqDtTgkXOJ9Uf9be+WjG4euypeJWFGxBicn4exJUJZ3bfGQ==
X-Received: by 2002:aca:5945:: with SMTP id n66mr2401054oib.11.1602248221676;
        Fri, 09 Oct 2020 05:57:01 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id o15sm6183250otj.3.2020.10.09.05.57.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 05:57:00 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id m11so8847952otk.13
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 05:57:00 -0700 (PDT)
X-Received: by 2002:a9d:6445:: with SMTP id m5mr8484954otl.36.1602248219891;
 Fri, 09 Oct 2020 05:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org> <20200928164431.21884-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20200928164431.21884-2-stanimir.varbanov@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 9 Oct 2020 21:56:47 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVFeGcDMWopXA5PNPVHTsgZ5r8L_-zE0TUwm5wFswVdmw@mail.gmail.com>
Message-ID: <CAPBb6MVFeGcDMWopXA5PNPVHTsgZ5r8L_-zE0TUwm5wFswVdmw@mail.gmail.com>
Subject: Re: [PATCH 1/3] venus: vdec: Fix non reliable setting of LAST flag
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 29, 2020 at 1:44 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> In real use of dynamic-resolution-change it is observed that the
> LAST buffer flag (which marks the last decoded buffer with the
> resolution before the resolution-change event) is not reliably set.
>
> Fix this by set the LAST buffer flag on next queued capture buffer
> after the resolution-change event.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h    |  5 +-
>  drivers/media/platform/qcom/venus/helpers.c |  6 +++
>  drivers/media/platform/qcom/venus/vdec.c    | 52 ++++++++++++---------
>  3 files changed, 38 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7b79a33dc9d6..e30eeaf0ada9 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -274,7 +274,6 @@ enum venus_dec_state {
>         VENUS_DEC_STATE_DRAIN           = 5,
>         VENUS_DEC_STATE_DECODING        = 6,
>         VENUS_DEC_STATE_DRC             = 7,
> -       VENUS_DEC_STATE_DRC_FLUSH_DONE  = 8,
>  };
>
>  struct venus_ts_metadata {
> @@ -339,7 +338,7 @@ struct venus_ts_metadata {
>   * @priv:      a private for HFI operations callbacks
>   * @session_type:      the type of the session (decoder or encoder)
>   * @hprop:     a union used as a holder by get property
> - * @last_buf:  last capture buffer for dynamic-resoluton-change
> + * @next_buf_last: a flag to mark next queued capture buffer as last
>   */
>  struct venus_inst {
>         struct list_head list;
> @@ -401,7 +400,7 @@ struct venus_inst {
>         union hfi_get_property hprop;
>         unsigned int core_acquired: 1;
>         unsigned int bit_depth;
> -       struct vb2_buffer *last_buf;
> +       bool next_buf_last;
>  };
>
>  #define IS_V1(core)    ((core)->res->hfi_version == HFI_VERSION_1XX)
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 50439eb1ffea..5ca3920237c5 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1347,6 +1347,12 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
>
>         v4l2_m2m_buf_queue(m2m_ctx, vbuf);
>
> +       /* Skip processing queued capture buffers after LAST flag */
> +       if (inst->session_type == VIDC_SESSION_TYPE_DEC &&
> +           V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
> +           inst->codec_state == VENUS_DEC_STATE_DRC)
> +               goto unlock;
> +
>         cache_payload(inst, vb);
>
>         if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index ea13170a6a2c..c11bdf3ca21b 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -914,10 +914,6 @@ static int vdec_start_capture(struct venus_inst *inst)
>                 return 0;
>
>  reconfigure:
> -       ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
> -       if (ret)
> -               return ret;
> -
>         ret = vdec_output_conf(inst);
>         if (ret)
>                 return ret;
> @@ -954,6 +950,7 @@ static int vdec_start_capture(struct venus_inst *inst)
>         inst->streamon_cap = 1;
>         inst->sequence_cap = 0;
>         inst->reconfig = false;
> +       inst->next_buf_last = false;
>
>         return 0;
>
> @@ -985,6 +982,7 @@ static int vdec_start_output(struct venus_inst *inst)
>         venus_helper_init_instance(inst);
>         inst->sequence_out = 0;
>         inst->reconfig = false;
> +       inst->next_buf_last = false;
>
>         ret = vdec_set_properties(inst);
>         if (ret)
> @@ -1078,9 +1076,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
>                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
>                 break;
>         case VENUS_DEC_STATE_DRC:
> -               WARN_ON(1);
> -               fallthrough;
> -       case VENUS_DEC_STATE_DRC_FLUSH_DONE:
> +               ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
>                 inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
>                 venus_helper_free_dpb_bufs(inst);
>                 break;
> @@ -1204,9 +1200,28 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
>  static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +       static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
>
>         vdec_pm_get_put(inst);
>
> +       mutex_lock(&inst->lock);
> +
> +       if (inst->next_buf_last && V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
> +           inst->codec_state == VENUS_DEC_STATE_DRC) {
> +               vbuf->flags |= V4L2_BUF_FLAG_LAST;
> +               vbuf->sequence = inst->sequence_cap++;
> +               vbuf->field = V4L2_FIELD_NONE;
> +               vb2_set_plane_payload(vb, 0, 0);
> +               v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
> +               v4l2_event_queue_fh(&inst->fh, &eos);
> +               inst->next_buf_last = false;
> +               mutex_unlock(&inst->lock);
> +               return;
> +       }
> +
> +       mutex_unlock(&inst->lock);
> +
>         venus_helper_vb2_buf_queue(vb);
>  }
>
> @@ -1250,13 +1265,6 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>                 vb->timestamp = timestamp_us * NSEC_PER_USEC;
>                 vbuf->sequence = inst->sequence_cap++;
>
> -               if (inst->last_buf == vb) {
> -                       inst->last_buf = NULL;
> -                       vbuf->flags |= V4L2_BUF_FLAG_LAST;
> -                       vb2_set_plane_payload(vb, 0, 0);
> -                       vb->timestamp = 0;
> -               }
> -
>                 if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
>                         const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
>
> @@ -1344,13 +1352,14 @@ static void vdec_event_change(struct venus_inst *inst,
>                 struct vb2_v4l2_buffer *last;
>                 int ret;
>
> -               last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
> -               if (last)
> -                       inst->last_buf = &last->vb2_buf;
> +               inst->next_buf_last = true;
>
> -               ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
> -               if (ret)
> -                       dev_dbg(dev, VDBGH "flush output error %d\n", ret);
> +               last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
> +               if (last) {
> +                       ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
> +                       if (ret)
> +                               dev_dbg(dev, VDBGH "flush output error %d\n", ret);
> +               }

Do we still need to call hfi_session_flush() here? It will be called
in vdec_stop_capture() anyway, and for some reason we are only calling
it if there is a CAPTURE buffer available (which is not guaranteed).

I suspect that we can call it unconditionally, and maybe remove the
call to hfi_session_flush() in vdec_stop_capture() when the state is
VENUS_DEC_STATE_DRC. That way flushing will be performed earlier and
in one place only.

>         }
>
>         inst->reconfig = true;
> @@ -1395,8 +1404,7 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
>
>  static void vdec_flush_done(struct venus_inst *inst)
>  {
> -       if (inst->codec_state == VENUS_DEC_STATE_DRC)
> -               inst->codec_state = VENUS_DEC_STATE_DRC_FLUSH_DONE;
> +       dev_dbg(inst->core->dev_dec, VDBGH "flush done\n");
>  }
>
>  static const struct hfi_inst_ops vdec_hfi_ops = {
> --
> 2.17.1
>
