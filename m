Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A64636A02D
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 10:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhDXIbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 04:31:15 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:53249 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbhDXIae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 04:30:34 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1578740007;
        Sat, 24 Apr 2021 08:29:53 +0000 (UTC)
Date:   Sat, 24 Apr 2021 10:30:35 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 44/78] media: i2c: ov5647: use pm_runtime_resume_and_get()
Message-ID: <20210424083035.d4wdzlntgeqxku4q@uno.localdomain>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <9713ae015dd9c8b8d65fa5baaaa2cd02ceb89a27.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9713ae015dd9c8b8d65fa5baaaa2cd02ceb89a27.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Apr 24, 2021 at 08:44:54AM +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
>
> Use the new API, in order to cleanup the error check logic.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Looks good, thanks!
Acked-by: Jacopo Mondi <jacopo@jmondi.org>


> ---
>  drivers/media/i2c/ov5647.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 1cefa15729ce..38faa74755e3 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -882,20 +882,20 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>  	}
>
>  	if (enable) {
> -		ret = pm_runtime_get_sync(&client->dev);
> +		ret = pm_runtime_resume_and_get(&client->dev);
>  		if (ret < 0)
>  			goto error_unlock;
>
>  		ret = ov5647_stream_on(sd);
>  		if (ret < 0) {
>  			dev_err(&client->dev, "stream start failed: %d\n", ret);
> -			goto error_unlock;
> +			goto error_pm;
>  		}
>  	} else {
>  		ret = ov5647_stream_off(sd);
>  		if (ret < 0) {
>  			dev_err(&client->dev, "stream stop failed: %d\n", ret);
> -			goto error_unlock;
> +			goto error_pm;
>  		}
>  		pm_runtime_put(&client->dev);
>  	}
> @@ -905,8 +905,9 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>
>  	return 0;
>
> +error_pm:
> +	pm_runtime_put(&client->dev);
>  error_unlock:
> -	pm_runtime_put(&client->dev);
>  	mutex_unlock(&sensor->lock);
>
>  	return ret;
> --
> 2.30.2
>
