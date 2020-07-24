Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FBB22BD1E
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 06:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgGXEpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 00:45:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:48912 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgGXEpi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 00:45:38 -0400
IronPort-SDR: iZzTQZ2WHz4VEX5iOKtmuL/flfcKWeIi7U0VkyaDN/MW+GJNmksibFA0Xc8+VwhbfoNq0kp4Y2
 ZhPIkOq+YQfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="212194215"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="212194215"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 21:45:37 -0700
IronPort-SDR: +EuAhV1rruV8HcHlzByXs1tXZ88V1fU6G1SgKyp51eTO/sfMkQnCCyik34B95UWQNJnyDZDo+f
 4Qy/yLneT/xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="272484696"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2020 21:45:35 -0700
Subject: Re: [PATCH] media: ipu3.rst: Format media-ctl and yavta commands as
 code blocks
To:     jorhand@linux.microsoft.com, linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200630040508.11461-1-jorhand@linux.microsoft.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <088accd1-79d8-c688-4860-dd7db1612edc@linux.intel.com>
Date:   Fri, 24 Jul 2020 12:44:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200630040508.11461-1-jorhand@linux.microsoft.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jordan, thanks for your patch.

On 6/30/20 12:05 PM, jorhand@linux.microsoft.com wrote:
...snip...
>  e.g
>  
> -yavta -w 0x009e0903 444 $SDEV
> +.. code-block:: none
> +
> +    yavta -w 0x009e0903 444 $SDEV
>  
> -yavta -w 0x009e0913 1024 $SDEV
> +    yavta -w 0x009e0913 1024 $SDEV
>  
> -yavta -w 0x009e0911 2046 $SDEV
> +    yavta -w 0x009e0911 2046 $SDEV
>  
As we move into the code-block, so the blank line between each command can be
removed.

>  Once the desired sensor settings are set, frame captures can be done as below.
>  
>  e.g
>  
> -yavta --data-prefix -u -c10 -n5 -I -s2592x1944 --file=/tmp/frame-#.bin \
> -      -f IPU3_SGRBG10 $(media-ctl -d $MDEV -e "ipu3-cio2 0")
> +.. code-block:: none
> +
> +    yavta --data-prefix -u -c10 -n5 -I -s2592x1944 --file=/tmp/frame-#.bin \
> +        -f IPU3_SGRBG10 $(media-ctl -d $MDEV -e "ipu3-cio2 0")
>  
Could we keep the option in the 2nd line align with 1st line? like:
yavta --data-prefix ...\
      -f IPU3_SGRBG10 ....

