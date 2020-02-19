Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 829DC163FCE
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBSIyC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:54:02 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34177 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgBSIyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:54:01 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4L7DjzUj7P9a94L7HjnXMz; Wed, 19 Feb 2020 09:53:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582102439; bh=2p6yrU2qxWpRKjFkqg7qvyKVhP0kDi+Qi1iAy50JEUg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cKLGRFvqbpZgo0LFTRPnQ7277Djzvaqii5Hs+CtHO5MmBBNQyMwnwy81qfGz/0sWR
         SuKXmB9R+m44ayGEfSDpeyNOyXJvgygjAZlsXTZnTNp72tWaIvJZdg1ddHnbf8Ezz9
         SOGLyj5lXa+6VdrzvIJPZFMWI4LFkd6nIjQjZBoUtiqGoVgpy0Pm11fgmtVtyztb39
         Mn8Liiu0k0Y4dxaaCuJQ3VFZ3XaknAgF31qAs4W1nxdbggW3/tJ6hHAk6zrwirgAYA
         ygkEkO0IvBPDlqLo+4eLBZkyzk1ZddPq/xRCoiz4JqF3+VMlztohbTyIkpQQ+Vo7WD
         NABzhcgCInZKg==
Subject: Re: [RFC][PATCHv2 00/12] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200204025641.218376-1-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <35d43107-3c1c-3bf8-20e5-6569605643c3@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:53:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJIKlUkJqnGnu5IIgcFzlxuIzPemo059Lomge90EQ5rG+k1u6j4ir7mSpjZvEQVSky3LcWja9ulbbJzWaf5yFxHl1vCzQvRclL4CqQl3CuwYdBHuzCMR
 D3EjaZc3xBx1m0NtNaO4w4qvscI1lTG5kbUpu6u8Yq5QCSVL6CfWJdd6tjqdh9B6/c/mtYbsA+zftWNQ3zm5cxuJE5WkrkLT7C+U2NnqLbDekCG4SeD2XCBY
 s+mwJUOOz7Kp//mHte/vIWcpUeupT8kFnhCuxmgI5TSvZhjubuv+dF4enqgnGWrv9jiuXP6v7oEuvM7Z2qsiUKQ6Q34BolNfeEorC4hpKOIUzL1McihbFets
 2FHPIgi9H0dvLP36cpHyyNJVewiHwKNPjv+e7PU21p2tkflxeeMDBqQjbWnOZVrRUWPYi6Vrs26uw8BJZL3k0adAIfDN30HyEIEtJLO8iHlO7JtCODqWmjpu
 zS99R5qPmvn1YPrA7PyomLkVArbgD9zBeD8zh0kZQky6aQ4ID19sHRnfm9YP9cI2XScDYf2Wcw6+oGtd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> Hello,
> 
> 	V2 of the patchset, reshuffled, added more documentation,
> 	addressed some of the feedback ;) Still in RFC, tho
> 
> v1 link: https://lore.kernel.org/lkml/20191217032034.54897-1-senozhatsky@chromium.org/
> 
> ---
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

This is starting to look pretty good. I think you can drop the RFC
for the next time you post this.

One thing I would like to see as well is test code in v4l2-compliance,
specifically for testing the various flags and capabilities. I.e.,
if V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS, then it should test that it can
set the cache flags and the NON_CONSISTENT flag. If it is not set,
then those flags should be cleared when attempting to set them.

Also code in v4l2-ctl and common/v4l2-info.cpp to support the new
flags, both reporting them, but also setting them.

Regards,

	Hans

> 
> [0] https://www.mail-archive.com/linux-media@vger.kernel.org/msg112459.html
> 
> Sergey Senozhatsky (12):
>   videobuf2: add cache management members
>   videobuf2: handle V4L2 buffer cache flags
>   videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
>   videobuf2: add queue memory consistency parameter
>   videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
>   videobuf2: factor out planes prepare/finish functions
>   videobuf2: do not sync caches when we are allowed not to
>   videobuf2: check ->synced flag in prepare() and finish()
>   videobuf2: let user-space know if driver supports cache hints
>   videobuf2: add begin/end cpu_access callbacks to dma-contig
>   videobuf2: add begin/end cpu_access callbacks to dma-sg
>   videobuf2: don't test db_attach in dma-contig prepare and finish
> 
>  Documentation/media/uapi/v4l/buffer.rst       |  27 +++++
>  .../media/uapi/v4l/vidioc-create-bufs.rst     |   9 +-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  22 +++-
>  .../media/common/videobuf2/videobuf2-core.c   | 110 +++++++++++++-----
>  .../common/videobuf2/videobuf2-dma-contig.c   |  39 ++++++-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  30 +++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  59 +++++++++-
>  drivers/media/dvb-core/dvb_vb2.c              |   2 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
>  include/media/videobuf2-core.h                |  17 ++-
>  include/uapi/linux/videodev2.h                |  11 +-
>  11 files changed, 273 insertions(+), 58 deletions(-)
> 

