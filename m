Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFED68D5D1
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 12:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbjBGLld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 06:41:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjBGLlT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 06:41:19 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB121C5BE
        for <linux-media@vger.kernel.org>; Tue,  7 Feb 2023 03:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675770078; x=1707306078;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=CPr3oCNTIe8z/JuJMSpNL+tKJuRphvm2zEFZXNG6obk=;
  b=Bcomquvv6dTx0ME3rzXLdVJW2tKmqRVkPcFXAI53wz3lo7udujMIiBp6
   dBPXy3PT8dyeIHsgStfHAfQ3RjqrPZ3INdqok3lfBKUkHuwlVsZrYOIv8
   pFBn6OsFKqOtnFIwuq8rrIl5/p16AcDe2s7ensXZIMX02QneTwOY0knHG
   lw+z7PW9gP5fHjxU66Q1sb+TGH+7djMt/TJgF5mCm0OdAkWl0cwL8Hc+q
   e5LkdC8ZUivexFUoHEmKOj87bNCZPrWURJ72vabNk01JBRD5e3CWKI3I7
   xVGoiKMqV+T9ZFsXfxPOM+G/sTLYSW1YxjbdjJsXcS1M/wQJvcvt0PJEQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="329502511"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="329502511"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 03:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="730402211"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="730402211"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by fmsmga008.fm.intel.com with ESMTP; 07 Feb 2023 03:40:57 -0800
Subject: Re: [PATCH] media: ov13b10: remove streaming mode set from reg_list
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        arec.kao@intel.com, sakari.ailus@linux.intel.com
References: <20230105110249.633633-1-bingbu.cao@intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <63df3790-a616-018e-b302-ef3c1696f495@linux.intel.com>
Date:   Tue, 7 Feb 2023 19:36:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20230105110249.633633-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, 

Could you help review this patch?

On 1/5/23 7:02 PM, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> It is not expected that trying to set the sensor to
> streaming mode when trying to set initial sensor configuration.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/ov13b10.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 549e5d93e568..841158febfba 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -243,7 +243,6 @@ static const struct ov13b10_reg mipi_data_rate_1120mbps[] = {
>  	{0x5047, 0xa4},
>  	{0x5048, 0x20},
>  	{0x5049, 0xa4},
> -	{0x0100, 0x01},
>  };
>  
>  static const struct ov13b10_reg mode_4208x3120_regs[] = {
> 

-- 
Best regards,
Bingbu Cao
