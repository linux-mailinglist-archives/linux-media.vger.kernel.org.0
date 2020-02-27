Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B961717A6
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 13:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgB0Mju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 07:39:50 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49941 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728977AbgB0Mjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 07:39:49 -0500
Received: from [IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0]
 ([IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7IS7jE0Y8jmHT7ISBjielx; Thu, 27 Feb 2020 13:39:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582807187; bh=SppaRo1Hod25rsdmHJB5MZdZ32/T0CqLTslF/uXHkrE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=heqqcEDGtkmETf2Mmzet70PQHrXMcVUCaOZRezDoXcSYAc1bgnZF6sPY0oyU0nfYP
         iGj3cfaMiyyOWtQyBUdI3Un1RFGWhU9xg33y/ggCmg/NyYsD8yIklhHod9zl0TIzZC
         9B79uLMIqaBhVQz/ZXl/J0a3JbQN0bM8mZVp6dviSLXeMuEYeA1FnP/JF1AXWHGJ2A
         ppSsom456bWnkVYj0iLzC6RNjxjEaoFK31bZn1WSMCK4uuWGJ2e94HzcbX1IbpbVw7
         GS9eQiZ+3mYBiYdfGv3/seP81WJvUr13wqWByQEVTsxdJHT4SQFNZkw9pQHgU7jHQV
         RRTZy8hOJ52Qg==
Subject: Re: [PATCHv3 00/11] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200226111529.180197-1-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <98205145-1a39-ce29-a2a0-c5abf8376349@xs4all.nl>
Date:   Thu, 27 Feb 2020 13:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIJA8jAKsvKUT+TpJDhqLkEuikjN7i5FZsZ558ClqGVzOf546hR5oEByTPTvV7XJXeRhg4n/RVzT6KhaF8wJFez0kI5nmuXzPZ7VOvjdNk/56wOvVFCb
 lHe5/EADe/5PzjUITHoweP0fANHxjHv8IUtv3LgF2a87hHL/CWSyTZgvPiayby/6V4TPzpaPx9jit1LNDil4yTXxhv1C83lvPG/XoIYFK+n1Y85wOHmdHdYZ
 M3uxIQaVAShd3lKQeqVjgZh7wXFvKAkYDcXGznlQ6s294O31qD6ErxMk2NbEN9J/FTjHV/1sTKpYmTao75+wR0jowBDSiTkjHVT1kfR3SPfYjMFrLwwNUgLh
 voslG1dIlcZDyWfeCJUlOKyd62rysJEbfbLFFUp7BxIZZtOKzuSSv2wtiN/p0e0nltQ0xWCM1cp7TIND56BQbZjtYU+SIZ9QnkUamymDPa+LoN4jl9ebKyu6
 GknDnVkUDXArlYwOp/yZTsXxJ+VT1XWWgub/Vi33qBzKNt8f5kvcbBipWZZNFA+MBYX0GVpsKahR9pqOvnbRh7GLTdGawxYSkdlZeCdainIbDv4ZMq6CKo4H
 Si2ukrVu37Xuyt8Ux1g8OknYU/kOGtUJbWNCsZe9cjPQrsw9wfTph31sDNmuYXstCIo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/26/20 12:15 PM, Sergey Senozhatsky wrote:
> Hello,
> 
> 	V3 of the patchset, reshuffled and updated.
> 
> - Most notable changes:
> 
> a) Added a simple helper function vb2_queue_allows_cache_hints(),
>    which return true if queue has ->allow_cache_hints and when
>    ->memory is VB2_MEMORY_MMAP.
>    That is - user space cache and memory consistency hints are now
>    specifically for MMAP buffers and queues that support hints.
> 
> b) Set V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS capability bit only when queue
>    has ->allow_cache_hints and ->io_modes has VB2_MMAP bit set
> 
> c) Clear "incompatible" request's flags when queue does not permit
>    cache and memory consistency hints (IOW, when vb2_queue_allows_cache_hints()
>    return false)
> 
> 
> Minor changes:
> 
> - Squashed V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS and V4L2_FLAG_MEMORY_NON_CONSISTENT
>   patches.
> 
> - Added more documentation and code comments.
> 
> 
> Previous series:
> v2 link: https://lore.kernel.org/lkml/20200204025641.218376-1-senozhatsky@chromium.org/
> v1 link: https://lore.kernel.org/lkml/20191217032034.54897-1-senozhatsky@chromium.org/
> 
> 
> Series Intro
> ========================================================================
> 
>         This is a reworked version of the vb2 cache hints
> (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE / V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> support patch series which previsouly was developed by Sakari and
> Laurent [0].
> 
> The patch set attempts to preserve the existing behvaiour - cache
> sync is performed in ->prepare() and ->finish() (unless the buffer
> is DMA exported). User space can request “default behavior” override
> with cache management hints, which are handled on a per-buffer basis
> and should be supplied with v4l2_buffer ->flags during buffer
> preparation. There are two possible hints:
> 
> - V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
>         No cache sync on ->finish()
> 
> - V4L2_BUF_FLAG_NO_CACHE_CLEAN
>         No cache sync on ->prepare()
> 
> In order to keep things on the safe side, we also require driver
> to explicitly state which of its queues (if any) support user space
> cache management hints (such queues should have ->allow_cache_hints
> bit set).
> 
> The patch set also (to some extent) simplifies allocators' ->prepare()
> and ->finish() callbacks. Namely, we move cache management decision
> making to the upper - core - layer. For example, if, previously, we
> would have something like this
> 
>         vb2_buffer_done()
>           vb2_dc_finish()
>             if (buf->db_attach)
>                return;
> 
> where each allocators' ->finish() callback would either bail
> out (DMA exported buffer, for instance) or sync, now that "bail
> out or sync" decision is made before we call into the allocator.
> 
> Along with cache management hints, user space is also able to
> adjust queue's memory consistency attributes. Memory consistency
> attribute (dma_attrs) is per-queue, yet it plays its role on the
> allocator level, when we allocate buffers’ private memory (planes).
> For the time being, only one consistency attribute is supported:
> DMA_ATTR_NON_CONSISTENT.

v3 looks very good, I only found some minor issues.

I think v4 should be ready to be merged, unless others have more comments.

Regards,

	Hans

> 
> [0] https://www.mail-archive.com/linux-media@vger.kernel.org/msg112459.html
> 
> Sergey Senozhatsky (11):
>   videobuf2: add cache management members
>   videobuf2: handle V4L2 buffer cache flags
>   videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
>   videobuf2: add queue memory consistency parameter
>   videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
>   videobuf2: factor out planes prepare/finish functions
>   videobuf2: do not sync caches when we are allowed not to
>   videobuf2: check ->synced flag in prepare() and finish()
>   videobuf2: add begin/end cpu_access callbacks to dma-contig
>   videobuf2: add begin/end cpu_access callbacks to dma-sg
>   videobuf2: don't test db_attach in dma-contig prepare and finish
> 
>  Documentation/media/uapi/v4l/buffer.rst       |  29 +++++
>  .../media/uapi/v4l/vidioc-create-bufs.rst     |   8 +-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  22 +++-
>  .../media/common/videobuf2/videobuf2-core.c   | 110 +++++++++++++-----
>  .../common/videobuf2/videobuf2-dma-contig.c   |  39 ++++++-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  36 ++++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  82 ++++++++++++-
>  drivers/media/dvb-core/dvb_vb2.c              |   2 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
>  include/media/videobuf2-core.h                |  28 ++++-
>  include/uapi/linux/videodev2.h                |  11 +-
>  11 files changed, 314 insertions(+), 58 deletions(-)
> 

