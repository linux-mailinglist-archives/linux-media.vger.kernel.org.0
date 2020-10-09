Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71DE288920
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgJIMpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732022AbgJIMpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 08:45:43 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A18DC0613D5
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 05:45:42 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m11so8819005otk.13
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 05:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R6eMuYXKQBt8ZcD3TVM9l7/XPveGAmfJeT8PkVlMs9k=;
        b=T0Vu1G/Ug2wRJI0vRjA5g0OvhN2VRMMML12ko89+m0vbUSpLlg5KfV49Ph9urGJKCd
         c69qKYqhH0IWar44sqdiakV75IeEQIvgl+S9z6trLyIukc/KgwDcr6LChy55JCsAeLtF
         mbTtzjwq4dnzqXQSMgyhctpsWK4v0bt4zKZPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R6eMuYXKQBt8ZcD3TVM9l7/XPveGAmfJeT8PkVlMs9k=;
        b=iJ7CKOSCaJlJf+FwYPS7p8HOjCvVqbrbxL37zqmvoQI2UOZTF0J7OTOQmF2fnJ9u4b
         SZLyHnrVt+Ltiu2hTnvv5mjXxv9hu69Kof2eovdvChawqT3Mn7+dezatuPVm8FnJvIkq
         Wh6xXVNjEflYUIAgWZRMLc4vozreQS5BX/yPs8rzarbPVv7z99Im1GPuNCwaObk2rLdH
         uL3UEjiwpP8noAtCDROzd9tjVYOEtbvo11jNDEGkcbbqt2P1c5bAeUYohBrjRXY8SRXA
         oGx55sQy2xE8jZB7ZRKcRmMn35XVUV03DE8UWsP7WaypRB5wR/zxSGbRGFjOzyXl+hsJ
         oeXA==
X-Gm-Message-State: AOAM532lFq4kAZgkbWsqBcDRNnhtLEsBXUeyfZ6DQhbyqcZSwqkyiIY4
        hUv+oc/hNv6f8qYQjLvNobfC9Na+JdJq12DY
X-Google-Smtp-Source: ABdhPJzo4i88IIrd8C5Wvso8vUkNwWo+JktiuMGdy7CV9we3hX+4mfwoYCtCOMdkjjcWA65pYXdeUQ==
X-Received: by 2002:a05:6830:17d8:: with SMTP id p24mr8728168ota.111.1602247541347;
        Fri, 09 Oct 2020 05:45:41 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id z63sm7404101oiz.37.2020.10.09.05.45.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 05:45:40 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id n61so8834419ota.10
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 05:45:40 -0700 (PDT)
X-Received: by 2002:a9d:6445:: with SMTP id m5mr8454412otl.36.1602247539630;
 Fri, 09 Oct 2020 05:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org> <20200928164431.21884-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20200928164431.21884-2-stanimir.varbanov@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 9 Oct 2020 21:45:27 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUMFnzd6zZE4C4T+bX5p=3iKPZp+S_hrTLECvHTHYXrtQ@mail.gmail.com>
Message-ID: <CAPBb6MUMFnzd6zZE4C4T+bX5p=3iKPZp+S_hrTLECvHTHYXrtQ@mail.gmail.com>
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

Is this needed? Whether a resolution change occurs should only be
dependent on what the OUTPUT queue receives, so even if the CAPTURE
queue is stopped and resumed for some reason, pending resolution
change events and their associated LAST buffer should still be
emitted. With this statement we are taking the risk of sending a
change resolution event without a corresponding LAST buffer (so the
following LAST buffer might be misinterpreted).

>
>         return 0;
>
> @@ -985,6 +982,7 @@ static int vdec_start_output(struct venus_inst *inst)
>         venus_helper_init_instance(inst);
>         inst->sequence_out = 0;
>         inst->reconfig = false;
> +       inst->next_buf_last = false;

This one I understand better - if the client seeks, it should probably
check for pending events before resuming.

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

I don't think publishing an EOS event here is correct. As the spec says:

"
... Last of the buffers will have the V4L2_BUF_FLAG_LAST flag set. To
determine the sequence to follow, the client must check if there is
any pending event and:

* if a V4L2_EVENT_SOURCE_CHANGE event with changes set to
V4L2_EVENT_SRC_CH_RESOLUTION is pending, the Dynamic Resolution Change
sequence needs to be followed,
* if a V4L2_EVENT_EOS event is pending, the End of Stream sequence
needs to be followed.
"

With this we will have *both* resolution change and EOS events pending
when the client checks the event queue after receiving the LAST
buffer.


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
