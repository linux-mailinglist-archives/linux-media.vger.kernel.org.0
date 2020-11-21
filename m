Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA812BBB64
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 02:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgKUBC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 20:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727862AbgKUBC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 20:02:58 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BB2C061A47
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 17:02:58 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f20so15358776ejz.4
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 17:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sk9JMkU18BJoY1tiLV8iF0/kiIHyna9O/RVdUCBqU8U=;
        b=V7bNk2SPrdN/SRh+iXN6Ri1rwBZAuSGh6TyIHNJrk8vH48eXGgEMm/YmZKcooovROC
         ftcGKO1vRdN7AHK2Lt/wF0U7LnT0XCt6Fx+Af/IpPON15v5KGiS2PhIeulTZWrNrUYz8
         7DKCJv8vzsUXsmcXTHBs86CtnrAt+kOsMSzn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sk9JMkU18BJoY1tiLV8iF0/kiIHyna9O/RVdUCBqU8U=;
        b=OftdOma1MGqMXNIqslzLtIDbpDfGDBqxwM8PutUOclVhvTTxJtGwdcLqTPHkes/Bam
         VGXwVeGyHc4Zwbc5MdGcwjVHFd56QD627ZGl/LJpbqtwgZett7k7bZBfWihaKBu2gXTA
         XBIf+6829OQEMNttovEQaoT7m6V/T4nQrItCjlguTUoOxtSlWSTqhEW3sdFKry7iZG/e
         BKP+sw8y4JndNoEdhkw2j5DxD289Q14/6iZ2OUMRPRKfw6rOWvY8Tuafhv70V3DoF7v+
         1k0IIVqi5Tw5y14o6kqWjgJKwaChDHE4m8/fz7NThrLwEsm0C74yPZaTmjFLxz9hWG82
         XpWA==
X-Gm-Message-State: AOAM530sqIuy+nahfCggvJ+jt1eu4sltpw8++sOtIjTPreSqflnFKMRO
        UcUMjuZ/0WI481v7/uf6KtlSYPidy6MwQA==
X-Google-Smtp-Source: ABdhPJxxXcDwLPgpJVM0cDPsyT6eC7HLvsRkJAKeN6+g3IG8yxo+4xqGhQxfiiA4tLTww0CRb9iZTA==
X-Received: by 2002:a17:906:ece7:: with SMTP id qt7mr16556916ejb.316.1605920576517;
        Fri, 20 Nov 2020 17:02:56 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id hs12sm701938ejc.91.2020.11.20.17.02.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 17:02:55 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id p22so12745156wmg.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 17:02:55 -0800 (PST)
X-Received: by 2002:a1c:31c6:: with SMTP id x189mr1524416wmx.50.1605920575058;
 Fri, 20 Nov 2020 17:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org> <20201120001037.10032-4-stanimir.varbanov@linaro.org>
In-Reply-To: <20201120001037.10032-4-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 20 Nov 2020 17:02:42 -0800
X-Gmail-Original-Message-ID: <CAMfZQbwjCNjeWJYt8A4Zrq5yABB0bDnOrg41JjDP=MZF86TOjQ@mail.gmail.com>
Message-ID: <CAMfZQbwjCNjeWJYt8A4Zrq5yABB0bDnOrg41JjDP=MZF86TOjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: hfi_venus: Request interrupt for sync cmds
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

