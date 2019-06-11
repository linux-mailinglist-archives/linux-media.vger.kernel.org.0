Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B19AF3D42B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 19:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406277AbfFKRam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 13:30:42 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43200 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406144AbfFKRal (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 13:30:41 -0400
Received: by mail-oi1-f195.google.com with SMTP id w79so9569835oif.10
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yghWgUY4bsBsaOEC8hSKrBWdpoBZpKBnYa7otcHZyeo=;
        b=fP6rusz+cfSBcHwrTTjNEuctg1yGwbR9kwzMZ/oPYrjbTAVBlkqiOOp7AsPJMuQZro
         Zu3tMT84Bc6Bv2LunGG6nf64drfxeTTbBySOZZsh51lnAk3BTeL77nCcpBtPED6295M5
         k4oGWEUDir9mhjt1sSwZMlFAiy5ynWE5/9tK9XopfglmmLlodbUY2FhjrISfTSa6X6V4
         /gkGHBjKJSKnzuGtnP9MkvLWN/LaFdDUjZU21hqN/Dg4vsEOf02ZuSRSsX+E08uum9DO
         dHC4N5r7bioQijmg18fx2xL9uJrfjNVCFG2ZLZpiIQch6TeDt8royT0heknjaEQQ6v+S
         iNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yghWgUY4bsBsaOEC8hSKrBWdpoBZpKBnYa7otcHZyeo=;
        b=s2sRShJqZanitwZc9+DWjQu3JDEZnEa9UB89El/0OfVym/KzAzBBcAIbcpYt+CWB9f
         TRN6t0nd9+KxhOjUg4MmTzmbpcoIOOYwRFGTgisNAmq95H3EZHdUChfBLJ+KHD/xoPQp
         dhWfHAJanmh+hT1rZBP2izh5HrjetkROiV1/nZ2JePkXoneAP5SsJqVuJrFLuFQNScI/
         MVRzcGTb2MG9tm9h4hcUYE5n0J8fbDw2PGiGQUI97vi/N6q/oH3LH8S2J5lZyqcPKdYP
         hejpk6wfPH+W0wAzyEsjrbNwU5OaIoG+BAO9QMgvf3fmFQpOiykwCaIAuCB8KbmbZYpq
         mYcg==
X-Gm-Message-State: APjAAAUodajbM+X8suZjO2BrQXDiT1hiM4RdFxvUnE49ezL/gLQR6m1P
        Gmw5IZlRPQxhZuZk60V/oMaPTfj4e/tnDA+n0jo3bpZ4
X-Google-Smtp-Source: APXvYqyP4/cshCDgw8o5QLzg/Bj3l9ix/1Aeal3lRW0g0iUmpN/SYlqtS8RekRr9l5/yQV3OuNMs7hOh/hXMd/CeYg8=
X-Received: by 2002:aca:e106:: with SMTP id y6mr16867827oig.77.1560274240400;
 Tue, 11 Jun 2019 10:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
 <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
 <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiW9vqHXVt771P7tQvHwJ1ifr2qbtmxnVm7Ff6vY=DjKwg@mail.gmail.com>
 <VE1PR04MB663800AFCE7FF016DBE9EB7689160@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWJ3u0NpP8Tji0oOJ4-9MFm1Ac1mzur_gL9+e8Jsj4EdA@mail.gmail.com>
 <VE1PR04MB66382A33B135E7A724D13C2F89170@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWiQ1XRWSsgE5DbMZTiy9HkSvhvWNn3cPPw9p6HZZaBEw@mail.gmail.com>
 <VE1PR04MB6638ECD904CC0F9A6F95302F89130@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWa8o4hEFTZauTtb0mWnzusVcYakvMn84eg_Q=CugKUKg@mail.gmail.com> <VE1PR04MB6638B3BA8B924C327D0368E089ED0@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6638B3BA8B924C327D0368E089ED0@VE1PR04MB6638.eurprd04.prod.outlook.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 11 Jun 2019 13:30:28 -0400
Message-ID: <CAGngYiUwi=sH_VoRApM4x2RtVzuxXAfgMZnxtDvQ6PUA+b4fyA@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 11, 2019 at 5:09 AM Robin Gong <yibin.gong@nxp.com> wrote:
>
> Sven, no any dependency from sdma driver view. The only difference between directly loading firmware
> from kernel and rootfs is the former spend more time during kernel boot and such timing may cause
> the crash. The issue is not 100% in my side, about 20% possibility, which looks like 'timing issue' . Another
> interesting thing is that every time the crash stop at somewhere drm, and After I disable ipu and display
> which use drm in i.mx6q.dtsi, the issue is gone on my i.mx6q-sabreauto board.
> Could you have a try with below patch as mine? If the issue is gone on your side, we could involve drm guys to
> look into it.

When I apply your patch to ipu and display, the crash still happens on
my device.
But when I disable NFSv4 network filesystem in defconfig, the crash disappears.
Yet on linux-next, the crash is there again, even if I disable the IPU or NFSv4.

My guess: we are chasing ghosts, the crashes are purely timing related. Things
like disabling the IPU or NFSv4 change boot timing, and this changes the crash.

Experiment: If I put msleep(1000) right before the sdma_load_script() call, then
the crash never happens. And if I comment out the call to sdma_run_channel0()
in sdma_load_script(), then the crash also does not happen.

This suggests that the crash is related to the exact timing when
sdma_run_channel0() is called. If it is called too early, this results
in an 'interrupt storm' on the sdma interrupt handler: it gets called
millions of times in a very short amount of time.

By adding debug prints, I noticed that the sdma core calls back
sdma_alloc_chan_resources(), later during the boot, when a spi
bus is created.

Experiment: I paused firmware upload until the first time
sdma_alloc_chan_resources() is called by the core.
I used a struct completion to accomplish this.

Result: the crash never happens again.

All this suggests very strongly that sdma_run_channel0() is called
"too early" by the driver. I don't known enough of imx-sdma to
know what is missing during the early call.

Here is the patch to delay firmware load until the first
sdma_alloc_chan_resources() has completed:

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 99d9f431ae2c..ddeded5c3337 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -33,6 +33,7 @@
 #include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/workqueue.h>
+#include <linux/completion.h>

 #include <asm/irq.h>
 #include <linux/platform_data/dma-imx-sdma.h>
@@ -444,6 +445,7 @@ struct sdma_engine {
        struct sdma_buffer_descriptor   *bd0;
        /* clock ratio for AHB:SDMA core. 1:1 is 1, 2:1 is 0*/
        bool                            clk_ratio;
+       struct completion               chan_resources_alloced;
 };

 static int sdma_config_write(struct dma_chan *chan,
@@ -1258,6 +1260,7 @@ static void sdma_desc_free(struct virt_dma_desc *vd)
 static int sdma_alloc_chan_resources(struct dma_chan *chan)
 {
        struct sdma_channel *sdmac = to_sdma_chan(chan);
+       struct sdma_engine *sdma = sdmac->sdma;
        struct imx_dma_data *data = chan->private;
        struct imx_dma_data mem_data;
        int prio, ret;
@@ -1310,6 +1313,7 @@ static int sdma_alloc_chan_resources(struct
dma_chan *chan)
        if (ret)
                goto disable_clk_ahb;

+       complete(&sdma->chan_resources_alloced);
        return 0;

 disable_clk_ahb:
@@ -1724,6 +1728,7 @@ static void sdma_load_firmware(const struct
firmware *fw, void *context)
                /* In this case we just use the ROM firmware. */
                return;
        }
+       wait_for_completion(&sdma->chan_resources_alloced);

        if (fw->size < sizeof(*header))
                goto err_firmware;
@@ -2012,6 +2017,7 @@ static int sdma_probe(struct platform_device *pdev)
                return -ENOMEM;

        spin_lock_init(&sdma->channel_0_lock);
+       init_completion(&sdma->chan_resources_alloced);

        sdma->dev = &pdev->dev;
        sdma->drvdata = drvdata;
