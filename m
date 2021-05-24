Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0D738ECE8
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 17:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhEXP34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 11:29:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:19527 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233248AbhEXP2q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 11:28:46 -0400
IronPort-SDR: XAn0+swvaFSEAPMAOYHL6WulA9KJCBAVIS6fehEQXSpAp3S5WULj8cqAjbK9zUnIKfvhrpx3cP
 Z/915Akv7bcA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="263167250"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="263167250"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:20:11 -0700
IronPort-SDR: MTXWHNUS1eOhtux62LcHRMDTm+O85OyDlcwpVn9Okhx3jPy5blyG8iFzfqmQhsOCblg5hq8A8C
 XH42Y2qv3qqg==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="407826169"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:20:09 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D0776204C0;
        Mon, 24 May 2021 18:20:06 +0300 (EEST)
Date:   Mon, 24 May 2021 18:20:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Aniket Bhattacharyea <aniketmail669@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Replace whitespace at the beginning of
 line
Message-ID: <20210524152006.GP3@paasikivi.fi.intel.com>
References: <20210520155013.929465-1-aniketmail669@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520155013.929465-1-aniketmail669@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aniket,

On Thu, May 20, 2021 at 09:20:13PM +0530, Aniket Bhattacharyea wrote:
> This patch replaces the whitespaces at the beginning of line with tabs.
> Identified by checkpatch: WARNING: please, no spaces at the start of a line.
> 
> Signed-off-by: Aniket Bhattacharyea <aniketmail669@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 135994d44802..93ac7e183344 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1041,9 +1041,9 @@ static struct camera_sensor_platform_data acpi_gmin_plat = {
>  };
>  
>  struct camera_sensor_platform_data *gmin_camera_platform_data(
> -    struct v4l2_subdev *subdev,
> -    enum atomisp_input_format csi_format,
> -    enum atomisp_bayer_order csi_bayer)
> +	struct v4l2_subdev *subdev,
> +	enum atomisp_input_format csi_format,
> +	enum atomisp_bayer_order csi_bayer)

Please wrap instead after the type if the type and name are too long.

I.e.

struct camera_sensor_platform_data *
gmin_camera_platform_data(...,
			  ...);

>  {
>  	u8 pmic_i2c_addr = gmin_detect_pmic(subdev);
>  	struct gmin_subdev *gs;

-- 
Regards,

Sakari Ailus
