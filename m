Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0997139ECD2
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 05:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFHDQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 23:16:51 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:44583 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhFHDQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 23:16:51 -0400
Received: by mail-lj1-f180.google.com with SMTP id d2so20825880ljj.11
        for <linux-media@vger.kernel.org>; Mon, 07 Jun 2021 20:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yarrfhfRh68/NScLHISiafJkt7tmtmWn5drOAmC634=;
        b=OeIWvtDAwguHXI9B0LwOkUbP9DsszLXx+m/Ca1BSfg0j5yQvMLMfnwb4o/YvppVlmU
         q2f25AiSHVkTvadXOpMWvjHVoA+U2CNYPVoGYdMLMnW1mPWJLgkRpHsIUw1kTWiCpjze
         UKZgW7/GnrCwQYkjN1eMYd9T3/uFSyK5MSe/+c1X1dpomDxvE/J0t5SRqydPpNOeVkP3
         gT3VpyhR1H5cjjUOqmI0z51Ud7s7y2DuKc8v6M33j5qzAsO0b+wAS+guxelxGXfbfcJV
         6o1Pxzo/kmqUKh5qdqL/RtiuPz7wiOQ/5EbPHFjsODupDa0ySAD1WorWdU6nncAV+CEG
         W42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yarrfhfRh68/NScLHISiafJkt7tmtmWn5drOAmC634=;
        b=XFdFkt+RoJ0Jh96oJlEkc62Ven55ODSNFDBiehIeHL8Bd4EppZ4y7+8hiQISxS7GQg
         9g+K1GVLxCQAE6wHRhTVWTNsBowm4e48HbLKKRDL4RERSE1LbVlK9NS0/kzvM9Zhg78/
         PoX/c4XjQVoR+bdhigltJDdKNEqlXLRawYvMTKMkWcuMqexW7fppZajv27zoj05GO8ip
         emmj/PuPDVnxrlwIyjH77h7dyUbP371tb+nSH5lqNO3Z+N8IUaB4vqBn7ryZZrAdOnfa
         EXlsAq6aj0gfCg87h/XwjmeFVM2PlnmvrqI0bM29h1SLNfkNHQ2Oi456qHoY7dn6AUL/
         p+/A==
X-Gm-Message-State: AOAM532gx1ztB6MazGw+nMpXHMlln+DsrtD5r//V0gkAfy0H96gTq4rq
        NEZSjKVR+6rooUcsJAAOGdO6+IvZdWZHCSxrBvI=
X-Google-Smtp-Source: ABdhPJwwBvCsr4sZ7KF7Jpj0frlYkbl9LagjU+rZCqoVYPyik6Ms7of2pFYsqj680UNEy7216cgT/ccPAKkSLpBQw3U=
X-Received: by 2002:a05:651c:a06:: with SMTP id k6mr16985836ljq.347.1623122022877;
 Mon, 07 Jun 2021 20:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Jun 2021 00:13:31 -0300
Message-ID: <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 8:48 PM Fabio Estevam <festevam@gmail.com> wrote:

> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
> driver bug, expect capture failures.
> [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
> [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
> [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
> [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> ../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:01.072478334
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
> Not sure why I am getting LP-11 and clock lane timeouts though.

I saw this post:
https://ez.analog.com/linux-software-drivers/f/q-a/535279/adv7282-m-dts-how-to-connect-adv-to-ipu1_csi0

and Frieder's patch:
https://git.kontron-electronics.de/linux/linux/-/commit/0d90331a44d0f718b7327a94fc72612ddcb4ac0f.patch

I applied Frieder's patch, but still getting the same errors below
upon launching Gstreamer.:

 New clock: GstSystemClock
 [   11.745511] imx6-mipi-csi2: LP-11 wait timeout, likely a sensor
 driver bug, expect capture failures.
 [   11.754956] imx6-mipi-csi2: phy_state = 0x00000200
 [   12.259957] imx6-mipi-csi2: clock lane timeout, phy_state = 0x00000200
 [   12.266630] ipu1_ic_prpvf: upstream stream on failed: -110
 [   12.274082] ipu1_ic_prpvf: pipeline start failed with -110

Does anyone know what needs to be done to avoid the LP-11 timeout error?

Thanks
