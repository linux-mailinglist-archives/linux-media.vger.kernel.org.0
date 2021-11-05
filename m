Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D442445FE2
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 07:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhKEG5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 02:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhKEG5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 02:57:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57692C061714
        for <linux-media@vger.kernel.org>; Thu,  4 Nov 2021 23:54:58 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j21so29581615edt.11
        for <linux-media@vger.kernel.org>; Thu, 04 Nov 2021 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rjYqcyyrBT9bF68VBF8V+POrURWUOXbA3YrHbG/XegY=;
        b=dKPMoNHb4Cm+TVU/37xDV4/Zu9m4EsMhGFlgZO817jnTGbDn7NJ+VkAaEaJDcu3Hlf
         yo9TrHpl8B/XAAbb3g1+/fM4p1yQ/dZFimabpMBjMIODERntF9ZJ7im7/OoE/0Tv2e3S
         iiGOcACSBmavfy7/7GIZ/GOlRQu6MC7iz/NtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjYqcyyrBT9bF68VBF8V+POrURWUOXbA3YrHbG/XegY=;
        b=vwnhLJh+7dMrH7OXAkzsbnG6guwi1fWTGVgvISxRgF8Uh8VmbBLEVF6posot6jqv7C
         N+u9+DDg4vO60P5Jz1l8T+MaoDrO7buXZF3qdWDfKzT6lZmqYDILAIw+RZ9ghE6WRNPu
         voNi99XDo+HPWLj86DG3GvKVWZq/0DfM9g6mqNlnb4m/+phKNjEQbqzUwufPH4HE2oza
         6KKT/x+BKiK23WMT2+8lMgptOOD94y2ivd+bA7RZK5t4h/M31yELUov73L8VP7Ej5XiL
         VE4hc5UiLI125n9+Y5IvWibPbhhTSJMCbfsPbgXfIZjR1WMFw9LA4Culzdda9ovLbGRQ
         UxHA==
X-Gm-Message-State: AOAM5328nEweqrmVP+piKHtHbEmRmHrZBPnpOROML2aYn1N8O3Od0y6G
        34eVauj5bRmDcYQLQeWMsELWiG11L1rbPA==
X-Google-Smtp-Source: ABdhPJz1+JW983M/9kDZELVsc7GSjP0yFpDCb5MEtzt5iRMA/72uEYGJVRke95IlgOzRp9gFFrPisg==
X-Received: by 2002:a17:906:3157:: with SMTP id e23mr16421837eje.359.1636095296689;
        Thu, 04 Nov 2021 23:54:56 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id v15sm4068620edi.89.2021.11.04.23.54.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 23:54:56 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id d5so12212931wrc.1
        for <linux-media@vger.kernel.org>; Thu, 04 Nov 2021 23:54:55 -0700 (PDT)
X-Received: by 2002:adf:a489:: with SMTP id g9mr58456823wrb.235.1636095295058;
 Thu, 04 Nov 2021 23:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
In-Reply-To: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 5 Nov 2021 15:54:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
Message-ID: <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        dongchun.zhu@mediatek.com, tian.shu.qiu@intel.com,
        bingbu.cao@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
>
> When dw9768 working with ACPI systems, the dw9768 was turned
> by i2c-core during probe, driver need activate the PM runtime
> and ask runtime PM to turn off the device.
>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/dw9768.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index c086580efac7..65c6acf3ced9 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client *client)
>
>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
>
> +       /*
> +        * Device is already turned on by i2c-core with ACPI domain PM.
> +        * Attempt to turn off the device to satisfy the privacy LED concerns.
> +        */
> +       pm_runtime_set_active(dev);

This driver is used by non-ACPI systems as well. This change will make
the PM core not call the runtime_resume() callback provided by the
driver and the power would never be turned on on such systems.

Wasn't the intention of Sakari's ACPI patches to allow bypassing the
ACPI domain power on at boot up and eliminate the need for this
change?

Best regards,
Tomasz

>
>         pm_runtime_enable(dev);
>         if (!pm_runtime_enabled(dev)) {
>                 ret = dw9768_runtime_resume(dev);
> @@ -483,6 +488,7 @@ static int dw9768_probe(struct i2c_client *client)
>                 dev_err(dev, "failed to register V4L2 subdev: %d", ret);
>                 goto err_power_off;
>         }
> +       pm_runtime_idle(dev);
>
>         return 0;
>
> --
> 2.7.4
>
