Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDEA36A8EE
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 20:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbhDYS4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 14:56:10 -0400
Received: from mga14.intel.com ([192.55.52.115]:25400 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230459AbhDYS4J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 14:56:09 -0400
IronPort-SDR: /A72ZgTv7oKfiJMvlTetN7aFIcQC+CZqPlXDigUB/sBsNocjNk0RTtuhfmbxuDTTp9JrLJskcF
 yBM1KWtv68dg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195803638"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="195803638"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 11:55:29 -0700
IronPort-SDR: AE9p1Ic5nMixp9EPLrlcyx4lgT3dvSCeK9uEJ7DCqX2pf7XZ07YVp7wItyd21TBC5iOYBy6txQ
 JrJ9asEj7lGQ==
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="464855304"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 11:55:27 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E841A20207;
        Sun, 25 Apr 2021 21:55:25 +0300 (EEST)
Date:   Sun, 25 Apr 2021 21:55:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/78] media: i2c: ccs-core: use
 pm_runtime_resume_and_get()
Message-ID: <20210425185525.GS3@paasikivi.fi.intel.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <34da940f76da6c1d61a193409164070f47243b64.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34da940f76da6c1d61a193409164070f47243b64.1619191723.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the patch.

On Sat, Apr 24, 2021 at 08:44:35AM +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 9dc3f45da3dc..1441ddcc9b35 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1880,12 +1880,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>  	int rval;
>  
> -	rval = pm_runtime_get_sync(&client->dev);
> -	if (rval < 0) {
> -		pm_runtime_put_noidle(&client->dev);
> -
> +	rval = pm_runtime_resume_and_get(&client->dev);
> +	if (rval < 0)
>  		return rval;
> -	} else if (!rval) {
> +
> +	if (!rval) {
>  		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
>  					       ctrl_handler);
>  		if (rval)
> @@ -3089,7 +3088,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
>  	bool streaming = sensor->streaming;
>  	int rval;
>  
> -	rval = pm_runtime_get_sync(dev);
> +	rval = pm_runtime_resume_and_get(dev);
>  	if (rval < 0) {
>  		pm_runtime_put_noidle(dev);

You'll need to drop pm_runtime_put_noidle() here.

-- 
Regards,

Sakari Ailus
