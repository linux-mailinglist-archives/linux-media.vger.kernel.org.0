Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE6983E9EEA
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 08:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbhHLGwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 02:52:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:53881 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234674AbhHLGw3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 02:52:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="202479372"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="202479372"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 23:52:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="460978749"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 23:52:02 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7F182203D0;
        Thu, 12 Aug 2021 09:52:00 +0300 (EEST)
Date:   Thu, 12 Aug 2021 09:52:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename
 "retvalue"
Message-ID: <20210812065200.GQ3@paasikivi.fi.intel.com>
References: <20210723003607.64179-1-yzhai003@ucr.edu>
 <20210812055421.44450-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812055421.44450-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 11, 2021 at 10:54:17PM -0700, Yizhuo Zhai wrote:
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
> 
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Yizhuo Zhai<yzhai003@ucr.edu>

There should be a space before '<'.

Apart from this the patch seems fine.

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

-- 
Regards,

Sakari Ailus
