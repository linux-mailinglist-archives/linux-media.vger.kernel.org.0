Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96BD8CF5C3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 11:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbfJHJN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 05:13:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbfJHJNZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 05:13:25 -0400
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 09F3528F7F5;
        Tue,  8 Oct 2019 10:13:23 +0100 (BST)
Date:   Tue, 8 Oct 2019 11:13:20 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Subject: Re: [RFC PATCH v2 0/7] media: v4l2: Add extended fmt and buffer
 ioctls
Message-ID: <20191008111320.7b2352b2@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191008091119.7294-1-boris.brezillon@collabora.com>
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue,  8 Oct 2019 11:11:13 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

Oops, forgot to update the subject. Should be:

"[RFC PATCH v3 0/6] media: v4l2: Add extended fmt and buffer ioctls"

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
> 
> Nothing has changed in v3, just rebased patches on top of media/master
> so we can discuss it during the Media Summit.
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
> Boris Brezillon (5):
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
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  534 ++++----
>  drivers/media/platform/vimc/vimc-capture.c    |   65 +-
>  drivers/media/platform/vimc/vimc-common.c     |    4 +-
>  drivers/media/platform/vimc/vimc-common.h     |    2 +-
>  drivers/media/platform/vivid/vivid-core.c     |   30 +-
>  drivers/media/platform/vivid/vivid-vid-cap.c  |  171 +--
>  drivers/media/platform/vivid/vivid-vid-cap.h  |   15 +-
>  drivers/media/platform/vivid/vivid-vid-out.c  |  195 +--
>  drivers/media/platform/vivid/vivid-vid-out.h  |   15 +-
>  drivers/media/v4l2-core/v4l2-dev.c            |   54 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 1127 +++++++++++++++--
>  include/media/v4l2-ioctl.h                    |   63 +
>  include/media/v4l2-mediabus.h                 |   22 +
>  include/media/videobuf2-core.h                |    6 +-
>  include/media/videobuf2-v4l2.h                |   26 +-
>  include/uapi/linux/videodev2.h                |  211 +++
>  17 files changed, 1897 insertions(+), 645 deletions(-)
> 

