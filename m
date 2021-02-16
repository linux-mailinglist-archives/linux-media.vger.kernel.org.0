Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126A131C8EB
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 11:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhBPKiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 05:38:09 -0500
Received: from mga09.intel.com ([134.134.136.24]:22244 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229662AbhBPKiE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 05:38:04 -0500
IronPort-SDR: VeyktYQ4bPtpU0BBL3sf57aUq9XCXTLBF2B1hX+JMPt1gWQO398JvBpaQF2xJ7Bj3hlRdMBeUi
 o3L/ia9Y2TjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="182988681"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="182988681"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 02:36:15 -0800
IronPort-SDR: I3eHIj41DKN1Oi0aOnjGmL6/WcrN3D9MjNficLyPKbgOt0rb33VDj/hs8S+BUO+VW/ddAHtYlj
 6puVLRWiWmwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="377517646"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga002.jf.intel.com with ESMTP; 16 Feb 2021 02:36:14 -0800
Subject: Re: [PATCH 1/1] ipu3-cio2: Fix pixel-rate derived link frequency
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
References: <20210215075742.12434-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <94f2c0e8-495f-7181-70a6-252ed7848377@linux.intel.com>
Date:   Tue, 16 Feb 2021 18:34:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215075742.12434-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent and Sakari, thanks.

On 2/15/21 3:57 PM, Sakari Ailus wrote:
> The driver uses v4l2_get_link_freq() helper to obtain the link frequency
> using the LINK_FREQ but also the PIXEL_RATE control. The divisor for the
> pixel rate derived link frequency was wrong, missing the bus uses double
> data rate. Fix this.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Fixes: 4b6c129e87a3 ("media: ipu3-cio2: Use v4l2_get_link_freq helper")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 6e8c0c230e11..fecef85bd62e 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -302,7 +302,7 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
>  	if (!q->sensor)
>  		return -ENODEV;
>  
> -	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes);
> +	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes * 2);
>  	if (freq < 0) {
>  		dev_err(dev, "error %lld, invalid link_freq\n", freq);
>  		return freq;
> 

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao
