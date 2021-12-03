Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE97E467445
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 10:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379648AbhLCJsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 04:48:12 -0500
Received: from mga03.intel.com ([134.134.136.65]:57888 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1379642AbhLCJsL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Dec 2021 04:48:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="236886214"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; 
   d="scan'208";a="236886214"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 01:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; 
   d="scan'208";a="655897030"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by fmsmga001.fm.intel.com with SMTP; 03 Dec 2021 01:42:07 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 03 Dec 2021 11:42:06 +0200
Date:   Fri, 3 Dec 2021 11:42:06 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Felix.Kuehling@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] drm/amdkfd: Use max() instead of doing it manually
Message-ID: <YanmbhwDrdpu+Zup@intel.com>
References: <1638523913-117827-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1638523913-117827-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 03, 2021 at 05:31:53PM +0800, Jiapeng Chong wrote:
> Fix following coccicheck warning:
> 
> ./drivers/gpu/drm/amd/amdkfd/kfd_svm.c:2193:16-17: WARNING opportunity
> for max().
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index f2db49c..4f7e7b1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -2190,7 +2190,7 @@ void schedule_deferred_list_work(struct svm_range_list *svms)
>  
>  	start = mni->interval_tree.start;
>  	last = mni->interval_tree.last;
> -	start = (start > range->start ? start : range->start) >> PAGE_SHIFT;
> +	start = max(start, range->start) >> PAGE_SHIFT;
>  	last = (last < (range->end - 1) ? last : range->end - 1) >> PAGE_SHIFT;

There's an open coded min() on the very next line.

>  	pr_debug("[0x%lx 0x%lx] range[0x%lx 0x%lx] notifier[0x%lx 0x%lx] %d\n",
>  		 start, last, range->start >> PAGE_SHIFT,
> -- 
> 1.8.3.1

-- 
Ville Syrj�l�
Intel
