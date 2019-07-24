Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5513072C58
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 12:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfGXKa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 06:30:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:13272 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbfGXKa2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 06:30:28 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jul 2019 03:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,302,1559545200"; 
   d="scan'208";a="172260139"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003.jf.intel.com with ESMTP; 24 Jul 2019 03:30:25 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3BBF122217; Wed, 24 Jul 2019 13:30:28 +0300 (EEST)
Date:   Wed, 24 Jul 2019 13:30:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, yong.zhi@intel.com,
        digetx@gmail.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] media: staging: ipu3: Enable IOVA API only when IOMMU
 support is enabled
Message-ID: <20190724103027.GD21370@paasikivi.fi.intel.com>
References: <20190722134749.21580-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722134749.21580-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yue,

On Mon, Jul 22, 2019 at 09:47:49PM +0800, YueHaibing wrote:
> If IOMMU_SUPPORT is not set, ipu3 driver may select IOMMU_IOVA to m.
> But for many drivers, they use "select IOMMU_IOVA if IOMMU_SUPPORT"
> in the Kconfig, for example, CONFIG_TEGRA_VDE is set to y but IOMMU_IOVA
> is m, then the building fails like this:
> 
> drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
> iommu.c:(.text+0x41): undefined reference to `alloc_iova'
> iommu.c:(.text+0x56): undefined reference to `__free_iova'
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/ipu3/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
> index 4b51c67..b7df18f 100644
> --- a/drivers/staging/media/ipu3/Kconfig
> +++ b/drivers/staging/media/ipu3/Kconfig
> @@ -4,7 +4,7 @@ config VIDEO_IPU3_IMGU
>  	depends on PCI && VIDEO_V4L2
>  	depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
>  	depends on X86
> -	select IOMMU_IOVA
> +	select IOMMU_IOVA if IOMMU_SUPPORT

This doesn't seem right: the ipu3-cio2 driver needs IOMMU_IOVA
independently of IOMMU_SUPPORT.

Looking at tegra-vde, it seems to depend on IOMMU_SUPPORT but that's not
declared in its Kconfig entry. I wonder if adding that would be the right
way to fix this.

Cc'ing the IOMMU list.

>  	select VIDEOBUF2_DMA_SG
>  	help
>  	  This is the Video4Linux2 driver for Intel IPU3 image processing unit,

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
