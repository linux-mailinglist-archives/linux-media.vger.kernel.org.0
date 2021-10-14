Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACB942D2FF
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 08:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhJNGzZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 02:55:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:36630 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229947AbhJNGzT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 02:55:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214553568"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="214553568"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 23:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="659841776"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2021 23:53:13 -0700
Subject: Re: [PATCH] media: ipu3-cio2: Update high watermark to support higher
 data rate camera sensors
To:     Tomasz Figa <tfiga@chromium.org>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tian.shu.qiu@intel.com, laurent.pinchart@ideasonboard.com
References: <1632370218-5508-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5BdXTYZDAQcyLVurqdjuT6fHdGpzQQ0c1NJ5y=81v7hcg@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <0309ef19-8411-ae6c-3304-0e180420baa5@linux.intel.com>
Date:   Thu, 14 Oct 2021 14:49:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BdXTYZDAQcyLVurqdjuT6fHdGpzQQ0c1NJ5y=81v7hcg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomasz,

On 10/6/21 1:03 PM, Tomasz Figa wrote:
> Hi Bingbu,
> 
> On Thu, Sep 23, 2021 at 1:11 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
>>
>> CIO2 worked well with most camera sensors so far, but CIO2 will meet SRAM
>> overflow when working with higher data rate camera sensors such as 13M@30fps.
>> We must set lower high watermark value to trigger the DRAM write to support
>> such camera sensors.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/pci/intel/ipu3/ipu3-cio2.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> Thanks for the patch. Would this have any implications for other
> (lower) operating modes, such as increased power consumption, or it's
> harmless? If so, what's the reason we didn't use the value from the
> very beginning?

Yes, we meet that the frame data corruption for some high data rate camera sensors like
imx258 (13M@30fps) with current watermark settings. The higher watermark potentially has
power concern as it  request DMA transfer more than before.

To keep the old settings for low data rate camera sensor, I am thinking the rationality
to determine the HWM value based on the link_frequency? Apparently, it is not reliable
to determine by the format.

> 
> Best regards,
> Tomasz
> 
>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
>> index 3806d7f04d69..fde80d48533b 100644
>> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
>> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
>> @@ -181,7 +181,7 @@ struct pci_dev;
>>  #define CIO2_PBM_WMCTRL1_MID1_2CK      (16 << CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT)
>>  #define CIO2_PBM_WMCTRL1_MID2_2CK      (21 << CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT)
>>  #define CIO2_REG_PBM_WMCTRL2                           0x1468
>> -#define CIO2_PBM_WMCTRL2_HWM_2CK                       40U
>> +#define CIO2_PBM_WMCTRL2_HWM_2CK                       30U
>>  #define CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT                 0U
>>  #define CIO2_PBM_WMCTRL2_LWM_2CK                       22U
>>  #define CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT                 8U
>> --
>> 2.7.4
>>

-- 
Best regards,
Bingbu Cao