On Thu, Nov 19, 2020 at 4:12 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> From: Vikash Garodia <vgarodia@codeaurora.org>
>
> For synchronous commands, update the message queue variable.
> This would inform video firmware to raise interrupt on host
> CPU whenever there is a response for such commands.
>
> Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 74 ++++++++++---------
>  1 file changed, 41 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 4be4a75ddcb6..b8fdb464ba9c 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -372,7 +372,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
>  }
>
>  static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
> -                                        void *pkt)
> +                                        void *pkt, bool sync)
>  {
>         struct device *dev = hdev->core->dev;
>         struct hfi_pkt_hdr *cmd_packet;
> @@ -397,15 +397,23 @@ static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
>         if (rx_req)
>                 venus_soft_int(hdev);
>
> +       /* Inform video firmware to raise interrupt for synchronous commands */
> +       queue = &hdev->queues[IFACEQ_MSG_IDX];

I don't think there is any reason to scope queue outside of  the sync
block below.

>
> +       if (sync) {
> +               queue->qhdr->rx_req = 1;
> +               /* ensure rx_req is updated in memory */
> +               wmb();
> +       }
> +
>         return 0;
>  }
>
> -static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt)
> +static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt, bool sync)
>  {
>         int ret;
>
>         mutex_lock(&hdev->lock);
> -       ret = venus_iface_cmdq_write_nolock(hdev, pkt);
> +       ret = venus_iface_cmdq_write_nolock(hdev, pkt, sync);
>         mutex_unlock(&hdev->lock);
>
>         return ret;
> @@ -428,7 +436,7 @@ static int venus_hfi_core_set_resource(struct venus_core *core, u32 id,
>         if (ret)
>                 return ret;
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -778,7 +786,7 @@ static int venus_sys_set_debug(struct venus_hfi_device *hdev, u32 debug)
>
>         pkt_sys_debug_config(pkt, HFI_DEBUG_MODE_QUEUE, debug);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -795,7 +803,7 @@ static int venus_sys_set_coverage(struct venus_hfi_device *hdev, u32 mode)
>
>         pkt_sys_coverage_config(pkt, mode);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -816,7 +824,7 @@ static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
>
>         pkt_sys_idle_indicator(pkt, enable);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -834,7 +842,7 @@ static int venus_sys_set_power_control(struct venus_hfi_device *hdev,
>
>         pkt_sys_power_control(pkt, enable);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -885,14 +893,14 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
>         return ret;
>  }
>
> -static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type)
> +static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type, bool sync)
>  {
>         struct venus_hfi_device *hdev = to_hfi_priv(inst->core);
>         struct hfi_session_pkt pkt;
>
>         pkt_session_cmd(&pkt, pkt_type, inst);
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, sync);
>  }
>
>  static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
> @@ -922,7 +930,7 @@ static int venus_prepare_power_collapse(struct venus_hfi_device *hdev,
>
>         pkt_sys_pc_prep(&pkt);
>
> -       ret = venus_iface_cmdq_write(hdev, &pkt);
> +       ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -1064,13 +1072,13 @@ static int venus_core_init(struct venus_core *core)
>
>         venus_set_state(hdev, VENUS_STATE_INIT);
>
> -       ret = venus_iface_cmdq_write(hdev, &pkt);
> +       ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         if (ret)
>                 return ret;
>
>         pkt_sys_image_version(&version_pkt);
>
> -       ret = venus_iface_cmdq_write(hdev, &version_pkt);
> +       ret = venus_iface_cmdq_write(hdev, &version_pkt, false);
>         if (ret)
>                 dev_warn(dev, "failed to send image version pkt to fw\n");
>
> @@ -1099,7 +1107,7 @@ static int venus_core_ping(struct venus_core *core, u32 cookie)
>
>         pkt_sys_ping(&pkt, cookie);
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, false);
>  }
>
>  static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
> @@ -1112,7 +1120,7 @@ static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, false);
>  }
>
>  static int venus_session_init(struct venus_inst *inst, u32 session_type,
> @@ -1130,7 +1138,7 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
>         if (ret)
>                 goto err;
>
> -       ret = venus_iface_cmdq_write(hdev, &pkt);
> +       ret = venus_iface_cmdq_write(hdev, &pkt, true);
>         if (ret)
>                 goto err;
>
> @@ -1151,7 +1159,7 @@ static int venus_session_end(struct venus_inst *inst)
>                         dev_warn(dev, "fw coverage msg ON failed\n");
>         }
>
> -       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_END);
> +       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_END, true);
>  }
>
>  static int venus_session_abort(struct venus_inst *inst)
> @@ -1160,7 +1168,7 @@ static int venus_session_abort(struct venus_inst *inst)
>
>         venus_flush_debug_queue(hdev);
>
> -       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_ABORT);
> +       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_ABORT, true);
>  }
>
>  static int venus_session_flush(struct venus_inst *inst, u32 flush_mode)
> @@ -1173,22 +1181,22 @@ static int venus_session_flush(struct venus_inst *inst, u32 flush_mode)
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, true);
>  }
>
>  static int venus_session_start(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_START);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_START, true);
>  }
>
>  static int venus_session_stop(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_STOP);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_STOP, true);
>  }
>
>  static int venus_session_continue(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_CONTINUE);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_CONTINUE, false);
>  }
>
>  static int venus_session_etb(struct venus_inst *inst,
> @@ -1205,7 +1213,7 @@ static int venus_session_etb(struct venus_inst *inst,
>                 if (ret)
>                         return ret;
>
> -               ret = venus_iface_cmdq_write(hdev, &pkt);
> +               ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         } else if (session_type == VIDC_SESSION_TYPE_ENC) {
>                 struct hfi_session_empty_buffer_uncompressed_plane0_pkt pkt;
>
> @@ -1213,7 +1221,7 @@ static int venus_session_etb(struct venus_inst *inst,
>                 if (ret)
>                         return ret;
>
> -               ret = venus_iface_cmdq_write(hdev, &pkt);
> +               ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         } else {
>                 ret = -EINVAL;
>         }
> @@ -1232,7 +1240,7 @@ static int venus_session_ftb(struct venus_inst *inst,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, false);
>  }
>
>  static int venus_session_set_buffers(struct venus_inst *inst,
> @@ -1252,7 +1260,7 @@ static int venus_session_set_buffers(struct venus_inst *inst,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, false);
>  }
>
>  static int venus_session_unset_buffers(struct venus_inst *inst,
> @@ -1272,17 +1280,17 @@ static int venus_session_unset_buffers(struct venus_inst *inst,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, true);
>  }
>
>  static int venus_session_load_res(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_LOAD_RESOURCES);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_LOAD_RESOURCES, true);
>  }
>
>  static int venus_session_release_res(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_RELEASE_RESOURCES);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_RELEASE_RESOURCES, true);
>  }
>
>  static int venus_session_parse_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
> @@ -1299,7 +1307,7 @@ static int venus_session_parse_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
>         if (ret)
>                 return ret;
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -1320,7 +1328,7 @@ static int venus_session_get_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, false);
>  }
>
>  static int venus_session_set_property(struct venus_inst *inst, u32 ptype,
> @@ -1339,7 +1347,7 @@ static int venus_session_set_property(struct venus_inst *inst, u32 ptype,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, false);
>  }
>
>  static int venus_session_get_property(struct venus_inst *inst, u32 ptype)
> @@ -1352,7 +1360,7 @@ static int venus_session_get_property(struct venus_inst *inst, u32 ptype)
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, true);
>  }
>
>  static int venus_resume(struct venus_core *core)
> --
> 2.17.1
>
