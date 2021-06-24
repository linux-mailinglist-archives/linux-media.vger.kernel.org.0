Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5437A3B2B00
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 11:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhFXJGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 05:06:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:33521 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231350AbhFXJF7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 05:05:59 -0400
IronPort-SDR: /A05oRYfUCpMz5wIYMJEjN6F+NsGcKOm+FnWG7X+RJryyGLjxW4aVRMc+/8PgcnvGqFALDnrsk
 3WPXaKdfDjgA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="187118772"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="187118772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 02:03:29 -0700
IronPort-SDR: 9sgqSddcUApgXSDBIBuHa5IupkRdAekgMzrMhq0yI7+6jybo1JcX141ZHzVvlBihWe5kJR9YA2
 cRl5j2wBkRgQ==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; 
   d="scan'208";a="406579431"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 02:03:26 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9C8482036A;
        Thu, 24 Jun 2021 12:03:24 +0300 (EEST)
Date:   Thu, 24 Jun 2021 12:03:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Yizhuo <yzhai003@ucr.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: fix the uninitialized use and rename
 "retvalue"
Message-ID: <20210624090324.GL3@paasikivi.fi.intel.com>
References: <20210624031719.11157-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624031719.11157-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 03:17:17AM +0000, Yizhuo wrote:
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
> 
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index f5de81132177..b02a8cd3dde7 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1533,16 +1533,20 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
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
> +	ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> +			       (u32)MT9M114_PID, &model);

Thanks for the update.

The cast seems to be there still.

> +	if (ret)
> +		return ret;
> +	dev->real_model_id = model;
>  
> -	if (retvalue != MT9M114_MOD_ID) {
> +	if (model != MT9M114_MOD_ID) {
>  		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
>  			__func__, client->addr);
>  		return -ENODEV;

-- 
Sakari Ailus
