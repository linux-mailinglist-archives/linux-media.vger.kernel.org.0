Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4582C95BF
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 04:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbgLADY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 22:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgLADY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 22:24:58 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B708EC0613D2
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 19:24:11 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u18so1042035lfd.9
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 19:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7+Idg3efY9PUSvZ7WAMegwUyYjeY1husLBEhQzx0RW4=;
        b=eyARn/I6tSRyPIRz85iURN20GQQJ/cCVXjHBtH4ObUJEwoRJnuHd/2gQ18KpmnnXGa
         pmRnly9JilsjkRYe2aJkg7c0P6CEbe8d87i6lfyrFhfraxlsLCIFKEDpZiOmDmArrOLz
         o7NpFDpE5K0rICtv4AbACEl2fSLHesjRouwIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7+Idg3efY9PUSvZ7WAMegwUyYjeY1husLBEhQzx0RW4=;
        b=J5szrtqAO3EyyA/TD5Oarqu061tdiUZRjCQGJKdbcSrmtl8iXBA7qaizr25V7gCbyH
         U+pUymNhq/AfEgCQXeWKZkpvI4Wt9SrqSJ8UnclvYPJQG5aDX3gdm6iJQ7ZN+oLdfuHN
         rivngRO6gbu5hQdv9Z+otdtegrNcXDYNzd69oiWoi7Y6DsS5N1WUIs6RiXiQhsrnUo4A
         TBEEomM6UiVASvaY6xWiLfHls3bJ4f7LzHF22C0nbMDKHbwDCtp0DM1eMK/x7eSnxYJJ
         eLXcz4QAMjS6717oxGGLljqQrsoYe1VrJH5DEHGVbXvwYuBlPBppTxDfAZXypZUy8+CL
         cxcw==
X-Gm-Message-State: AOAM532QIJZ1nngpAWpTKyfkrxznXvAmStyq50RyvnlrbjKxhUz8ZVnJ
        rHj5q8mly3kmQbPC/mz96U4r0e30kpByqdy6
X-Google-Smtp-Source: ABdhPJxl06LH+4aJnO/s4PtKTccEQEWvH5TaOmgWLFEQPiMzo5YOIbVzBjJsztfmb7r6hNp7T47AnQ==
X-Received: by 2002:a05:6512:48e:: with SMTP id v14mr291421lfq.255.1606793049784;
        Mon, 30 Nov 2020 19:24:09 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id d19sm53701lfc.139.2020.11.30.19.24.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 19:24:09 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id d20so1013825lfe.11
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 19:24:08 -0800 (PST)
X-Received: by 2002:ac2:5e8d:: with SMTP id b13mr279952lfq.246.1606793048600;
 Mon, 30 Nov 2020 19:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20201129060517.2029659-1-frkoenig@chromium.org>
In-Reply-To: <20201129060517.2029659-1-frkoenig@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 1 Dec 2020 12:23:57 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUDUs2d+hDRnfg3-7jwqQX8jO1AwjbjyWppE8a64ovvCA@mail.gmail.com>
Message-ID: <CAPBb6MUDUs2d+hDRnfg3-7jwqQX8jO1AwjbjyWppE8a64ovvCA@mail.gmail.com>
Subject: Re: [PATCH] venus: venc: Add VIDIOC_TRY_ENCODER_CMD support
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 29, 2020 at 3:05 PM Fritz Koenig <frkoenig@chromium.org> wrote:
>
> V4L2_ENC_CMD_STOP and V4L2_ENC_CMD_START are already
> supported.  Add a way to query for support.

I think your Signed-off-by is missing (checkpatch.pl should warn you
about such problems).

>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 2ddfeddf98514..e05db3c4bfb24 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -507,6 +507,27 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>         return 0;
>  }
>
> +static int
> +venc_try_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
> +{
> +       struct venus_inst *inst = to_inst(file);
> +       struct device *dev = inst->core->dev_dec;
> +
> +       switch (cmd->cmd) {
> +       case V4L2_ENC_CMD_STOP:
> +       case V4L2_ENC_CMD_START:
> +               if (cmd->flags != 0) {
> +                       dev_dbg(dev, "flags=%u are not supported", cmd->flags);
> +                       return -EINVAL;
> +               }
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  static int
>  venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)

I am not seeing venc_encoder_cmd() in the media tree, does this patch
depend on others that are not yet merged? If so they should be
submitted together as a series.

>  {
> @@ -514,6 +535,10 @@ venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
>         struct hfi_frame_data fdata = {0};
>         int ret = 0;
>
> +       ret = venc_try_encoder_cmd(file, fh, cmd);
> +       if (ret < 0)
> +               return ret;
> +

v4l2_m2m_ioctl_try_encoder_cmd() is called right below, and AFAICT
does the same thing as the newly-defined venc_try_encoder_cmd(). So
IIUC this patch can be turned into a one-liner that does just the
following:

@@ -575,6 +600,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
        .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
        .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
        .vidioc_encoder_cmd = venc_encoder_cmd,
+       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
 };

>         ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
>         if (ret)
>                 return ret;
> @@ -575,6 +600,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>         .vidioc_encoder_cmd = venc_encoder_cmd,
> +       .vidioc_try_encoder_cmd = venc_try_encoder_cmd,
>  };
>
>  static int venc_set_properties(struct venus_inst *inst)
> --
> 2.29.2.454.gaff20da3a2-goog
>
