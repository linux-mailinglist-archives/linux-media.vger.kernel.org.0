Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B4E3E9FB6
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 09:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234118AbhHLHqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 03:46:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:52460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231502AbhHLHqo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 03:46:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 501E460FC4;
        Thu, 12 Aug 2021 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628754379;
        bh=Ls1zKRbLvgNPQeKi4jwnzfArAicQtndjRZOspd/gn2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2fz4GAWTgKvdrUnkYDroRXFUgOM810yxdKzhuakSI1VJDdKZcH1R54wUaVtVeaXOS
         7CLWQn0/jpWHGTKh3612PVOiWRmPprGBr4JgkvpUb0iiRJJkgjyqla0p1wulFUZE25
         4AgbQUtz1udJDgI7coxO5NyF/qIk4gwKmRHazaDY=
Date:   Thu, 12 Aug 2021 09:46:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename
 "retvalue"
Message-ID: <YRTRyEmXgBB5HxlU@kroah.com>
References: <20210723003607.64179-1-yzhai003@ucr.edu>
 <20210812073447.127193-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812073447.127193-1-yzhai003@ucr.edu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 12, 2021 at 12:34:46AM -0700, Yizhuo Zhai wrote:
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
> 
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index f5de81132177..77293579a134 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
>  static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
> -	u32 retvalue;
> +	u32 model;
> +	int ret;
>  
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
>  		dev_err(&client->dev, "%s: i2c error", __func__);
>  		return -ENODEV;
>  	}
> -	mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
> -	dev->real_model_id = retvalue;
> +	ret = mt9m114_read_reg(client, MISENSOR_16BIT, MT9M114_PID, &model);
> +	if (ret)
> +		return ret;
> +	dev->real_model_id = model;
>  
> -	if (retvalue != MT9M114_MOD_ID) {
> +	if (model != MT9M114_MOD_ID) {
>  		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
>  			__func__, client->addr);
>  		return -ENODEV;
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
