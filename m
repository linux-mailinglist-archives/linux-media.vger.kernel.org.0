Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD6D2B435F
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 13:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbgKPMKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 07:10:31 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:55199 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729907AbgKPMKa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 07:10:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id edKxkeWDv6LFvedL0kPc4u; Mon, 16 Nov 2020 13:10:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605528627; bh=8+0EJoLK6l1G5ltadZZfnA8YoPvvNwCgoblT2QOPjAA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QoOcHwznE2zELkEDHAIK2SJ64c0tot5JuaggQsPqMV+aPNBsImm/WNvH+k8t8DWBP
         OV8GqczihntOfIpU79u1krAF6LSgtgspHypNGcMBUbCOVqBc6dyFWoFVE44+Wd4uzG
         3tPtiWTrBKzOQeWnuJF8UoUQDuyfIGf9YniATlBsi0+we72cFAhZJ8Qg1h3Oqy3swz
         HsAdJhO8G4njCrKcXm5RZA+Z5J037RUE7ZU+C1FZ5hVy4Hs5+oEVAoqoLL/NcKijDX
         EUtepBhjm4bg1u1VPaXCDOr0rvyjcnRAp6mkvGv1w6Erm4ZW/t5ucqc38vwfuvZYbR
         VMhU8rVF+olMQ==
Subject: Re: [PATCH v2 19/19] media: v4l2: Add 10-, 12- and 16-bpc 4:2:0 and
 4:2:2 semi-planar YUV formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-20-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1df9f1df-5352-9bf0-bef8-976c0300c497@xs4all.nl>
Date:   Mon, 16 Nov 2020 13:10:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102224102.30292-20-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKq7VDlWLkaZE5LG7SIjBbVvwWyXdy2XoUu/LSKUsuelG6/vqnJIxkzaOgsY5b7ZT5hSHUQ7P++FA835YLCBSI+gkKuInYHdx6mZ/jOaf74weFl6vVs0
 l4/HrwZ9WD/7i01tFuMEsWvxR4ShV2tLFPjiS1bEUQbmlyxLwQvK2Wzka/4zVp4feaErAdovaXWX35o3gGKg6h7HleZOfMVyLW0B2E8vh1Bf+j8c4aK27bF+
 t9PrqPOvhXkizrdxCXQcKYzEXufT/UM1cQKT+e62KcwC1O2HLP+ZeAOjfTsn0v+wFJdQIaVKdwYFTATT2jBjDBoaPXNF0DT6F+0OK8Sw0tvWzMgacEqVmomB
 TjVaZe1OZeO37fMb7q7FDUwWIHklig==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2020 23:41, Laurent Pinchart wrote:
> Add semi-planar YUV formats with 10, 12 and 16 bits per components, in
> both 4:2:0 (NV12) and 4:2:2 (NV16) subsampling, and with both chroma
> orderings. They are used by the Xilinx Video Frame Buffer Read/Write IP
> cores.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-yuv-planar.rst           | 564 +++++++++++++++++-
>  include/uapi/linux/videodev2.h                |  12 +
>  2 files changed, 575 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 07081ab05419..7f0fe2e4b668 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -48,6 +48,11 @@ relationship between the luma and chroma line padding and stride.
>  
>  All components are stored with the same number of bits per component.
>  
> +Formats with more than 8 bits per component pack, within each plane, multiple
> +samples in a word (padded as necessary to reach a multiple of 8 bits), which is
> +then stored in memory in little endian byte order. They are named with a suffix
> +indicating the number of bits per component and the number of samples per word.
> +
>  .. flat-table:: Overview of Semi-Planar YUV Formats
>      :header-rows:  1
>      :stub-columns: 0
> @@ -145,6 +150,90 @@ All components are stored with the same number of bits per component.
>        - Cr, Cr
>        - Yes
>        - Linear
> +    * - V4L2_PIX_FMT_NV12_10_3
> +      - 'N012'
> +      - 10
> +      - 4:2:0
> +      - Cb, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV21_10_3
> +      - 'N061'
> +      - 10
> +      - 4:2:0
> +      - Cr, Cr

Should be: Cr, Cb
This happens in several places, just do a search-and-replace.

Regards,

	Hans

> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV16_10_3
> +      - 'N016'
> +      - 10
> +      - 4:2:2
> +      - Cb, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV61_10_3
> +      - 'N061'
> +      - 10
> +      - 4:2:2
> +      - Cr, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV12_12_2
> +      - 'N212'
> +      - 12
> +      - 4:2:0
> +      - Cb, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV21_12_2
> +      - 'N261'
> +      - 12
> +      - 4:2:0
> +      - Cr, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV16_12_2
> +      - 'N216'
> +      - 12
> +      - 4:2:2
> +      - Cb, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV61_12_2
> +      - 'N261'
> +      - 12
> +      - 4:2:2
> +      - Cr, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV12_16_1
> +      - 'N612'
> +      - 16
> +      - 4:2:0
> +      - Cb, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV21_16_1
> +      - 'N661'
> +      - 16
> +      - 4:2:0
> +      - Cr, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV16_16_1
> +      - 'N616'
> +      - 16
> +      - 4:2:2
> +      - Cb, Cr
> +      - Yes
> +      - Linear
> +    * - V4L2_PIX_FMT_NV61_16_1
> +      - 'N661'
> +      - 16
> +      - 4:2:2
> +      - Cr, Cr
> +      - Yes
> +      - Linear
>  
>  .. note::
>  
> @@ -153,7 +242,6 @@ All components are stored with the same number of bits per component.
>        disjoint
>     .. [3] Macroblock size in pixels
>  
> -
>  **Color Sample Location:**
>  Chroma samples are :ref:`interstitially sited<yuv-chroma-centered>`
>  horizontally.
> @@ -463,6 +551,480 @@ number of lines as the luma plane.
>        - Cr\ :sub:`33`
>  
>  
> +.. _V4L2-PIX-FMT-NV12-10-3:
> +.. _V4L2-PIX-FMT-NV21-10-3:
> +.. _V4L2-PIX-FMT-NV16-10-3:
> +.. _V4L2-PIX-FMT-NV61-10-3:
> +
> +NV12_10_3, NV21_10_3, NV16_10_3 and NV61_10_3
> +---------------------------------------------
> +
> +Semi-planar YUV 4:2:0 and 4:2:2 formats with 10 bits per component, stored with
> +3 samples packed in 4 bytes.
> +
> +Within a plane, 3 samples are packed in a 32-bit word, with 2 padding bits.
> +The bits are organized as follows for the first three samples of a luma line
> +and a chroma line.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - 31:30
> +      - 29:20
> +      - 19:10
> +      - 9:0
> +    * - `-`\ [1:0]
> +      - Y'\ :sub:`2`\ [9:0]
> +      - Y'\ :sub:`1`\ [9:0]
> +      - Y'\ :sub:`0`\ [9:0]
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - 31:30
> +      - 29:20
> +      - 19:10
> +      - 9:0
> +    * - `-`\ [1:0]
> +      - Cb\ :sub:`2`\ [9:0]
> +      - Cr\ :sub:`0`\ [9:0]
> +      - Cb\ :sub:`0`\ [9:0]
> +
> +Words are then stored in memory in little endian format. Due to a chroma word
> +storing an odd number of samples, the image width must be a multiple of 6
> +pixels.
> +
> +.. flat-table:: Sample 6x4 NV12_10_3 Image
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00`\ [7:0]
> +      - Y'\ :sub:`01`\ [5:0] Y'\ :sub:`00`\ [9:8]
> +      - Y'\ :sub:`02`\ [3:0] Y'\ :sub:`01`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`02`\ [9:4]
> +      - Y'\ :sub:`03`\ [7:0]
> +      - Y'\ :sub:`04`\ [5:0] Y'\ :sub:`04`\ [9:8]
> +      - Y'\ :sub:`05`\ [3:0] Y'\ :sub:`05`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`05`\ [9:4]
> +    * - start + 8:
> +      - Y'\ :sub:`10`\ [7:0]
> +      - Y'\ :sub:`11`\ [5:0] Y'\ :sub:`10`\ [9:8]
> +      - Y'\ :sub:`12`\ [3:0] Y'\ :sub:`11`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`12`\ [9:4]
> +      - Y'\ :sub:`13`\ [7:0]
> +      - Y'\ :sub:`14`\ [5:0] Y'\ :sub:`14`\ [9:8]
> +      - Y'\ :sub:`15`\ [3:0] Y'\ :sub:`15`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`15`\ [9:4]
> +    * - start + 16:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`21`\ [5:0] Y'\ :sub:`20`\ [9:8]
> +      - Y'\ :sub:`22`\ [3:0] Y'\ :sub:`21`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`22`\ [9:4]
> +      - Y'\ :sub:`23`\ [7:0]
> +      - Y'\ :sub:`24`\ [5:0] Y'\ :sub:`24`\ [9:8]
> +      - Y'\ :sub:`25`\ [3:0] Y'\ :sub:`25`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`25`\ [9:4]
> +    * - start + 24:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`21`\ [5:0] Y'\ :sub:`20`\ [9:8]
> +      - Y'\ :sub:`22`\ [3:0] Y'\ :sub:`21`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`22`\ [9:4]
> +      - Y'\ :sub:`23`\ [7:0]
> +      - Y'\ :sub:`24`\ [5:0] Y'\ :sub:`24`\ [9:8]
> +      - Y'\ :sub:`25`\ [3:0] Y'\ :sub:`25`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`25`\ [9:4]
> +    * - start + 32:
> +      - Cb\ :sub:`00`\ [7:0]
> +      - Cr\ :sub:`00`\ [5:0] Cb\ :sub:`00`\ [9:8]
> +      - Cb\ :sub:`02`\ [3:0] Cr\ :sub:`00`\ [9:6]
> +      - `-`\ [1:0] Cb\ :sub:`02`\ [9:4]
> +      - Cr\ :sub:`02`\ [7:0]
> +      - Cb\ :sub:`04`\ [5:0] Cr\ :sub:`02`\ [9:8]
> +      - Cr\ :sub:`04`\ [3:0] Cb\ :sub:`04`\ [9:6]
> +      - `-`\ [1:0] Cr\ :sub:`04`\ [9:4]
> +    * - start + 40:
> +      - Cb\ :sub:`20`\ [7:0]
> +      - Cr\ :sub:`20`\ [5:0] Cb\ :sub:`20`\ [9:8]
> +      - Cb\ :sub:`22`\ [3:0] Cr\ :sub:`20`\ [9:6]
> +      - `-`\ [1:0] Cb\ :sub:`22`\ [9:4]
> +      - Cr\ :sub:`22`\ [7:0]
> +      - Cb\ :sub:`24`\ [5:0] Cr\ :sub:`22`\ [9:8]
> +      - Cr\ :sub:`24`\ [3:0] Cb\ :sub:`24`\ [9:6]
> +      - `-`\ [1:0] Cr\ :sub:`24`\ [9:4]
> +
> +.. flat-table:: Sample 6x4 NV16_10_3 Image
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00`\ [7:0]
> +      - Y'\ :sub:`01`\ [5:0] Y'\ :sub:`00`\ [9:8]
> +      - Y'\ :sub:`02`\ [3:0] Y'\ :sub:`01`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`02`\ [9:4]
> +      - Y'\ :sub:`03`\ [7:0]
> +      - Y'\ :sub:`04`\ [5:0] Y'\ :sub:`04`\ [9:8]
> +      - Y'\ :sub:`05`\ [3:0] Y'\ :sub:`05`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`05`\ [9:4]
> +    * - start + 8:
> +      - Y'\ :sub:`10`\ [7:0]
> +      - Y'\ :sub:`11`\ [5:0] Y'\ :sub:`10`\ [9:8]
> +      - Y'\ :sub:`12`\ [3:0] Y'\ :sub:`11`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`12`\ [9:4]
> +      - Y'\ :sub:`13`\ [7:0]
> +      - Y'\ :sub:`14`\ [5:0] Y'\ :sub:`14`\ [9:8]
> +      - Y'\ :sub:`15`\ [3:0] Y'\ :sub:`15`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`15`\ [9:4]
> +    * - start + 16:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`21`\ [5:0] Y'\ :sub:`20`\ [9:8]
> +      - Y'\ :sub:`22`\ [3:0] Y'\ :sub:`21`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`22`\ [9:4]
> +      - Y'\ :sub:`23`\ [7:0]
> +      - Y'\ :sub:`24`\ [5:0] Y'\ :sub:`24`\ [9:8]
> +      - Y'\ :sub:`25`\ [3:0] Y'\ :sub:`25`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`25`\ [9:4]
> +    * - start + 24:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`21`\ [5:0] Y'\ :sub:`20`\ [9:8]
> +      - Y'\ :sub:`22`\ [3:0] Y'\ :sub:`21`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`22`\ [9:4]
> +      - Y'\ :sub:`23`\ [7:0]
> +      - Y'\ :sub:`24`\ [5:0] Y'\ :sub:`24`\ [9:8]
> +      - Y'\ :sub:`25`\ [3:0] Y'\ :sub:`25`\ [9:6]
> +      - `-`\ [1:0] Y'\ :sub:`25`\ [9:4]
> +    * - start + 32:
> +      - Cb\ :sub:`00`\ [7:0]
> +      - Cr\ :sub:`00`\ [5:0] Cb\ :sub:`00`\ [9:8]
> +      - Cb\ :sub:`02`\ [3:0] Cr\ :sub:`00`\ [9:6]
> +      - `-`\ [1:0] Cb\ :sub:`02`\ [9:4]
> +      - Cr\ :sub:`02`\ [7:0]
> +      - Cb\ :sub:`04`\ [5:0] Cr\ :sub:`02`\ [9:8]
> +      - Cr\ :sub:`04`\ [3:0] Cb\ :sub:`04`\ [9:6]
> +      - `-`\ [1:0] Cr\ :sub:`04`\ [9:4]
> +    * - start + 40:
> +      - Cb\ :sub:`10`\ [7:0]
> +      - Cr\ :sub:`10`\ [5:0] Cb\ :sub:`10`\ [9:8]
> +      - Cb\ :sub:`12`\ [3:0] Cr\ :sub:`10`\ [9:6]
> +      - `-`\ [1:0] Cb\ :sub:`12`\ [9:4]
> +      - Cr\ :sub:`12`\ [7:0]
> +      - Cb\ :sub:`14`\ [5:0] Cr\ :sub:`12`\ [9:8]
> +      - Cr\ :sub:`14`\ [3:0] Cb\ :sub:`14`\ [9:6]
> +      - `-`\ [1:0] Cr\ :sub:`14`\ [9:4]
> +    * - start + 48:
> +      - Cb\ :sub:`20`\ [7:0]
> +      - Cr\ :sub:`20`\ [5:0] Cb\ :sub:`20`\ [9:8]
> +      - Cb\ :sub:`22`\ [3:0] Cr\ :sub:`20`\ [9:6]
> +      - `-`\ [1:0] Cb\ :sub:`22`\ [9:4]
> +      - Cr\ :sub:`22`\ [7:0]
> +      - Cb\ :sub:`24`\ [5:0] Cr\ :sub:`22`\ [9:8]
> +      - Cr\ :sub:`24`\ [3:0] Cb\ :sub:`24`\ [9:6]
> +      - `-`\ [1:0] Cr\ :sub:`24`\ [9:4]
> +    * - start + 56:
> +      - Cb\ :sub:`30`\ [7:0]
> +      - Cr\ :sub:`30`\ [5:0] Cb\ :sub:`30`\ [9:8]
> +      - Cb\ :sub:`32`\ [3:0] Cr\ :sub:`30`\ [9:6]
> +      - `-`\ [1:0] Cb\ :sub:`32`\ [9:4]
> +      - Cr\ :sub:`32`\ [7:0]
> +      - Cb\ :sub:`34`\ [5:0] Cr\ :sub:`32`\ [9:8]
> +      - Cr\ :sub:`34`\ [3:0] Cb\ :sub:`34`\ [9:6]
> +      - `-`\ [1:0] Cr\ :sub:`34`\ [9:4]
> +
> +
> +.. _V4L2-PIX-FMT-NV12-12-2:
> +.. _V4L2-PIX-FMT-NV21-12-2:
> +.. _V4L2-PIX-FMT-NV16-12-2:
> +.. _V4L2-PIX-FMT-NV61-12-2:
> +
> +NV12_12_2, NV21_12_2, NV16_12_2 and NV61_12_2
> +---------------------------------------------
> +
> +Semi-planar YUV 4:2:0 and 4:2:2 formats with 12 bits per component, stored with
> +2 samples packed in 3 bytes.
> +
> +Within a plane, 2 samples are packed in a 24-bit word, with no padding bits.
> +The bits are organized as follows for the first two samples of a luma line
> +and a chroma line.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - 23:12
> +      - 11:0
> +    * - Y'\ :sub:`1`\ [11:0]
> +      - Y'\ :sub:`0`\ [11:0]
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - 23:12
> +      - 11:0
> +    * - Cr\ :sub:`0`\ [11:0]
> +      - Cb\ :sub:`0`\ [11:0]
> +
> +Words are then stored in memory in little endian format.
> +
> +.. flat-table:: Sample 4x4 NV12_12_2 Image
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00`\ [7:0]
> +      - Y'\ :sub:`01`\ [3:0] Y'\ :sub:`00`\ [11:8]
> +      - Y'\ :sub:`01`\ [11:4]
> +      - Y'\ :sub:`02`\ [7:0]
> +      - Y'\ :sub:`03`\ [3:0] Y'\ :sub:`02`\ [11:8]
> +      - Y'\ :sub:`03`\ [11:4]
> +    * - start + 6:
> +      - Y'\ :sub:`10`\ [7:0]
> +      - Y'\ :sub:`11`\ [3:0] Y'\ :sub:`10`\ [11:8]
> +      - Y'\ :sub:`11`\ [11:4]
> +      - Y'\ :sub:`12`\ [7:0]
> +      - Y'\ :sub:`13`\ [3:0] Y'\ :sub:`12`\ [11:8]
> +      - Y'\ :sub:`13`\ [11:4]
> +    * - start + 12:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`21`\ [3:0] Y'\ :sub:`20`\ [11:8]
> +      - Y'\ :sub:`21`\ [11:4]
> +      - Y'\ :sub:`22`\ [7:0]
> +      - Y'\ :sub:`23`\ [3:0] Y'\ :sub:`22`\ [11:8]
> +      - Y'\ :sub:`23`\ [11:4]
> +    * - start + 18:
> +      - Y'\ :sub:`30`\ [7:0]
> +      - Y'\ :sub:`31`\ [3:0] Y'\ :sub:`30`\ [11:8]
> +      - Y'\ :sub:`31`\ [11:4]
> +      - Y'\ :sub:`32`\ [7:0]
> +      - Y'\ :sub:`33`\ [3:0] Y'\ :sub:`32`\ [11:8]
> +      - Y'\ :sub:`33`\ [11:4]
> +    * - start + 24:
> +      - Cb\ :sub:`00`\ [7:0]
> +      - Cr\ :sub:`00`\ [3:0] Cb\ :sub:`00`\ [11:8]
> +      - Cr\ :sub:`00`\ [11:4]
> +      - Cb\ :sub:`02`\ [7:0]
> +      - Cr\ :sub:`02`\ [3:0] Cb\ :sub:`02`\ [11:8]
> +      - Cr\ :sub:`02`\ [11:4]
> +    * - start + 30:
> +      - Cb\ :sub:`20`\ [7:0]
> +      - Cr\ :sub:`20`\ [3:0] Cb\ :sub:`20`\ [11:8]
> +      - Cr\ :sub:`20`\ [11:4]
> +      - Cb\ :sub:`22`\ [7:0]
> +      - Cr\ :sub:`22`\ [3:0] Cb\ :sub:`22`\ [11:8]
> +      - Cr\ :sub:`22`\ [11:4]
> +
> +.. flat-table:: Sample 4x4 NV16_12_2 Image
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00`\ [7:0]
> +      - Y'\ :sub:`01`\ [3:0] Y'\ :sub:`00`\ [11:8]
> +      - Y'\ :sub:`01`\ [11:4]
> +      - Y'\ :sub:`02`\ [7:0]
> +      - Y'\ :sub:`03`\ [3:0] Y'\ :sub:`02`\ [11:8]
> +      - Y'\ :sub:`03`\ [11:4]
> +    * - start + 6:
> +      - Y'\ :sub:`10`\ [7:0]
> +      - Y'\ :sub:`11`\ [3:0] Y'\ :sub:`10`\ [11:8]
> +      - Y'\ :sub:`11`\ [11:4]
> +      - Y'\ :sub:`12`\ [7:0]
> +      - Y'\ :sub:`13`\ [3:0] Y'\ :sub:`12`\ [11:8]
> +      - Y'\ :sub:`13`\ [11:4]
> +    * - start + 12:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`21`\ [3:0] Y'\ :sub:`20`\ [11:8]
> +      - Y'\ :sub:`21`\ [11:4]
> +      - Y'\ :sub:`22`\ [7:0]
> +      - Y'\ :sub:`23`\ [3:0] Y'\ :sub:`22`\ [11:8]
> +      - Y'\ :sub:`23`\ [11:4]
> +    * - start + 18:
> +      - Y'\ :sub:`30`\ [7:0]
> +      - Y'\ :sub:`31`\ [3:0] Y'\ :sub:`30`\ [11:8]
> +      - Y'\ :sub:`31`\ [11:4]
> +      - Y'\ :sub:`32`\ [7:0]
> +      - Y'\ :sub:`33`\ [3:0] Y'\ :sub:`32`\ [11:8]
> +      - Y'\ :sub:`33`\ [11:4]
> +    * - start + 24:
> +      - Cb\ :sub:`00`\ [7:0]
> +      - Cr\ :sub:`00`\ [3:0] Cb\ :sub:`00`\ [11:8]
> +      - Cr\ :sub:`00`\ [11:4]
> +      - Cb\ :sub:`02`\ [7:0]
> +      - Cr\ :sub:`02`\ [3:0] Cb\ :sub:`02`\ [11:8]
> +      - Cr\ :sub:`02`\ [11:4]
> +    * - start + 30:
> +      - Cb\ :sub:`10`\ [7:0]
> +      - Cr\ :sub:`10`\ [3:0] Cb\ :sub:`10`\ [11:8]
> +      - Cr\ :sub:`10`\ [11:4]
> +      - Cb\ :sub:`12`\ [7:0]
> +      - Cr\ :sub:`12`\ [3:0] Cb\ :sub:`12`\ [11:8]
> +      - Cr\ :sub:`12`\ [11:4]
> +    * - start + 36:
> +      - Cb\ :sub:`20`\ [7:0]
> +      - Cr\ :sub:`20`\ [3:0] Cb\ :sub:`20`\ [11:8]
> +      - Cr\ :sub:`20`\ [11:4]
> +      - Cb\ :sub:`22`\ [7:0]
> +      - Cr\ :sub:`22`\ [3:0] Cb\ :sub:`22`\ [11:8]
> +      - Cr\ :sub:`22`\ [11:4]
> +    * - start + 42:
> +      - Cb\ :sub:`30`\ [7:0]
> +      - Cr\ :sub:`30`\ [3:0] Cb\ :sub:`30`\ [11:8]
> +      - Cr\ :sub:`30`\ [11:4]
> +      - Cb\ :sub:`32`\ [7:0]
> +      - Cr\ :sub:`32`\ [3:0] Cb\ :sub:`32`\ [11:8]
> +      - Cr\ :sub:`32`\ [11:4]
> +
> +
> +.. _V4L2-PIX-FMT-NV12-16-1:
> +.. _V4L2-PIX-FMT-NV21-16-1:
> +.. _V4L2-PIX-FMT-NV16-16-1:
> +.. _V4L2-PIX-FMT-NV61-16-1:
> +
> +NV12_16_1, NV21_16_1, NV16_16_1 and NV61_16_1
> +---------------------------------------------
> +
> +Semi-planar YUV 4:2:0 and 4:2:2 formats with 16 bits per component. 16-bit
> +samples are stored in memory in little endian format.
> +
> +.. flat-table:: Sample 4x4 NV12_16_1 Image
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00`\ [7:0]
> +      - Y'\ :sub:`00`\ [15:8]
> +      - Y'\ :sub:`01`\ [7:0]
> +      - Y'\ :sub:`01`\ [15:8]
> +      - Y'\ :sub:`02`\ [7:0]
> +      - Y'\ :sub:`02`\ [15:8]
> +      - Y'\ :sub:`03`\ [7:0]
> +      - Y'\ :sub:`03`\ [15:8]
> +    * - start + 8:
> +      - Y'\ :sub:`10`\ [7:0]
> +      - Y'\ :sub:`10`\ [15:8]
> +      - Y'\ :sub:`11`\ [7:0]
> +      - Y'\ :sub:`11`\ [15:8]
> +      - Y'\ :sub:`12`\ [7:0]
> +      - Y'\ :sub:`12`\ [15:8]
> +      - Y'\ :sub:`13`\ [7:0]
> +      - Y'\ :sub:`13`\ [15:8]
> +    * - start + 16:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`20`\ [15:8]
> +      - Y'\ :sub:`21`\ [7:0]
> +      - Y'\ :sub:`21`\ [15:8]
> +      - Y'\ :sub:`22`\ [7:0]
> +      - Y'\ :sub:`22`\ [15:8]
> +      - Y'\ :sub:`23`\ [7:0]
> +      - Y'\ :sub:`23`\ [15:8]
> +    * - start + 24:
> +      - Y'\ :sub:`30`\ [7:0]
> +      - Y'\ :sub:`30`\ [15:8]
> +      - Y'\ :sub:`31`\ [7:0]
> +      - Y'\ :sub:`31`\ [15:8]
> +      - Y'\ :sub:`32`\ [7:0]
> +      - Y'\ :sub:`32`\ [15:8]
> +      - Y'\ :sub:`33`\ [7:0]
> +      - Y'\ :sub:`33`\ [15:8]
> +    * - start + 32:
> +      - Cb\ :sub:`00`\ [7:0]
> +      - Cb\ :sub:`00`\ [15:8]
> +      - Cr\ :sub:`00`\ [7:0]
> +      - Cr\ :sub:`00`\ [15:8]
> +      - Cb\ :sub:`02`\ [7:0]
> +      - Cb\ :sub:`02`\ [15:8]
> +      - Cr\ :sub:`02`\ [7:0]
> +      - Cr\ :sub:`02`\ [15:8]
> +    * - start + 40:
> +      - Cb\ :sub:`20`\ [7:0]
> +      - Cb\ :sub:`20`\ [15:8]
> +      - Cr\ :sub:`20`\ [7:0]
> +      - Cr\ :sub:`20`\ [15:8]
> +      - Cb\ :sub:`22`\ [7:0]
> +      - Cb\ :sub:`22`\ [15:8]
> +      - Cr\ :sub:`22`\ [7:0]
> +      - Cr\ :sub:`22`\ [15:8]
> +
> +.. flat-table:: Sample 4x4 NV16_16_1 Image
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - start + 0:
> +      - Y'\ :sub:`00`\ [7:0]
> +      - Y'\ :sub:`00`\ [15:8]
> +      - Y'\ :sub:`01`\ [7:0]
> +      - Y'\ :sub:`01`\ [15:8]
> +      - Y'\ :sub:`02`\ [7:0]
> +      - Y'\ :sub:`02`\ [15:8]
> +      - Y'\ :sub:`03`\ [7:0]
> +      - Y'\ :sub:`03`\ [15:8]
> +    * - start + 8:
> +      - Y'\ :sub:`10`\ [7:0]
> +      - Y'\ :sub:`10`\ [15:8]
> +      - Y'\ :sub:`11`\ [7:0]
> +      - Y'\ :sub:`11`\ [15:8]
> +      - Y'\ :sub:`12`\ [7:0]
> +      - Y'\ :sub:`12`\ [15:8]
> +      - Y'\ :sub:`13`\ [7:0]
> +      - Y'\ :sub:`13`\ [15:8]
> +    * - start + 16:
> +      - Y'\ :sub:`20`\ [7:0]
> +      - Y'\ :sub:`20`\ [15:8]
> +      - Y'\ :sub:`21`\ [7:0]
> +      - Y'\ :sub:`21`\ [15:8]
> +      - Y'\ :sub:`22`\ [7:0]
> +      - Y'\ :sub:`22`\ [15:8]
> +      - Y'\ :sub:`23`\ [7:0]
> +      - Y'\ :sub:`23`\ [15:8]
> +    * - start + 24:
> +      - Y'\ :sub:`30`\ [7:0]
> +      - Y'\ :sub:`30`\ [15:8]
> +      - Y'\ :sub:`31`\ [7:0]
> +      - Y'\ :sub:`31`\ [15:8]
> +      - Y'\ :sub:`32`\ [7:0]
> +      - Y'\ :sub:`32`\ [15:8]
> +      - Y'\ :sub:`33`\ [7:0]
> +      - Y'\ :sub:`33`\ [15:8]
> +    * - start + 32:
> +      - Cb\ :sub:`00`\ [7:0]
> +      - Cb\ :sub:`00`\ [15:8]
> +      - Cr\ :sub:`00`\ [7:0]
> +      - Cr\ :sub:`00`\ [15:8]
> +      - Cb\ :sub:`02`\ [7:0]
> +      - Cb\ :sub:`02`\ [15:8]
> +      - Cr\ :sub:`02`\ [7:0]
> +      - Cr\ :sub:`02`\ [15:8]
> +    * - start + 40:
> +      - Cb\ :sub:`10`\ [7:0]
> +      - Cb\ :sub:`10`\ [15:8]
> +      - Cr\ :sub:`10`\ [7:0]
> +      - Cr\ :sub:`10`\ [15:8]
> +      - Cb\ :sub:`12`\ [7:0]
> +      - Cb\ :sub:`12`\ [15:8]
> +      - Cr\ :sub:`12`\ [7:0]
> +      - Cr\ :sub:`12`\ [15:8]
> +    * - start + 48:
> +      - Cb\ :sub:`20`\ [7:0]
> +      - Cb\ :sub:`20`\ [15:8]
> +      - Cr\ :sub:`20`\ [7:0]
> +      - Cr\ :sub:`20`\ [15:8]
> +      - Cb\ :sub:`22`\ [7:0]
> +      - Cb\ :sub:`22`\ [15:8]
> +      - Cr\ :sub:`22`\ [7:0]
> +      - Cr\ :sub:`22`\ [15:8]
> +    * - start + 56:
> +      - Cb\ :sub:`30`\ [7:0]
> +      - Cb\ :sub:`30`\ [15:8]
> +      - Cr\ :sub:`30`\ [7:0]
> +      - Cr\ :sub:`30`\ [15:8]
> +      - Cb\ :sub:`32`\ [7:0]
> +      - Cb\ :sub:`32`\ [15:8]
> +      - Cr\ :sub:`32`\ [7:0]
> +      - Cr\ :sub:`32`\ [15:8]
> +
> +
>  Fully Planar YUV Formats
>  ========================
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index cf9288d270c6..3c4609ff83d6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -616,6 +616,18 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
>  #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
>  #define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8  YUV 4:2:0 16x16 macroblocks */
> +#define V4L2_PIX_FMT_NV12_10_3 v4l2_fourcc('N', '0', '1', '2') /* 16  Y/CbCr 4:2:0 10b */
> +#define V4L2_PIX_FMT_NV21_10_3 v4l2_fourcc('N', '0', '2', '1') /* 16  Y/CrCb 4:2:0 10b */
> +#define V4L2_PIX_FMT_NV16_10_3 v4l2_fourcc('N', '0', '1', '6') /* 64/3 Y/CbCr 4:2:2 10b */
> +#define V4L2_PIX_FMT_NV61_10_3 v4l2_fourcc('N', '0', '6', '1') /* 64/3 Y/CrCb 4:2:2 10b */
> +#define V4L2_PIX_FMT_NV12_12_2 v4l2_fourcc('N', '2', '1', '2') /* 18  Y/CbCr 4:2:0 12b */
> +#define V4L2_PIX_FMT_NV21_12_2 v4l2_fourcc('N', '2', '2', '1') /* 18  Y/CrCb 4:2:0 12b */
> +#define V4L2_PIX_FMT_NV16_12_2 v4l2_fourcc('N', '2', '1', '6') /* 24  Y/CbCr 4:2:2 12b */
> +#define V4L2_PIX_FMT_NV61_12_2 v4l2_fourcc('N', '2', '6', '1') /* 24  Y/CrCb 4:2:2 12b */
> +#define V4L2_PIX_FMT_NV12_16_1 v4l2_fourcc('N', '6', '1', '2') /* 24  Y/CbCr 4:2:0 16b */
> +#define V4L2_PIX_FMT_NV21_16_1 v4l2_fourcc('N', '6', '2', '1') /* 24  Y/CrCb 4:2:0 16b */
> +#define V4L2_PIX_FMT_NV16_16_1 v4l2_fourcc('N', '6', '1', '6') /* 32  Y/CbCr 4:2:2 16b */
> +#define V4L2_PIX_FMT_NV61_16_1 v4l2_fourcc('N', '6', '6', '1') /* 32  Y/CrCb 4:2:2 16b */
>  
>  /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */
> 

