Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B30A3A3FB3
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 12:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhFKKB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 06:01:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:65434 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230356AbhFKKB4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 06:01:56 -0400
IronPort-SDR: KbRBw84QMUkbJlsQOWUK4xLdEtHqN43el7zBfvTAiiwAwTsLOuwPEYMoaJLscMLKTciJL/gODL
 JJWGyy4D4PGg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185872338"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="185872338"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:59:58 -0700
IronPort-SDR: fkhDfSlQ9vKy2UjFBMV6u4V7kKolzSzvRQ9J+MTp+VU583mEzKSoxIs4kcnXIGdjuJeL0KWhkK
 OhtlES0XpWyA==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="552649386"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:59:55 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lrdxA-001TlT-E8; Fri, 11 Jun 2021 12:59:52 +0300
Date:   Fri, 11 Jun 2021 12:59:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Baokun Li <libaokun1@huawei.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, kaixuxia@tencent.com,
        gustavoars@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next v3] media: staging: atomisp: use list_splice_init
 in atomisp_compat_css20.c
Message-ID: <YMM0GO4Ny6j/FvQV@smile.fi.intel.com>
References: <20210611081004.1348026-1-libaokun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611081004.1348026-1-libaokun1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 11, 2021 at 04:10:04PM +0800, Baokun Li wrote:
> Using list_splice_init() instead of entire while-loops
> in atomisp_compat_css20.c.

Seems fine to me.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
> V1->V2:
> 	CC mailist
> V2->V3:
>         Using list_move_tail() -> Using list_splice_init()
> 
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 35 +++----------------
>  1 file changed, 5 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index f60198bb8a1a..3844180d32b5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -2144,42 +2144,17 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
>  	}
>  
>  	/* move stats buffers to free queue list */
> -	while (!list_empty(&asd->s3a_stats_in_css)) {
> -		s3a_buf = list_entry(asd->s3a_stats_in_css.next,
> -				     struct atomisp_s3a_buf, list);
> -		list_del(&s3a_buf->list);
> -		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
> -	}
> -	while (!list_empty(&asd->s3a_stats_ready)) {
> -		s3a_buf = list_entry(asd->s3a_stats_ready.next,
> -				     struct atomisp_s3a_buf, list);
> -		list_del(&s3a_buf->list);
> -		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
> -	}
> +	list_splice_init(&asd->s3a_stats_in_css, &asd->s3a_stats);
> +	list_splice_init(&asd->s3a_stats_ready, &asd->s3a_stats);
>  
>  	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
> -	while (!list_empty(&asd->dis_stats_in_css)) {
> -		dis_buf = list_entry(asd->dis_stats_in_css.next,
> -				     struct atomisp_dis_buf, list);
> -		list_del(&dis_buf->list);
> -		list_add_tail(&dis_buf->list, &asd->dis_stats);
> -	}
> +	list_splice_init(&asd->dis_stats_in_css, &asd->dis_stats);
>  	asd->params.dis_proj_data_valid = false;
>  	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
>  
>  	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
> -		while (!list_empty(&asd->metadata_in_css[i])) {
> -			md_buf = list_entry(asd->metadata_in_css[i].next,
> -					    struct atomisp_metadata_buf, list);
> -			list_del(&md_buf->list);
> -			list_add_tail(&md_buf->list, &asd->metadata[i]);
> -		}
> -		while (!list_empty(&asd->metadata_ready[i])) {
> -			md_buf = list_entry(asd->metadata_ready[i].next,
> -					    struct atomisp_metadata_buf, list);
> -			list_del(&md_buf->list);
> -			list_add_tail(&md_buf->list, &asd->metadata[i]);
> -		}
> +		list_splice_init(&asd->metadata_in_css[i], &asd->asd->metadata[i]);
> +		list_splice_init(&asd->metadata_ready[i], &asd->asd->metadata[i]);
>  	}
>  
>  	atomisp_flush_params_queue(&asd->video_out_capture);
> -- 
> 2.31.1
> 

-- 
With Best Regards,
Andy Shevchenko


