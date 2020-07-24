Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B27E22BD44
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 07:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgGXFBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 01:01:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:1531 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgGXFBz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 01:01:55 -0400
IronPort-SDR: cLoc7GXbf02zAad7Qr8Q8uf1F2inELEWEEAiIbufYomMaDio33qLLLZ7bHnnevjWYdV/wzmbYv
 Mc7eHCOEj2zQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="149850302"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="149850302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2020 22:01:54 -0700
IronPort-SDR: OJ/49s8Mzef94R8bDDkKuwhyCGqAtx9vr+zL1pzF86fHymXjgtip/jFlOIhuuq8i82JKUAWC9e
 j6VLYkpdPNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
   d="scan'208";a="272486761"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2020 22:01:52 -0700
Subject: Re: [PATCH] media: ipu3.rst: Format media-ctl and yavta commands as
 code blocks
To:     jorhand@linux.microsoft.com, linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200630040508.11461-1-jorhand@linux.microsoft.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <0fb304f4-21ff-3adb-48be-d7e5268d2abb@linux.intel.com>
Date:   Fri, 24 Jul 2020 13:00:37 +0800
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



On 6/30/20 12:05 PM, jorhand@linux.microsoft.com wrote:
> From: Jordan Hand <jorhand@linux.microsoft.com>
...
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
>  
Just notice indent will exceed 80 characters.
BTW, need a backslash at each EOL.
>  You can also use yavta [#f2]_ command to do same thing as above:
...
-- 
Best regards,
Bingbu Cao
