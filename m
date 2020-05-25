Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BA41E0878
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 10:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388487AbgEYIJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 04:09:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:13792 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387941AbgEYIJH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 04:09:07 -0400
IronPort-SDR: H6TxFAeeQmasdR6rHp6+dFFwDDNS0xKAWftkmWr+Yz/dvQVorhTa/EFjIbDReSevTXV2RJQYXy
 PB4vlJvOTm6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 01:09:06 -0700
IronPort-SDR: 2GxOdfOXTb/+beTG0TdxwA4u82GnnXD2FJKjLqz8AyaRik+2lRMnoP5XOU/iowG1F7sBWaKmQT
 YcSLip9as2CA==
X-IronPort-AV: E=Sophos;i="5.73,432,1583222400"; 
   d="scan'208";a="284068677"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 01:09:04 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D5C3920953; Mon, 25 May 2020 11:09:02 +0300 (EEST)
Date:   Mon, 25 May 2020 11:09:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: smiapp: Fix runtime PM imbalance on error
Message-ID: <20200525080902.GC7618@paasikivi.fi.intel.com>
References: <20200522090313.10634-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522090313.10634-1-dinghao.liu@zju.edu.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

Thanks for the patch.

On Fri, May 22, 2020 at 05:03:13PM +0800, Dinghao Liu wrote:
> When v4l2_async_register_subdev_sensor_common() returns
> an error code, a pairing runtime PM usage counter
> decrement is needed to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/i2c/smiapp/smiapp-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
> index 5e4f6a2ef78e..43ba63c48a87 100644
> --- a/drivers/media/i2c/smiapp/smiapp-core.c
> +++ b/drivers/media/i2c/smiapp/smiapp-core.c
> @@ -3103,6 +3103,7 @@ static int smiapp_probe(struct i2c_client *client)
>  	return 0;
>  
>  out_disable_runtime_pm:
> +	pm_runtime_put_autosuspend(&client->dev);

Can you use pm_runtime_put_noidle(), as the device musn't be powered off
here yet?

>  	pm_runtime_disable(&client->dev);
>  
>  out_media_entity_cleanup:

-- 
Regards,

Sakari Ailus
