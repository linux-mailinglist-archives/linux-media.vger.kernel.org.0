Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4481644588
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 15:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbiLFOXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 09:23:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiLFOW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 09:22:59 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F64F5A7
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 06:22:56 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id a7so17340451ljq.12
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHpm3RXlb+iGfAOkUSgzHlGEee+UJIWEtcZK+d2ukTE=;
        b=HnqSK/XFNv757Uho8kL0bkJFVzdpCUU3sbKkfw/DbnL3WMfEgJPv45ihigaN9v+UhN
         nB4+1gjKplGjw3R+wuetfe2hsB0dUhuvB4w4QCLA9kfVeYqzPh1CHuatGCKarkodZ5p4
         xABJ4SCA45FpOPKSM2j8NzEc22RSIXz7/pASjT344zRwiaOp96mzo5f6r8JE7cKXdxf9
         1l3VBUSFVxstVpbto3agFlgr7CwkVxp5b2XUbKETGkiZNyIkzZX+gbQ8cNc6kGFec3j+
         RK/MXW63jxEe1BqRLtPJb1Afeo206Y80DcCm/JIYQJpQZ26W1//cd56GMs1+19aIrfUV
         Y5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHpm3RXlb+iGfAOkUSgzHlGEee+UJIWEtcZK+d2ukTE=;
        b=RLcB8e2X4IHgYTCFbPnMmrBdsRCJXI2a1PuTkCuFK8o7HHzPc2E25BiklMKxHFLLB5
         BgVRHdCm0VSGPZL6jYhhv4sCqc14Y9N70y+XlV8I+/ekZb6c7uDGBKJhrfMa0LSc5vpg
         y9mCd1fvl/5B9uZ7CKo/ZnDeJ3ll3sUHG8pOXutWuDTgbvgZahTRKXzZanSk8wpxRRhO
         8gvneKTFy+M7RQrWrVutaBp9ZGCIMFhRwkJEYLJ73CpsodT1+oSSZUkxLJ650pHen5Lu
         oDhGuWeTpssOunS2NBdnzUhQ4KiQPUnT0+eKFx60BPLG0hl+9u2MtMSEpL4BXAwwfj55
         Ufjg==
X-Gm-Message-State: ANoB5pkl8Bp8Zm6glZy6CT8woBXXnVZ0JKKVpzEPgvmlFfIprPJQckQX
        b+Ot7dwChGwxsOQkkkuuaVNga7QVOJ5RZROR
X-Google-Smtp-Source: AA0mqf6iR6c51unUX/l7fPlCH1+jcV7jFNPlWoVl3zLXVCKKJEcYCL1YI2J10tSStsw9xwBqCEjWHQ==
X-Received: by 2002:a2e:964c:0:b0:279:f197:440d with SMTP id z12-20020a2e964c000000b00279f197440dmr4125055ljh.517.1670336574750;
        Tue, 06 Dec 2022 06:22:54 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id 6-20020ac25f06000000b00498fbec3f8asm2519753lfq.129.2022.12.06.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 06:22:54 -0800 (PST)
Date:   Tue, 6 Dec 2022 15:22:53 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Shang XiaoJing <shangxiaojing@huawei.com>
Cc:     jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: max9286: Fix memleak in max9286_v4l2_register()
Message-ID: <Y49QPaYDe2iZjBLu@oden.dyn.berto.se>
References: <20221206130555.9322-1-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221206130555.9322-1-shangxiaojing@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shang,

Thanks for your work.

On 2022-12-06 21:05:55 +0800, Shang XiaoJing wrote:
> There is a kmemleak when testing the media/i2c/max9286.c with bpf mock
> device:

Out of curiosity, what exactly is a bpf mock device?

> 
> kmemleak: 5 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> 
> unreferenced object 0xffff88810defc400 (size 256):
>   comm "python3", pid 278, jiffies 4294737563 (age 31.978s)
>   hex dump (first 32 bytes):
>     28 06 a7 0a 81 88 ff ff 00 fe 22 12 81 88 ff ff  (.........".....
>     10 c4 ef 0d 81 88 ff ff 10 c4 ef 0d 81 88 ff ff  ................
>   backtrace:
>     [<00000000191de6a7>] __kmalloc_node+0x44/0x1b0
>     [<000000002f4912b7>] kvmalloc_node+0x34/0x180
>     [<0000000057dc4cae>] v4l2_ctrl_new+0x325/0x10f0 [videodev]
>     [<0000000026030272>] v4l2_ctrl_new_std+0x16f/0x210 [videodev]
>     [<00000000f0d9ea2f>] max9286_probe+0x76e/0xbff [max9286]
>     [<00000000ea8f6455>] i2c_device_probe+0x28d/0x680
>     [<0000000087529af3>] really_probe+0x17c/0x3f0
>     [<00000000b08be526>] __driver_probe_device+0xe3/0x170
>     [<000000004382edea>] driver_probe_device+0x49/0x120
>     [<000000007bde528a>] __device_attach_driver+0xf7/0x150
>     [<000000009f9c6ab4>] bus_for_each_drv+0x114/0x180
>     [<00000000c8aaf588>] __device_attach+0x1e5/0x2d0
>     [<0000000041cc06b9>] bus_probe_device+0x126/0x140
>     [<000000002309860d>] device_add+0x810/0x1130
>     [<000000002827bf98>] i2c_new_client_device+0x359/0x4f0
>     [<00000000593bdc85>] of_i2c_register_device+0xf1/0x110
> 
> max9286_v4l2_register() calls v4l2_ctrl_new_std(), but won't free the
> created v412_ctrl when fwnode_graph_get_endpoint_by_id() failed, which
> causes the memleak. Call v4l2_ctrl_handler_free() to free the v412_ctrl.
> 
> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>  drivers/media/i2c/max9286.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 9c083cf14231..d034a67042e3 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -932,6 +932,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  err_put_node:
>  	fwnode_handle_put(ep);
>  err_async:
> +	v4l2_ctrl_handler_free(&priv->ctrls);
>  	max9286_v4l2_notifier_unregister(priv);
>  
>  	return ret;
> -- 
> 2.17.1
> 

-- 
Kind Regards,
Niklas Söderlund
