Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0DE15DA40
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 16:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbgBNPEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 10:04:52 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41477 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729314AbgBNPEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 10:04:52 -0500
Received: from [IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef]
 ([IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2cWPjJP7i8i432cWQjQOFn; Fri, 14 Feb 2020 16:04:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581692690; bh=jfgZCMwKGh7eRuI/zjy8W67xBkZ5fm6VCvCQhPom9X4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wbfGJUh9UU39Uj6YRgoxg5RQTyWguqt2+A2Fuu61WLSHdYWA/AoFjJNUMP+uHXowF
         XCw+MtiINuakssbH+M1u/r/J/cbuEKiZQT9tiL+d0K9iaZmCwi33VYZ/p7354rYqCW
         lFhDsFcDEWahV3y/00I+mpA3uD3lqGTcLc9s4ST25erVSAOA7MNM0TKRBE/S54nuDD
         kvLWDc1/qTmkUQc3Gwg6pUjchSVz6+hiWcKjITVXTSdkCxdSbIm2izVFSPRuob3u/p
         VFFzFPafXu9c/Se3rfOeTuR6IdD7ELEO8LhoRiV1V7eGh9lVq61lThEoe+97r0fBEl
         Pg7doy7XeKfzA==
Subject: Re: [PATCH v4 5/5] media: meson: vdec: add VP9 decoder support
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200206084152.7070-1-narmstrong@baylibre.com>
 <20200206084152.7070-6-narmstrong@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <444673d2-f1f0-bfe8-1aa2-b37cbdec6231@xs4all.nl>
Date:   Fri, 14 Feb 2020 16:04:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206084152.7070-6-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFNdI5qioRE4ZTzJD1OWEs/FwuSg+GRIzzIndRyH6rbfMxZ0OCM6RKuim/d0+6+RsdywWM4lMusKcJLMkdSpyxqjmP/giZIaZzX78/rJODFKCOSXKpJD
 qrfdJ3GISg2BE2sQWvgv9vYNHQgI+OA6g5m0FqGPYtyfd2HuxWwoG5Z0Y2m3ERDj7tERbXGDwjpxcJSyJAA97KTB3D+iwyiIT3CdHuZVp0Oh6tRQATMk8uqz
 JCKdmk3zFCXO1yEjzx85d7SdEXyiMAyxHk5oIhpG7CISThGw6qveYliBNeK8C6/wYljtOhpoSGIr5ZXytThNaDXLj1kBBX/XFtQ+97y87cXFgm86uYGGSnuO
 hdybGVGnSjnkm84SG9LMSOit2xz5IGQWSuKHwwfY3VOSHjUi1wy/ZLP/wTHQs4MZm83LcArheX77f4DO98pJSqftfCoiJ+MikHFQGGERcDj1nfyBaMJiQhEh
 0shWJ4XYVzpypV3APadCIlnMlL0R8DzU3WZPO5ro5T6be1JeY77fhVHUEKprZaM4FY5BAJPjdKVnFBrb
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/6/20 9:41 AM, Neil Armstrong wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> This adds VP9 decoding for the Amlogic GXL, G12A & SM1 SoCs, using
> the commong "HEVC" HW decoder.
> 
> For G12A & SM1, it uses the IOMMU support from the firmware.
> 
> For 10bit decoding, the firmware can only decode in the proprietary
> Amlogic Framebuffer Compression format, but can output in 8bit NV12
> buffer while writing the decoded frame.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/staging/media/meson/vdec/Makefile     |    2 +-
>  drivers/staging/media/meson/vdec/codec_vp9.c  | 2138 +++++++++++++++++
>  drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
>  drivers/staging/media/meson/vdec/hevc_regs.h  |    7 +
>  drivers/staging/media/meson/vdec/vdec.c       |    5 +
>  .../staging/media/meson/vdec/vdec_helpers.c   |    4 +
>  .../staging/media/meson/vdec/vdec_platform.c  |   38 +
>  7 files changed, 2206 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
> 
> diff --git a/drivers/staging/media/meson/vdec/Makefile b/drivers/staging/media/meson/vdec/Makefile
> index f55b6e625034..6e726af84ac9 100644
> --- a/drivers/staging/media/meson/vdec/Makefile
> +++ b/drivers/staging/media/meson/vdec/Makefile
> @@ -3,6 +3,6 @@
>  
>  meson-vdec-objs = esparser.o vdec.o vdec_helpers.o vdec_platform.o
>  meson-vdec-objs += vdec_1.o vdec_hevc.o
> -meson-vdec-objs += codec_mpeg12.o codec_h264.o codec_hevc_common.o
> +meson-vdec-objs += codec_mpeg12.o codec_h264.o codec_hevc_common.o codec_vp9.o
>  
>  obj-$(CONFIG_VIDEO_MESON_VDEC) += meson-vdec.o
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
> new file mode 100644
> index 000000000000..e7ffbc6dd892
> --- /dev/null
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -0,0 +1,2138 @@

...

> +#define ROUND_POWER_OF_TWO(value, num) (((value) + (1 << ((num) - 1))) >> (num))

Checkpatch says:

CHECK: Macro argument reuse 'num' - possible side-effects?
#377: FILE: drivers/staging/media/meson/vdec/codec_vp9.c:330:
+#define ROUND_POWER_OF_TWO(value, num) (((value) + (1 << ((num) - 1))) >> (num))

While num is const in this source, I do prefer if this is turned into a static inline.

It's just safer.

Regards,

	Hans
