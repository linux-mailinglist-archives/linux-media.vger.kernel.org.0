Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE483003AF
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbhAVNC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbhAVNCN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:02:13 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B79C06174A
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:01:30 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c124so4230443wma.5
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G0ng+OZa3Vuf9YdIl1xtH1whS14V+BAXkcJKtu9qil4=;
        b=LXlZLfwJlLR08wLynX4+9UKOdiejRTjAGFeteUdPwwTtFfGze69EjLcTnHIivc2oE0
         pWyeJ5TOi/AmJ/V/Y+RAG+o85BEeP01Sae3w2FPv5ZAAXjzi/5IjFCdfUm912gi1gmdr
         5jQsaQUCnkfISv7/pwttFGpQfK7kgff4Wpuy4zz5TBnAzpfCdL6YM5xcyYiL1wNDEKpw
         VInLcbeeehceKdChTuiYQSZbh6W87GC6ZwAAyft8TEEh7GokL5EV2BpWGU7KWzsp9HAr
         H2DBne6G3oOWM4eybQLbWOe8DumaaGT2I/6mg98kfj9Dtn6jKgJQlOJTRyL5GXY+9gpn
         a93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0ng+OZa3Vuf9YdIl1xtH1whS14V+BAXkcJKtu9qil4=;
        b=uNroDn8cmYajLMAovvIQ79oZ0jvRWMoNzDl+YfsBch665HIPLX2MzPH0jIOCKP2d5G
         Qbz3stEwcnZJs7YbgIlSUYvxSuGyuT8M1lHrF8hJqKABvUxZrQmBtwxVIL51I6Enmdd2
         V2UovhwEhdd3E6Uth7sKgEYWesjadl6HcMKmRFNG63Gwm+/7guql9vTduNb6cGbt6Nf0
         f1rqcsCzzdbSdqk4YYH/GNIVCIv73RxUXSuMQ2tgvuXmrvdLVSsr4c9ewmNarVbzBWCv
         T9L0BhXtir8Bnmx/lePcqjmk4Qc4SNiOTdIZ8/ZL+qIb1JXHsDyJTuvaGI32ZuX5lRiZ
         C2rA==
X-Gm-Message-State: AOAM532NheztoOcJHnDiy46Bo05TOGLR3XMHPTGgly3dm34Qb7t5/NfJ
        p1LBLi0wx9qhlHTtt/pH12HwwjclgaRLfbj2Ur+nOQ==
X-Google-Smtp-Source: ABdhPJzF7RWNhnyFcB3wiTOL99LPVoNx7wnkjoc35sgnKb4ToGcGD0ixlxJvCoN6a77ExsSS9LXd0zUSejjp8Wsij9U=
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr3906940wmi.116.1611320488755;
 Fri, 22 Jan 2021 05:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech> <20210111142309.193441-10-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-10-maxime@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 22 Jan 2021 13:01:13 +0000
Message-ID: <CAPY8ntC7OwDwtWE+j+VwktpMgX_abvkKqPrWvsY-6T9ay7gMJw@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] drm/vc4: hdmi: Split the interrupt handlers
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM2711 has two different interrupt sources to transmit and receive
> CEC messages, provided through an external interrupt chip shared between
> the two HDMI interrupt controllers.
>
> The rest of the CEC controller is identical though so we need to change
> a bit the code organisation to share the code as much as possible, yet
> still allowing to register independant handlers.

s/independant/independent

>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

With that
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 86 +++++++++++++++++++++++++---------
>  1 file changed, 65 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 7b5c92df8f1b..12ca5f3084af 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1454,15 +1454,22 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>  }
>
>  #ifdef CONFIG_DRM_VC4_HDMI_CEC
> -static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
> +static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
>  {
>         struct vc4_hdmi *vc4_hdmi = priv;
>
> -       if (vc4_hdmi->cec_irq_was_rx) {
> -               if (vc4_hdmi->cec_rx_msg.len)
> -                       cec_received_msg(vc4_hdmi->cec_adap,
> -                                        &vc4_hdmi->cec_rx_msg);
> -       } else if (vc4_hdmi->cec_tx_ok) {
> +       if (vc4_hdmi->cec_rx_msg.len)
> +               cec_received_msg(vc4_hdmi->cec_adap,
> +                                &vc4_hdmi->cec_rx_msg);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t vc4_cec_irq_handler_tx_thread(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +
> +       if (vc4_hdmi->cec_tx_ok) {
>                 cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
>                                   0, 0, 0, 0);
>         } else {
> @@ -1476,6 +1483,19 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +       irqreturn_t ret;
> +
> +       if (vc4_hdmi->cec_irq_was_rx)
> +               ret = vc4_cec_irq_handler_rx_thread(irq, priv);
> +       else
> +               ret = vc4_cec_irq_handler_tx_thread(irq, priv);
> +
> +       return ret;
> +}
> +
>  static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
>  {
>         struct drm_device *dev = vc4_hdmi->connector.dev;
> @@ -1500,31 +1520,55 @@ static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
>         }
>  }
>
> +static irqreturn_t vc4_cec_irq_handler_tx_bare(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +       u32 cntrl1;
> +
> +       cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
> +       vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
> +       cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +
> +       return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t vc4_cec_irq_handler_rx_bare(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +       u32 cntrl1;
> +
> +       vc4_hdmi->cec_rx_msg.len = 0;
> +       cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
> +       vc4_cec_read_msg(vc4_hdmi, cntrl1);
> +       cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +       cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> +
> +       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +
> +       return IRQ_WAKE_THREAD;
> +}
> +
>  static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
>  {
>         struct vc4_hdmi *vc4_hdmi = priv;
>         u32 stat = HDMI_READ(HDMI_CEC_CPU_STATUS);
> -       u32 cntrl1, cntrl5;
> +       irqreturn_t ret;
> +       u32 cntrl5;
>
>         if (!(stat & VC4_HDMI_CPU_CEC))
>                 return IRQ_NONE;
> -       vc4_hdmi->cec_rx_msg.len = 0;
> -       cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
> +
>         cntrl5 = HDMI_READ(HDMI_CEC_CNTRL_5);
>         vc4_hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
> -       if (vc4_hdmi->cec_irq_was_rx) {
> -               vc4_cec_read_msg(vc4_hdmi, cntrl1);
> -               cntrl1 |= VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> -               HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> -               cntrl1 &= ~VC4_HDMI_CEC_CLEAR_RECEIVE_OFF;
> -       } else {
> -               vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
> -               cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
> -       }
> -       HDMI_WRITE(HDMI_CEC_CNTRL_1, cntrl1);
> +       if (vc4_hdmi->cec_irq_was_rx)
> +               ret = vc4_cec_irq_handler_rx_bare(irq, priv);
> +       else
> +               ret = vc4_cec_irq_handler_tx_bare(irq, priv);
> +
>         HDMI_WRITE(HDMI_CEC_CPU_CLEAR, VC4_HDMI_CPU_CEC);
> -
> -       return IRQ_WAKE_THREAD;
> +       return ret;
>  }
>
>  static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
> --
> 2.29.2
>
