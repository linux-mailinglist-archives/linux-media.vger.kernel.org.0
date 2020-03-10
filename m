Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 611B7180B55
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 23:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgCJWSS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 18:18:18 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43979 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgCJWSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 18:18:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id f8so79287plt.10
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 15:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvP/vPK8MWc/hkLtqEYCaNyI71mk5mVYojMdSNDwtdA=;
        b=NwFD/TeXpItJ435LUmhPS0Mh9nAZMXDf/Bu2tk2hpPxVXGW5/lNzJlUdMwo5In/HIs
         MyiDBbtcPU8Rz6JUCGh2Z33elDJniaHuA1zAMoY5Ooc2DG3e0d0mMowZNFx7I8+uAFcv
         OVlECjVE2D8ZuKjx9JE5VjRUjTQxXczXKsEv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvP/vPK8MWc/hkLtqEYCaNyI71mk5mVYojMdSNDwtdA=;
        b=L6ncXgUZqoob3ECGp8B5fA/E4NmTb+ETkhVE5ZptfHBbIlufCQC8u05/6mskwDKd+K
         jfz42YTZG5vZicbE/o8bHNDgE6/hx3YkZ30M7NWcvI4gg3a44yMS9ESoHbiBv8qQbOLx
         k7RXM7LWWFEwaH/XUpMHZ0UH7wxDUQ6tfYqXaBMZs/CFZhifAZYzxeFB3QlXzbhDyp/Z
         B2UQrW4jOHxEYZIjA2E57KfKKggQp4a/QY8DRAMWzmpYtS6JTzwzXfr2P+MOGLTxrJ6+
         Hs3OI4GkBfkSsTKOsO6CGustsJ8YxkFVWNbuZ4E/45sOC3pWS0csrHZnoEAtZmlu6R6b
         3O3Q==
X-Gm-Message-State: ANhLgQ2S58DVedhku/BYWRtUxYYxQl+Hsgd0MNgbwteJWSh1/KAA2Gx8
        GvTA4Q7c6kV697aXxYQinDQ29A==
X-Google-Smtp-Source: ADFU+vt9lfF+H9/djTccZTiXhHAadQ8vrYw/Unxcl7SI4VbR/F0rH/UN8qSWkE7b+TOHahct/cyS9w==
X-Received: by 2002:a17:902:fe15:: with SMTP id g21mr96539plj.215.1583878696964;
        Tue, 10 Mar 2020 15:18:16 -0700 (PDT)
Received: from localhost ([2620:15c:f:10:14c5:dd6c:b86:da06])
        by smtp.gmail.com with ESMTPSA id s21sm20741819pfd.99.2020.03.10.15.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 15:18:15 -0700 (PDT)
From:   Fritz Koenig <frkoenig@chromium.org>
To:     boris.brezillon@collabora.com
Cc:     Brian.Starkey@arm.com, hans.verkuil@cisco.com, hiroh@chromium.org,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        nicolas@ndufresne.ca, sakari.ailus@iki.fi, tfiga@chromium.org
Subject: Re: [RFC PATCH v2 0/7] media: v4l2: Add extended fmt and buffer ioctls
Date:   Tue, 10 Mar 2020 15:18:13 -0700
Message-Id: <20200310221813.221766-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20191008091119.7294-1-boris.brezillon@collabora.com>
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

On Tue, Oct 8, 2019 at 11:11 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:

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

I'm new to V4L2, so I'm sorry if some of my questions don't make sense.

The venus codec can decode to UBWC format so I'm working with this
patch set to see how the modifiers flow will go.  I've been able to
integrate these patches for the most part.

Is the expectation with these new ioctls that they will work seamlessly with
all codecs?  Or that a codec can implement only the ones that are needed?
i.e. I only need to pass the modifier, so could I only implement S_EXT_FMT?
And then is the expectation that I know that for EXT I set the queue to
!MPLANE?

I find the interaction between _MPLANE and !MPLANE to still be a odd with
the new ioctls.  I had thought that I could use the same queue designation
for all the calls.  But for the codec I'm looking at (venus) it is MPLANE only,
so I call REQBUFS with V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE and all of the new
ioctls with V4L2_BUF_TYPE_VIDEO_CAPTURE.  I'm failing to see how to do this
in a backward compatible way.

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
> -- 
> 2.21.0


