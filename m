Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6C42CBA82
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 11:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgLBKZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 05:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgLBKZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 05:25:35 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C66C0613CF
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 02:24:49 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l11so3739143lfg.0
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 02:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FqgZBuyriKFHscfCKzWnYdcmG7dmWWESxzGWiLiHppY=;
        b=JVWBNXyC0QeCaKMX16uuRxGVMsXFILjSBYoCPCJ+kahnp3X5gzwhziPhpWn478WqNh
         YLgQGNkk2MfSolO4QwgTJn0INTag0vsigSNSVSB8IZIexg+BK4u2O+DOuFNsJLOFHfeU
         SSP+/BWtvPejS8RG5ZORi83TUT9GtRs0SzIS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FqgZBuyriKFHscfCKzWnYdcmG7dmWWESxzGWiLiHppY=;
        b=PEsHhjf3ufEyE74XjbbcBtnHEVpeG3iWt3Xyv9V5/fxHHciPeye7ZWNk+M2rfLNNDm
         qi4O0dicfxYOxdH1GxVLuLIkXbmc6jsMbOX1BGHDXJXae8rBWVQzOmnEJoTjpFlbyfBc
         I7jesY+HQsPqtV5PiSq1HOt+wsX7yxxeEgmmasFvrAcfM+GA/pFRwn7v5OU4L2MGNWXh
         Kj4kRLpG1Lb0DRdLNMcKrgB9NFSoVatIA6vwqSwCg3P97WP34wJF55pfvhz2zAhxXTDJ
         RD2WwuDZxiU3KwqHAg2xZ3DHPlG4oZRr7DnuS5ljj+nM3yd5e0SmEhrw/6En/AeJ4HMG
         HXRw==
X-Gm-Message-State: AOAM533ItgNRkrqA4Ffeza5nBhltz6LNMoHu9isD1EyaQnxhFKCJOLAj
        q8df5+oCdKlNwmYPTBAO/rsyraF0XI2A6SZa
X-Google-Smtp-Source: ABdhPJzTTD0kWkJRpvvP6L19AF3cR2u8CqIrMRuj0bGR5PUfJtPuC/uaMFbLCcfcGBu7/LwCzX0x3g==
X-Received: by 2002:a19:711:: with SMTP id 17mr931319lfh.131.1606904687351;
        Wed, 02 Dec 2020 02:24:47 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id j23sm344184lfh.88.2020.12.02.02.24.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:24:46 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id s27so3680271lfp.5
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 02:24:46 -0800 (PST)
X-Received: by 2002:ac2:5e8d:: with SMTP id b13mr905826lfq.246.1606904686164;
 Wed, 02 Dec 2020 02:24:46 -0800 (PST)
MIME-Version: 1.0
References: <20201202053424.3286774-1-acourbot@chromium.org>
In-Reply-To: <20201202053424.3286774-1-acourbot@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 2 Dec 2020 19:24:33 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXt4uL+VgxQs6ynf5LKae657QXmrjw6XYnL0vg_zuuDsw@mail.gmail.com>
Message-ID: <CAPBb6MXt4uL+VgxQs6ynf5LKae657QXmrjw6XYnL0vg_zuuDsw@mail.gmail.com>
Subject: Re: [PATCH] media: venus: preserve DRC state across seeks
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 2:34 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> DRC events can happen virtually at anytime, including when we are
> starting a seek. Should this happen, we must make sure to return to the
> DRC state, otherwise the firmware will expect buffers of the new
> resolution whereas userspace will still work with the old one.
>
> Returning to the DRC state upon resume for seeking makes sure that the
> client will get the DRC event and will reallocate the buffers to fit the
> firmware's expectations.

Oops, please ignore as this seems to depend on another patch... I will
repost once I can figure out the correct dependency chain, unless
Stanimir can find a better way to handle DRC during seek and flush.

>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 8488411204c3..e3d0df7fd765 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -972,7 +972,10 @@ static int vdec_start_output(struct venus_inst *inst)
>
>         if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
>                 ret = venus_helper_process_initial_out_bufs(inst);
> -               inst->codec_state = VENUS_DEC_STATE_DECODING;
> +               if (inst->next_buf_last)
> +                       inst->codec_state = VENUS_DEC_STATE_DRC;
> +               else
> +                       inst->codec_state = VENUS_DEC_STATE_DECODING;
>                 goto done;
>         }
>
> @@ -1077,8 +1080,10 @@ static int vdec_stop_capture(struct venus_inst *inst)
>                 ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
>                 fallthrough;
>         case VENUS_DEC_STATE_DRAIN:
> -               vdec_cancel_dst_buffers(inst);
>                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
> +               fallthrough;
> +       case VENUS_DEC_STATE_SEEK:
> +               vdec_cancel_dst_buffers(inst);
>                 break;
>         case VENUS_DEC_STATE_DRC:
>                 WARN_ON(1);
> @@ -1102,6 +1107,7 @@ static int vdec_stop_output(struct venus_inst *inst)
>         case VENUS_DEC_STATE_DECODING:
>         case VENUS_DEC_STATE_DRAIN:
>         case VENUS_DEC_STATE_STOPPED:
> +       case VENUS_DEC_STATE_DRC:
>                 ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
>                 inst->codec_state = VENUS_DEC_STATE_SEEK;
>                 break;
> @@ -1371,6 +1377,7 @@ static void vdec_event_change(struct venus_inst *inst,
>                         dev_dbg(dev, VDBGH "flush output error %d\n", ret);
>         }
>
> +       inst->next_buf_last = true;
>         inst->reconfig = true;
>         v4l2_event_queue_fh(&inst->fh, &ev);
>         wake_up(&inst->reconf_wait);
> --
> 2.29.2.454.gaff20da3a2-goog
>
