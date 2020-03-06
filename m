Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA2317C012
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 15:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgCFOS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 09:18:29 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53547 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726646AbgCFOS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 09:18:28 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ADo1j3HQwEE3qADo2jCfUe; Fri, 06 Mar 2020 15:18:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583504307; bh=qPs4O9bzHG/Qd9bfS0xN/I51t+b35srezEE15bWS1Lc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o9KItpNK7ElHCYhvP4XpZSnJLzYAVKs+FbjsW5own5y/+ul04w7cpxF/Ffo/u8feP
         991AMi/afxLR/wA2ezGYwcbM/I6qbJ50mBVz2/DQhCcqGxYwPbdEuGSHYXHN2YP7+X
         3BB3239MxXs503kmspQnLX6mmzhv2vUnf4GwU+rd2I5GKTgZhsT6eke7eQbLwN8svx
         ePA80k6u1bJ6gNkgeb3bUM7HpMW58OlyaXoqjrG49kUg1vjv+giTsvYnKyY81bO03g
         9KmeW7M7CoNzYceWdETlhu5Nep3druRvOlxB7bpfGDgrH4HNoQPvrscIxC6/nyE0rd
         9Z0TdzmsVi0ng==
Subject: Re: [PATCHv4 00/11] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
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
References: <20200302041213.27662-1-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <04241ce5-dc41-9ea8-a058-5c0d8f9ba5a4@xs4all.nl>
Date:   Fri, 6 Mar 2020 15:18:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMIPh+1kpdpwLIvBuo+qM47k+a3e5gGBZyENFJLLhyTkloSYNKkVjJiV3UfOsSnmMkuNr/TowBS0A/UhPzf3wC5QWPUlwR6zXbrcfLkSIL2N0lavSdMj
 R7eVuPDnidQOMMXX77SI19Tjd9qqRt+oxePrHJcTlJYKYuZoek1PWMeESgyjozPFSVEn0GqCfIyfh9zIxZ7cSMRnB/OYTIa8prES2gd2VAZ6BBAbH0Vap/Tj
 g55Iz2oXaYdzegv+NX1WHme4dTzFJpOFgmm/Y5ImjwPHk+4v24YBf36kqgXoF4m7ghGJrkjJagJJ31SLUGK5Rn+4v1tupMWW19WzNMXJy3WN0cVK92+MZxci
 ms3OYlNJ1nZ/8b6Aa6xayNrlel4WVaGkfGjyxkO38F0nHR8GG6TiW8W6DfE5/rZCVKgOi6KzVGWM5P88GK4v3HzT9lroZz8MWTg3vwu0iAFWw6gBlhNSff5B
 cUkP5CZUYc9bDozW9PJtT6PEK8lXHd3KeiVWRAZyg/Z9wpTS17JbdGk7vIwSiUvKavNx94pM5Q6rfZ2eW4qgzzzjhcTNmJ0gcZbXdCSObyyjTz28lc+4jwvx
 AfC6ROOIuWltlSiAS25+Erl0+adJSiUVV1pe7pbdXKBIig==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2020 05:12, Sergey Senozhatsky wrote:
> Hello,
> 
> 	v4 of the series. Typos and grammar fixes.
> 
> Previous series:
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

As mentioned in my v4 review I found a serious bug when testing with
v4l2-compliance. That meant that this series was not tested properly,
which is a requirement for something that touches the core framework.

I've posted an RFC patch with my v4l-utils changes (assumes you've run
'make sync-with-kernel' first), but that's just very basic testing. You
can use it as your starting point.

It needs to be expanded to test the various combinations of flags and
capabilities. I don't think there is a reliable way of actually testing
the cache hint functionality, so that can be skipped, but the compliance
test should at least test the basic behavior depending on whether or not
the cache hints capability is set.

I also would like to see a patch adding cache hint support to an existing
driver (more than one if possible) and the compliance output when tested
against that driver.

You should also test with the test-media script in contrib/test: run as
'sudo test-media mc' to test with all the virtual drivers. If it all passes,
then that's a good indication that there are at least no regressions.

Sorry, but this bug scared me a little, it suggests that not much testing
has been done.

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
>  .../media/uapi/v4l/vidioc-create-bufs.rst     |   7 +-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  18 ++-
>  .../media/common/videobuf2/videobuf2-core.c   | 110 +++++++++++++-----
>  .../common/videobuf2/videobuf2-dma-contig.c   |  39 ++++++-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  36 ++++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  82 ++++++++++++-
>  drivers/media/dvb-core/dvb_vb2.c              |   2 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
>  include/media/videobuf2-core.h                |  28 ++++-
>  include/uapi/linux/videodev2.h                |  11 +-
>  11 files changed, 310 insertions(+), 57 deletions(-)
> 

