Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3C5294B24
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 12:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388190AbgJUKPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 06:15:36 -0400
Received: from mga07.intel.com ([134.134.136.100]:64662 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731414AbgJUKPg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 06:15:36 -0400
IronPort-SDR: kU7Haksqf5Ne0UBw7Q8+5Sy2s2T37JjVFo9yx4rB8TcngvriZ7G6yb9rrBkP9wa2mLuSRoH9Ui
 wk1ncvGr/DcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="231536353"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="231536353"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 03:15:33 -0700
IronPort-SDR: Kma2iuThanopwCO2z9mpWxj/cepIUqQK/VtSLlLERKuPiCiJw3hMIkuPAG4arfn5xGImLd91NS
 vTMwYT075Qkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="523843995"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2020 03:15:31 -0700
Subject: Re: [PATCH] media: ov2740: change the minimal exposure value to 4
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, senozhatsky@chromium.org,
        tfiga@chromium.org
References: <1603248250-24847-1-git-send-email-bingbu.cao@intel.com>
 <20201021092043.GD2703@paasikivi.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2907f55b-2854-7f4d-e9e6-6b4d386f6773@linux.intel.com>
Date:   Wed, 21 Oct 2020 18:12:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021092043.GD2703@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, thanks.
I did not find that on patchwork, so resend it again. :)

On 10/21/20 5:20 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Oct 21, 2020 at 10:44:10AM +0800, Bingbu Cao wrote:
>> The minimal valid exposure value should be 4 lines instead of 8 for
>> ov2740 mannual exposure control.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/i2c/ov2740.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index bd0d45b0d43f..0dbae4949cb3 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -37,7 +37,7 @@
>>  
>>  /* Exposure controls from sensor */
>>  #define OV2740_REG_EXPOSURE		0x3500
>> -#define OV2740_EXPOSURE_MIN		8
>> +#define OV2740_EXPOSURE_MIN		4
>>  #define OV2740_EXPOSURE_MAX_MARGIN	8
>>  #define OV2740_EXPOSURE_STEP		1
> 
> This is already in my tree --- I may forgotten to push master after
> applying many patches, it is up-to-date now.
> 

-- 
Best regards,
Bingbu Cao
