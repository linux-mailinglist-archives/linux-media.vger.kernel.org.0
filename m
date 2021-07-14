Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FDE3C840C
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 13:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhGNLuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 07:50:00 -0400
Received: from mga11.intel.com ([192.55.52.93]:6722 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230405AbhGNLuA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 07:50:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="207312377"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; 
   d="scan'208";a="207312377"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 04:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; 
   d="scan'208";a="505229930"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.202]) ([10.238.232.202])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2021 04:46:57 -0700
Subject: Re: [PATCH] media: staging: document that Imgu not output
 auto-exposure statistics
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tfiga@chromium.org
References: <1626262180-19749-1-git-send-email-bingbu.cao@intel.com>
 <YO7NpSZfA65oCE6e@pendragon.ideasonboard.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <9098e7ca-5ea5-2773-38fa-6b189711378e@linux.intel.com>
Date:   Wed, 14 Jul 2021 19:48:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YO7NpSZfA65oCE6e@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent,

Thanks for your review.

On 7/14/21 7:42 PM, Laurent Pinchart wrote:
> Hi Bingbu,
> 
> Thank you for the patch.
> 
> On Wed, Jul 14, 2021 at 07:29:40PM +0800, Bingbu Cao wrote:
>> Currently, Imgu can not support output the auto-exposure statistics into
>> ae_raw_buffer in 3A stats buffer, this patch document it.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> index fa3d6ee5adf2..605113da1aed 100644
>> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>> @@ -534,6 +534,9 @@ struct ipu3_uapi_ff_status {
>>   *
>>   * @awb_raw_buffer: auto white balance meta data &ipu3_uapi_awb_raw_buffer
>>   * @ae_raw_buffer: auto exposure raw data &ipu3_uapi_ae_raw_buffer_aligned
>> + *                 current Imgu does not output the auto exposure statistics
>> + *                 to ae_raw_buffer, the user such as 3A algorithm can use the
>> + *                 RGB table in &ipu3_uapi_awb_raw_buffer to do auto-exposure.
> 
> Is there any other fields in the statistics buffer that is not populated
> by the device, or is this the only one ?

I will check again whether there is any I missed.
> 
> Could you please also mark the corresponding parameters fields as unused
> by the device ?

Yes, sure.

> 
>>   * @af_raw_buffer: &ipu3_uapi_af_raw_buffer for auto focus meta data
>>   * @awb_fr_raw_buffer: value as specified by &ipu3_uapi_awb_fr_raw_buffer
>>   * @stats_4a_config: 4a statistics config as defined by &ipu3_uapi_4a_config.
> 

-- 
Best regards,
Bingbu Cao
