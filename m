Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2AEC50046F
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 04:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239587AbiDNCxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 22:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236394AbiDNCxr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 22:53:47 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A9012086
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 19:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649904684; x=1681440684;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=WZAC2T1bGyi1MuhaaxLLqyCEfX6lxK6AHlIyotffp1I=;
  b=bvufVRh6c3d+RR7ezvigWsFxhQsz1LHPYZHqAfxCWxwC6lm4a0ZwCkeK
   J+3DrgdseOyxhH3dAhrf/EhCqE6BZAnhc+z9E0ni/j1T0R8U43Kh0zDYi
   MZwd39Y61n4irn6BMJu2V7/w7G3yA7JFel9Oe5rshYBoSaojs6+Tx7LnZ
   KALzgpW1rP1xKQN48n2TjD0fNoDssUtkBVL7vgpY9HAVwpEn/xYq8XnNC
   K9Hho/ZfMJcXtPmyK/H0IFsXZ5FqdvDanZUn9G9pQUOBxgU8a/AE6EBAb
   o9Qaq2RGQIpIkaq3qD03Cc2sVbccGRsVDHOPCCeuAiSONE96eu8hiBbjJ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="250119199"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="250119199"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 19:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="655816260"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2022 19:51:22 -0700
Subject: Re: [PATCH 1/1] Revert "media: dw9768: activate runtime PM and turn
 off device"
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     tfiga@chromium.org, bingbu.cao@intel.com
References: <20220413133315.622593-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <b35686ce-02d1-d435-3b94-956cdf2d25fc@linux.intel.com>
Date:   Thu, 14 Apr 2022 10:51:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220413133315.622593-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, 

Thanks.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 4/13/22 9:33 PM, Sakari Ailus wrote:
> This reverts commit c09d776eaa060534a1663e3b89d842db3e1d9076.
> 
> Revert the commit as it breaks runtime PM support on OF based systems.
> More fixes to the driver are needed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/dw9768.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index 65c6acf3ced9a..c086580efac78 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -469,11 +469,6 @@ static int dw9768_probe(struct i2c_client *client)
>  
>  	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
>  
> -	/*
> -	 * Device is already turned on by i2c-core with ACPI domain PM.
> -	 * Attempt to turn off the device to satisfy the privacy LED concerns.
> -	 */
> -	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
>  	if (!pm_runtime_enabled(dev)) {
>  		ret = dw9768_runtime_resume(dev);
> @@ -488,7 +483,6 @@ static int dw9768_probe(struct i2c_client *client)
>  		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
>  		goto err_power_off;
>  	}
> -	pm_runtime_idle(dev);
>  
>  	return 0;
>  
> 

-- 
Best regards,
Bingbu Cao
