Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D902AD56B
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 12:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgKJLio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 06:38:44 -0500
Received: from mga06.intel.com ([134.134.136.31]:2337 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKJLik (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 06:38:40 -0500
IronPort-SDR: xLyspo5re72F2ZxP9HTy7n2eF/ml8qg6YWBqQWO7TRp5prrK1tVqG7rpaYwRvlGJs6JjnOqgTc
 83ZLxqznBkpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="231586296"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="231586296"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 03:38:39 -0800
IronPort-SDR: HnswfLIrREsNx34ZWwDOva4Q7533ZlE9+MSbgcAyMQM0Cxtf2N5dybHOfjJ5aLK88h0zejpHfT
 oD/zZgSH6BKg==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="398632057"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 03:38:37 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D689620867; Tue, 10 Nov 2020 13:38:35 +0200 (EET)
Date:   Tue, 10 Nov 2020 13:38:35 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        senozhatsky@chromium.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com
Subject: Re: [PATCH v2 1/2] media: ov2740: only do OTP data read on demand
 from user
Message-ID: <20201110113835.GU26150@paasikivi.fi.intel.com>
References: <1604907581-2808-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604907581-2808-1-git-send-email-bingbu.cao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Mon, Nov 09, 2020 at 03:39:40PM +0800, Bingbu Cao wrote:
> OTP data access of ov2740 in probe need power up, it may cause
> the camera flash LED blink during probe if the LED use same power
> rail with camera, this patch move the OTP data access out of
> probe, it will only occur on demand from user by nvmem sysfs.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 87 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 66 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 64ecb6917dd3..4bb4fe4bcab6 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -71,9 +71,11 @@
>  #define OV2740_REG_OTP_CUSTOMER		0x7010
>  
>  struct nvm_data {
> -	char *nvm_buffer;
> +	struct i2c_client *client;
>  	struct nvmem_device *nvmem;
>  	struct regmap *regmap;
> +	char *nvm_buffer;
> +	bool ready;

Thanks for the update, this indeed makes the set much easier to review.

Would it be possible to just rely on the nvm_buffer, and remove ready
field? Essentially, having NULL nvm_buffer would tell the memory isn't
allocated nor the NVM data is loaded. What do you think?

This would also mean moving the memory allocation where NVM data is read.

-- 
Kind regards,

Sakari Ailus
