Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64E92EF05A
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 11:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbhAHKBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 05:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbhAHKBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 05:01:17 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157C3C0612F5
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 02:00:37 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ce23so13740074ejb.8
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 02:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIPDrybHYDhrvRvtrv7fNkrHahASlP6RR/P3/LW+RDQ=;
        b=VLn2tfq+cDp5QXVPJu7O9dnF40qGvvxBpHn0n6yOHOwnNP+XP8cT6kPTUe1T23K+is
         OKV3bhfEzVswtI+ATO28Ul3IpAdT9JUzOSA+9XD9Q9oDn0GYgSAHWF4XuYp548lt6on4
         J3QLISt2daUJJhWALz5NzsT3tqkTLp0OKVG18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIPDrybHYDhrvRvtrv7fNkrHahASlP6RR/P3/LW+RDQ=;
        b=P0pj2VGrSWwX/Qd0rsxUguVBFqrrHFbmHWEjsB9JT1sS22KBKJnqF9ogGlWfoBCcUH
         EpW7EpaecRribT0ohfouIPfQ0Kp7IT/HjKWSnzOzZaaF56FFo7+C8R/7Lksf8c9gPrYA
         L0yxdfwGbucdHevQmsxwu2SLJ4K9HqdalMrhZWWCQwqGXQlfUipCUCNzGujhwQMkTzbK
         SMVixPy92r7SYzVs5BJfkGzR2t9IypQi5In3o2XXOgTGMfhhvdTqZ6ukOsZD0vHpZsBU
         x8BKGue8+MH+8neCPQF9K29cvCd1KX/taYcSxbMhmRsu2mYht7C9f9itJ42VL15SxE0a
         n9Cg==
X-Gm-Message-State: AOAM531/X05MjdflErMXDta2Nks6ffrx18lJ5ho2BART2gArx6EzwGgZ
        UdfO5ifphVpzMr6wKmMmfCu+K5TKHp/M/g==
X-Google-Smtp-Source: ABdhPJy5o7UPoeTXUgeWxOIy9jhhSyQ9eFCCRdiw7pnPX+ksKraakKUi1hiiWJrWFGwhAggY1A6G8w==
X-Received: by 2002:a17:906:b0c2:: with SMTP id bk2mr2196664ejb.223.1610100035197;
        Fri, 08 Jan 2021 02:00:35 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id ot18sm3330774ejb.54.2021.01.08.02.00.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 02:00:34 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id k10so7325052wmi.3
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 02:00:33 -0800 (PST)
X-Received: by 2002:a1c:c308:: with SMTP id t8mr2392160wmf.22.1610100033143;
 Fri, 08 Jan 2021 02:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20200804192939.2251988-1-helen.koike@collabora.com>
 <20200804192939.2251988-3-helen.koike@collabora.com> <b8a08145-c54e-3d06-dd61-78ce99a812d5@xs4all.nl>
 <3ac23162-ce59-6cc3-da48-90f26c618345@collabora.com> <CAAFQd5A1F7g=LSJrtqwF+KEUq-QXmi0__-mbebsN27xFA0rQCQ@mail.gmail.com>
 <b14809a5-e471-73da-efde-1d0d6f54e485@collabora.com> <de781845-7192-df0b-26c4-36b981237735@xs4all.nl>
 <f565c17a-e6ef-e875-bc01-1122ba59a50a@collabora.com> <CAAFQd5C=+0YYNHrk+B3-zUTLT8rfBg3iC9Jn7nXzFccC0JW79Q@mail.gmail.com>
 <a41fe519-8835-97a0-ef8a-ad5b5efcb449@collabora.com> <CAAFQd5DKE=xVf9tX6J6RaVR0M4udK9JDnMESdBSa8aKLwQsvfQ@mail.gmail.com>
 <4fec6e91-a19b-b0be-d4b6-72a333451d9b@collabora.com> <CAAFQd5Ds5DQ0V+c_Oapwg9CQ0ADkjtML6w6H5Ad4hwMz9Rg9YQ@mail.gmail.com>
 <79f59368-2295-c9d9-b09a-9d1256c7b0f2@collabora.com>
In-Reply-To: <79f59368-2295-c9d9-b09a-9d1256c7b0f2@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 8 Jan 2021 19:00:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A5jQWd3Vt+M9ft4npQyV72TJRhdyn6F7OVdhZrFmnkyw@mail.gmail.com>
Message-ID: <CAAFQd5A5jQWd3Vt+M9ft4npQyV72TJRhdyn6F7OVdhZrFmnkyw@mail.gmail.com>
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

