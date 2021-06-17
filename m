Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC603AB5BF
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 16:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhFQOYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 10:24:16 -0400
Received: from mga04.intel.com ([192.55.52.120]:20346 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231654AbhFQOYP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 10:24:15 -0400
IronPort-SDR: WisNd1PIitRBTMCJQmObwy3Ra5XgsFfbim3/nf1aHbZm0v2wUiQKhE6A28HGRwhbC4OmqN/W1p
 hTdTW22U1Hkw==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="204549763"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="204549763"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 07:22:07 -0700
IronPort-SDR: Z4HIb70qCwinYy0ChMzIEgOI8sKy5FPd2zHPeL8lBe989yjckX8dIR9kXqHbRd/cTrh5SLbGy2
 8pIe+Mh1c9gg==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="452794702"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 07:22:04 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ltsu9-003Mad-8G; Thu, 17 Jun 2021 17:22:01 +0300
Date:   Thu, 17 Jun 2021 17:22:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Baokun Li <libaokun1@huawei.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, kaixuxia@tencent.com,
        gustavoars@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next v6] media: staging: atomisp: use list_splice_init
 in atomisp_compat_css20.c
Message-ID: <YMtaidhBu25wxwv3@smile.fi.intel.com>
References: <20210617140926.887680-1-libaokun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617140926.887680-1-libaokun1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 10:09:26PM +0800, Baokun Li wrote:
> 
> Using list_splice_init() instead of entire while-loops
> in atomisp_compat_css20.c.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
> V1->V2:
>         CC mailist
> V2->V3:
>         Using list_move_tail() -> Using list_splice_init()
> V3->V4:
>         Remove redundant 'asd->'
> V4->V5:
>         Add the version information for 'V3->V4:'
> V5->V6:
>         Remove unused variable 'md_buf','dis_buf','s3a_buf'
> 
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 38 +++----------------
>  1 file changed, 5 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index f60198bb8a1a..99a632f33d2d 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -2102,9 +2102,6 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
>  		      enum ia_css_pipe_id pipe_id, bool in_reset)
>  {
>  	struct atomisp_device *isp = asd->isp;
> -	struct atomisp_s3a_buf *s3a_buf;
> -	struct atomisp_dis_buf *dis_buf;
> -	struct atomisp_metadata_buf *md_buf;
>  	unsigned long irqflags;
>  	unsigned int i;
>  
> @@ -2144,42 +2141,17 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
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
> +		list_splice_init(&asd->metadata_in_css[i], &asd->metadata[i]);
> +		list_splice_init(&asd->metadata_ready[i], &asd->metadata[i]);
>  	}
>  
>  	atomisp_flush_params_queue(&asd->video_out_capture);
> -- 
> 2.31.1
> 

-- 
With Best Regards,
Andy Shevchenko


