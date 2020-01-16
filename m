Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111A413D7E6
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 11:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgAPKa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 05:30:26 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:34483 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbgAPKa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 05:30:26 -0500
Received: from [IPv6:2001:420:44c1:2577:1825:cb8:c622:6168]
 ([IPv6:2001:420:44c1:2577:1825:cb8:c622:6168])
        by smtp-cloud9.xs4all.net with ESMTPA
        id s2PniJWzoT6sRs2PricrHs; Thu, 16 Jan 2020 11:30:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579170623; bh=kn7bUSdZ2Fasrf3hZzW73u5tRI6ZSWWaoFUv/HUNxNE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uC6CkSm7DDqXaHTcgovlMkoa7drUCK8oBD0nrZfV0Cgr8hUqbQqjigPdVPNzflqNl
         ZwEbkVXMvvj/4P6XcjPj42lj0D537yqJj0aYSR+EmFaq51s4RALOcK8VgsaatGgZRV
         oxAF5Hz/pHng54iU+u+pqyrj1/343fF/CbYz4AK5zrQXiaDAKMYb/zMKf3vq6BUqRO
         vWkEODCguvf4MxFXlpvbUuUxxoCN8LaTmhIo5rCBE20IJUs/9NYSUmwsf9GgSo+4ga
         H5YTo8vnGYDHmKts+MRpIUxuRjLUkbwPQRl6wApEw2ccT5GGz1QVn/RoPfT8eUBz1N
         u8BEZUnC95USw==
Subject: Re: [PATCH v5 0/5] Add support for mt2701 JPEG ENC support
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
References: <20191204094424.2562-1-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e62010b2-a2c1-cf52-139f-5f0134605195@xs4all.nl>
Date:   Thu, 16 Jan 2020 11:30:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204094424.2562-1-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLx4+oarlH9NOKPID7K7G8V0SUpdV50ZS509UQ+6bf01fg9VgNH2/YXnhVVenenH8SjBYRQ8/LGm/4twIwDgTbdCNN+sUQwBDJ4Sd0eRC2HMSsjX1DId
 HAbn+UnktBFG9VQkbvguOpWrsdNLs6r3sZgM18LRSawjJgO3nVTYawHDFACK7/anPAz8nOcCeUekFHYouB7n1AGJaBFmkaWDidn51Qgpo0myxHsTq5ZoimAW
 j0QwovbyKwLzGlxoLlYqNWPm4AknlEDzAfP3pCFCUU96NqWUoCB+XPAKSnsZFhBsHE6PmsRpxPfGTFZUFw7vph6uWjNkEOOHF05e7r2X46huel2Ap+K7R6z/
 cjPDJ+ErxDxZLUzs78mScDnt4D/jl6OF8B+4kS0b9X2ZELnYRRim5X4bl5dRIZ9v0S8xoPmoHyAIj/VGfH6EipcSYNx4Tvqa3+uNGgGtdZ0VO83T/8b5XRxb
 4u30FTHXPsjQlRitJVSugNz1knHJmXVWdZQylILffHO58HVojvh409xnJ7jNdZ8bErxzz0aknpmjTgF9JDdj2zla3EzbVP8vMa/J1idyVz58bcriikLGs9F/
 IPPp7vPA8bkrlLtOdXgLm7BLGpWgRY1JbMCkaev1k8fDBfGLBmx9nHm6g1AIj+7bPu1vp1EMBcqBeLG+2LeYQW3zdkiKrzDa0mKghrAlB6P2ZnlhUMvrBD1x
 abHlHtyzz6dv/feufdly+BF1H/upqJRGUuJQHtwadDEliwLs+zD/Ug==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

I get checkpatch, compiler and sparse/smatch warnings when I try to
compile this series.

checkpatch.pl --strict gives:

0001-media-platform-Fix-jpeg-dec-driver-bug-and-improve-c.patch
---------------------------------------------------------------
CHECK: Alignment should match open parenthesis
#221: FILE: drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c:157:
+               param->comp_w[i] = round_up(param->comp_w[i],
                                                  MTK_JPEG_DCTSIZE);

0004-media-platform-Add-jpeg-dec-enc-feature.patch
--------------------------------------------------
CHECK: spaces preferred around that '+' (ctx:VxV)
#289: FILE: drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:335:
+                                       pix_mp->width * pix_mp->height / (i+1);
                                                                           ^

