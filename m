Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A3935DD76
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344381AbhDMLKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:10:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:43548 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343520AbhDMLKc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:10:32 -0400
IronPort-SDR: vTHgZNGP2brM1ZUylmmbrVW3tpBWSdqEepS8T9cPuzj5wzwQCegagRAv+X8pwd2FSd+40YEX/2
 w0DJqCW/dm4w==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="255711245"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="255711245"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 04:10:12 -0700
IronPort-SDR: SWUMmDbHuMTJDMYpvyQoZhZ368xvZpvfFKjjB91AqHcy81mwyrQTl7wgqwLrSaZpvFkjH60U1x
 u7v1zoEaKKiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="451906319"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.202]) ([10.238.232.202])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2021 04:10:09 -0700
Subject: Re: [PATCH 1/1] staging: ipu3-imgu: Move the UAPI header from include
 under include/uapi
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mitali Borkar <mitaliborkar810@gmail.com>,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in,
        laurent.pinchart@ideasonboard.com
References: <20210412111120.31625-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f94863a5-3e6a-7f4f-afef-634f66fec10d@linux.intel.com>
Date:   Tue, 13 Apr 2021 19:03:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412111120.31625-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

On 4/12/21 7:11 PM, Sakari Ailus wrote:
> The header defines the user space interface but may be mistaken as
> kernel-only header due to its location. Add "uapi" directory under
> driver's include directory and move the header there.
> 
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/admin-guide/media/ipu3.rst      | 35 ++++++++++---------
>  .../media/v4l/pixfmt-meta-intel-ipu3.rst      |  2 +-
>  .../ipu3/include/{ => uapi}/intel-ipu3.h      |  0
>  drivers/staging/media/ipu3/ipu3-abi.h         |  2 +-
>  4 files changed, 20 insertions(+), 19 deletions(-)
>  rename drivers/staging/media/ipu3/include/{ => uapi}/intel-ipu3.h (100%)
> 
> diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
> index f59697c7b374..d6454f637ff4 100644
> --- a/Documentation/admin-guide/media/ipu3.rst
> +++ b/Documentation/admin-guide/media/ipu3.rst
> @@ -234,22 +234,23 @@ The IPU3 ImgU pipelines can be configured using the Media Controller, defined at
>  Running mode and firmware binary selection
>  ------------------------------------------
>  
> -ImgU works based on firmware, currently the ImgU firmware support run 2 pipes in
> -time-sharing with single input frame data. Each pipe can run at certain mode -
> -"VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture, and
> -"STILL" is used for still frame capture. However, you can also select "VIDEO" to
> -capture still frames if you want to capture images with less system load and
> -power. For "STILL" mode, ImgU will try to use smaller BDS factor and output
> -larger bayer frame for further YUV processing than "VIDEO" mode to get high
> -quality images. Besides, "STILL" mode need XNR3 to do noise reduction, hence
> -"STILL" mode will need more power and memory bandwidth than "VIDEO" mode. TNR
> -will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is running at
> -“VIDEO” mode by default, the user can use v4l2 control V4L2_CID_INTEL_IPU3_MODE
> -(currently defined in drivers/staging/media/ipu3/include/intel-ipu3.h) to query
> -and set the running mode. For user, there is no difference for buffer queueing
> -between the "VIDEO" and "STILL" mode, mandatory input and main output node
> -should be enabled and buffers need be queued, the statistics and the view-finder
> -queues are optional.
> +ImgU works based on firmware, currently the ImgU firmware support run 2 pipes
> +in time-sharing with single input frame data. Each pipe can run at certain mode
> +- "VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture,
> +and "STILL" is used for still frame capture. However, you can also select
> +"VIDEO" to capture still frames if you want to capture images with less system
> +load and power. For "STILL" mode, ImgU will try to use smaller BDS factor and
> +output larger bayer frame for further YUV processing than "VIDEO" mode to get
> +high quality images. Besides, "STILL" mode need XNR3 to do noise reduction,
> +hence "STILL" mode will need more power and memory bandwidth than "VIDEO" mode.
> +TNR will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is
> +running at “VIDEO” mode by default, the user can use v4l2 control
> +V4L2_CID_INTEL_IPU3_MODE (currently defined in
> +drivers/staging/media/ipu3/include/uapi/intel-ipu3.h) to query and set the
> +running mode. For user, there is no difference for buffer queueing between the
> +"VIDEO" and "STILL" mode, mandatory input and main output node should be
> +enabled and buffers need be queued, the statistics and the view-finder queues
> +are optional.
>  
>  The firmware binary will be selected according to current running mode, such log
>  "using binary if_to_osys_striped " or "using binary if_to_osys_primary_striped"
> @@ -586,7 +587,7 @@ preserved.
>  References
>  ==========
>  
> -.. [#f5] drivers/staging/media/ipu3/include/intel-ipu3.h
> +.. [#f5] drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
>  
>  .. [#f1] https://github.com/intel/nvt
>  
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
> index 5f33d35532ef..84d81dd7a7b5 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
> @@ -78,4 +78,4 @@ hardware and algorithm details.
>  Intel IPU3 ImgU uAPI data types
>  ===============================
>  
> -.. kernel-doc:: drivers/staging/media/ipu3/include/intel-ipu3.h
> +.. kernel-doc:: drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> similarity index 100%
> rename from drivers/staging/media/ipu3/include/intel-ipu3.h
> rename to drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> diff --git a/drivers/staging/media/ipu3/ipu3-abi.h b/drivers/staging/media/ipu3/ipu3-abi.h
> index e1185602c7fd..c76935b436d7 100644
> --- a/drivers/staging/media/ipu3/ipu3-abi.h
> +++ b/drivers/staging/media/ipu3/ipu3-abi.h
> @@ -4,7 +4,7 @@
>  #ifndef __IPU3_ABI_H
>  #define __IPU3_ABI_H
>  
> -#include "include/intel-ipu3.h"
> +#include "include/uapi/intel-ipu3.h"
>  
>  /******************* IMGU Hardware information *******************/
>  
> 

-- 
Best regards,
Bingbu Cao
