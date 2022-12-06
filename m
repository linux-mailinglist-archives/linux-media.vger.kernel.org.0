Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDCB644DB5
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 22:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiLFVEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 16:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiLFVEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 16:04:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0890245A05
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 13:04:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 567593D7;
        Tue,  6 Dec 2022 22:04:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670360651;
        bh=XLKZJIi8SYOdtsqE8YAQdoGONWODOl4r0js2A6dR0HU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CRhv1jn06rW7t2B3QHd/02PLdUkSy+U04HEbZrKpZQ1/3mScxXn26GWr8e2Z2tTVK
         M6UsNGdP0Li0ZcvOznnLkmeQxvHnqh8r1CI4JJk9tbVnO5iqx6Ye8L2zPXGr25B8xC
         76w8zcbC2XFqXPcgdc/JvedJtudjt1nDtwGOk2B0=
Date:   Tue, 6 Dec 2022 23:04:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Shang XiaoJing <shangxiaojing@huawei.com>,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: max9286: Fix memleak in max9286_v4l2_register()
Message-ID: <Y4+uSMEQSaYLiExO@pendragon.ideasonboard.com>
References: <20221206130555.9322-1-shangxiaojing@huawei.com>
 <Y49QPaYDe2iZjBLu@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y49QPaYDe2iZjBLu@oden.dyn.berto.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 06, 2022 at 03:22:53PM +0100, Niklas Söderlund wrote:
> Hi Shang,
> 
> Thanks for your work.
> 
> On 2022-12-06 21:05:55 +0800, Shang XiaoJing wrote:
> > There is a kmemleak when testing the media/i2c/max9286.c with bpf mock
> > device:
> 
> Out of curiosity, what exactly is a bpf mock device?

I'm curious as well, is it something like
https://lwn.net/Articles/906236/ but for I2C devices ? Is the
implementation public ?

> > kmemleak: 5 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> > 
> > unreferenced object 0xffff88810defc400 (size 256):
> >   comm "python3", pid 278, jiffies 4294737563 (age 31.978s)
> >   hex dump (first 32 bytes):
> >     28 06 a7 0a 81 88 ff ff 00 fe 22 12 81 88 ff ff  (.........".....
> >     10 c4 ef 0d 81 88 ff ff 10 c4 ef 0d 81 88 ff ff  ................
> >   backtrace:
> >     [<00000000191de6a7>] __kmalloc_node+0x44/0x1b0
> >     [<000000002f4912b7>] kvmalloc_node+0x34/0x180
> >     [<0000000057dc4cae>] v4l2_ctrl_new+0x325/0x10f0 [videodev]
> >     [<0000000026030272>] v4l2_ctrl_new_std+0x16f/0x210 [videodev]
> >     [<00000000f0d9ea2f>] max9286_probe+0x76e/0xbff [max9286]
> >     [<00000000ea8f6455>] i2c_device_probe+0x28d/0x680
> >     [<0000000087529af3>] really_probe+0x17c/0x3f0
> >     [<00000000b08be526>] __driver_probe_device+0xe3/0x170
> >     [<000000004382edea>] driver_probe_device+0x49/0x120
> >     [<000000007bde528a>] __device_attach_driver+0xf7/0x150
> >     [<000000009f9c6ab4>] bus_for_each_drv+0x114/0x180
> >     [<00000000c8aaf588>] __device_attach+0x1e5/0x2d0
> >     [<0000000041cc06b9>] bus_probe_device+0x126/0x140
> >     [<000000002309860d>] device_add+0x810/0x1130
> >     [<000000002827bf98>] i2c_new_client_device+0x359/0x4f0
> >     [<00000000593bdc85>] of_i2c_register_device+0xf1/0x110
> > 
> > max9286_v4l2_register() calls v4l2_ctrl_new_std(), but won't free the
> > created v412_ctrl when fwnode_graph_get_endpoint_by_id() failed, which
> > causes the memleak. Call v4l2_ctrl_handler_free() to free the v412_ctrl.
> > 
> > Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> > Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

Regardless of how this has been tested, the fix looks good.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  drivers/media/i2c/max9286.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index 9c083cf14231..d034a67042e3 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -932,6 +932,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
> >  err_put_node:
> >  	fwnode_handle_put(ep);
> >  err_async:
> > +	v4l2_ctrl_handler_free(&priv->ctrls);
> >  	max9286_v4l2_notifier_unregister(priv);
> >  
> >  	return ret;

-- 
Regards,

Laurent Pinchart
