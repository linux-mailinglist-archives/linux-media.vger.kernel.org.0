Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FD567E0D9
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 10:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbjA0Jzj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 04:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjA0Jzi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 04:55:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566DABBAC
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 01:55:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E718561AA9
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 09:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92646C433D2;
        Fri, 27 Jan 2023 09:55:35 +0000 (UTC)
Message-ID: <3345768e-8c25-6951-3cdb-612e89c436f0@xs4all.nl>
Date:   Fri, 27 Jan 2023 10:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] media: pci: cx88: Fix missing pci_disable_device()
 when cx88_core_get() returns null
Content-Language: en-US
To:     gaochao <gaochao49@huawei.com>, mchehab@kernel.org,
        v4l@cerqueira.org, linux-media@vger.kernel.org
References: <20221205062757.1749-1-gaochao49@huawei.com>
 <20221205131334.1270-1-gaochao49@huawei.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221205131334.1270-1-gaochao49@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/12/2022 14:13, gaochao wrote:
> From: Gao Chao <gaochao49@huawei.com>
> 
> commit a8782f669c35 ("V4L/DVB (9796): drivers/media/video/cx88/cx88-alsa.c:
> Adjust error-handling code") added fail path. However, when cx88_core_get()
> returns null with chip->pci has not been setted, snd_cx88_dev_free() won't
> call a valid pci_disable_device() due to invalid chip->pci. Move the
> assignment of chip->pci forward to ensure snd_cx88_dev_free() can get
> valid chip->pci.
> 
> Fixes: b7f355d23c34 ("V4L/DVB (3293): Added digital support for cx88 (cx88-alsa)")
> Signed-off-by: Gao Chao <gaochao49@huawei.com>
> 
> v2:
> - move the assignment of chip->pci after chip = card->private_data
> ---
>  drivers/media/pci/cx88/cx88-alsa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --
> 2.17.1
> 
> diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
> index 29fb1311e443..22fe8c48a853 100644
> --- a/drivers/media/pci/cx88/cx88-alsa.c
> +++ b/drivers/media/pci/cx88/cx88-alsa.c
> @@ -861,6 +861,7 @@ static int snd_cx88_create(struct snd_card *card, struct pci_dev *pci,
>  	pci_set_master(pci);
> 
>  	chip = card->private_data;
> +	chip->pci = pci;

This isn't sufficient. If the pci_enable_device fails, then this function
also returns an error and chip->pci is still not set.

The same problem actually occurs with chip->core: this too is used in snd_cx88_dev_free,
and it is set much later.

Regards,

	Hans

> 
>  	core = cx88_core_get(pci);
>  	if (!core) {
> @@ -877,7 +878,6 @@ static int snd_cx88_create(struct snd_card *card, struct pci_dev *pci,
> 
>  	/* pci init */
>  	chip->card = card;
> -	chip->pci = pci;
>  	chip->irq = -1;
>  	spin_lock_init(&chip->reg_lock);
> 

