Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D628FF72
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 11:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbfHPJvB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 05:51:01 -0400
Received: from mga05.intel.com ([192.55.52.43]:51947 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbfHPJvB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 05:51:01 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 02:51:00 -0700
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="261071642"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 02:50:58 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2AB7220435; Fri, 16 Aug 2019 12:49:54 +0300 (EEST)
Date:   Fri, 16 Aug 2019 12:49:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] media: mc-device.c: fix memleak in
 media_device_register_entity
Message-ID: <20190816094954.GV6133@paasikivi.fi.intel.com>
References: <1565926382-91620-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565926382-91620-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Zhenbin,

On Fri, Aug 16, 2019 at 11:33:02AM +0800, zhengbin wrote:
> In media_device_register_entity, if media_graph_walk_init fails,
> need to free the previously memory.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/media/mc/mc-device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index e19df51..939be00 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -632,6 +632,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
>  		 */
>  		ret = media_graph_walk_init(&new, mdev);
>  		if (ret) {
> +			__media_device_unregister_entity(entity);
>  			mutex_unlock(&mdev->graph_mutex);
>  			return ret;
>  		}

This does not compile; the function is defined after it's used here.

Could you move the function definition up, just above this function,
please?

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
