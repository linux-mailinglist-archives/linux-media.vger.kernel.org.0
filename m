Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A66F3D5140
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 04:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhGZBlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 21:41:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:52277 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230272AbhGZBlx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 21:41:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212141715"
X-IronPort-AV: E=Sophos;i="5.84,269,1620716400"; 
   d="scan'208";a="212141715"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2021 19:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,269,1620716400"; 
   d="scan'208";a="436588592"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.202]) ([10.238.232.202])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2021 19:22:20 -0700
Subject: Re: [PATCH 1/2] media: imx258: Rectify mismatch of VTS value
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>
References: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
 <20210723112233.1361319-2-umang.jain@ideasonboard.com>
 <YPqtC0KITMbB2I4F@pendragon.ideasonboard.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e543e0fe-3a2c-f3c9-9543-24e576cb32e8@linux.intel.com>
Date:   Mon, 26 Jul 2021 10:20:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YPqtC0KITMbB2I4F@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Umang and Laurent,

I just checked the spec, 0xc98 should be the initial value not for 4208x3118, the patch
looks good to me though I am not working on that anymore.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 7/23/21 7:50 PM, Laurent Pinchart wrote:
> Hi Umang,
> 
> Thank you for the patch.
> 
> (Expanding the CC list)
> 
> On Fri, Jul 23, 2021 at 04:52:32PM +0530, Umang Jain wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> The frame_length_lines (0x0340) registers are hard-coded as follows:
>>
>> - 4208x3118
>>   frame_length_lines = 0x0c50
>>
>> - 2104x1560
>>   frame_length_lines = 0x0638
>>
>> - 1048x780
>>   frame_length_lines = 0x034c
>>
>> The driver exposes the V4L2_CID_VBLANK control in read-only mode and
>> sets its value to vts_def - height, where vts_def is a mode-dependent
>> value coming from the supported_modes array. It is set using one of
>> the following macros defined in the driver:
>>
>>   #define IMX258_VTS_30FPS                0x0c98
>>   #define IMX258_VTS_30FPS_2K             0x0638
>>   #define IMX258_VTS_30FPS_VGA            0x034c
>>
>> There's a clear mismatch in the value for the full resolution mode i.e.
>> IMX258_VTS_30FPS. Fix it by rectifying the macro with the value set for
>> the frame_length_lines register as stated above.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> ---
>>  drivers/media/i2c/imx258.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
>> index 7ab9e5f9f267..4e695096e5d0 100644
>> --- a/drivers/media/i2c/imx258.c
>> +++ b/drivers/media/i2c/imx258.c
>> @@ -23,7 +23,7 @@
>>  #define IMX258_CHIP_ID			0x0258
>>  
>>  /* V_TIMING internal */
>> -#define IMX258_VTS_30FPS		0x0c98
>> +#define IMX258_VTS_30FPS		0x0c50
>>  #define IMX258_VTS_30FPS_2K		0x0638
>>  #define IMX258_VTS_30FPS_VGA		0x034c
>>  #define IMX258_VTS_MAX			0xffff
> 

-- 
Best regards,
Bingbu Cao
