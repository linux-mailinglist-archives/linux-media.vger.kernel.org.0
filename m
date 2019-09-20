Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3225FB8CAF
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 10:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404925AbfITIZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 04:25:06 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41561 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404617AbfITIZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 04:25:06 -0400
Received: from [IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d] ([IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BEDuiUAZp9D4hBEDvici7v; Fri, 20 Sep 2019 10:25:03 +0200
Subject: Re: [Patch 00/13] media: am437x-vpfe: overdue maintenance
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190919204125.15254-1-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5fe1a8a8-6172-fefa-639d-42f5be783227@xs4all.nl>
Date:   Fri, 20 Sep 2019 10:25:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190919204125.15254-1-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCEl8Zg+pT8jUZ1VC/6ND5ioAgkQ/bpYt96qNa0T48BgXQteVJe12DIco1ekeDWG0KGXCCOmVyoG+bu2cGai+/rsGNXyiqlXXrot0rSKPPzlSaqQFG9O
 2fgqcGxJa4KP6U2qASFXOSfFLFt5MTXQ8V1r7OnhgnuVJ4QPXqQeRnJ3aLL4mtyUKRAIbd9KaOhOUY/rNGKLxqvCy/5zYfF/bBX+4bAvis4MhrJfFDyhNB9v
 5d5Z/Op7djU+fM/1jBTTiXTCPSsRvidDVmln7vBg7MJlEoRzrszfNZ0XWVJgYNKzRbh0JvXs9u/VygH5tM8G6feYLgjPn3Qsj1pI4qG5F78suAe9AIKZBRxW
 il/mLuW6+Vg5paaNNegnAH/VubOz6nI/qUtL8xAPln3Lqd/znfc2y9IZq+BzilKwayq3r57U
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/19/19 10:41 PM, Benoit Parrot wrote:
> This patch series is a collection of patches we have been carrying for a
> while.
> 
> A few patches do fix actual bug and v4l2-compliance errors/warnings.
> Other are drivers re-work to simplify/clarify the code for easier
> maintenance.
> 
> We also include the SPDX Licensing update which seemed to have been
> missed by the global script thus far.
> 
> Changes since v1:
> - Address review comment from Joe, Hans and Prabhakar
> - Cleaned-up the function entry debug log
> - Split off the pcr change into its own patch
> - Rework/combine two patches but remove code churn
> - fix miscellaneous typos

Just to verify: this patch from v1 has been dropped in this v2, right?

[Patch 08/13] media: am437x-vpfe: Maintain a reference to the current vpfe_fmt

Regards,

	Hans

> 
> =============================
> 
> v4l2-compliance SHA: 5b168dc8473911227890526bad26553d9e8ff81b, 32 bits
> 
> Compliance test for vpfe device /dev/video0:
> 
> Driver Info:
> 	Driver name      : vpfe
> 	Card type        : TI AM437x VPFE
> 	Bus info         : platform:vpfe 48326000.vpfe
> 	Driver version   : 5.3.0
> 	Capabilities     : 0x85200001
> 		Vide o Capture
> 		Read/Write
> 		Streaming
> 		Extended Pix Format
> 		D evice Capabilities
> 	Device Caps      : 0x05200001
> 		Video Capt ure
> 		Read/Write
> 		Streaming
> 		Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 3 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 		fail: v4l2-test-formats.cpp(1419): node->frmsizes_count[pixfmt] > 1
> 	test Cropping: FAIL
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK
> 	test blocking wait: OK
> 	test MMAP (no poll): OK                           
> 	test MMAP (select): OK                            
> 	test MMAP (epoll): OK                             
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for vpfe device /dev/video0: 51, Succeeded: 50, Failed: 1, Warnings: 0
> dd
> ============================
> 
> Benoit Parrot (12):
>   media: am437x-vpfe: Fix missing first line
>   media: am437x-vpfe: Rework ISR routine for clarity
>   media: am437x-vpfe: Wait for end of frame before tear-down
>   media: am437x-vpfe: fix start streaming error path
>   media: am437x-vpfe: Streamlined vb2 buffer cleanup
>   media: am437x-vpfe: Setting STD to current value is not an error
>   media: am437x-vpfe: Use a per instance format array instead of a
>     static one
>   media: am437x-vpfe: fix function trace debug log
>   media: am437x-vpfe: Remove print_fourcc helper
>   media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
>   media: am437x-vpfe: Remove per bus width static data
>   media: am437x-vpfe: Switch to SPDX Licensing
> 
> Dave Gerlach (1):
>   media: am437x-vpfe: Fix suspend path to always handle pinctrl config
> 
>  drivers/media/platform/am437x/am437x-vpfe.c   | 878 ++++++++----------
>  drivers/media/platform/am437x/am437x-vpfe.h   |  45 +-
>  .../media/platform/am437x/am437x-vpfe_regs.h  |  10 +-
>  3 files changed, 406 insertions(+), 527 deletions(-)
> 

