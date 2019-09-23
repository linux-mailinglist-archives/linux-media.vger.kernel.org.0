Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6FC6BB6FD
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 16:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407616AbfIWOlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 10:41:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57900 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407614AbfIWOlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 10:41:02 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7688228AE02;
        Mon, 23 Sep 2019 15:40:57 +0100 (BST)
Date:   Mon, 23 Sep 2019 16:40:54 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <m.chehab@samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Subject: Re: [RFC PATCH v2 0/7] media: v4l2: Add extended fmt and buffer
 ioctls
Message-ID: <20190923164054.59792271@collabora.com>
In-Reply-To: <9d53f065-da2c-9ab9-5e97-dbd48237d41e@xs4all.nl>
References: <20190404081700.30006-1-boris.brezillon@collabora.com>
        <9d53f065-da2c-9ab9-5e97-dbd48237d41e@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 23 Sep 2019 13:41:07 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Hi Boris,
> 
> On 4/4/19 10:16 AM, Boris Brezillon wrote:
> > Hello,
> > 
> > This RFC follows the discussion started by Hans [1] a few months back.
> > It does not try to address all the problem reported in this thread but
> > instead focuses on the FMT and BUF(S) ioctls.
> > 
> > Note that my primary goal is to unify handling for multiplanar and
> > singleplanar formats and extend things to support the "single dmabuf
> > storing all pixel planes" issue.
> > 
> > This version received a bit more testing than the previous one (added
> > new tests to v4l2-compliance [2] to make sure EXT ioctls work as
> > expected and also checked that !ext -> ext wrappers work correctly by
> > running the old tests). Note that I'm not planning to post those
> > v4l-utils patches on the ML until we've settled down on the userspace
> > API, unless I'm explicitly asked to do so.
> > 
> > Right now I'm focusing on the case I was primarily interested in:
> > single dmabuf storing all pixel planes (each being at a different
> > offset), and it seems that patching the VB2 core to support that is
> > not a trivial task.
> > 
> > So here are a few questions for V4L/DMABUF experts:
> > - Can the same dmabuf be mapped several times. I think it's okay apart
> >   from the extra/needless time spent doing cache maintenance
> >   operations, but there might be issues if an IOMMU is involved
> >   (duplicate mappings?). If it's not okay, then we need to find a
> >   solution to only attach/map the DMABUF once when it's used for
> >   several planes (this is what I tried to do here [3], but I'm not
> >   entirely happy with the implementation and started to investigate
> >   another approach here [4]).
> > - How should we pass the offset to drivers that were previously using
> >   the get_cookie() (or the dma_sg wrapper) to retrieve an sg table.
> >   Adding the offset to the dma_addr or vaddr for vmalloc or dma-contig
> >   case can be done in the core, but for an sg-table it's a bit more
> >   complicated. Should drivers access this piece of information
> >   directly from vb2_plane->dbuf_offset? And in that case, how do we
> >   make sure drivers don't simply ignore the offset and assume it's
> >   always zero? 
> > 
> > Few words about the feedback I got from Brian and Nicolas on my v1:
> > 
> > - modifier field has been moved to v4l2_ext_format as suggested
> > - v4l2_timecode is still not present in v4l2_ext_buffer, but can be
> >   added back thanks to the extra reserved space
> > - the ENUMFMT is left as is for now, because I think we want Maxime's
> >   work on DRM/V4L format unification to land before reworking the
> >   ioctl (exposing extra info about the format and not only the 4CC
> >   code?). That also means that there's currently no way to know which
> >   modifiers are supported
> > - EXT_FMT/EXT_BUF capability flags to detect whether new ioctls are
> >   supported or not have not been added yet  
> 
> Can you post a v3, rebased on top of our current master branch? No other
> changes needed, just a rebase.

Ok, I'll try to do that next week.
