Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2BA2DF884
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 06:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgLUFIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 00:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgLUFH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 00:07:59 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114D1C0611C5
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 21:07:19 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id g20so11713211ejb.1
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 21:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JSDBpbAb+/VW+RgOV1OSYF43CooUkraHhPfK0IhMgi4=;
        b=cf8HHgfeCrEt06Dq61ckFkc/qILM4IrFeIP8bQNnqWyTh/0UhG4cI1FIZ8YaJugCBH
         0g+Jvedgj1D50OK5h40yKwQsYcV/B5piZQqbmX1DDcwt9mKCOBD26gdGHc3O1SuRfJmL
         8EYfqbiCUWj/AnIXhmdjmXMKLltgk0mro30O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JSDBpbAb+/VW+RgOV1OSYF43CooUkraHhPfK0IhMgi4=;
        b=kUzZnG7SQ2vXw0IFddGJhivnMZkMop6AXFax6Q2inShGFpTl0cMH0+ha9tq93EyqvQ
         cbLsISLEZkVbEBCux7bvqIPbxyZcczdHGMJcdfzLXU4ghBmps+2zVUKCDRNdQx4qMoH2
         +XrXGfNXVUkj1cBLnfGoWGfcvFdhMO90PgMDFV3HAUVRi2mfEqE1JachvbjxGTZVwNVT
         5oqOWlGZLegQ+lTHzqyRgLTLZz1NVZ/qHD6r2zcu0t7JAc+oInZCgIiLuHKW3hye2IQX
         m+qykTRaPxVcae5kPA2CVjsZCB8MxoPWY+KNPla/7AtywuKuqO4C8t4u8PqjXSfs4r2E
         cpCQ==
X-Gm-Message-State: AOAM530pVVURhCgonzM7d7KyvfKyHvgth/WJWh+ZKc5+qEehT03xvN8R
        I/1cdeqXRpKMw1rXTrvYgQLgEdi6SOEHHQ==
X-Google-Smtp-Source: ABdhPJxYQmyg472lFFSe5JAZzaL3Z/Iyuk4U6t6kpMuWWuerXhPOZ61WGUuVYTs+54eJtkgMS6Uzwg==
X-Received: by 2002:a17:906:7a46:: with SMTP id i6mr13270761ejo.257.1608520398402;
        Sun, 20 Dec 2020 19:13:18 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id qh23sm8481108ejb.71.2020.12.20.19.13.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 19:13:16 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id c133so8567277wme.4
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 19:13:16 -0800 (PST)
X-Received: by 2002:a1c:c308:: with SMTP id t8mr14451460wmf.22.1608520395846;
 Sun, 20 Dec 2020 19:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-3-helen.koike@collabora.com> <b8a08145-c54e-3d06-dd61-78ce99a812d5@xs4all.nl>
 <3ac23162-ce59-6cc3-da48-90f26c618345@collabora.com> <CAAFQd5A1F7g=LSJrtqwF+KEUq-QXmi0__-mbebsN27xFA0rQCQ@mail.gmail.com>
 <b14809a5-e471-73da-efde-1d0d6f54e485@collabora.com> <de781845-7192-df0b-26c4-36b981237735@xs4all.nl>
 <f565c17a-e6ef-e875-bc01-1122ba59a50a@collabora.com> <CAAFQd5C=+0YYNHrk+B3-zUTLT8rfBg3iC9Jn7nXzFccC0JW79Q@mail.gmail.com>
 <a41fe519-8835-97a0-ef8a-ad5b5efcb449@collabora.com> <CAAFQd5DKE=xVf9tX6J6RaVR0M4udK9JDnMESdBSa8aKLwQsvfQ@mail.gmail.com>
 <4fec6e91-a19b-b0be-d4b6-72a333451d9b@collabora.com>
In-Reply-To: <4fec6e91-a19b-b0be-d4b6-72a333451d9b@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 21 Dec 2020 12:13:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ds5DQ0V+c_Oapwg9CQ0ADkjtML6w6H5Ad4hwMz9Rg9YQ@mail.gmail.com>
Message-ID: <CAAFQd5Ds5DQ0V+c_Oapwg9CQ0ADkjtML6w6H5Ad4hwMz9Rg9YQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] media: v4l2: Add extended buffer operations
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 10:20 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Tomasz,
>
> Thanks for your comments, I have a few questions below.
>
> On 12/16/20 12:13 AM, Tomasz Figa wrote:
> > On Tue, Dec 15, 2020 at 11:37 PM Helen Koike <helen.koike@collabora.com> wrote:
> >>
> >> Hi Tomasz,
> >>
> >> On 12/14/20 7:46 AM, Tomasz Figa wrote:
> >>> On Fri, Dec 4, 2020 at 4:52 AM Helen Koike <helen.koike@collabora.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> Please see my 2 points below (about v4l2_ext_buffer and another about timestamp).
> >>>>
> >>>> On 12/3/20 12:11 PM, Hans Verkuil wrote:
> >>>>> On 23/11/2020 18:40, Helen Koike wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 11/23/20 12:46 PM, Tomasz Figa wrote:
> >>>>>>> On Tue, Nov 24, 2020 at 12:08 AM Helen Koike <helen.koike@collabora.com> wrote:
> >>>>>>>>
> >>>>>>>> Hi Hans,
> >>>>>>>>
> >>>>>>>> Thank you for your review.
> >>>>>>>>
> >>>>>>>> On 9/9/20 9:27 AM, Hans Verkuil wrote:
> >>>>>>>>> Hi Helen,
> >>>>>>>>>
> >>>>>>>>> Again I'm just reviewing the uAPI.
> >>>>>>>>>
> >>>>>>>>> On 04/08/2020 21:29, Helen Koike wrote:
[snip]
> >
> >>
> >> Output: userspace fills plane information, informing in which memory buffer each
> >>         plane was placed (Or should this be pre-determined by the driver?)
> >>
> >> For MMAP
> >> -----------------------
> >> userspace performs EXT_CREATE_BUF ioctl to reserve a buffer "index" range in
> >> that mode, to be used in EXT_QBUF and EXT_DQBUF
> >>
> >> Should the API allow userspace to select how many memory buffers it wants?
> >> (maybe not)
> >
> > I think it does allow that - it accepts the v4l2_ext_format struct.
>
> hmmm, I thought v4l2_ext_format would describe color planes, and not memory planes.
> Should it describe memory planes instead? Since planes are defined by the pixelformat.
> But is this information relevant to ext_{set/get/try} format?
>

Good point. I ended up assuming the current convention, where giving
an M format would imply num_memory_planes == num_color_planes and
non-M format num_memory_planes == 1. Sounds like we might want
something like a flags field and that could have bits defined to
select that. I think it would actually be useful for S_FMT as well,
because that's what REQBUFS would use.

> >
> >>
> >> userspace performs EXT_QUERY_MMAP_BUF to get the mmap offset/cookie and length
> >> for each memory buffer.
> >>
> >> On EXT_QBUF, userspace doesn't need to fill membuf information. Should the
> >> mmap offset and length be filled by the kernel and returned to userspace here
> >> as well? I'm leaning towards: no.
> >
> > Yeah, based on my comment above, I think the answer should be no.
> >
> >>
> >> If the answer is no, then here is my proposal:
> >> ----------------------------------------------
> >>
> >> /* If MMAP, drivers decide how many memory buffers to allocate */
> >> int ioctl( int fd, VIDIOC_EXT_CREATE_BUFS, struct v4l2_ext_buffer *argp )
> >>
> >> /* Returns -EINVAL if not MMAP */
> >> int ioctl( int fd, VIDIOC_EXT_MMAP_QUERYBUF, struct v4l2_ext_mmap_querybuf *argp )
> >>
> >> /* userspace fills v4l2_ext_buffer.membufs if DMA-fd or Userptr, leave it zero for MMAP
> >>  * Should userspace also fill v4l2_ext_buffer.planes?
> >>  */
> >> int ioctl( int fd, VIDIOC_EXT_QBUF, struct v4l2_ext_buffer *argp )
> >>
> >> /* v4l2_ext_buffer.membufs is set to zero by the driver */
> >> int ioctl( int fd, VIDIOC_EXT_DBUF, struct v4l2_ext_buffer *argp )
> >>
> >> (I omitted reserved fields below)
> >>
> >> struct v4l2_ext_create_buffers {
> >>         __u32                           index;
> >>         __u32                           count;
> >>         __u32                           memory;
> >>         __u32                           capabilities;
> >>         struct v4l2_ext_pix_format      format;
> >> };
> >>
> >> struct v4l2_ext_mmap_membuf {
> >>         __u32 offset;
> >>         __u32 length;
> >> }
> >>
> >> struct v4l2_ext_mmap_querybuf {
> >>         __u32 index;
> >>         struct v4l2_ext_mmap_membuf membufs[VIDEO_MAX_PLANES];
> >> }
> >>
> >> struct v4l2_ext_membuf {
> >>         __u32 memory;
> >>         union {
> >>                 __u64 userptr;
> >>                 __s32 dmabuf_fd;
> >>         } m;
> >>         // Can't we just remove the union and "memory" field, and the non-zero
> >>         // is the one we should use?
> >
> > I think that would lead to an equivalent result in this case. That
> > said, I'm not sure if there would be any significant enough benefit to
> > justify moving away from the current convention. Having the memory
> > field might also make the structure a bit less error prone, e.g.
> > resilient to missing memset().
> >
> >> };
> >>
> >> struct v4l2_ext_plane {
> >>         __u32 membuf_index;
> >>         __u32 offset;
> >>         __u32 bytesused;
> >> };
> >>
> >> struct v4l2_ext_buffer {
> >>         __u32 index;
> >>         __u32 type;
> >>         __u32 field;
> >>         __u32 sequence;
> >>         __u64 flags;
> >>         __u64 timestamp;
> >>         struct v4l2_ext_membuf membufs[VIDEO_MAX_PLANES];
> >>         struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> >
> > Do we actually need this split into membufs and planes here? After
> > all, all we want to pass to the kernel here is in what buffer the
> > plane is in.
>
> You are right, we don't.
>
> >
> > struct v4l2_ext_plane {
> >         __u32 memory;
>
> Should we design the API to allow a buffer to contain multiple memory planes
> of different types? Lets say one memplane is DMA-fd, the other is userptr.
> If the answer is yes, then struct v4l2_ext_create_buffers requires some changes.
> If not, then there is no need a "memory" field per memory plane in a buffer.
>

That's a good question. I haven't seen any practical need to do that.
Moreover, I suspect that the API might be going towards the DMA-buf
centric model, with DMA-buf heaps getting upstream acceptance, so
maybe we would be fine moving the memory field to the buffer struct
indeed.

> >         union {
> >                 __u32 membuf_index;
> >                 __u64 userptr;
> >                 __s32 dmabuf_fd;
> >         } m;
> >         __u32 offset;
> >         __u32 bytesused;
>
> We also need userptr_length right?

Is it actually needed? The length of the plane is determined by the
current format. I can only see as it being an extra sanity check
before accessing the process memory, but is it necessary? I think I
want to hear others's opinion on this.

[snip]

Best regards,
Tomasz
