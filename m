Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E81CE1A583F
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 01:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729838AbgDKXLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 19:11:14 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42344 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbgDKXLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 19:11:14 -0400
Received: by mail-ed1-f68.google.com with SMTP id cw6so7061599edb.9
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2020 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hM2xNoRDEOsCQMc/8ffTH/ZtgmObtgZL7f9RJCSssp8=;
        b=mp/DOoPQsfzm3B0+5t9StX5Kkk2y5KlqsKysolBoZDoYSBzOEC4TJOKuasReGBbIaz
         4zXqJYGie8jGh1yvbaKdzJ2Fn7pj24ghTcW3cv9RYgl1K64lwn+TESkQBZDMc6lLTQ/O
         WIpQHW5HmVTC4jMKFMXjxfReNhnG7BwT4IYe3tRv2yFa99oRRbOzOWaOVJbPb3PNvtuH
         /t3BxBpCpzESLw8UiEcuT6ufBsM5CwHzV1h+hpO0wUmlPLgwgDkp8sfjMIUE99KjthN2
         Jg31cAf7fG1boxi/Pah5y6dc8maleWaTl6ifq326DuWTQ17S/MkS6srMLP5yr6y2nLW9
         rJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hM2xNoRDEOsCQMc/8ffTH/ZtgmObtgZL7f9RJCSssp8=;
        b=TW7RgMEIg6fdlBWH6bMNCdQeewi/MGM6yUT36lJTdUe96d6WJ7zJjB7Pg4OrdvJIb/
         QR+MiDZ3qPWAGOK8x2Qpj1+sETVXhNlziO10Rft+261ddya/j2wTLsvOZciqZAa/7Jm+
         RbGQIKewZxX2P5Gjo16VPTx7ON4wLMmVHwXwHVWtcS+PhAING1WN6hfM7hUeMfzLd17N
         fxesLTtP0TrjueBKEgbj0a25/nkh3d7F3FKCTB9XLS3sQAuLPTmpCidoTq8Hn3xpgsn6
         k2poxldb25zj0z58yQcGY4pKCsic+OCgEM3SJjrV9N4gqRTMI//SudS3tGbXbtQC8C4s
         leLQ==
X-Gm-Message-State: AGi0PuakDlPr0PsZOKGNKBAALbrbeOCIGXEdfP+kfnuNlSAZ53nhzyev
        eTrM8FDwm1lyMhmFnjDjJ1DvHftDrRdyXC3KSVdYZS0LwLs=
X-Google-Smtp-Source: APiQypJQE2qPgi1xoI94y8AB90tOMDYjsDYUMuc9MPy0tLvmBy917MrKoq5KDglXColsDfnLnEhRWmNu1NxR4UTerNo=
X-Received: by 2002:a17:906:7f10:: with SMTP id d16mr10139135ejr.318.1586646672949;
 Sat, 11 Apr 2020 16:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200410135014.26396-1-colin.king@canonical.com>
In-Reply-To: <20200410135014.26396-1-colin.king@canonical.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 11 Apr 2020 20:11:01 -0300
Message-ID: <CAAEAJfA2PQOUWbKu=CLPaA-bx2T3MWGpsviq7DBaJ9DxOqCTbg@mail.gmail.com>
Subject: Re: [PATCH] media: pwc-ctl: remove redundant assignment to variable ret
To:     Colin King <colin.king@canonical.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Apr 2020 at 10:50, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/media/usb/pwc/pwc-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/pwc/pwc-ctrl.c b/drivers/media/usb/pwc/pwc-ctrl.c
> index 315c55927f5c..cff64d872058 100644
> --- a/drivers/media/usb/pwc/pwc-ctrl.c
> +++ b/drivers/media/usb/pwc/pwc-ctrl.c
> @@ -523,7 +523,7 @@ int pwc_set_leds(struct pwc_device *pdev, int on_value, int off_value)
>  #ifdef CONFIG_USB_PWC_DEBUG
>  int pwc_get_cmos_sensor(struct pwc_device *pdev, int *sensor)
>  {
> -       int ret = -1, request;
> +       int ret, request;
>
>         if (pdev->type < 675)
>                 request = SENSOR_TYPE_FORMATTER1;
> --
> 2.25.1
>