CHECK: Alignment should match open parenthesis
#312: FILE: drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:358:
+static int mtk_jpeg_try_dec_fmt_mplane(struct v4l2_format *f,
                                   struct mtk_jpeg_fmt *fmt,

CHECK: Avoid CamelCase: <mtk_jpeg_enc_set_encFormat>
#587: FILE: drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1037:
+       mtk_jpeg_enc_set_encFormat(base, ctx->out_q.fmt->fourcc);


Compiler warnings:

drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function 'vidioc_jpeg_s_ctrl':
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:147:23: warning: unused variable 'jpeg' [-Wunused-variable]
  147 |  struct mtk_jpeg_dev *jpeg = ctx->jpeg;
      |                       ^~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_try_enc_fmt_mplane':
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:299:18: warning: unused variable 'align_h' [-Wunused-variable]
  299 |  int i, align_w, align_h;
      |                  ^~~~~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:299:9: warning: unused variable 'align_w' [-Wunused-variable]
  299 |  int i, align_w, align_h;
      |         ^~~~~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:298:23: warning: unused variable 'jpeg' [-Wunused-variable]
  298 |  struct mtk_jpeg_dev *jpeg = ctx->jpeg;
      |                       ^~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_try_dec_fmt_mplane':
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:362:23: warning: unused variable 'jpeg' [-Wunused-variable]
  362 |  struct mtk_jpeg_dev *jpeg = ctx->jpeg;
      |                       ^~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_device_run':
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1061:16: warning: unused variable 'flags' [-Wunused-variable]
 1061 |  unsigned long flags;
      |                ^~~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c: In function 'mtk_jpeg_enc_set_encFormat':
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:125:6: warning: 'yuv_format' may be used uninitialized in this function [-Wmaybe-uninitialized]
  125 |  u32 yuv_format, value;
      |      ^~~~~~~~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c: In function 'mtk_jpeg_enc_set_ctrl_cfg':
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:221:8: warning: 'enc_quality' may be used uninitialized in this function [-Wmaybe-uninitialized]
  221 |  value = JPEG_ENC_SET_QUALITY(value, enc_quality);
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:211:9: note: 'enc_quality' was declared here
  211 |  u32 i, enc_quality;
      |         ^~~~~~~~~~~

Sparse warnings:

SPARSE:drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:169:5:  warning: symbol 'mtk_jpeg_ctrls_setup' was not declared. Should it be static?
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:147:23: warning: unused variable 'jpeg' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:169:5: warning: no previous prototype for 'mtk_jpeg_ctrls_setup' [-Wmissing-prototypes]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:299:18: warning: unused variable 'align_h' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:299:9: warning: unused variable 'align_w' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:298:23: warning: unused variable 'jpeg' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:362:23: warning: unused variable 'jpeg' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1061:16: warning: unused variable 'flags' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:125:6: warning: 'yuv_format' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:221:8: warning: 'enc_quality' may be used uninitialized in this function [-Wmaybe-uninitialized]

Smatch errors/warnings:

drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c: drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:146 mtk_jpeg_enc_set_encFormat() error: uninitialized symbol 'yuv_format'.
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c: drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:221 mtk_jpeg_enc_set_quality() error: uninitialized symbol 'enc_quality'.
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:125:6: warning: 'yuv_format' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c:221:8: warning: 'enc_quality' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:147:23: warning: unused variable 'jpeg' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:169:5: warning: no previous prototype for 'mtk_jpeg_ctrls_setup' [-Wmissing-prototypes]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:299:18: warning: unused variable 'align_h' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:299:9: warning: unused variable 'align_w' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:298:23: warning: unused variable 'jpeg' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:362:23: warning: unused variable 'jpeg' [-Wunused-variable]
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1061:16: warning: unused variable 'flags' [-Wunused-variable]

Please fix!

Regards,

	Hans

On 12/4/19 10:44 AM, Xia Jiang wrote:
> This patchset add support for mt2701 JPEG ENC support.
> 
> This is the compliance test result for jpeg dec and enc.
> 
> The JPEG dec log:
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video0
> v4l2-compliance SHA: af33cc5ef00177edbb45d466faf9061197767f2b, 32 bits
> 
> Compliance test for mtk-jpeg device /dev/video0:
> 
> Driver Info:
>         Driver name      : mtk-jpeg
>         Card type        : mtk-jpeg decoder
>         Bus info         : platform:15004000.jpegdec
>         Driver version   : 5.4.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected JPEG Decoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK
>         test Scaling: OK
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for mtk-jpeg device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0
> ------------------------------------------------------------
> 
> The JPEG enc log:
> 
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video1 
> v4l2-compliance SHA: af33cc5ef00177edbb45d466faf9061197767f2b, 32 bits
> 
> Compliance test for mtk-jpeg device /dev/video1:
> 
> Driver Info:
>         Driver name      : mtk-jpeg
>         Card type        : mtk-jpeg encoder
>         Bus info         : platform:1500a000.jpegenc
>         Driver version   : 5.4.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected JPEG Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 4 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for mtk-jpeg device /dev/video1: 44, Succeeded: 44, Failed: 0, Warnings: 0
> ------------------------------------------------------------
> 
> Change compared to v4:
> -improve code quality for the orignal jpeg decode driver in separate patch.
> -support crop for jpeg encode and compose for jpeg decode separately.
> -delete jpeg_enc_param/mtk_jpeg_enc_param structure.
> -delete mtk_jpeg_set_param() for jpeg encode.
> -use clamp() to replace mtk_jpeg_bound_align_image() and round_up() to
>  replace mtk_jpeg_align().
> -move macro definition about hw to mtk_jpeg_enc_reg.h.
> -delete unnecessary V4L2 logs in driver.
> -cancel spin lock and unlock operation in deviec run function.
> -change jpeg enc register offset hex numberals from upercase to lowercase.
> 
> Xia Jiang (5):
>   media: platform: Fix jpeg dec driver bug and improve code quality
>   media: dt-bindings: Add jpeg enc device tree node document
>   arm: dts: Add jpeg enc device tree node
>   media: platform: Rename jpeg dec file name
>   media: platform: Add jpeg dec/enc feature
> 
>  .../bindings/media/mediatek-jpeg-encoder.txt  |  37 +
>  arch/arm/boot/dts/mt2701.dtsi                 |  13 +
>  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 752 +++++++++++++-----
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  50 +-
>  .../{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}      |   8 +-
>  .../{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}      |  14 +-
>  ...{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} |   2 +-
>  ...{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} |   2 +-
>  .../{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}    |  19 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 271 +++++++
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  86 ++
>  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  78 ++
>  13 files changed, 1100 insertions(+), 237 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (98%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (89%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
>  rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (77%)
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> 

