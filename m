Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10EA238ED4B
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 17:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbhEXPgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 11:36:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:54402 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233814AbhEXPe3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 11:34:29 -0400
IronPort-SDR: /1BIbrrwFpPpbPHvt1rDyST/VdO1IH37rQDsd8GZ6O/WK90ydFMU+7woMbg9eMg4U9bkN4D+W5
 AFcx4mqtulXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="202002891"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="202002891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:32:52 -0700
IronPort-SDR: TSVuQCCO5bDPRFhHJiq8iyGKubH2rl6VexUUuLqrub78lkVQiJ7iAfQdGmkUIOjaMn0STbV+rf
 9dKksCxla/3w==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="396432635"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:32:50 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8095B202F7;
        Mon, 24 May 2021 18:32:47 +0300 (EEST)
Date:   Mon, 24 May 2021 18:32:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     trix@redhat.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, drv@mailo.com,
        martinsdecarvalhobeatriz@gmail.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: atomisp: improve error handling in
 gc2235_detect()
Message-ID: <20210524153247.GQ3@paasikivi.fi.intel.com>
References: <20210521194805.2078135-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521194805.2078135-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tom,

On Fri, May 21, 2021 at 12:48:05PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Static analysis reports this representative problem
> 
> atomisp-gc2235.c:867:20: warning: The right operand
>   of '|' is a garbage value
>         id = ((high << 8) | low);
>                           ^ ~~~
> When gc2235_read_reg() fails, its return val is never written.
> 
> For gc2235_detect(), high and low are or-ed and compared
> with GC2235_ID, 0x2235.  Initialize both to 0 and skip
> checking the read returns, it's errors are not passed up, only
> -ENODEV is.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 38defa0f81513..3b6e02b1f45d1 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -849,21 +849,14 @@ static int gc2235_get_fmt(struct v4l2_subdev *sd,
>  static int gc2235_detect(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
> -	u16 high, low;
> -	int ret;
> +	u16 high = 0, low = 0;
>  	u16 id;
>  
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
>  		return -ENODEV;
>  
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_SENSOR_ID_H, &high);
> -	if (ret) {
> -		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
> -		return -ENODEV;

It'd be nice if the function returned a different value for different
errors, such as there was an I/O error and that the ID was wrong.

> -	}
> -	ret = gc2235_read_reg(client, GC2235_8BIT,
> -			      GC2235_SENSOR_ID_L, &low);
> +	gc2235_read_reg(client, GC2235_8BIT, GC2235_SENSOR_ID_H, &high);
> +	gc2235_read_reg(client, GC2235_8BIT, GC2235_SENSOR_ID_L, &low);
>  	id = ((high << 8) | low);
>  
>  	if (id != GC2235_ID) {

-- 
Sakari Ailus
