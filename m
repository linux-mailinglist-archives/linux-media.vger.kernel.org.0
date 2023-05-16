Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4665B704A52
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 12:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjEPKTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 06:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbjEPKTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 06:19:42 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9931A5
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684232379; x=1715768379;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=finlpI3b8yf6d7vSLNrmEom+iDGvV2dkMN6qMXazL4s=;
  b=NJzSbh7QRSKWf2UmUXZDx53cgS40ULE1aDGU+SOO1acE0yF/1ydJRF3/
   9UM2/BxlnSfJGr5WbT8qSj5gnrwOJAC0XQTajbFWHmfj2A91SL6+yRQQU
   WvUVaBW8bDrGuTTz04c/a7vJ31xhjo5F6FT7aMzyDhmYRVTBfVdnyd+o4
   ioxi58xcLRU8Sq1JLneRmQOAy3YprirzUvRpq0fkGz0SUnEuVX32mB5ge
   NHsPQLD2zulxQjuKVWVbkt7a/KHEY9m6t8wv3/Jr9VeA26x7x/rH3YjpK
   kKxcufBMe8cAP60SITCPv09LMqSsrp0eCYsrJjJAR8dfvdwPDgsMvVQNA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350276768"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="350276768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 03:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031238969"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="1031238969"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by fmsmga005.fm.intel.com with ESMTP; 16 May 2023 03:19:39 -0700
Subject: Re: [PATCH v3 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
References: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <afc0b6c5-469f-368b-f3a0-ea484a2a674f@linux.intel.com>
Date:   Tue, 16 May 2023 18:19:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 5/15/23 8:21 PM, Sakari Ailus wrote:
> Use the endpoint fwnode to find out the remote pad, instead of using the
> first source pad found. Also improve error messages.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Oh well. Hopefully this is final then.
> 
> since v2:
> - Use remote fwnode for finding the remote pad, not local.
> 
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 28 ++++++++-----------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 39a8022eec396..2743ecc9b8e4b 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1418,31 +1418,27 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>  	struct sensor_async_subdev *s_asd;
>  	struct v4l2_async_connection *asd;
>  	struct cio2_queue *q;
> -	unsigned int pad;
>  	int ret;
>  
>  	list_for_each_entry(asd, &cio2->notifier.done_list, asc_entry) {
>  		s_asd = to_sensor_asd(asd);
>  		q = &cio2->queue[s_asd->csi2.port];
>  
> -		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
> -			if (q->sensor->entity.pads[pad].flags &
> -						MEDIA_PAD_FL_SOURCE)
> -				break;
> -
> -		if (pad == q->sensor->entity.num_pads) {
> -			dev_err(dev, "failed to find src pad for %s\n",
> -				q->sensor->name);
> -			return -ENXIO;
> +		ret = media_entity_get_fwnode_pad(&q->sensor->entity,
> +						  s_asd->asd.match.fwnode,
> +						  MEDIA_PAD_FL_SOURCE);
> +		if (ret < 0) {
> +			dev_err(dev, "no pad for endpoint %pfw (%d)\n",
> +				s_asd->asd.match.fwnode, ret);
> +			return ret;
>  		}
>  
> -		ret = media_create_pad_link(
> -				&q->sensor->entity, pad,
> -				&q->subdev.entity, CIO2_PAD_SINK,
> -				0);
> +		ret = media_create_pad_link(&q->sensor->entity, ret,
> +					    &q->subdev.entity, CIO2_PAD_SINK,
> +					    0);
>  		if (ret) {
> -			dev_err(dev, "failed to create link for %s\n",
> -				q->sensor->name);
> +			dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
> +				q->sensor->name, s_asd->asd.match.fwnode, ret);
>  			return ret;
>  		}
>  	}
> 

-- 
Best regards,
Bingbu Cao
