Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1B0366D89
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 16:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243212AbhDUOEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 10:04:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:14749 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235783AbhDUOEs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 10:04:48 -0400
IronPort-SDR: Y9ElL9LI/WPi7QOWdcMswWsPnF7nrCZjwQB7c1D/wkdxMmcxLW5zmcZVUD4nO80z6GkNCUsatZ
 KWen4OvICvBw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="281031548"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; 
   d="scan'208";a="281031548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 07:04:15 -0700
IronPort-SDR: ndnxDe7bmDHqRhztwyrCVG/gjitqYUNQ5AfrcIqvlQ1jxq09Q/5ArXvUW+B+TRWMytNyrS+zA9
 W4DtNwx9A4Rg==
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; 
   d="scan'208";a="384457339"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 07:04:12 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BB534202EC;
        Wed, 21 Apr 2021 17:03:40 +0300 (EEST)
Date:   Wed, 21 Apr 2021 17:03:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Fix referece counting when
 looping over ACPI devices
Message-ID: <20210421140340.GD3@paasikivi.fi.intel.com>
References: <20210404181409.1451026-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210404181409.1451026-1-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thanks for the patch.

On Sun, Apr 04, 2021 at 09:14:09PM +0300, Andy Shevchenko wrote:
> When we continue, due to device is disabled, loop we have to drop reference count.
> When we have an array full of devices we have to also drop the reference count.
> Note, in this case the cio2_bridge_unregister_sensors() is called by the caller.

Please limit the commit message to 75 chars, at least if there's no reason
to do otherwise.

I can wrap it this time.

> 
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Cc: Daniel Scally <djrscally@gmail.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index c2199042d3db..85f8b587405e 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -173,14 +173,15 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  	int ret;
>  
>  	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> -		if (!adev->status.enabled)
> +		if (!adev->status.enabled) {
> +			acpi_dev_put(adev);
>  			continue;
> +		}
>  
>  		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
> +			acpi_dev_put(adev);
>  			dev_err(&cio2->dev, "Exceeded available CIO2 ports\n");
> -			cio2_bridge_unregister_sensors(bridge);
> -			ret = -EINVAL;
> -			goto err_out;
> +			return -EINVAL;
>  		}
>  
>  		sensor = &bridge->sensors[bridge->n_sensors];
> @@ -228,7 +229,6 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  	software_node_unregister_nodes(sensor->swnodes);
>  err_put_adev:
>  	acpi_dev_put(sensor->adev);
> -err_out:
>  	return ret;
>  }
>  

-- 
Regards,

Sakari Ailus
