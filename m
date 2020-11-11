Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280742AF7E7
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 19:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgKKS3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 13:29:01 -0500
Received: from iodev.co.uk ([46.30.189.100]:50300 "EHLO iodev.co.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbgKKS3B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 13:29:01 -0500
X-Greylist: delayed 588 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Nov 2020 13:29:00 EST
Received: from abuya (118.130.77.188.dynamic.jazztel.es [188.77.130.118])
        by iodev.co.uk (Postfix) with ESMTPSA id 4DBD013403;
        Wed, 11 Nov 2020 19:19:09 +0100 (CET)
Date:   Wed, 11 Nov 2020 19:21:26 +0100
From:   Ismael Luceno <ismael@iodev.co.uk>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: solo6x10: fix missing snd_card_free in error
 handling case
Message-ID: <20201111182126.GE22827@abuya>
References: <20201111032201.17879-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111032201.17879-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/Nov/2020 11:22, Qinglang Miao wrote:
> Fix to goto snd_error in error handling case when fails
> to do snd_ctl_add, as done elsewhere in this function.
> 
> Fixes: 28cae868cd24 ("[media] solo6x10: move out of staging into drivers/media/pci.")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/media/pci/solo6x10/solo6x10-g723.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> index 906ce86437ae..d137b94869d8 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> @@ -385,7 +385,7 @@ int solo_g723_init(struct solo_dev *solo_dev)
>  
>  	ret = snd_ctl_add(card, snd_ctl_new1(&kctl, solo_dev));
>  	if (ret < 0)
> -		return ret;
> +		goto snd_error;
>  
>  	ret = solo_snd_pcm_init(solo_dev);
>  	if (ret < 0)
> -- 
> 2.23.0
> 

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
