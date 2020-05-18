Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0C41D7C91
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 17:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgERPSl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 11:18:41 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:34243 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbgERPSl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 11:18:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ahXGjvLYt8hmdahXKjhJ8z; Mon, 18 May 2020 17:18:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589815118; bh=n0fFGCGdi818S+XdCRml9VArGU71ZuuWGQf3y8cVenM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MzvkyNhR3+1xg9AJ1h0OcyOrrxCoEWkSUTzgh5VuX3AoGLhjn1B0dqZAeS/cFc6pI
         kWBr3VTRLnsRgQe6HvGJMYqkkEOkIRE3DhyzxZzpC/m+pufUpCfFPfFGz9Vh1kpVja
         1GQg/86BG71p7CkX601+bKjh3esf/3MYj1mWsZjBC8BaMe1Rqlk+2U6lmGdl6zgTIo
         8XCv/fYlzAkZdF5jiylQSOtUiTOUq4LYMZb8Mk/R0RSCCbTwE/NKZFtx4sTBQEHCAy
         /C8zSqiUYTwbwv0e82I3eZTh3s/wVaVN6r86EMtRX+MaVjt2MAVuS5YEO7UyWs41ZM
         5Z4cgBEOAmvZg==
Subject: Re: [PATCH v6 00/14] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3fee9a3d-30fe-826a-7a36-b4c9720a94db@xs4all.nl>
Date:   Mon, 18 May 2020 17:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI6Lht0ujiOXn8w5y/udiDLlkwMRqX60HUf+iJ7HJGUpwLICDz656fqMWX//dHjq1DNJuQh7kF3onp42CadT3ClOKvouGOMf5oKLKuIeja2xByT9mRdh
 WKXrOGq72IFFDv1SEeMOQs0ZEwqEY7RjYh3senwLjJEjLaYB6WJHezFte8Lb/ns/erZ5w2Dnvt2mc9w8n33seQAbw+D66kWiBDl+cchpqeUsALXPN1GE8ljF
 PygvybUsvwXN0RFiuA6hX2xoOLhQO6yRN3UgB90to+OYrqOSXciaHs3uEISQ84dR1mNe0egY0JnLygyvaOIQ/Ih8SgjEtr3e5itS7dL8lV1Yi+tQzjYGAuB7
 Bk5ZDrl8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On 14/05/2020 18:01, Sergey Senozhatsky wrote:
> Hello
> 
> v6 changes:
> The design has been slightly reworked. The cache-hints capability has
> been renamed to SUPPORTS_MMAP_CACHE_HINTS and is reported for all queues
> that support MMAP and allow cache hints. However, the actual hints and
> memory consistency are ignored unless the queue is used for the MMAP
> streaming I/O. Plus some cleanups, documentation updates, and so on.

This looks good. If there are no new comments then I plan to make a PR for 5.9 in
two weeks.

Thank you for all your work on this!

Regards,

	Hans

> 
> Previous versions:
> v5 link: https://lore.kernel.org/lkml/20200424092920.4801-1-sergey.senozhatsky@gmail.com
> v4 link: https://lore.kernel.org/lkml/20200302041213.27662-1-senozhatsky@chromium.org/
> v3 link: https://lore.kernel.org/lkml/20200226111529.180197-1-senozhatsky@chromium.org
> v2 link: https://lore.kernel.org/lkml/20200204025641.218376-1-senozhatsky@chromium.org/
> v1 link: https://lore.kernel.org/lkml/20191217032034.54897-1-senozhatsky@chromium.org/
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
>               return;
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
> 
> [0] https://www.mail-archive.com/linux-media@vger.kernel.org/msg112459.html
> 
> Sergey Senozhatsky (14):
>   videobuf2: use explicit unsigned int in vb2_queue
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
>   videobuf2: remove redundant if-statement
>   media: vivid: add cache_hints module param
> 
>  Documentation/admin-guide/media/vivid.rst     |   9 ++
>  .../userspace-api/media/v4l/buffer.rst        |  40 +++++-
>  .../media/v4l/vidioc-create-bufs.rst          |   7 +-
>  .../media/v4l/vidioc-reqbufs.rst              |  21 ++-
>  .../media/common/videobuf2/videobuf2-core.c   | 121 +++++++++++++-----
>  .../common/videobuf2/videobuf2-dma-contig.c   |  44 ++++++-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  38 ++++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  72 ++++++++++-
>  drivers/media/dvb-core/dvb_vb2.c              |   2 +-
>  drivers/media/test-drivers/vivid/vivid-core.c |   9 ++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  10 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
>  include/media/videobuf2-core.h                |  47 +++++--
>  include/uapi/linux/videodev2.h                |  14 +-
>  14 files changed, 366 insertions(+), 73 deletions(-)
> 

