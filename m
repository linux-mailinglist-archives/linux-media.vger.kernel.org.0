Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF323569B3
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 12:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346649AbhDGKay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 06:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346614AbhDGKat (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 06:30:49 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E4FC061756
        for <linux-media@vger.kernel.org>; Wed,  7 Apr 2021 03:30:39 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so1024049pjb.4
        for <linux-media@vger.kernel.org>; Wed, 07 Apr 2021 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f1o55VZYOi9bO9sakh3OCgxey7xHaBjCU7LLfTXHDiM=;
        b=bHf2PR2x5LXVmv5IfLqCsswnf9S243MiDir9KI3ai/+KMoqUtlGh4dwIp9w43tvyko
         kLeBvIh3O3XlvkSjV4UtALWpw6FLfk3neruYH9AYvfRohCh5QmT5PU+iYHkk242hd4WX
         eDDI5OeIMu6v/jVngbG31IQoTVq8+c83ClOJn8lnk6nvC2N1oKMB+670t4+7Pe/O5xHJ
         hZNvfZ+gmpd9nXCsksizLp8sRT4NuabXyXOdJNUazS4nm5BcP1laCxK1po/oNJaf/6BK
         dp+gOh8Jn+ygpApvL8TfMgpn2xzDbnEKyL+TcZOsJdLGPvX1otczXQ5zOSMzqtuUCK79
         iK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f1o55VZYOi9bO9sakh3OCgxey7xHaBjCU7LLfTXHDiM=;
        b=Zi/GOqbS9r0koHi4wo+VKau0ZmXY+0bTWpgdXdmWNBvnGpBSAo8fSMX5rwazZVYQrv
         G778Pgca02NimA9a0ENI2pD1lvdRGBJH703GOuklOe7DeMPyz+dVWFVO1P8oewt49fqP
         h63llTF772VZrVuH51XzECen6re8eSCnp5+Y9x0HNrEv8GyJFkB5TNPOq7OzWVvWJjCK
         ///YdvPip+AaMXdEkIAdOV20WkxC+dJqNrXmUME+lSt20gkoMkE+xfQ0P4+H8oVdDNGt
         Wl9iuRJoaLnZtla6fSA7ouF20QcMeHIj1mJIEgnVk92Xe6MUEUvQyOQN0s7tma6vQrld
         PgzQ==
X-Gm-Message-State: AOAM531cq5mlQx/k6WCCpXatgn2L9mbwfJ/ix3twKWNVsKuJfLZUJO3D
        Ssqo3OZpoh1Xyf195fHcsYdyaY92ZLUUp3T3Z9QoYQ==
X-Google-Smtp-Source: ABdhPJzWUJARKqrj0ZB9gp6GxaktITu+JF/8RGqblLoZfXmWFL6U0tl9xTtHniJoI+pzTINUlvOdeQo3Ll8Q+7SaLMs=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id f15mr2685173pjh.19.1617791439424;
 Wed, 07 Apr 2021 03:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <1617776679-4226-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1617776679-4226-1-git-send-email-tiantao6@hisilicon.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 7 Apr 2021 12:30:28 +0200
Message-ID: <CAG3jFyt94+Q-WS3C2K3-F-x-8xGGPBRm0eYPMu4_XDp7LYarqA@mail.gmail.com>
Subject: Re: [PATCH] media: camss: move to use request_irq by IRQF_NO_AUTOEN flag
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 7 Apr 2021 at 08:24, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
>
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c   | 5 ++---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 463760c..46c19bf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -586,14 +586,13 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>         snprintf(csid->irq_name, sizeof(csid->irq_name), "%s_%s%d",
>                  dev_name(dev), MSM_CSID_NAME, csid->id);
>         ret = devm_request_irq(dev, csid->irq, csid->ops->isr,
> -                              IRQF_TRIGGER_RISING, csid->irq_name, csid);
> +                              IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
> +                              csid->irq_name, csid);
>         if (ret < 0) {
>                 dev_err(dev, "request_irq failed: %d\n", ret);
>                 return ret;
>         }
>
> -       disable_irq(csid->irq);
> -
>         /* Clocks */
>
>         csid->nclocks = 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 6ceb6d7..fefb4f3 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -625,14 +625,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
>                  dev_name(dev), MSM_CSIPHY_NAME, csiphy->id);
>
>         ret = devm_request_irq(dev, csiphy->irq, csiphy->ops->isr,
> -                              IRQF_TRIGGER_RISING, csiphy->irq_name, csiphy);
> +                              IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
> +                              csiphy->irq_name, csiphy);
>         if (ret < 0) {
>                 dev_err(dev, "request_irq failed: %d\n", ret);
>                 return ret;
>         }
>
> -       disable_irq(csiphy->irq);
> -
>         /* Clocks */
>
>         csiphy->nclocks = 0;
> --

When IRQF_NO_AUTOEN[1] lands I'd be happy to see this patch applied as well.

[1]  https://lore.kernel.org/patchwork/patch/1388765/

Reviewed-by: Robert Foss <robert.foss@linaro.org>
