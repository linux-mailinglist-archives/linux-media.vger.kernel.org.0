Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8116ADEFF
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 13:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjCGMmh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 07:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjCGMmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 07:42:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3FF7E790;
        Tue,  7 Mar 2023 04:41:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43D6761347;
        Tue,  7 Mar 2023 12:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DF8C433D2;
        Tue,  7 Mar 2023 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678192896;
        bh=pnrZ98731lubBoA2Vy2p3wpCm/3MmyBR6TDlfygjB5U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q2FXVrDLyXwoyhYAYD/ajm70T222ROY88RcE9hn1vJN2uW7bvqKHJkjkfZEn4RO5N
         enZn0C0a44AhI+ppQh4gjQISPxP28auwgub8U3DG12C/YevZT0va9IBLcnDm83f/GK
         BJ0Q8C8fOQPeXR4zD134/V1h0S9kRamvdxrIG1HYvKKxCCeWudCpXUc/b/Av4srY7w
         fVK4uHYroGkftAU0ui5KcVUzpjjPVkDs2YchdSuhFD//GJgnpsP59HUb0ilj1R7hBX
         yGKIS1/E22upYHqUUSZI8u6BTa+BRK+YLj9GgjviI2sIlo+FO7GEdIBKW0csaIQlFq
         Pr2qHQafJXThQ==
Date:   Tue, 7 Mar 2023 13:41:31 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hyunwoo Kim <imv4bel@gmail.com>
Cc:     kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev, tiwai@suse.de
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <20230307134131.3a005bdb@coco.lan>
In-Reply-To: <20221117045925.14297-1-imv4bel@gmail.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 16 Nov 2022 20:59:21 -0800
Hyunwoo Kim <imv4bel@gmail.com> escreveu:

> Dear,
> 
> This patch set is a security patch for various race condition vulnerabilities that occur
> in 'dvb-core' and 'ttusb_dec', a dvb-based device driver.
> 
> 
> # 1. media: dvb-core: Fix use-after-free due to race condition occurring in dvb_frontend
> This is a security patch for a race condition that occurs in the dvb_frontend system of dvb-core.
> 
> The race condition that occurs here will occur with _any_ device driver using dvb_frontend.
> 
> The race conditions that occur in dvb_frontend are as follows
> (Description is based on drivers/media/usb/as102/as102_drv.c using dvb_frontend):
> ```
>                 cpu0                                                cpu1
>        1. open()
>           dvb_frontend_open()
>           dvb_frontend_get()    // kref : 3
> 
> 
>                                                              2. as102_usb_disconnect()
>                                                                 as102_dvb_unregister()
>                                                                 dvb_unregister_frontend()
>                                                                     dvb_frontend_put()    // kref : 2
>                                                                 dvb_frontend_detach()
>                                                                     dvb_frontend_put()    // kref : 1
>        3. close()
>           __fput()
>           dvb_frontend_release()
>           dvb_frontend_put()    // kref : 0
>           dvb_frontend_free()
>           __dvb_frontend_free()
>           dvb_free_device()
>           kfree (dvbdev->fops);
>           ...
>           fops_put(file->f_op);    // UAF!!

Hmm... you're mentioning ttusb_dec at the comment, but here you're showing
the race for as102, which is a different driver.

I'm confused.


Thanks,
Mauro
