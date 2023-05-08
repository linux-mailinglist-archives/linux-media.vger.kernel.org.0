Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4096FA1A7
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 09:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbjEHHze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 03:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjEHHzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 03:55:32 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F731BCB
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683532531; x=1715068531;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=FCP5R9c/uMVnYW7Kh2XHa2mcqzZn40ANTRWy3DCqKrE=;
  b=YSUi9bwGxpax+2h1PhRop6f5Vtck0jfupCigXBWeEOChRSwZZi7k0+3z
   77XgfO1/hwzqpV63yTsnguXCl43rFUh9exbelII3mVICoLyO50/NCa4KL
   Ch1KvkyCOikD2DdtbuTijag/B4Tojsw//BAUTMa0LXQ53VOBlTTB8dfqd
   4DepX+2ioFUdArdFFh4ngFZMHZ7TsU2XEQ8p82C4iJMlaq91Q3CrdulE6
   j6pCN3U+dHBwndEt15WTm7AyMfPI2nW9xi0HBH0aQaAu6dCgE5DtjdZwI
   h4mNB79d/3R2ySqVB5zig3yt59bFJ1e3fdJhmEY7ElVN/Hds1YSHOzqxo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="334022150"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="334022150"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 00:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="1028329521"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="1028329521"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 00:55:29 -0700
Subject: Re: [PATCH v2 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
References: <20230508064123.979451-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d28f7837-7a57-6cdf-b787-eada45c2d694@linux.intel.com>
Date:   Mon, 8 May 2023 15:55:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20230508064123.979451-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Sakari,

Thanks for your patch.

On 5/8/23 2:41 PM, Sakari Ailus wrote:
> Use the endpoint fwnode to find out the remote pad, instead of using the
> first source pad found. Also improve error messages.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Drop pad variable.
> 
> - Wrap long lines.
> 
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 31 +++++++++----------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 3c84cb1216320..c5d00c929bfac 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1373,6 +1373,7 @@ static const struct v4l2_subdev_ops cio2_subdev_ops = {
>  struct sensor_async_subdev {
>  	struct v4l2_async_subdev asd;
>  	struct csi2_bus_info csi2;
> +	struct fwnode_endpoint endpoint;
>  };
>  
>  #define to_sensor_asd(asd)	container_of(asd, struct sensor_async_subdev, asd)
> @@ -1417,31 +1418,28 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>  	struct sensor_async_subdev *s_asd;
>  	struct v4l2_async_subdev *asd;
>  	struct cio2_queue *q;
> -	unsigned int pad;
>  	int ret;
>  
>  	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
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
> +						  s_asd->endpoint.local_fwnode,
> +						  MEDIA_PAD_FL_SOURCE);
> +		if (ret < 0) {
> +			dev_err(dev, "no endpoint for %pfw (%d)\n",
> +				s_asd->endpoint.local_fwnode, ret);
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

Is there some cases that sensor has multiple source pads?

>  		if (ret) {
> -			dev_err(dev, "failed to create link for %s\n",
> -				q->sensor->name);
> +			dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",

Over 80, but it looks fine ;).

> +				q->sensor->name, s_asd->endpoint.local_fwnode,
> +				ret);
>  			return ret;
>  		}
>  	}
> @@ -1485,6 +1483,7 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
>  			goto err_parse;
>  		}
>  
> +		s_asd->endpoint = vep.base;
>  		s_asd->csi2.port = vep.base.port;
>  		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
>  
> 

-- 
Best regards,
Bingbu Cao
