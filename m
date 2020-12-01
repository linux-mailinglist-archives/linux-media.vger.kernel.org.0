Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B545E2C9598
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 04:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgLADKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 22:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLADKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 22:10:21 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC079C0613CF
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 19:09:34 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id r18so350200ljc.2
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 19:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDVDschaWntS/kjfsZJ9z/QW9d+XVa+aVBHR0hnauGw=;
        b=fBNr0Q5OPvuxwwpF9TzfNL6A+pR2mQumhRxGCZCKfpiLtO9ON5hunyXeH9oM9iH7O0
         zCgJ+jBzM4mkTvQpr4eSGt2jAjCwxo51S/tA3NRnsXquzbypfU4nx+KP0fqFju2qu5G+
         /YjoV/XGzegWMUUOSYHi+TDndkfisTwjStUZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDVDschaWntS/kjfsZJ9z/QW9d+XVa+aVBHR0hnauGw=;
        b=sqahuVAbyMCc5wH3QDk+CRfAqWw7nC/hRZ5W8oKg9rDvOWMvljENA2Sp34aKERnfrs
         4zINijhJUscsrDLkzr7UL6JJhyCqaiZ5pV9qshK/tNqG7GLuFcHbezKfn0dwqKVJjeXU
         WOzfuNNv+A5zI4uzeO9PU0lwOorYlpxaOlV6oKQmt5j40YSUoQxlb9KiC2ZzEFEzGaiy
         AoA3lRJb7NigaXBP/D98ulfl3TKc3c1di8cw1zgsqXoChYXeBeulhXKU4o62/unfS8+G
         OwL4RQhIQL8GKFSu/3Gk094orhDxw5izGCoyj0dEVvdDbHdR2oWg44SKrtpfeZjzd5zG
         XFlg==
X-Gm-Message-State: AOAM532MwxB5GSTJaL08aoFjVZvAiJLyOnqdQwNJniLQ+AKgaWipbgiO
        6J8sIwXX6st2Dz8hFjYlqEXk7A/sNePH+jM7
X-Google-Smtp-Source: ABdhPJzvNBcF1fNgXE2/EFHacG/0dj0LGQdYRRWxQ3rkCBYRqaAsP0nNKK0u+K0nD8hTw/YfpMHnSQ==
X-Received: by 2002:a2e:991a:: with SMTP id v26mr320181lji.128.1606792172890;
        Mon, 30 Nov 2020 19:09:32 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id c23sm51984lfg.83.2020.11.30.19.09.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 19:09:31 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id y16so355029ljk.1
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 19:09:31 -0800 (PST)
X-Received: by 2002:a2e:8115:: with SMTP id d21mr280666ljg.379.1606792171335;
 Mon, 30 Nov 2020 19:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20201128063629.1830702-1-frkoenig@chromium.org>
In-Reply-To: <20201128063629.1830702-1-frkoenig@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 1 Dec 2020 12:09:19 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX8aiZ3q1CTuHTK+68UmOzmm03ruJcHREu+XBd3jCKCbg@mail.gmail.com>
Message-ID: <CAPBb6MX8aiZ3q1CTuHTK+68UmOzmm03ruJcHREu+XBd3jCKCbg@mail.gmail.com>
Subject: Re: [PATCH] venus: vdec: Handle DRC after drain
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 28, 2020 at 3:40 PM Fritz Koenig <frkoenig@chromium.org> wrote:
>
> If the DRC is near the end of the stream the client
> may send a V4L2_DEC_CMD_STOP before the DRC occurs.
> V4L2_DEC_CMD_STOP puts the driver into the
> VENUS_DEC_STATE_DRAIN state.  DRC must be aware so
> that after the DRC event the state can be restored
> correctly.
>
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
>
> ---
>
> This is an attempt to fix the logic for when a DRC occurs
> after the driver is in VENUS_DEC_STATE_DRAIN state.  This
> works for me, but I'm not sure if I covered all the cases.
> Specifically I'm not sure if I reset |drain_active| in all
> the right places.
>
>  drivers/media/platform/qcom/venus/core.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c | 19 +++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 2b0899bf5b05f..1680c936c06fb 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -406,6 +406,7 @@ struct venus_inst {
>         unsigned int core_acquired: 1;
>         unsigned int bit_depth;
>         bool next_buf_last;
> +       bool drain_active;
>  };
>
>  #define IS_V1(core)    ((core)->res->hfi_version == HFI_VERSION_1XX)
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 5671cf3458a68..7edbefbd75210 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -523,8 +523,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>
>                 ret = hfi_session_process_buf(inst, &fdata);
>
> -               if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
> +               if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
>                         inst->codec_state = VENUS_DEC_STATE_DRAIN;
> +                       inst->drain_active = true;
> +               }
>         }
>
>  unlock:
> @@ -976,10 +978,14 @@ static int vdec_start_capture(struct venus_inst *inst)
>
>         inst->codec_state = VENUS_DEC_STATE_DECODING;
>
> +       if (inst->drain_active)
> +               inst->codec_state = VENUS_DEC_STATE_DRAIN;
> +
>         inst->streamon_cap = 1;
>         inst->sequence_cap = 0;
>         inst->reconfig = false;
>         inst->next_buf_last = false;
> +       inst->drain_active = false;
>
>         return 0;
>
> @@ -1105,6 +1111,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
>                 /* fallthrough */
>         case VENUS_DEC_STATE_DRAIN:
>                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
> +               inst->drain_active = false;
>                 /* fallthrough */
>         case VENUS_DEC_STATE_SEEK:
>                 vdec_cancel_dst_buffers(inst);
> @@ -1304,8 +1311,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>
>                         v4l2_event_queue_fh(&inst->fh, &ev);
>
> -                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN) {
> +                               inst->drain_active = false;
>                                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
> +                       }
>                 }
>
>                 if (!bytesused)
> @@ -1429,11 +1438,17 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
>         case EVT_SYS_EVENT_CHANGE:
>                 switch (data->event_type) {
>                 case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +                               inst->codec_state = VENUS_DEC_STATE_DECODING;
>                         vdec_event_change(inst, data, true);
>                         break;
>                 case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> +                               inst->codec_state = VENUS_DEC_STATE_DECODING;
>                         vdec_event_change(inst, data, false);
>                         break;
> +               // TODO(fritz) : does HFI_EVENT_RELEASE_BUFFER_REFERENCE also need to
> +               // change the codec_state to VENUS_DEC_STATE_DECODING?

I don't think it does, but Stanimir can confirm probably. In any case
we should remove this TODO in the next version. :)

>                 case HFI_EVENT_RELEASE_BUFFER_REFERENCE:
>                         venus_helper_release_buf_ref(inst, data->tag);
>                         break;
> --
> 2.29.2.454.gaff20da3a2-goog
>
