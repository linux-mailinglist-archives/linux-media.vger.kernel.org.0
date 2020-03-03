Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2EFE176D32
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 04:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgCCDBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 22:01:48 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40610 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbgCCDBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 22:01:48 -0500
Received: by mail-vs1-f67.google.com with SMTP id c18so1438799vsq.7
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 19:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSRU5sACea5+ppbDemV9Uic2wN/d3iE9zq0J+9WMWgc=;
        b=GLB9O7C5VahYJhDYzkBxf2lKSD9pLzKz5Byom6tbN2F00apEFOoMKygPFRUL/Uj/9p
         trrMj2G7knR6XcyNzJnegV3oqZFYXjOzksRSaS7EYqXLtBm73hjZhvPgh/oHzwaPaxK3
         76NkpiHJoXM8Dn8fmYWtlTbgNorgHL9tKxZJyFtPTMNtqUHk0NviVgwyZkLagj68k+m2
         eR3sQl4yLprO0JVwr10qiSju6vKn8TwNCARfi1ZmCrQ3QXiaMKxoMnt4pglC66DeYQJA
         FO+hfumTHCsVe8b6U78fKr/EUZSkshYD2KuyX+9VNS+l4U99BqrSloNqlDPhi1J3nwwL
         lNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSRU5sACea5+ppbDemV9Uic2wN/d3iE9zq0J+9WMWgc=;
        b=pkqNW7NVZLcq/V2GwMJNzlsm5PjF0YzavG7D+CF3pvi97Io9+UD9Pwe7pO+D8cgEVJ
         SzeBTDic+GMqqPK25AuRQyYv2bukSKNWMTwyRb4kT5MllnUUDtwqtOSACUYlUK1j0c0D
         Euq/nFmK7RpkyYJT5oLoHumSJ4Z4eBa9JIjaz6Y8Lrl1dwHjhZukG9dYlazdL0PRZNcb
         UcPLS92VQxBYOtPadulpk2IavBt7+mIDJ8wJCU5w7OOGP2FSpuBFtfB2L2Vc+z8X0Xux
         YhmG/0QoKvsXKaElEHC/Bli/wQFgTV+8bkxOA5bzkajysXxDkITlPiVD2+5urC8Gpt49
         ohcg==
X-Gm-Message-State: ANhLgQ1cBln1hJfaLTZYr8/USxPtAi+aC+ljxLY9H7Q645VW8pGV0s+Z
        8DQ3SJE2J0b6IH2blPO62r1erk+lwW/PCnruMCrUVQ==
X-Google-Smtp-Source: ADFU+vuC8mp7isBQqKtElWb2H5X02yPVK/KkJEjfK1X7c0jaRsY9KoO483bHWVY/z9yfC29IZdAch/0rT3wM1qaKiP0=
X-Received: by 2002:a67:1601:: with SMTP id 1mr1197519vsw.176.1583204506731;
 Mon, 02 Mar 2020 19:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAOMZO5AP65Upj8v=KaPLzS10DNdwrz20gJGbwbcJfCDqZBx71Q@mail.gmail.com>
 <CA+V-a8s_d3Atp9J5KM=x4z2z_iAY8+9vcSHFUTyQ3XZ9HCCS3g@mail.gmail.com> <CAOMZO5DP3BMmmL3eM5dmhy0YdMGvD9UW1mUXb1tYds9eVbE6LA@mail.gmail.com>
In-Reply-To: <CAOMZO5DP3BMmmL3eM5dmhy0YdMGvD9UW1mUXb1tYds9eVbE6LA@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 3 Mar 2020 00:01:34 -0300
Message-ID: <CAAEAJfBmvGhMWCCh80Y+qG26OKg5Af5U+Zdtgrbt27cS9YgQug@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: Add virtual_channel module parameter
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding Niklas and Jacopo,

On Mon, Mar 2, 2020, 12:33 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Prabhakar,
>
> On Mon, Mar 2, 2020 at 4:19 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>
> > > Should this be a device tree property instead?
> > I did give a thought about it, but making this as DT property would
> > make it more stiff.
>
> In case a system has two OV5645 and we want to operate each OV5645
> with a different virtual channel, it will not be possible with the
> module_param approach.
>
> Using a device tree property would make it possible though, so I think
> it makes more sense to use a device tree property for this.
>

As often happens, driver parameter is probably the easiest and less
invasive way to customize a driver, so I can imagine myself carrying
something like this downstream if needed. Haven't we all?

It's definitely not suitable upstream, as Fabio points out, but
I don't think a devicetree approach is either.

It seems Niklas and Jacopo have been working on adding
proper support to route this, via some new ioctls.

https://patchwork.linuxtv.org/patch/55300/

Not sure what's the status of it.

Hope it helps,
Ezequiel
