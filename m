Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B780BB2EE
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 13:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732196AbfIWLlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 07:41:15 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58087 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726146AbfIWLlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 07:41:15 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CMiJiwmHFKKNGCMiMilRuw; Mon, 23 Sep 2019 13:41:12 +0200
Subject: Re: [RFC PATCH v2 0/7] media: v4l2: Add extended fmt and buffer
 ioctls
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <m.chehab@samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
References: <20190404081700.30006-1-boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9d53f065-da2c-9ab9-5e97-dbd48237d41e@xs4all.nl>
Date:   Mon, 23 Sep 2019 13:41:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190404081700.30006-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBT4WBYwLbzWq/sqX/y1D2sN7WVo/bDfDrElnozXk3oLeC4Qr6WLAqbnqJSfqfRx3g6EoB8dFW/Gp3Mh8p9ufQVw6hceUHRXLSrJhkOSs8YmMfzU40J7
 HhDG83nnkpnbWNojBM0TdzCUHIY1Kyax3t5OMaPKlnty6cIqD72saSQ2ktSyfMKJlkrJNsTRgP+b2thHqona+0r7tlTXis5gRssIKP1Fx15awgkLHqyC2AQh
 nIwpK1BxSSaR6HmMWv/hTXrxfsGlt7VV2mgNPWm8uFwOcF7DkNsRvE63gt1ZjIsvzjxOzw9szkfehvSsDCXdyTQojo6s/vP9yczW+UlFdiSDQRL0E3eAk9tt
 A7XogGJW+2Ah9vARIRpNr4wkwju4nSaUR1osDUjFe6s8NRmXMp4/esA1kBQzqg7EdUlSHfMzQnJTHWoEbnIzFMFBKHkk08cZzIXoSLwdXcFQjBR+5N4bEUkA
 gPbawFSJ32ky1lZzbZ2EDCMX85LUyY9AL4Nh4I2jbDntTqi9cQ0u7DKNiM4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

On 4/4/19 10:16 AM, Boris Brezillon wrote:
> Hello,
> 
> This RFC follows the discussion started by Hans [1] a few months back.
> It does not try to address all the problem reported in this thread but
> instead focuses on the FMT and BUF(S) ioctls.
> 
> Note that my primary goal is to unify handling for multiplanar and
> singleplanar formats and extend things to support the "single dmabuf
> storing all pixel planes" issue.
> 
> This version received a bit more testing than the previous one (added
> new tests to v4l2-compliance [2] to make sure EXT ioctls work as
> expected and also checked that !ext -> ext wrappers work correctly by
> running the old tests). Note that I'm not planning to post those
> v4l-utils patches on the ML until we've settled down on the userspace
> API, unless I'm explicitly asked to do so.
> 
> Right now I'm focusing on the case I was primarily interested in:
> single dmabuf storing all pixel planes (each being at a different
> offset), and it seems that patching the VB2 core to support that is
> not a trivial task.
> 
> So here are a few questions for V4L/DMABUF experts:
> - Can the same dmabuf be mapped several times. I think it's okay apart
>   from the extra/needless time spent doing cache maintenance
>   operations, but there might be issues if an IOMMU is involved
>   (duplicate mappings?). If it's not okay, then we need to find a
>   solution to only attach/map the DMABUF once when it's used for
>   several planes (this is what I tried to do here [3], but I'm not
>   entirely happy with the implementation and started to investigate
>   another approach here [4]).
> - How should we pass the offset to drivers that were previously using
>   the get_cookie() (or the dma_sg wrapper) to retrieve an sg table.
>   Adding the offset to the dma_addr or vaddr for vmalloc or dma-contig
>   case can be done in the core, but for an sg-table it's a bit more
>   complicated. Should drivers access this piece of information
>   directly from vb2_plane->dbuf_offset? And in that case, how do we
>   make sure drivers don't simply ignore the offset and assume it's
>   always zero? 
> 
> Few words about the feedback I got from Brian and Nicolas on my v1:
> 
> - modifier field has been moved to v4l2_ext_format as suggested
> - v4l2_timecode is still not present in v4l2_ext_buffer, but can be
>   added back thanks to the extra reserved space
> - the ENUMFMT is left as is for now, because I think we want Maxime's
>   work on DRM/V4L format unification to land before reworking the
>   ioctl (exposing extra info about the format and not only the 4CC
>   code?). That also means that there's currently no way to know which
>   modifiers are supported
> - EXT_FMT/EXT_BUF capability flags to detect whether new ioctls are
>   supported or not have not been added yet

