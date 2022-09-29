Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D815EEE08
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 08:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbiI2Gsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 02:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234891AbiI2Gsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 02:48:54 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3F412F749
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 23:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664434133; x=1695970133;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=wBwbPtxJo2+Wju5RTftBf87LjJJW1KORsvMkC08f1lE=;
  b=jYIjuTCJePltiZ9ErdfMm5p3t11GYRowHe0zMglpQ/6Dv0Pq5z5Fw3xD
   +TbhY7UnxtagBMVNWHGLBwpJHq3WqJzECv/iX1MOjqPnffnlfzXmz0qGP
   jcCr0CouLyYCsm4xeDwxRcX3ezQi3xtehkzThN4BW9nHy3kjTdDehZQKk
   Gqv6HPFzBEwM+p0kaxfOixO0SQeho/8IUNk9ja8sQXQQUOcapQw6gTlxL
   5VvBi4KEYJGqJC96qRTHTMl7at8uy47Jxfk9b7kMA/wJ5L9h+Iyq5kuC6
   gyRYo6lNZphFON9JqFNYDvslcOfQ0elwNT5+4HYY+xLEvJI5qS3OkrA5Z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="300528588"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="300528588"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 23:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="573342098"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="573342098"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by orsmga003.jf.intel.com with ESMTP; 28 Sep 2022 23:48:47 -0700
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
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <ea72318d-2661-1918-6531-1518683364c3@linux.intel.com>
Date:   Thu, 29 Sep 2022 14:48:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220831141357.1396081-4-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/31/22 10:13 PM, Tomi Valkeinen wrote:
> V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
> to have an arbitrary amount of streams in a single pad, so preferably
> there should be no hardcoded maximum number.
> 
> However, I believe a reasonable max is 8, which would cover a CSI-2 pad
> with 4 streams of pixel data and 4 streams of metadata.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 9689f38a0af1..3797b99bb408 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -358,7 +358,11 @@ struct v4l2_mbus_frame_desc_entry {
>  	} bus;
>  };
>  
> -#define V4L2_FRAME_DESC_ENTRY_MAX	4
> + /*
> +  * If this number is too small, it should be dropped altogether and the
> +  * API switched to a dynamic number of frame descriptor entries.
> +  */
> +#define V4L2_FRAME_DESC_ENTRY_MAX	8

The number 8 here is still not enough I think, CSI2 specification already
extended the VC identifier to be at most 5 bits, which support a max of
32 VCs.

Considering the metadata, the number should be larger, it looks like that
we have to switch using dynamic number?

BTW, does this change break the uAPI?

>  
>  /**
>   * enum v4l2_mbus_frame_desc_type - media bus frame description type
> 

-- 
Best regards,
Bingbu Cao
