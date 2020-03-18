Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B051897BF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgCRJQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:16:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46782 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgCRJQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:16:50 -0400
Received: by mail-ot1-f65.google.com with SMTP id 111so24683512oth.13;
        Wed, 18 Mar 2020 02:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=28v2Ge+NMFFDgoUGQYz6fJX3Vr60wr4F2WTbj8Q51X0=;
        b=gsrK7Srt9hjveoobdMSQ00yiMOUpmwsRWoK7HqltASEs7FuWleCeE64bzeU2K6whrf
         tDDUcvTH6gPzhcwZvG9D1dIfD5T8IJPWiWpbm6jEEt5diM2yjtqlvSI7lqsKeiyAfrKV
         EU5Ge3SDXUi0gDUlRhm22ysuKhcyhmNW9PhTb9cEu20g3UaREHnfwP8baSAfzBH8MyM5
         oYqMkC+hof3ydqYIgX66ffalRzyta53pp6DRVE6MbFLHO/SSFI7niauiarZAEYuL89Ft
         1v7jqmPIXB5DztjXMEDEcBa2lKB5bGspyiZE0w1sXa9CUIL87+1/4FhhZPJrUwHhBP+h
         Yswg==
X-Gm-Message-State: ANhLgQ1NWB63qSTZe9yx7JruR/bp59i32e1eZT/lVVxlbVOSdq8XLOL9
        l3S3P0m4i3ztcNILpRwNRASXPGGM41KgcN33Wls=
X-Google-Smtp-Source: ADFU+vvWdyR70DQQxb1tY2EBTgzpS9Nnh/g+TSNj9K6JFDBR2dQJVNIf/IW1Njir27uMXs6eiiqkUoHEB7MatGofRIs=
X-Received: by 2002:a9d:6a47:: with SMTP id h7mr3037675otn.297.1584523009161;
 Wed, 18 Mar 2020 02:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com> <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Mar 2020 10:16:37 +0100
Message-ID: <CAMuHMdUDr2XRUuMxCn3W7BCscEDhaVAsX7fP6MBhKXDB4n3Eag@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: v4l2-async: Log message in case of
 heterogenous fwnode match
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Mar 18, 2020 at 1:26 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> When a notifier supplies a device fwnode and a subdev supplies an
> endpoint fwnode, incorrect matches may occur if multiple subdevs
> correspond to the same device fwnode. This can't be handled
> transparently in the framework, and requires the notifier to switch to
> endpoint fwnodes. Log a message to notify of this problem. A second
> message is added to help accelerating the transition to endpoint
> matching.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -113,7 +114,28 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>
>         fwnode_handle_put(dev_fwnode);
>
> -       return dev_fwnode == other_fwnode;
> +       if (dev_fwnode != other_fwnode)
> +               return false;
> +
> +       /*
> +        * We have an heterogenous match. Retrieve the struct device of the
> +        * side that matched on a device fwnode to print its driver name.
> +        */
> +       if (sd_fwnode_is_ep)
> +               dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
> +                   : notifier->sd->dev;
> +       else
> +               dev = sd->dev;
> +
> +       if (dev && dev->driver) {
> +               if (sd_fwnode_is_ep)
> +                       dev_info(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
> +                                dev->driver->name);

I think that deserves a dev_warn().

> +               dev_info(dev, "Consider updating driver %s to match on endpoints\n",
> +                        dev->driver->name);

And dev_notice(), while at it ;-)

> +       }
> +
> +       return true;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
