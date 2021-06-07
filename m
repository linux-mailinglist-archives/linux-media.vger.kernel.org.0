Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C26539E839
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhFGUU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 16:20:59 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:39707 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbhFGUU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 16:20:59 -0400
Received: by mail-lj1-f182.google.com with SMTP id c11so23942923ljd.6
        for <linux-media@vger.kernel.org>; Mon, 07 Jun 2021 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aVD8lq1uNANeZKWp0ZPkE9JXADJnLuidcBKbXh2dcbI=;
        b=Bv1Pt/sAx0q2PDSnmNa0pGYRgEyRTbhZO5Zmb99/9IvWZxsicenBbsIaT4QeU0SE8Y
         41Ab/+s5z1Lon0v7c34t3H0SNH5Xu6kF3TKNZI3AWAGBaAbBwPdC8tUwQhimimY+vHks
         DA7AjLy6eRbBDzvQZRwoBNmxF2CSYVEatbDPkD99QS9L2tKQcrZPqXTDqnXPZ6gM+1X4
         uYY/hdsNaDsCMcKiVrFEQscpeCPXY/+8OUvzwnhYnzhYscra1lnFY/sBYSlm/h1AqO1i
         VsWURb4NbccZ+2hOD/x1cF1JoBee+e+Bvw12ElTKM0lloTRBaof4wAU/JnXakQqtIQLa
         nPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aVD8lq1uNANeZKWp0ZPkE9JXADJnLuidcBKbXh2dcbI=;
        b=ZIBkDrV3/M3YlpipU17eHx8IBveq3qrt3QFB1wWYxwuNHYjsN+/97pNerONkjCAJ+H
         w41N3xwzX/TG5SE2P54AzsO59jARA4GWwDg7GG6/Ov5pmyVvCG3r65BRgC/u00DPC8lR
         SHYnBIp75tlqtIqQ8ulZ7yYPqporvEGlhUh/ffB73sQ1gH8Fc28vrXo2C+9echL+7U7q
         5hwRF0zckonvoe1gEZH39V6MDyAJmcC+I9jbLIUI6o5t4mIyIyy9Ik8MMMYiD+r4bFrY
         mf5jR1MB1niQ8etyRiKIFep/wfcKfE7gjoLHxCYs4Iz8W46ke0wkhdIYXT032EKxIZ/h
         xBqw==
X-Gm-Message-State: AOAM533e3sYy7Rc1MJkJvxCw1aQWE2rXf2acI9nisgmYrbRrcWA4Q3++
        AuqGk9jyfec3KEY7dSM2nb4q36YU1q4WQBKsgmgoqtA3Ya0=
X-Google-Smtp-Source: ABdhPJw0/qPxUNO5vXTaB06yRHt8+85C/oalaRbTTgF25himPKRudMcaDKldQ9WXAPwVsbnZuFE0N3PJqcVVn5yNDHE=
X-Received: by 2002:a2e:9e53:: with SMTP id g19mr16475855ljk.58.1623097071585;
 Mon, 07 Jun 2021 13:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <478e73fc-0e2c-4f1b-11d4-c71067764571@selasky.org> <b3747aa3-9984-0456-943a-b16e687c0ec0@selasky.org>
In-Reply-To: <b3747aa3-9984-0456-943a-b16e687c0ec0@selasky.org>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Mon, 7 Jun 2021 22:17:35 +0200
Message-ID: <CAPybu_3058QGK3uRZn4Q9Pru5ReMjVyD4tj9_+Lt4y0kxskfcA@mail.gmail.com>
Subject: Re: [PATCH] Genesys Logic UVC microscopes used to work with Linux
To:     Hans Petter Selasky <hps@selasky.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Maybe you want to handle this with a quirk? I suspect that some
devices might work differently with this patches?

On Sun, Jun 6, 2021 at 3:36 PM Hans Petter Selasky <hps@selasky.org> wrote:
>
> Hi,
>
> Some USB video class compliant devices, like Genesys Logic camera chips,
> used in cheap microscopes, doesn't provide any image if there are UVC
> SET current value commands for the processing unit, before the camera
> stream is activated. Fix this by not issuing any UVC SET current value
> commands, if the value was not changed. This should also work fine with
> existing UVC compliant webcams and optimized the number of needed
> processing unit control endpoint requests.
>
> Signed-off-by: Hans Petter Selasky <hps@selasky.org>
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c
> b/drivers/media/usb/uvc/uvc_ctrl.c
> index b3dde98499f4..0d7137eca331 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1697,7 +1697,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>          if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>                  ctrl->handle = handle;
>
> -       ctrl->dirty = 1;
> +       /* Avoid setting the current value. */
> +       if (!ctrl->dirty &&
> +           memcmp(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_BACKUP),
> +                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> +                  ctrl->info.size) != 0)
> +               ctrl->dirty = 1;
> +
>          ctrl->modified = 1;
>          return 0;
>   }



-- 
Ricardo Ribalda
