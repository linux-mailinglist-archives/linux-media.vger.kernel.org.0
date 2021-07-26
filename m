Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335B83D58B4
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 13:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbhGZLEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 07:04:13 -0400
Received: from mga06.intel.com ([134.134.136.31]:33773 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233632AbhGZLEL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 07:04:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="273302481"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="273302481"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 04:44:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="661822881"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 04:44:35 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 86BCE205CF;
        Mon, 26 Jul 2021 14:44:33 +0300 (EEST)
Date:   Mon, 26 Jul 2021 14:44:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Drop reference on error path in
 cio2_bridge_connect_sensor()
Message-ID: <20210726114433.GB3@paasikivi.fi.intel.com>
References: <20210726084055.54887-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726084055.54887-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Jul 26, 2021 at 11:40:55AM +0300, Andy Shevchenko wrote:
> The commit 71f642833284 ("ACPI: utils: Fix reference counting in
> for_each_acpi_dev_match()") moved adev assignment outside of error
> path and hence made acpi_dev_put(sensor->adev) a no-op. We still
> need to drop reference count on error path, and to achieve that,
> replace sensor->adev by locally assigned adev.
> 
> Fixes: 71f642833284 ("ACPI: utils: Fix reference counting in for_each_acpi_dev_match()")
> Depends-on: fc68f42aa737 ("ACPI: fix NULL pointer dereference")
> Reported-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index 59a36f922675..30d29b96a339 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -226,7 +226,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  err_free_swnodes:
>  	software_node_unregister_nodes(sensor->swnodes);
>  err_put_adev:
> -	acpi_dev_put(sensor->adev);
> +	acpi_dev_put(adev);

adev is assigned to sensor->adev before goto so the two have the same
value. I have no problem with the patch though.

>  	return ret;
>  }
>  

-- 
Regards,

Sakari Ailus