Can you post a v3, rebased on top of our current master branch? No other
changes needed, just a rebase.

I want to discuss this series during the media summit in Lyon and this
one is getting a bit old. Also, the new patchwork is much better at
keeping patch series together, so that makes it handy to link to this
series.

Regards,

	Hans

> 
> Regards,
> 
> Boris
> 
> [1]https://www.mail-archive.com/linux-media@vger.kernel.org/msg135729.html
> [2]https://github.com/bbrezillon/v4l-utils/commits/master
> [3]https://github.com/bbrezillon/linux/commit/4882435f80b05a61827649d55cc0f0cee79680a7
> [4]https://github.com/bbrezillon/linux/commit/a415216c6aaab2d51f0bd62270b994c8196ddd90
> 
> *** BLURB HERE ***
> 
> Boris Brezillon (6):
>   media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap,out}_mplane
>   media: v4l2: Extend pixel formats to unify single/multi-planar
>     handling (and more)
>   media: videobuf2: Expose helpers to implement the _ext_fmt and
>     _ext_buf hooks
>   media: mediabus: Add an helper to convert a ext_pix format to an
>     mbus_fmt
>   media: vivid: Convert the capture and output drivers to
>     EXT_FMT/EXT_BUF
>   media: vimc: Implement the ext_fmt and ext_buf hooks
> 
> Hans Verkuil (1):
>   media: v4l2: Add extended buffer operations
> 
>  .../media/common/videobuf2/videobuf2-core.c   |    2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  534 +++++---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c      |    2 +-
>  drivers/media/platform/exynos-gsc/gsc-m2m.c   |    4 +-
>  .../media/platform/exynos4-is/fimc-capture.c  |    2 +-
>  .../platform/exynos4-is/fimc-isp-video.c      |    2 +-
>  drivers/media/platform/exynos4-is/fimc-lite.c |    2 +-
>  drivers/media/platform/exynos4-is/fimc-m2m.c  |    4 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |    4 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |    4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |    4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |    4 +-
>  .../media/platform/qcom/camss/camss-video.c   |    2 +-
>  drivers/media/platform/qcom/venus/vdec.c      |    4 +-
>  drivers/media/platform/qcom/venus/venc.c      |    4 +-
>  drivers/media/platform/rcar_fdp1.c            |    4 +-
>  drivers/media/platform/rcar_jpu.c             |    4 +-
>  drivers/media/platform/renesas-ceu.c          |    2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |    4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |    4 +-
>  drivers/media/platform/ti-vpe/vpe.c           |    4 +-
>  drivers/media/platform/vicodec/vicodec-core.c |    2 -
>  drivers/media/platform/vimc/vimc-capture.c    |   65 +-
>  drivers/media/platform/vimc/vimc-common.c     |    4 +-
>  drivers/media/platform/vimc/vimc-common.h     |    2 +-
>  drivers/media/platform/vimc/vimc-core.c       |   10 +-
>  drivers/media/platform/vivid/vivid-core.c     |   36 +-
>  drivers/media/platform/vivid/vivid-vid-cap.c  |  171 +--
>  drivers/media/platform/vivid/vivid-vid-cap.h  |   15 +-
>  .../media/platform/vivid/vivid-vid-common.c   |   20 -
>  .../media/platform/vivid/vivid-vid-common.h   |    2 -
>  drivers/media/platform/vivid/vivid-vid-out.c  |  195 +--
>  drivers/media/platform/vivid/vivid-vid-out.h  |   15 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |   56 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 1141 +++++++++++++++--
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |    4 +-
>  .../media/rockchip/vpu/rockchip_vpu_enc.c     |    4 +-
>  include/media/v4l2-ioctl.h                    |   77 +-
>  include/media/v4l2-mediabus.h                 |   22 +
>  include/media/videobuf2-core.h                |    6 +-
>  include/media/videobuf2-v4l2.h                |   26 +-
>  include/uapi/linux/videodev2.h                |  211 +++
>  42 files changed, 1945 insertions(+), 739 deletions(-)
> 

