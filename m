Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219863210A1
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 07:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhBVGBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 01:01:00 -0500
Received: from mga02.intel.com ([134.134.136.20]:58392 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhBVGA7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 01:00:59 -0500
IronPort-SDR: OpqHGMKNLlFnlI7HvN245Y4yIYcBx/Gr9+bw9ezxfoFCOsONc4iPVFpoPpONP9DKmgiqv4o4Ew
 tkKgLhMD5LQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="171479632"
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; 
   d="scan'208";a="171479632"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2021 21:59:09 -0800
IronPort-SDR: VSn6uHHpqohWQdn3J0H5wCf/mWtIR9QL67LE29WwX0xBL5jy7Y2gLAHdnPVDkGdciYuwG7uYE4
 P46VkLA4fuWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; 
   d="scan'208";a="379886377"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga002.jf.intel.com with ESMTP; 21 Feb 2021 21:59:07 -0800
Subject: Re: [PATCH] media: staging: ipu3: uapi: Add "WITH Linux-syscall-note"
 license
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210207235610.15687-1-laurent.pinchart@ideasonboard.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2e96698a-ddea-3d17-9454-ec44b916e88f@linux.intel.com>
Date:   Mon, 22 Feb 2021 13:57:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210207235610.15687-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent, thanks for your patch.
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 2/8/21 7:56 AM, Laurent Pinchart wrote:
> All Linux headers licensed under the GPL-2.0 must include a "WITH
> Linux-syscall-note" extension in their SPDX license identifier, as
> enforced by the scripts/headers_install.sh script. Fix the Intel IPU3
> UAPI header currently stored with the driver in staging.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index edd8edda0647..9b644fb23dde 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /* Copyright (C) 2017 - 2018 Intel Corporation */
>  
>  #ifndef __IPU3_UAPI_H
> 

-- 
Best regards,
Bingbu Cao
