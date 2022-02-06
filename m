Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753AB4AAF08
	for <lists+linux-media@lfdr.de>; Sun,  6 Feb 2022 12:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbiBFLj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Feb 2022 06:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbiBFLj0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Feb 2022 06:39:26 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C80AC06173B
        for <linux-media@vger.kernel.org>; Sun,  6 Feb 2022 03:39:23 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id j14so10575653ejy.6
        for <linux-media@vger.kernel.org>; Sun, 06 Feb 2022 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tdh0NxXIz2/EMAENpMdPB6CeyoGehi7GG6wZXv/tC8g=;
        b=p8Nsf9VhxvOXZwakZIF3+cQcEFWEBV44/Srg0knl0t1F7a4QuGT0xdTDFjMLluZm/C
         b6mSsrqHyH/dDX3r+uCdq1GoU39PlavPNF8fCOAP7/4xDtnuLJZFdamr4GkIu8YAhWFa
         dOx+uLwCklalkljy49ns5fz5lRN5AwY2Hkh5AQcFw+ATXaNwVY2Torzy8zsxoD3UHrth
         kO1kpsKlUEnOYNr0ouqKzB0f6buZoKm+fER7h184wxKjkshMXj0NExq86tV5fc8I6Pa1
         JkpaUNkZTjlQyDQSx+6kcTqEpkTnr2gYPFbUFkO4n22dCx7KXRUwdeNRAp7zod5RMaek
         ZWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tdh0NxXIz2/EMAENpMdPB6CeyoGehi7GG6wZXv/tC8g=;
        b=1P02QMT7hfOZSLC4ixgrGP2V7sc8CQkm6OFyBNtw5AvoTWZawtEiF+uDa14uO14Y63
         ZbRjlpfxpIrE6vri6Z+SNK5rIDWNTFhIbOcxhCBVmkoTFzVv+OIOFFcLs3igClDnqAOe
         X3bXX3MK+v0agzpa+O23kFKz6E62iLkzfGPReyR/IFhnO4Zgouks/1ci7wF5jPg9iRQG
         7ATOSNt4kvSzWjfXN42eJ2k3HxhzqK9N2OZjAfxHbdHivwOnpLUeMANOXtZ7Eb+r1/fC
         kErLmnZpA/f1HINnjE13LDaneKzuoBAgtfN8hxvt5hL+JZC5WokRu+oUKbIKDziCkdec
         TiWQ==
X-Gm-Message-State: AOAM533oxondeDwpwwfKS17C3WKKq1niiO6ZufoSNd26X5NHTTHAJw6g
        3vIvlDa4TljS8nGHMtiS1UvOBIks4S2mVEwoJQoHhQ==
X-Google-Smtp-Source: ABdhPJwtUWwnk8aDwnbvNnbufYcpV+M5BDsQ37OvI3x5eeGo2BMpw+ygsO9BVciTbvkGJj8LgA4iJNfz/otFn8Gy8ME=
X-Received: by 2002:a17:907:a422:: with SMTP id sg34mr6147890ejc.221.1644147560330;
 Sun, 06 Feb 2022 03:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20220125080213.30090-1-dafna.hirschfeld@collabora.com> <20220125080213.30090-2-dafna.hirschfeld@collabora.com>
In-Reply-To: <20220125080213.30090-2-dafna.hirschfeld@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 6 Feb 2022 08:39:07 -0300
Message-ID: <CAAEAJfAFXq3xLjsTiSstQrbNYLh8MMi3vRds2=QRhthCjWLGeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: stk1160: fix number of buffers in case not
 all buffers are created
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Collabora Kernel ML <kernel@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, senozhatsky@google.com,
        hch@lst.de, Dafna Hirschfeld <dafna3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, 25 Jan 2022 at 05:02, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> In case we fail to allocate a transfer_buffer then we
> break the buffers creation loop and update the number of
> buffers to the number of successfully allocated which should
> be 'i' and not 'i - 1' nor 'i + 1'
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks!

> ---
>  drivers/media/usb/stk1160/stk1160-video.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 202b084f65a2..92c8b1fba2b0 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -511,15 +511,15 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>         usb_free_urb(dev->isoc_ctl.urb[i]);
>         dev->isoc_ctl.urb[i] = NULL;
>
> -       stk1160_warn("%d urbs allocated. Trying to continue...\n", i - 1);
> +       stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
>
> -       dev->isoc_ctl.num_bufs = i - 1;
> +       dev->isoc_ctl.num_bufs = i;
>
>         return 0;
>
>  free_i_bufs:
>         /* Save the allocated buffers so far, so we can properly free them */
> -       dev->isoc_ctl.num_bufs = i+1;
> +       dev->isoc_ctl.num_bufs = i;
>         stk1160_free_isoc(dev);
>         return -ENOMEM;
>  }
> --
> 2.17.1
>
