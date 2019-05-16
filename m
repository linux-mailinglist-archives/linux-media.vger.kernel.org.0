Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6912048A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfEPLVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:21:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfEPLVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:21:45 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F7462FD;
        Thu, 16 May 2019 13:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558005703;
        bh=Od9FJhOCAF6iWV0Sudo2Dd31NOffbbeZHA5QWn6iBLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UhxHcJHS3SHnGvEF9YiMoSLkUJGu5z6K52yaP6vGPEHTgX84RMStPcGuCNKPtJ0Yq
         lgNoL6XlVAg/xELWUXoHSuc081PGmKBKkcoIv/xkh108wRcXdvQupTRvLbozSn6Dzp
         1E3yK4jFcIfK+PIZmvKANoWJOB57QUc8zFAl8s3c=
Date:   Thu, 16 May 2019 14:21:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 3/8] rcar-vin: Allow interrupting lock when trying to
 open the video device
Message-ID: <20190516112127.GA14820@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516011417.10590-4-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 03:14:12AM +0200, Niklas Söderlund wrote:
> The user should be allowed to break waiting for the lock when opening
> the video device.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0841f1a0bfd7ba3a..f67cef97b89a3bd4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -821,7 +821,9 @@ static int rvin_open(struct file *file)
>  	struct rvin_dev *vin = video_drvdata(file);
>  	int ret;
>  
> -	mutex_lock(&vin->lock);
> +	ret = mutex_lock_interruptible(&vin->lock);
> +	if (ret)
> +		return ret;
>  
>  	file->private_data = vin;
>  

-- 
Regards,

Laurent Pinchart