On Wed, Dec 23, 2020 at 9:04 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Tomasz,
>
> On 12/21/20 12:13 AM, Tomasz Figa wrote:
> > On Thu, Dec 17, 2020 at 10:20 PM Helen Koike <helen.koike@collabora.com> wrote:
> >>
> >> Hi Tomasz,
> >>
> >> Thanks for your comments, I have a few questions below.
> >>
> >> On 12/16/20 12:13 AM, Tomasz Figa wrote:
> >>> On Tue, Dec 15, 2020 at 11:37 PM Helen Koike <helen.koike@collabora.com> wrote:
> >>>>
> >>>> Hi Tomasz,
> >>>>
> >>>> On 12/14/20 7:46 AM, Tomasz Figa wrote:
> >>>>> On Fri, Dec 4, 2020 at 4:52 AM Helen Koike <helen.koike@collabora.com> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> Please see my 2 points below (about v4l2_ext_buffer and another about timestamp).
> >>>>>>
> >>>>>> On 12/3/20 12:11 PM, Hans Verkuil wrote:
> >>>>>>> On 23/11/2020 18:40, Helen Koike wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 11/23/20 12:46 PM, Tomasz Figa wrote:
> >>>>>>>>> On Tue, Nov 24, 2020 at 12:08 AM Helen Koike <helen.koike@collabora.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> Hi Hans,
> >>>>>>>>>>
> >>>>>>>>>> Thank you for your review.
> >>>>>>>>>>
> >>>>>>>>>> On 9/9/20 9:27 AM, Hans Verkuil wrote:
> >>>>>>>>>>> Hi Helen,
> >>>>>>>>>>>
> >>>>>>>>>>> Again I'm just reviewing the uAPI.
> >>>>>>>>>>>
> >>>>>>>>>>> On 04/08/2020 21:29, Helen Koike wrote:
> > [snip]
> >>>
> >>>>
> >>>> Output: userspace fills plane information, informing in which memory buffer each
> >>>>         plane was placed (Or should this be pre-determined by the driver?)
> >>>>
> >>>> For MMAP
> >>>> -----------------------
> >>>> userspace performs EXT_CREATE_BUF ioctl to reserve a buffer "index" range in
> >>>> that mode, to be used in EXT_QBUF and EXT_DQBUF
> >>>>
> >>>> Should the API allow userspace to select how many memory buffers it wants?
> >>>> (maybe not)
> >>>
> >>> I think it does allow that - it accepts the v4l2_ext_format struct.
> >>
> >> hmmm, I thought v4l2_ext_format would describe color planes, and not memory planes.
> >> Should it describe memory planes instead? Since planes are defined by the pixelformat.
> >> But is this information relevant to ext_{set/get/try} format?
> >>
> >
> > Good point. I ended up assuming the current convention, where giving
> > an M format would imply num_memory_planes == num_color_planes and
> > non-M format num_memory_planes == 1. Sounds like we might want
> > something like a flags field and that could have bits defined to
> > select that. I think it would actually be useful for S_FMT as well,
> > because that's what REQBUFS would use.
>
> Would this flag select between memory and color planes?
> I didn't understand how this flag would be useful to S_FMT, could you
> please clarify?

I mean a flag that decides the plane layout between the 2 possible
options (all planes in their own buffers at offsets 0 vs all planes in
one buffer one after another), rather than giving too much flexibility
for MMAP buffers, which isn't necessary any way, because DMABUF can be
used if more flexibility is needed.

Best regards,
Tomasz

