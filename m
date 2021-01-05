Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4392EB2E7
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 20:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbhAETBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 14:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbhAETBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 14:01:09 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E9FC061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 11:00:28 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b26so847440lff.9
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 11:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IwsPjitLgHPH525PlxQFtZP7BfLuaT1Lq+isq8JrQG4=;
        b=J33LfUApYmDUwGGJJy/Kw9dMgVfs0qAa8jlqqBWIWkiAxcO0J4gfVKila76p8ExlYO
         yT+3F8oDtOYJttof9pZKAk0KvrVRTuX5H1DVy50LBKiCcvHDq8COWrZuoRdkmCtgYL6D
         dNTBm5HayEDnj5fJhyfezeA2tssmLjzb0XXiGUNsUqU7xLhIFOHQz9HoEAVxqBxsMZSh
         /JVmaZKFdDno6vroz8UCXPArsS54vTUkPg0Wln4Z2PqM4rxe6bub/nTzBc4CWo1GOfoS
         aihSM8hsk2f/omAMm9Bpq94WpJkZamty1J0+KNVRBsV9AcqozCtnevsHQcYr93BkHZTG
         SGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IwsPjitLgHPH525PlxQFtZP7BfLuaT1Lq+isq8JrQG4=;
        b=EE+GXtgmg9lplGOedLJePtkvmTW+pve4HRRek8tdfgjNYD/xgktVisRGcVihp6uKvD
         EqgezbYQbgD70Pn3f8qrsQTyTd+rJhZ5fC1+G9HX338Kq9hfUwkxWqxagK8KMbYMjhFW
         ExLGDwJyWYpUUvmeo5ixvDVXaTR+V95B/lYMcBwfbMWu+3vZP720mryHuh35q1X64G4Q
         gKigFt5Xzqd1At0/ZQcW99W4Io5KNSes7KAjg7f70gsp+QroiAtxmynG4nS+GYcLx2Mb
         ZZymXe54FS4EDPs3Qvlxt4Hs6iYyijMuVWXCbSAXunPXI3K20g3Lu/UAtGy08fdca598
         G6Pw==
X-Gm-Message-State: AOAM532gWKnEIsc3rYmxlbGAuiFWQWwqrfBjGUm53qYFOxtH/I6VuhuK
        qO0xH4xN+9JTyqxMPU0hxiT3IVo+z//sdQh+PXo=
X-Google-Smtp-Source: ABdhPJwDoL7zjBtG1HluGa3AteDkZbZYtIQ++/UiSjD84LHEvCb4QnUCwq4eZlFOfQ546uhfbA7qogORwgxODJfi2aM=
X-Received: by 2002:a2e:8750:: with SMTP id q16mr481569ljj.53.1609873227422;
 Tue, 05 Jan 2021 11:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com> <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
In-Reply-To: <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Jan 2021 16:00:15 -0300
Message-ID: <CAOMZO5CB12S2O-Ag2CPRRU2i_ad9+5i-=pFmm+rPxdNZBQGQUQ@mail.gmail.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for i.MX7
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 5, 2021 at 2:45 PM Fabio Estevam <festevam@gmail.com> wrote:

> There is a build error introduced by patch 74/75. I fixed it like this:
>
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -193,6 +193,8 @@
>  #define MIPI_CSIS_SDW_RESOL_CH(n)              (0x84 + (n) * 0x10)
>  #define MIPI_CSIS_SDW_SYNC_CH(n)               (0x88 + (n) * 0x10)
>
> +/* Debug Control register */
> +#define MIPI_CSIS_DBG_CTRL                     0x20

I meant 0xc0 here, sorry.
