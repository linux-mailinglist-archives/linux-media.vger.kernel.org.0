Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862A935E086
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 15:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346139AbhDMNqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 09:46:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346151AbhDMNq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 09:46:29 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3D1D8AF;
        Tue, 13 Apr 2021 15:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618321567;
        bh=ERzFPHfwcC1rsN/DqiEKlswPknAmFAYpH+SlZCHO53s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M+mVpGANMD7po+3PLGrcQK+tltANs7uEpInW1c0IEonhQ3Rd/h5sawXyi0/08uqdD
         1gf6EPhyF5ypqxn0ylQFS1KOOI+/qhlfpEJNlZTSMMjSlhM6QwW0qoCmmoQr37FJFF
         bcfl9eWNSPHvuHH9tlsMlpoxghqi1IWm/oJdwLxs=
Date:   Tue, 13 Apr 2021 16:45:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Mitali Borkar <mitaliborkar810@gmail.com>,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 1/1] staging: ipu3-imgu: Move the UAPI header from
 include under include/uapi
Message-ID: <YHWgbZTDAWBX9EpR@pendragon.ideasonboard.com>
References: <20210412111120.31625-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210412111120.31625-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:11:20PM +0300, Sakari Ailus wrote:
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

The reflow of the whole paragraph is a bit painful to review.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