>
> Thanks
> Helen
>
> >
> >>>
> >>>>
> >>>> userspace performs EXT_QUERY_MMAP_BUF to get the mmap offset/cookie and length
> >>>> for each memory buffer.
> >>>>
> >>>> On EXT_QBUF, userspace doesn't need to fill membuf information. Should the
> >>>> mmap offset and length be filled by the kernel and returned to userspace here
> >>>> as well? I'm leaning towards: no.
> >>>
> >>> Yeah, based on my comment above, I think the answer should be no.
> >>>
> >>>>
> >>>> If the answer is no, then here is my proposal:
> >>>> ----------------------------------------------
> >>>>
> >>>> /* If MMAP, drivers decide how many memory buffers to allocate */
> >>>> int ioctl( int fd, VIDIOC_EXT_CREATE_BUFS, struct v4l2_ext_buffer *argp )
> >>>>
> >>>> /* Returns -EINVAL if not MMAP */
> >>>> int ioctl( int fd, VIDIOC_EXT_MMAP_QUERYBUF, struct v4l2_ext_mmap_querybuf *argp )
> >>>>
> >>>> /* userspace fills v4l2_ext_buffer.membufs if DMA-fd or Userptr, leave it zero for MMAP
> >>>>  * Should userspace also fill v4l2_ext_buffer.planes?
> >>>>  */
> >>>> int ioctl( int fd, VIDIOC_EXT_QBUF, struct v4l2_ext_buffer *argp )
> >>>>
> >>>> /* v4l2_ext_buffer.membufs is set to zero by the driver */
> >>>> int ioctl( int fd, VIDIOC_EXT_DBUF, struct v4l2_ext_buffer *argp )
> >>>>
> >>>> (I omitted reserved fields below)
> >>>>
> >>>> struct v4l2_ext_create_buffers {
> >>>>         __u32                           index;
> >>>>         __u32                           count;
> >>>>         __u32                           memory;
> >>>>         __u32                           capabilities;
> >>>>         struct v4l2_ext_pix_format      format;
> >>>> };
> >>>>
> >>>> struct v4l2_ext_mmap_membuf {
> >>>>         __u32 offset;
> >>>>         __u32 length;
> >>>> }
> >>>>
> >>>> struct v4l2_ext_mmap_querybuf {
> >>>>         __u32 index;
> >>>>         struct v4l2_ext_mmap_membuf membufs[VIDEO_MAX_PLANES];
> >>>> }
> >>>>
> >>>> struct v4l2_ext_membuf {
> >>>>         __u32 memory;
> >>>>         union {
> >>>>                 __u64 userptr;
> >>>>                 __s32 dmabuf_fd;
> >>>>         } m;
> >>>>         // Can't we just remove the union and "memory" field, and the non-zero
> >>>>         // is the one we should use?
> >>>
> >>> I think that would lead to an equivalent result in this case. That
> >>> said, I'm not sure if there would be any significant enough benefit to
> >>> justify moving away from the current convention. Having the memory
> >>> field might also make the structure a bit less error prone, e.g.
> >>> resilient to missing memset().
> >>>
> >>>> };
> >>>>
> >>>> struct v4l2_ext_plane {
> >>>>         __u32 membuf_index;
> >>>>         __u32 offset;
> >>>>         __u32 bytesused;
> >>>> };
> >>>>
> >>>> struct v4l2_ext_buffer {
> >>>>         __u32 index;
> >>>>         __u32 type;
> >>>>         __u32 field;
> >>>>         __u32 sequence;
> >>>>         __u64 flags;
> >>>>         __u64 timestamp;
> >>>>         struct v4l2_ext_membuf membufs[VIDEO_MAX_PLANES];
> >>>>         struct v4l2_ext_plane planes[VIDEO_MAX_PLANES];
> >>>
> >>> Do we actually need this split into membufs and planes here? After
> >>> all, all we want to pass to the kernel here is in what buffer the
> >>> plane is in.
> >>
> >> You are right, we don't.
> >>
> >>>
> >>> struct v4l2_ext_plane {
> >>>         __u32 memory;
> >>
> >> Should we design the API to allow a buffer to contain multiple memory planes
> >> of different types? Lets say one memplane is DMA-fd, the other is userptr.
> >> If the answer is yes, then struct v4l2_ext_create_buffers requires some changes.
> >> If not, then there is no need a "memory" field per memory plane in a buffer.
> >>
> >
> > That's a good question. I haven't seen any practical need to do that.
> > Moreover, I suspect that the API might be going towards the DMA-buf
> > centric model, with DMA-buf heaps getting upstream acceptance, so
> > maybe we would be fine moving the memory field to the buffer struct
> > indeed.
> >
> >>>         union {
> >>>                 __u32 membuf_index;
> >>>                 __u64 userptr;
> >>>                 __s32 dmabuf_fd;
> >>>         } m;
> >>>         __u32 offset;
> >>>         __u32 bytesused;
> >>
> >> We also need userptr_length right?
> >
> > Is it actually needed? The length of the plane is determined by the
> > current format. I can only see as it being an extra sanity check
> > before accessing the process memory, but is it necessary? I think I
> > want to hear others's opinion on this.
> >
> > [snip]
> >
> > Best regards,
> > Tomasz
> >