>  With the above command, 10 frames are captured at 2592x1944 resolution, with
>  sGRBG10 format and output as IPU3_SGRBG10 format.
> @@ -269,21 +271,21 @@ all the video nodes setup correctly.
>  
>  Let us take "ipu3-imgu 0" subdev as an example.
>  
> -media-ctl -d $MDEV -r
> -
> -media-ctl -d $MDEV -l "ipu3-imgu 0 input":0 -> "ipu3-imgu 0":0[1]
> -
> -media-ctl -d $MDEV -l "ipu3-imgu 0":2 -> "ipu3-imgu 0 output":0[1]
> -
> -media-ctl -d $MDEV -l "ipu3-imgu 0":3 -> "ipu3-imgu 0 viewfinder":0[1]
> +.. code-block:: none
>  
> -media-ctl -d $MDEV -l "ipu3-imgu 0":4 -> "ipu3-imgu 0 3a stat":0[1]
> +    media-ctl -d $MDEV -r
> +    media-ctl -d $MDEV -l "ipu3-imgu 0 input":0 -> "ipu3-imgu 0":0[1]
> +    media-ctl -d $MDEV -l "ipu3-imgu 0":2 -> "ipu3-imgu 0 output":0[1]
> +    media-ctl -d $MDEV -l "ipu3-imgu 0":3 -> "ipu3-imgu 0 viewfinder":0[1]
> +    media-ctl -d $MDEV -l "ipu3-imgu 0":4 -> "ipu3-imgu 0 3a stat":0[1]
>  
>  Also the pipe mode of the corresponding V4L2 subdev should be set as desired
>  (e.g 0 for video mode or 1 for still mode) through the control id 0x009819a1 as
>  below.
>  
> -yavta -w "0x009819A1 1" /dev/v4l-subdev7
> +.. code-block:: none
> +
> +    yavta -w "0x009819A1 1" /dev/v4l-subdev7
>  
>  Certain hardware blocks in ImgU pipeline can change the frame resolution by
>  cropping or scaling, these hardware blocks include Input Feeder(IF), Bayer Down
> @@ -371,30 +373,32 @@ v4l2n command can be used. This helps process the raw Bayer frames and produces
>  the desired results for the main output image and the viewfinder output, in NV12
>  format.
>  
> -v4l2n --pipe=4 --load=/tmp/frame-#.bin --open=/dev/video4
> ---fmt=type:VIDEO_OUTPUT_MPLANE,width=2592,height=1944,pixelformat=0X47337069
> ---reqbufs=type:VIDEO_OUTPUT_MPLANE,count:1 --pipe=1 --output=/tmp/frames.out
> ---open=/dev/video5
> ---fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
> ---reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=2 --output=/tmp/frames.vf
> ---open=/dev/video6
> ---fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
> ---reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=3 --open=/dev/video7
> ---output=/tmp/frames.3A --fmt=type:META_CAPTURE,?
> ---reqbufs=count:1,type:META_CAPTURE --pipe=1,2,3,4 --stream=5
> +.. code-block:: none
> +
> +    v4l2n --pipe=4 --load=/tmp/frame-#.bin --open=/dev/video4
> +        --fmt=type:VIDEO_OUTPUT_MPLANE,width=2592,height=1944,pixelformat=0X47337069
> +        --reqbufs=type:VIDEO_OUTPUT_MPLANE,count:1 --pipe=1 --output=/tmp/frames.out
> +        --open=/dev/video5
> +        --fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
> +        --reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=2 --output=/tmp/frames.vf
> +        --open=/dev/video6
> +        --fmt=type:VIDEO_CAPTURE_MPLANE,width=2560,height=1920,pixelformat=NV12
> +        --reqbufs=type:VIDEO_CAPTURE_MPLANE,count:1 --pipe=3 --open=/dev/video7
> +        --output=/tmp/frames.3A --fmt=type:META_CAPTURE,?
> +        --reqbufs=count:1,type:META_CAPTURE --pipe=1,2,3,4 --stream=5
>  Same as above, alignment.
>  You can also use yavta [#f2]_ command to do same thing as above:
>  
>  .. code-block:: none
>  
> -	yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
> -	--file=frame-#.out-f NV12 /dev/video5 & \
> -	yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
> -	--file=frame-#.vf -f NV12 /dev/video6 & \
> -	yavta --data-prefix -Bmeta-capture -c10 -n5 -I \
> -	--file=frame-#.3a /dev/video7 & \
> -	yavta --data-prefix -Boutput-mplane -c10 -n5 -I -s2592x1944 \
> -	--file=/tmp/frame-in.cio2 -f IPU3_SGRBG10 /dev/video4
> +    yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
> +        --file=frame-#.out-f NV12 /dev/video5 & \
> +    yavta --data-prefix -Bcapture-mplane -c10 -n5 -I -s2592x1944 \
> +        --file=frame-#.vf -f NV12 /dev/video6 & \
> +    yavta --data-prefix -Bmeta-capture -c10 -n5 -I \
> +        --file=frame-#.3a /dev/video7 & \
> +    yavta --data-prefix -Boutput-mplane -c10 -n5 -I -s2592x1944 \
> +        --file=/tmp/frame-in.cio2 -f IPU3_SGRBG10 /dev/video4
>  
ditto.

-- 
Best regards,
Bingbu Cao
