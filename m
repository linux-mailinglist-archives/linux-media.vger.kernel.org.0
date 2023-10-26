Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2C87D8035
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 12:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjJZKD4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 06:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbjJZKDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 06:03:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F7E93
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698314633; x=1729850633;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=aNHz4mUGJ6wLsj9ob8nJ/PHe2/GfDxz1fn509pcWL9U=;
  b=a7NPOuppMvNgu8O/h3jOkZXltLI/aDrijDCx29oCVFCCMRiZT6bWMvg4
   RQt9XAjGCJmzUm/5TIFAbyGH9Ny9Kzxrjnq6KB85cZN2H2238xCjGWiFV
   TQFL+v8PHttyrsYjbDQsPiDqljJcokwlVRi2xdb+FSlmsLXOlfeyqbnJq
   vYigLe5LRYoj3QLnXiDM2cheDvuWkhiwmT1fwPT3k1FZ44CRipDyByrAr
   FpJmkbB+onkOUuWAKsDuUIWuvCnwkOY8WOCJIHaKHrEXoBb3BIud+sIzJ
   LAbWHJjS4710LSvq1G4W56nmi8BaKdIYcdjgDWfvDMCyqCpT2KrL082cc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387331976"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="387331976"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 03:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="794142541"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="794142541"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga001.jf.intel.com with ESMTP; 26 Oct 2023 03:03:50 -0700
Subject: Re: [PATCH 1/6] media: ivsc: csi: Don't parse remote endpoints
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
References: <20231026081346.958238-1-sakari.ailus@linux.intel.com>
 <20231026081346.958238-2-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2d72dd4c-c529-6838-40d6-297f2c0b124b@linux.intel.com>
Date:   Thu, 26 Oct 2023 17:59:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20231026081346.958238-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/26/23 4:13 PM, Sakari Ailus wrote:
> The driver parsed, besides its own endpoint on the sink, the remote
> upstream endpoint that most likely is a sensor, and took the number of
> lanes from that. Instead obtain the number of lanes from the local
> endpoint.

Yes, it's the work of ipu-bridge or device table. ;)
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  drivers/media/pci/intel/ivsc/mei_csi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index b2b9d1669a82..b04847e30213 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -662,6 +662,8 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
>  		return -EINVAL;
>  	}
>  
> +	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
> +
>  	fwnode = fwnode_graph_get_remote_endpoint(ep);
>  	fwnode_handle_put(ep);
>  
> @@ -675,18 +677,12 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
>  		return PTR_ERR(asd);
>  	}
>  
> -	ret = v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
>  	fwnode_handle_put(fwnode);
> -	if (ret)
> -		return ret;
> -	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
>  
>  	ret = v4l2_async_nf_register(&csi->notifier);
>  	if (ret)
>  		v4l2_async_nf_cleanup(&csi->notifier);
>  
> -	v4l2_fwnode_endpoint_free(&v4l2_ep);
> -
>  	return ret;
>  }
>  
>

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao
