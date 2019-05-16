Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7835320134
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 10:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfEPIXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 04:23:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33663 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfEPIXh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 04:23:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id x132so1948602lfd.0
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XJZVmV6klsLB8rLUMzEHXV+UB7QNIIBSdJCCHsemTzs=;
        b=I+4X/ssFxAwUPCX3qC+RTjZ1LNGgw7dJLXp1fa5u2ufCyUe8yiiD9Cl1ATeKXPfjp9
         Njp2V1uRyIs7MMvfpAcC8iPVBBdkmSb21HQ1+QQCfTxcgrCHYnC/RNtXkNJwmI+sFuXd
         dI8fK298BdJXtWH3r0+Nv104vjq6S6GY3jb38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJZVmV6klsLB8rLUMzEHXV+UB7QNIIBSdJCCHsemTzs=;
        b=EO76tiUcTxCrcPdpG+aBeDKheCU3vdwJdQRiHT9CXR/UHhuBjOqTvHWzLr1/7kycT9
         i2BpH8mwP9irOJUBYNW6W0WfFO9WUq/4i7yEWXXfhBFkYikLwLkaZBVc2MvnAvWFvmxY
         7bCiom+n0vd2zb1WSSB9vGfkplh9C3sOv4hG0FSnlZYroIrBQcU2b7Br3Qk52SrxBwzK
         b7uWO/dkoaUv0u9vJP6p9vVL9tQF0hoSi21PRFrPFEdA6vUbxo/5aNEc7N6GF4gyPvPj
         9Tfk7UnChaXvRYrQ+/Rx6sAk1lxVMVyF+5YoQ3wvXf2cy7+27aDW8i6V5tX8mXg2YnYv
         101Q==
X-Gm-Message-State: APjAAAVGitOAMKlTdGueV0xGXhvehG1VlqZ3VpcHQ+eepWzqb0W/Xphf
        +qBoJVvVOdly+bU3MBIAACSm2cW1m9auNv7X
X-Google-Smtp-Source: APXvYqxN5NyxTK7atmE/u/IZmcciOM8fpWaj003GnIFlQgaQCU8SEjD2WkKpxOwTYyGFhUuDPtAJZQ==
X-Received: by 2002:ac2:428f:: with SMTP id m15mr22680749lfh.40.1557995014268;
        Thu, 16 May 2019 01:23:34 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id a25sm761759ljd.32.2019.05.16.01.23.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 01:23:32 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id z1so2270023ljb.3
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 01:23:32 -0700 (PDT)
X-Received: by 2002:a2e:9142:: with SMTP id q2mr3808443ljg.18.1557995011520;
 Thu, 16 May 2019 01:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190404081700.30006-1-boris.brezillon@collabora.com>
 <20190404081700.30006-4-boris.brezillon@collabora.com> <20190412105755.42764170@collabora.com>
 <64dd011d-d397-b587-6027-b222dd100fc2@xs4all.nl>
In-Reply-To: <64dd011d-d397-b587-6027-b222dd100fc2@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 16 May 2019 17:23:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C3rHTeWg0S8ok1cWdDbwecty=0X8BGOQrkhPo6WDxb-A@mail.gmail.com>
Message-ID: <CAAFQd5C3rHTeWg0S8ok1cWdDbwecty=0X8BGOQrkhPo6WDxb-A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] media: v4l2: Add extended buffer operations
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <m.chehab@samsung.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 8, 2019 at 10:58 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Boris,
>
> On 4/12/19 10:57 AM, Boris Brezillon wrote:
> > On Thu,  4 Apr 2019 10:16:56 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >
> >
> >> +/**
> >> + * struct v4l2_ext_buffer - extended video buffer info
> >> + * @index: id number of the buffer
> >> + * @type: enum v4l2_buf_type; buffer type. _MPLANE and _OVERLAY formats are
> >> + *    invalid
> >> + * @flags: buffer informational flags
> >> + * @field: enum v4l2_field; field order of the image in the buffer
> >> + * @timestamp: frame timestamp
> >> + * @sequence: sequence count of this frame
> >> + * @memory: enum v4l2_memory; the method, in which the actual video data is
> >> + *          passed
> >> + * @planes: per-plane buffer information
> >> + * @num_planes: number of plane buffers
> >> + * @request_fd: fd of the request that this buffer should use
> >> + * @reserved: some extra space reserved to add future fields (like timecode).
> >> + *        Must be set to 0
> >> + *
> >> + * Contains data exchanged by application and driver using one of the Streaming
> >> + * I/O methods.
> >> + */
> >> +struct v4l2_ext_buffer {
> >> +    __u32 index;
> >> +    __u32 type;
> >> +    __u32 flags;
> >> +    __u32 field;
> >> +    __u64 timestamp;
> >> +    __u32 sequence;
> >> +    __u32 memory;
> >> +    struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> >
> > I had a discussion with Tomasz last week, and he made me realize I was
> > misunderstanding the concept of V4L2 planes. I thought it was encoding
> > pixel-component planes, but it's actually memory planes, and sometimes
> > those one memory planes might contain all component planes placed next
> > to each others (like the V4L2_PIX_FMT_NV12 format).
> >
> > So, the question is, what do we want v4l2_ext_plane to encode (memory
> > planes or pixel component planes)?
> > If we go for the pixel component plane approach (which IMHO would be a
> > good thing), that means we'll have to convert V4L2_PIX_FMT_NV12-like
> > single-memory-plane buffers into v4l2_ext_buffer containing X planes,
> > each pointing to the same memory object but at a different offset.
>
> First of all my apologies for the long delay in replying.
>
> I think v4l2_ext_plane should encode pixel component planes, that way
> it becomes much easier to describe e.g. NV12 formats that use a single
> memory range, but where each component plane has its own bytesperline
> value and where each component plane starts at e.g. a page boundary
> due to hardware restrictions.
>
> This is currently impossible to describe without creating a new pixel
> format.

Agreed with the above.

>
> But it is of course possible that different component planes use
> different memory ranges.
>
> I think that the memory information in v4l2_ext_plane should describe the
> memory for that component plane and any following component planes that
> are part of that memory. The memory information for those following
> component planes should be 0 or some other value that makes it clear
> that it is part of the same memory buffer as the preceding component plane.

That could be an option too, but there are also cases where the
userspace has no idea to know if all the memory buffers are the same,
e.g. when it gets dup()ed DMA-buf FDs for all the color planes.

We should let the userspace set file descriptors for all the color
planes and then the framework figure out if that matches the driver
(or format) expectations.

Best regards,
Tomasz
