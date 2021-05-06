Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3EAB37582D
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 18:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbhEFQHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 12:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbhEFQHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 12:07:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B68C061574;
        Thu,  6 May 2021 09:06:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7DBA89D;
        Thu,  6 May 2021 18:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620317179;
        bh=pPRN7aviLixXqbXvHZ811Lqc8oDiwN3xjtvymz/3+pY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o8j4QTHg69dGi6GRqr/9rBeBfIaf8RzOgt1yRTEB+bA+Boz37zOvPVxSCZvAQeTma
         2MM7ZhvxYcC1Jzc4Ssgs5EhEOUfdJ0sK9/U4e4kYt9OoYz5O+a4/H/NP0BGiJca/8g
         9h1PeQarvjTI9HE/x3u9GKkQQ2ZVwsqaTMAfeNDM=
Date:   Thu, 6 May 2021 19:06:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 23/25] media: vsp1: use pm_runtime_resume_and_get()
Message-ID: <YJQT9hXnGn5hrjQA@pendragon.ideasonboard.com>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <8e8ca03fd0dfa1b3245c0ff0201f3cf9a522ede2.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e8ca03fd0dfa1b3245c0ff0201f3cf9a522ede2.1620314616.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Thu, May 06, 2021 at 05:26:01PM +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> As a bonus, pm_runtime_resume_and_get() always return 0 on success.
> So, the code can be simplified.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/vsp1/vsp1_drv.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index aa66e4f5f3f3..de442d6c9926 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -559,15 +559,7 @@ static int vsp1_device_init(struct vsp1_device *vsp1)
>   */
>  int vsp1_device_get(struct vsp1_device *vsp1)
>  {
> -	int ret;
> -
> -	ret = pm_runtime_get_sync(vsp1->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(vsp1->dev);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return pm_runtime_resume_and_get(vsp1->dev);
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart
