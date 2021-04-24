Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE5A36A028
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 10:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbhDXI0l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 04:26:41 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39115 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhDXIZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 04:25:28 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id ADE6FFF805;
        Sat, 24 Apr 2021 08:24:12 +0000 (UTC)
Date:   Sat, 24 Apr 2021 10:24:54 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Apr 24, 2021 at 08:44:48AM +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
>
> Use the new API, in order to cleanup the error check logic.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

I should re-work the error handling sequence there on top of this
patch as right now it's not the best, that 'done' label bothers me...
anyway, for later.

> ---
>  drivers/media/i2c/mt9m001.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> index 3b0ba8ed5233..57e15a291ebd 100644
> --- a/drivers/media/i2c/mt9m001.c
> +++ b/drivers/media/i2c/mt9m001.c
> @@ -217,9 +217,9 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
>  		goto done;
>
>  	if (enable) {
> -		ret = pm_runtime_get_sync(&client->dev);
> +		ret = pm_runtime_resume_and_get(&client->dev);
>  		if (ret < 0)
> -			goto put_unlock;
> +			goto unlock;
>
>  		ret = mt9m001_apply_selection(sd);
>  		if (ret)
> @@ -247,6 +247,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
>
>  put_unlock:
>  	pm_runtime_put(&client->dev);
> +unlock:
>  	mutex_unlock(&mt9m001->mutex);
>
>  	return ret;
> @@ -834,7 +835,7 @@ static int mt9m001_remove(struct i2c_client *client)
>  {
>  	struct mt9m001 *mt9m001 = to_mt9m001(client);
>
> -	pm_runtime_get_sync(&client->dev);
> +	pm_runtime_resume_and_get(&client->dev);
>
>  	v4l2_async_unregister_subdev(&mt9m001->subdev);
>  	media_entity_cleanup(&mt9m001->subdev.entity);
> --
> 2.30.2
>
