Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEF8408B5E
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 14:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235988AbhIMMyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 08:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235037AbhIMMyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 08:54:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9F1C061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 05:53:25 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i7so4720342lfr.13
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 05:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BD+DPDh/6joAqVggU6X1vywkJMOanIEvYQGdDSh+asE=;
        b=dyxkR0LekFs/9eazkETn4gqIFMQqr/s5JJg51m6HYSjiS/2HuiRRruyNcFgeP+ZsQI
         VAo4LA0JB3vkmjHcZ+C9a8XTy2K5zexlEhzJBQgyCUpmRDylznhPERO81kUHY7NWvAfX
         IihCNx44RBHUbp9bVhKmgcCfZ94uJkss9wo4PYyUWuAT1/C0Npkz/eY7+cC/cqYMxtZ3
         oRmHdjnXyXJlH/MbdNYcK7MsIURhIUV+azr0+iOv+bJPjLsvxqVGwGPUaZgMypS8Ax70
         Lizy1sXJUewTKwcXscQbP+V+Ac5jYprSXHEpU5Q5hiRAAlMZXITjHyGlMoKESHMtLLkx
         9xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BD+DPDh/6joAqVggU6X1vywkJMOanIEvYQGdDSh+asE=;
        b=PpkjjBqnXhBcJ0kc5Xt1zAP/x5254pBJStqQFZZd0BD996cnDlpr3rIIy+7p1mdqhm
         384XFkpCSfWVnnr1PEXpAjDhtOdXVQl/P2HFCjBPagumtDPx53aqHxtxLqlDTZKAjQLD
         JDWZhuGXaEt6z22ZSHoltYPYWyCON7vo/hvTOD6yJFiPpgXrr7nJrGGZjg6jMUL/AtB3
         QSHokIpCBZNcN0Bl7+LuOX3xwgrnVXEFOdVlq9Oq4GaFWOBQZA1bgihigWLjrQ4LNXLa
         j1UlSQpBTDOo5PZKduq7MRRM/ddh5us8I+lLoncQh+46gYbyq9/mYMEOEu68jultRFrl
         XyYw==
X-Gm-Message-State: AOAM532fvsnRQI0uvm9ke6vB8BsfsuhgnVgWpA3JIDGMONhenmZ30nsD
        inwwywwAJPWlSp7+sAUZvf6u9GICnnzFmAhQF1c=
X-Google-Smtp-Source: ABdhPJxuu8CkCYVZZ0EASUKcT8jWLtegHIubSOi8hOuLUm7Wnv7q1XpE+lD0eLprrYrA+HvS+MMLXjQg6BRRuW8qf9s=
X-Received: by 2002:a19:f701:: with SMTP id z1mr8653150lfe.457.1631537603568;
 Mon, 13 Sep 2021 05:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210827130150.909695-1-festevam@gmail.com> <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
In-Reply-To: <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 13 Sep 2021 09:53:12 -0300
Message-ID: <CAOMZO5B-BRfuPoGFyYQk4HdwaX45zxL9=gKTXKDHSxNwBDO-2g@mail.gmail.com>
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rui.silva@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Sep 13, 2021 at 5:58 AM Jacopo Mondi <jacopo@jmondi.org> wrote:

> There's an
>
>         tw9910_s_power(&priv->subdev, 0);
>
> at the end of the video_probe() function.
>
> The driver handles power management with the legacy s_power() call
> chain, and the receiver driver needs to v4l2_pipeline_pm_get() which
> the imx driver does when the capture node is open.
>
> Just an hint, you might have noticed already

Thanks for your comments and review. Yes, I have fixed the I2C errors.

I plan to re-submit the entire series after I get the TW9990 to work
on my imx6sx-based board.

The capture driver is drivers/staging/media/imx/imx7-media-csi.c.

Currently, I am not able to get the stream to start.

This is the configuration I am using:

media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
media-ctl -l "'csi':1 -> 'csi capture':0[1]"
media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x480 field:any]"
Opening media device /dev/media0
Enumerating entities
Found 3 entities
Enumerating pads and links
Setting up format UYVY8_2X8 720x480 on pad tw9910 2-0044/0
Format set: UYVY8_2X8 720x480
Setting up format UYVY8_2X8 720x480 on pad csi/0
Format set: UYVY8_2X8 720x480

Then I launch the capture stream command:

v4l2-ctl --stream-mmap -d /dev/video1

but nothing happens here, no >>>>> frame indication progress is shown.

If I hit CTRL + C then I get:
[  715.467623] csi: wait last EOF timeout

Any suggestions?

Thanks
