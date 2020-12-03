Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4578A2CCCD0
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 03:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729484AbgLCCrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 21:47:49 -0500
Received: from mga14.intel.com ([192.55.52.115]:16063 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbgLCCrs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 21:47:48 -0500
IronPort-SDR: rz21ZMU2IyMRFSeZDQwqMod5ezjLG9/AFRkl1r+0EO0w1uBLX57J5cpn2UNDn77adLcbeP9hXc
 +DNOolKe47GQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="172342563"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
   d="scan'208";a="172342563"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 18:46:07 -0800
IronPort-SDR: up+3Me5C9mLQbPWWBVxTX/2bEKVDdzvU5VjYVl/KVdmVVjEXjvY/ee0lSe/i70Drt1FJqheMxL
 axTU02Y7428Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
   d="scan'208";a="481797093"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga004.jf.intel.com with ESMTP; 02 Dec 2020 18:46:05 -0800
Subject: Re: [PATCH][next] media: ov2740: fix dereference before null check on
 pointer nvm
To:     Colin King <colin.king@canonical.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Qingwu Zhang <qingwu.zhang@intel.com>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201126114932.1984730-1-colin.king@canonical.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <9d6ef10c-a575-c79b-5ac4-3313bc96e89e@linux.intel.com>
Date:   Thu, 3 Dec 2020 10:43:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126114932.1984730-1-colin.king@canonical.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Colin

Thanks for your patch.

On 11/26/20 7:49 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently pointer nvm is being dereferenced before it is being null
> checked.  Fix this by moving the assignments of pointers client and
> ov2740 so that are after the null check hence avoiding any potential
> null pointer dereferences on pointer nvm.
> 
> Fixes: 5e6fd339b68d ("media: ov2740: allow OTP data access during streaming")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/i2c/ov2740.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 99016546cbec..b41a90c2aed5 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -600,8 +600,8 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
>  
>  static int ov2740_load_otp_data(struct nvm_data *nvm)
>  {
> -	struct i2c_client *client = nvm->client;
> -	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
> +	struct i2c_client *client;
> +	struct ov2740 *ov2740;
>  	u32 isp_ctrl00 = 0;
>  	u32 isp_ctrl01 = 0;
>  	int ret;
> @@ -612,6 +612,9 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
>  	if (nvm->nvm_buffer)
>  		return 0;
>  
> +	client = nvm->client;
> +	ov2740 = to_ov2740(i2c_get_clientdata(client));
> +
>  	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
>  	if (!nvm->nvm_buffer)
>  		return -ENOMEM;
> 

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>


-- 
Best regards,
Bingbu Cao
