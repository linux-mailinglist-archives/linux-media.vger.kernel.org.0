Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1543A35C2F3
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242121AbhDLJx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:53:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:51446 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242423AbhDLJuF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:05 -0400
IronPort-SDR: nds5RXqROVOzLU50EWfki5pn13K1RPH+EX4fMsusPxrD6MKKOMyDdikjAN4B6hL0ZnCfECE65X
 Np3bZx6l04hA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193716847"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="193716847"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:49:45 -0700
IronPort-SDR: /uH/qozKRs83kwg3Fusf37qVxeq+FBgDrIn9DfqqIgVcbBOWGdhg6qm/fx4UFMkTlQhm0ysKKu
 /kfDSS/Il+Bw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="442996816"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:49:43 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6B95C205AA;
        Mon, 12 Apr 2021 12:49:41 +0300 (EEST)
Date:   Mon, 12 Apr 2021 12:49:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 5/6] staging: media: intel-ipu3: line should not end with
 '['
Message-ID: <20210412094941.GK3@paasikivi.fi.intel.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <7514b0a9f6b0ce736de3c9d13ae2629d9e67f04c.1618180660.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7514b0a9f6b0ce736de3c9d13ae2629d9e67f04c.1618180660.git.mitaliborkar810@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mitali,

On Mon, Apr 12, 2021 at 04:39:58AM +0530, Mitali Borkar wrote:
> Fixed the issue of line should not end with '[' by moving arguments
> from next line to line ending with '['
> Reported by checkpatch.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index 53f8e5dec8f5..0451f8b7ba4f 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -246,8 +246,7 @@ struct ipu3_uapi_ae_ccm {
>   */
>  struct ipu3_uapi_ae_config {
>  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> -	struct ipu3_uapi_ae_weight_elem weights[
> -			IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);

Could you still wrap it to stay under 80?

>  	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
>  } __packed;
>  

-- 
Sakari Ailus
