Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C62CA5FD58E
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 09:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiJMHdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 03:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbiJMHdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 03:33:39 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85C411E44F
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665646418; x=1697182418;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=FVeBU1VFMxTjJbz58RbNkQ1swie2wOSWxFWGHSAZYuc=;
  b=MQv11Xx79Gkr3MrrxOXoiVOCRCC5xN+aMpGOvSgu+k8uNhCok2Mt3N/Y
   +ahx1S39NswhtTKYsPFZSnOO5hWEyUUCU/zC4edbPtD6NFkbS+u98tI8y
   TU4yjsmCtrQAS4aOKGml/w1ZDJjcEc2S6/H4V8rmaxGB93uW0Pbooo9Xg
   i2FeY64YGDVO4m3P5crR2wK9XKiQYcCJoDk2rdDg5VXDF2trCA2KZQrHf
   JYAlzWjx+IPEt8PDKn9HZEivHGSmslNyg5pHbJ1uqxZNrvav0dyvm1k3p
   9L5WqgC8U5tsm+ruHRMp+QuO1joD3OeF7oPJsYcpX+fXbsjYrjVLvzTo6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="284732507"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="284732507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 00:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="629418251"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="629418251"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2022 00:31:23 -0700
Subject: Re: [PATCH v14 03/34] media: subdev: increase
 V4L2_FRAME_DESC_ENTRY_MAX to 8
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-4-tomi.valkeinen@ideasonboard.com>
 <ea72318d-2661-1918-6531-1518683364c3@linux.intel.com>
 <cf01ba3b-ec26-0bb7-257b-a3cdf2d489d9@ideasonboard.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <678f0385-0ac0-199a-7d0d-23077982804d@linux.intel.com>
Date:   Thu, 13 Oct 2022 15:31:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cf01ba3b-ec26-0bb7-257b-a3cdf2d489d9@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi, 

On 10/3/22 7:32 PM, Tomi Valkeinen wrote:
> Hi,
> 
> On 29/09/2022 09:48, Bingbu Cao wrote:
>>
>>
>> On 8/31/22 10:13 PM, Tomi Valkeinen wrote:
>>> V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
>>> to have an arbitrary amount of streams in a single pad, so preferably
>>> there should be no hardcoded maximum number.
>>>
>>> However, I believe a reasonable max is 8, which would cover a CSI-2 pad
>>> with 4 streams of pixel data and 4 streams of metadata.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>   include/media/v4l2-subdev.h | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index 9689f38a0af1..3797b99bb408 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -358,7 +358,11 @@ struct v4l2_mbus_frame_desc_entry {
>>>       } bus;
>>>   };
>>>   -#define V4L2_FRAME_DESC_ENTRY_MAX    4
>>> + /*
>>> +  * If this number is too small, it should be dropped altogether and the
>>> +  * API switched to a dynamic number of frame descriptor entries.
>>> +  */
>>> +#define V4L2_FRAME_DESC_ENTRY_MAX    8
>>
>> The number 8 here is still not enough I think, CSI2 specification already
>> extended the VC identifier to be at most 5 bits, which support a max of
>> 32 VCs.
> 
> Well, 8 frame desc entries is not enough for the "old" CSI2 either as there can be a lot of data-types, each a separate stream ("stream" as defined by this series) which needs a frame desc.
> 
>> Considering the metadata, the number should be larger, it looks like that
>> we have to switch using dynamic number?
> 
> Do we have a current use case which needs more than 8 streams per pad? If not, I'd stay away from this for the time being. This can be changed later.

Yes, we have a use case which run at maximum 6 streams + 4 meta-data.

> 
>> BTW, does this change break the uAPI?
> 
> No, the frame desc is fully internal to the kernel.

Got it, thanks.
> 
>  Tomi

-- 
Best regards,
Bingbu Cao
