Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA8F36A018
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 10:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbhDXIL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 04:11:28 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55305 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbhDXILZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 04:11:25 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9E13040004;
        Sat, 24 Apr 2021 08:10:39 +0000 (UTC)
Date:   Sat, 24 Apr 2021 10:11:21 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/78] media: renesas-ceu: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210424081121.smppo4ly5p3fxto2@uno.localdomain>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <29ba3fafde4d2643fae49789e6b378d6b1fd51f5.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29ba3fafde4d2643fae49789e6b378d6b1fd51f5.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Apr 24, 2021 at 08:44:16AM +0200, Mauro Carvalho Chehab wrote:
> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> replace it by the new pm_runtime_resume_and_get(), introduced by:

Nit: 'Replace' as it follows a full stop ?

> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
>
> While here, check if the PM runtime was caught at open time.

Nit: Maybe "PM runtime error ..." or something similar as I'm missing the
subject of the phrase.

>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/renesas-ceu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index cd137101d41e..965a7259e707 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1099,7 +1099,10 @@ static int ceu_open(struct file *file)
>
>  	mutex_lock(&ceudev->mlock);
>  	/* Causes soft-reset and sensor power on on first open */
> -	pm_runtime_get_sync(ceudev->dev);
> +	ret = pm_runtime_resume_and_get(ceudev->dev);
> +	if (ret < 0)
> +		return ret;

The mutex should be released before returning

> +
>  	mutex_unlock(&ceudev->mlock);
>
>  	return 0;
> --
> 2.30.2
>
