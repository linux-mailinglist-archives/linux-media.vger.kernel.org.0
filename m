Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2232F41BBFE
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 02:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243501AbhI2BAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 21:00:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:20191 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242636AbhI2BAZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 21:00:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="204322693"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="204322693"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 17:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; 
   d="scan'208";a="519517143"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2021 17:58:43 -0700
Subject: Re: [PATCH 4/7] media: ipu3-cio2: VIDIOC_QUERYCAP: Fix bus_info
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
References: <20210928211033.2415162-1-ribalda@chromium.org>
 <20210928211033.2415162-5-ribalda@chromium.org>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <0afce6fa-068d-2b66-e394-d9398e99069b@linux.intel.com>
Date:   Wed, 29 Sep 2021 08:55:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210928211033.2415162-5-ribalda@chromium.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Besides the subject,

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 9/29/21 5:10 AM, Ricardo Ribalda wrote:
> bus_info field had a different value for the media entity and the video
> device.
> 
> Fixes v4l2-compliance:
> 
> v4l2-compliance.cpp(637): media bus_info 'PCI:0000:00:05.0' differs from
> 			  V4L2 bus_info 'PCI:viewfinder'
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 66995c6f15808..2594ac4eb0763 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -592,11 +592,12 @@ static const struct imgu_fmt *find_format(struct v4l2_format *f, u32 type)
>  static int imgu_vidioc_querycap(struct file *file, void *fh,
>  				struct v4l2_capability *cap)
>  {
> -	struct imgu_video_device *node = file_to_intel_imgu_node(file);
> +	struct imgu_device *imgu = video_drvdata(file);
>  
>  	strscpy(cap->driver, IMGU_NAME, sizeof(cap->driver));
>  	strscpy(cap->card, IMGU_NAME, sizeof(cap->card));
> -	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", node->name);
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
> +		 pci_name(imgu->pci_dev));
>  
>  	return 0;
>  }
> 

-- 
Best regards,
Bingbu Cao
