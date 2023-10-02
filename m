Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBB27B4D5B
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 10:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235832AbjJBIj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 04:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjJBIj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 04:39:56 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599E59F;
        Mon,  2 Oct 2023 01:39:54 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-279294d94acso1958626a91.0;
        Mon, 02 Oct 2023 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696235994; x=1696840794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfaZheZNrcPXbbqVximSrkSx2//13nRESxlv6BoWClU=;
        b=FOZ8PIodT18eiBwg4UrgodLo+gtnqsNWoNKh9rp4RKGpahD0+OIWWY8xTKh3xPjcR9
         C7ilvaxSbBC8aFD4nfgd5lsNGPdm21JT2TcPYAdZnBBSU67XVaQMKF9Y25r4u8pTvRb5
         AKYxHHFhnfIb75ozIpSYeff+rVTpxOtpvYzh926e9EgPSXUKFvfB/9YPDANztV78i9JY
         OTUYhD3q6/sWg3nKP50amLbPQrqzRnNY+QiBrJHntTb/+kmRLXETbzsHjE8/tDXgur3i
         6Gm4iWpXl5ILXI5RLgsnr674B7jASHfmGpCX7CdzyxNPtVf/3M5uKkKFAtze2EaMaBZG
         8mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696235994; x=1696840794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfaZheZNrcPXbbqVximSrkSx2//13nRESxlv6BoWClU=;
        b=IACYhQeel7kxfLefldqbjsNfivydzAAfjoUbwhGMrBVbywu+Qa/h+Nl9yljcBMJTrs
         lNac3sM1wuEhNSGLJAWcyA/ii3hZr1ol+BlZkkf5Qsqah2IxtVd6C0ENnOw6TMTlhA3v
         w5gkqON1yOkAo0y1JWWjFUFwN1v6+oGEgTtl9SJduIsjXZ9mpcc6xyZKbwSqMDetX7ar
         K0t2Ea5L6hauT3FDktcSH0wnQ2Z9p8L/9ScJ6B++PT/PssRnXZ5dT+dCVvJKgRGUnzBz
         cpGtj3atpYp0KLbt0kNvmT8JuGY2SOp4FiX3YS7rc5wqIjD1No5CfLNNnKskTFzB3Vk0
         sDYg==
X-Gm-Message-State: AOJu0YzhudcU0gN6dsOqfI5F62ndJU52O/tLvPtIDDHKgvVdrglz+in2
        j2gzCMpzUGJes2QnuzTwtAsRpCYJvi20W1PZd6M=
X-Google-Smtp-Source: AGHT+IHcNoCWWPJoOZlHk5CbnIq6zss1fvBm8Lek6/i5PwX77I2AVfeMLb45bpP6XFxI2lY1j7cPPTCQVogJegrrWow=
X-Received: by 2002:a17:90a:e48:b0:274:a241:a7a8 with SMTP id
 p8-20020a17090a0e4800b00274a241a7a8mr16691115pja.0.1696235993529; Mon, 02 Oct
 2023 01:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>
In-Reply-To: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Mon, 2 Oct 2023 04:39:42 -0400
Message-ID: <CAB=otbTBNDNpg0B_WdCbCuj7qcoOdPCP2QE4az0J=KrHOTgfLg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: initialize spinlocks
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        john@keeping.me.uk, alsi@bang-olufsen.dk, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 2, 2023 at 2:42=E2=80=AFAM Michael Grzeschik
<m.grzeschik@pengutronix.de> wrote:
>
> When using uac2 with lockdep enabled, the kernel is throwing this
> message, due to uninitialized spinlocks. We initialize them now.
>
> [   24.668867] The code is fine but needs lockdep annotation, or maybe
> [   24.675878] you didn't initialize this object before use?
> [   24.681910] turning off the locking correctness validator.
> [   24.688038] CPU: 0 PID: 348 Comm: irq/43-dwc3 Tainted: G         C    =
     6.5.0-20230919-1+ #14
> [   24.697866] Hardware name: WolfVision PF5 (DT)
> [   24.702831] Call trace:
> [   24.705559]  dump_backtrace+0xac/0x130
> [   24.709755]  show_stack+0x30/0x48
> [   24.713456]  dump_stack_lvl+0x60/0xb0
> [   24.717552]  dump_stack+0x18/0x28
> [   24.721254]  register_lock_class+0x4e8/0x4f8
> [   24.726029]  __lock_acquire+0x88/0x2130
> [   24.730314]  lock_acquire+0x17c/0x338
> [   24.734403]  _raw_spin_lock_irqsave+0x60/0x90
> [   24.739274]  u_audio_get_capture_srate+0x34/0x68
> [   24.744436]  afunc_setup+0x2d8/0x538
> [   24.748431]  composite_setup+0x1a8/0x1ba8
> [   24.752913]  configfs_composite_setup+0x88/0xc0
> [   24.757974]  dwc3_ep0_interrupt+0x5e8/0xab8
> [   24.762648]  dwc3_process_event_buf+0x424/0xbb0
> [   24.767717]  dwc3_thread_interrupt+0x4c/0x90
> [   24.772488]  irq_thread_fn+0x34/0xb8
> [   24.776484]  irq_thread+0x1a0/0x290
> [   24.780379]  kthread+0x10c/0x120
> [   24.783985]  ret_from_fork+0x10/0x20
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/u_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index 4a42574b4a7feb..9d9f906adf7c00 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -1172,6 +1172,9 @@ int g_audio_setup(struct g_audio *g_audio, const ch=
ar *pcm_name,
>         g_audio->uac =3D uac;
>         uac->audio_dev =3D g_audio;
>
> +       spin_lock_init(&uac->c_prm.lock);
> +       spin_lock_init(&uac->p_prm.lock);

These locks are already initialized just a few lines below in this function=
.

It seems the issue is because uac2 does u_audio_get_capture_srate() while
capture isn't enabled? What is your UAC2 gadget configuration?

Thanks,
Ruslan

> +
>         params =3D &g_audio->params;
>         p_chmask =3D params->p_chmask;
>         c_chmask =3D params->c_chmask;
> --
> 2.39.2
>
