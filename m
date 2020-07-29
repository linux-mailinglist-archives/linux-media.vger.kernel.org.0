Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D98231D08
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 12:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgG2K4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 06:56:25 -0400
Received: from mga06.intel.com ([134.134.136.31]:5584 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgG2K4Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 06:56:25 -0400
IronPort-SDR: d13jFLxjaok9/IQ9hCAakS6afA8t2m5eGBfIGkawF0sksBIJM7i/xh2l3tjN5RApViH6S+7ert
 2SeQC+LwvGxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="212926020"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="212926020"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 03:56:24 -0700
IronPort-SDR: 0OJc/INDGFmSYxN1EL1Ten7Yk3g2nO9Bl6Gat51K6ZP7fMN2KFK/IJt4uTW4zF+1R9KfwBh/IS
 vNDG7rgOipYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="328622767"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2020 03:56:22 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k0jl0-004fwh-L4; Wed, 29 Jul 2020 13:56:22 +0300
Date:   Wed, 29 Jul 2020 13:56:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ankit Baluni <b18007@students.iitmandi.ac.in>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Staging: media: atomisp: fixed a brace coding sytle
 issue
Message-ID: <20200729105622.GU3703480@smile.fi.intel.com>
References: <20200728225935.28880-1-b18007@students.iitmandi.ac.in>
 <20200729074950.2104-1-b18007@students.iitmandi.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729074950.2104-1-b18007@students.iitmandi.ac.in>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 29, 2020 at 01:19:50PM +0530, Ankit Baluni wrote:
> Removed braces for a 'if' condition as it contain only single line & 
> there is no need for braces for such case according to coding style
> rules.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Ankit Baluni <b18007@students.iitmandi.ac.in>
> 
> ---
> Changes in v2:
> 	-Added more description about the patch.
> 	-Added space before the symobol '<' in 'From'
> 	 and 'Signed-off-by' line.
> Changes in v3:
> 	-Removed space before ':' in subject line.
> 
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 8ea65bef35d2..28b96b66f4f3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -4981,9 +4981,8 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
>  	case ATOMISP_CAMERA_PORT_SECONDARY:
>  		return MIPI_PORT1_ID;
>  	case ATOMISP_CAMERA_PORT_TERTIARY:
> -		if (MIPI_PORT1_ID + 1 != N_MIPI_PORT_ID) {
> +		if (MIPI_PORT1_ID + 1 != N_MIPI_PORT_ID)
>  			return MIPI_PORT1_ID + 1;
> -		}
>  	/* fall through */
>  	default:
>  		dev_err(isp->dev, "unsupported port: %d\n", port);
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


