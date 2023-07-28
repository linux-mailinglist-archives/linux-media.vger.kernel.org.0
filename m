Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D1E766416
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 08:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjG1GXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 02:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232782AbjG1GXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 02:23:41 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92257A0
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 23:23:39 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-40553466a08so11300541cf.3
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 23:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690525418; x=1691130218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9qPdlm1ReHqwmo2FxAME7hY6kG8vj/DByNpFwGBv3E=;
        b=FW/UilF/dRbMBUjv/XiNzGNDfXU6p04RedzWyL3FpNAw5kFfGY8cnJdCGSqMrA2to8
         05seqMQXfSy48HVmPExk3RiQhpNPFhebIseVnu10V4S+bEwvoWrE85MIHaxQLOTJqsZg
         9zQE5hA/BtrkGkK9mYBQKBdtLf/pHmtvOmt/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690525418; x=1691130218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9qPdlm1ReHqwmo2FxAME7hY6kG8vj/DByNpFwGBv3E=;
        b=jJm0ne0IxA7RiIvPntY2zSQQ1uv+hW4MjIztoVDdS4sZpp9qZeT5M4SVNGxY49Ti6m
         9t91RRdIjHK4aASrhjXCXTYpdUZTkCyuQxPGtVFyOBl7JjO9uZWrE/0DEm6g3fh9niqQ
         IuQBpQngSMWQp2Z2ZqIL1b2QzLctHBZwITHFC9TufPp/zJFPNTmRUgqr0IA5wHafKUmg
         trD/1QF4b1nRCWcyxDoblYM2aQEO/J59ZUGIzn48RdFpAfrrsJ1EKbHhTxMLq9L28t9d
         o1SbOptm7Syo3rVA2omCYSGu2U85FWhkyoFNcV9sMY1xhKpLNJ4+iNsxeT1juzZYyCYK
         Zr3Q==
X-Gm-Message-State: ABy/qLatSSfZCM9GNYlqEojyWAWI5p/FLKK/J8rOS/Q8MFGsEu9SxrRP
        XF7vclEFlZjB2iBV9eO8c7rcKmKPBNVeZatrwqgpFw==
X-Google-Smtp-Source: APBJJlF/gI84e1Q/MiPrFk/0e37sHNPl6hPrWFSbxVhIaXYHZDSLDYmCn3O+IIFeBJp4uPAYKHeosQ==
X-Received: by 2002:a05:622a:1aa0:b0:407:2c52:2858 with SMTP id s32-20020a05622a1aa000b004072c522858mr1429517qtc.55.1690525417995;
        Thu, 27 Jul 2023 23:23:37 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id z1-20020ac83e01000000b003e3918f350dsm958596qtf.25.2023.07.27.23.23.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 23:23:36 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-63cf3dcffe0so10729946d6.1
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 23:23:36 -0700 (PDT)
X-Received: by 2002:a0c:d692:0:b0:626:1e95:2feb with SMTP id
 k18-20020a0cd692000000b006261e952febmr1377537qvi.19.1690525416152; Thu, 27
 Jul 2023 23:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <3df23ff7-7a62-ed92-b9fb-a988e96c9790@synaptics.com>
 <CAAFQd5DBwCL8vELwJpFZPseLgLeXq-p2LWO9t=PYc0wXVjGB9w@mail.gmail.com> <fccd65a7-d555-0957-75f0-804730981be3@synaptics.com>
In-Reply-To: <fccd65a7-d555-0957-75f0-804730981be3@synaptics.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 28 Jul 2023 15:23:24 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DbnYmxKC3763HQy0hmuwcWNT=YdrOm2BQdb=+6fPBTPg@mail.gmail.com>
Message-ID: <CAAFQd5DbnYmxKC3763HQy0hmuwcWNT=YdrOm2BQdb=+6fPBTPg@mail.gmail.com>
Subject: Re: [RFC]: media: mc: storing query status in variable length buffer
 likes blob in DRM
To:     Hsia-Jun Li <Randy.Li@synaptics.com>
Cc:     Yunke Cao <yunkec@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 27, 2023 at 7:10=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics.com=
> wrote:
>
>
>
> On 7/27/23 17:07, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >
> >
> > On Tue, Jul 4, 2023 at 5:41=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics.=
com> wrote:
> >>
> >> Hello All
> >>
> >> This RFC will address the problem that some ioctl() commands would be
> >> called many times until that command got all the all its entries. Thos=
e
> >> ioctl() command are:
> >>
> >> - VIDIOC_ENUM_FMT
> >>
> >> - VIDIOC_QUERYCTRL
> >>
> >> - VIDIOC_ENUMSTD and VIDIOC_SUBDEV_ENUMSTD
> >>
> >> Generally speaking, all enumeration type commands would lead to
> >> frequently context switch between userspace  and kernel space. A few
> >> enumeration commands listed below may not meet this problem in some
> >> cases, as they could present their entries in a step wise way.
> >>
> >> - VIDIOC_ENUM_FRAMESIZES
> >>
> >> - VIDIOC_ENUM_FRAMEINTERVALS
> >>
> >
> > Right, it's something that often comes in conversations with user
> > space developers on how it's difficult to query information from V4L2.
> > That said, we've mostly found it as an annoyance rather than a
> > practical problem. Do you have some specific case where the current
> > approach of enumeration causes a problem for the application (e.g.
> > performance)?
> >
> I have to admit the performance is not a problem for enumeration of
> pixel formats. We only do that in the setup step.
>
> The original problem before ext_pixel_format is enumeration of the
> colorspace, 12 variant of colorimetries for a pixel format.
>
> After we began to disccus the v4l2 ext APIs, I want to remove the
> barrier that we can't update the v4l2 uAPI easily under the size limitati=
on.
> >>
> >> A simple solution that we could bring and improve from DRM is the blob
> >> object(struct drm_property_blob).
> >>
> >> We could extend the existing ioctl() in this way:
> >>
> >> 1. VIDIOC_ENUM_EXT_FMT would turn a blob id and the memory size
> >> requirement that usespace should prepare
> >>
> >> for storing.
> >>
> >> 2. Appication call VIDIOC_GETPROPBLOB with blob id and a userspace
> >> pointer which should be enough for storing.
> >>
> >> 3. V4L2 framework fill the that userptr with context likes this:
> >>
> >> struct v4l2_blob_prop {
> >>
> >> __u32 version;
> >>
> >> __u32 payload_size;
> >>
> >> __u32 payload[];
> >>
> >> };
> >>
> >> 4. The parsing of payload would depend on its version which
> >> v4l2_blob_prop.version says, and each entry in the payload could be
> >> variable length, likes this:
> >>
> >> struct v4l2_ext_pix_mod_desc {
> >>
> >> __u64 modifier;
> >>
> >> __u64 allocate_hints; /* heap flags shard by DMA-heap */
> >>
> >> __u32 num_of_planes;
> >>
> >> __u32 plane_sizes[8];
> >>
> >> __u32 colorimetry_flags;
> >>
> >> };
> >>
> >> struct v4l2_ext_pix_desc {
> >>
> >> __u32 fourcc;
> >>
> >> __u32 num_of_modifies;
> >>
> >> struct v4l2_ext_pix_mod_desc[];
> >>
> >> };
> >>
> >
> > Since I'm not familiar with the DRM blob approach it might be an
> > obvious thing, but what happens when the application was written when
> DRM doesn't have such design about API version.
> > let's say the version was 3, but the kernel it's running on now was
> > upgraded to version 4?
> >
> Nope, the API version is not selected by the userspace but kernel.
> It is something likes the protocol version in wayland.
>
> We would careful make a version of API but we don't not take the
> responsibility for the back-compatible for the application.

I hope Linus is not seeing this. Linux UAPI backwards compatibility is
a hard guarantee and it's stated multiple times in the kernel
documentation, for example:

https://www.kernel.org/doc/html/latest/process/4.Coding.html#regressions

I would be really surprised if DRM was an exception. Let me add
+Daniel Vetter as my source of truth regarding the DRM UAPI.

> >>
> >> In this design, we could avoid the problem that we could hardly extend
> >> our uAPI for V4L2, all the structure must be a fixed size.
> >>
> >> Here are some options design that people want for this RFC:
> >>
> >> 1. Do we need to call the ioctl() command itself(likes
> >> VIDIOC_ENUM_EXT_FMT) which let the driver to flush its internal proper=
ty
> >> cache or calling VIDIOC_GETPROPBLOB is enough?
> >
> > Wouldn't the former make it thread-unsafe?
> >
> Why we need thread safe here? V4L2 don't offer such thing.

That's not really true. What is your statement based on?

All V4L2 drivers need to allow calling their ioctls from different
threads - in the simplest case by serializing them. Any call to a V4L2
ioctl must return a consistent result. In your case, one thread would
call VIDIOC_ENUM_EXT_FMT, another could then call VIDIOC_ENUM_EXT_CTRL
and then if the first one calls VIDIOC_GETPROPBLOB it would get
results for something completely different than originally requested.

Arguably, the current design of enumerations is not thread-safe
either, because one thread could read supported formats from 0 to n,
then another thread could change some other state of the device and
then the first thread would get potentially different results for
formats n+1 to N. That is a design problem of the API, though. Nobody
was expecting that the list of formats would ever change due to some
potentially unrelated state change when the API was being designed.
(Although that's addressed today by the SRC_FMT change event, making
the user space re-read the destination formats when it notices it.)

> > I'd imagine something like this:
> >
> > struct v4l2_property_array {
> >          __u32 version; // Could be equal to the length of the struct
> >
> It should not be. version means the structure of the payload.
> >          void __user *buf;
> >          __u32 len;
> >
> >          __u32 num_formats;
> >          __u32 num_frame_sizes;
> >          __u32 num_modifiers;
> >          __u32 num_controls;
> >          __u32 num_menus;
> >
> >         // More fields could be added here for more types of
> > information to query, with next versions, which could be ignored by
> > old userspace.
> You know what this buffer for(the property that you want) before this
> step. That is not necessary to have a union reporting the items in the
> payload.
> A struct(or an item) in the payload(many items) itself could have a
> variable array. How many items in the payload may not help on parsing
> for the userspace.

They don't have to have variable arrays if designed as such. Instead of hav=
ing

struct v4l2_ext_pix_mod_desc modifiers[];
__u32 num_modifiers;

in struct v4l2_ext_pix_desc, we can have the struct representing a
supported modifier refer to a pixel format by its fourcc. Sure, the
drawback would be repeating the same information for every <modifier,
fourcc> pair in the rest of the struct, but at least we don't need to
have variable arrays. Another approach would be to have an additional
association array of only <fourcc, modifier> pairs, like in databases.

My main goal is to make it possible to keep backwards compatibility of
returned data, as per the kernel UAPI development guidelines, with a
reasonable amount of effort and without complicating user space
programming too much. That said, we may still need to have some kind
of size variability in the structs, because otherwise we wouldn't be
able to extend them in the future with more fields, so my proposal
wouldn't work either. Need to think about it for a moment.

> > };
> >
> > If out_buf is NULL, the kernel fills len and num_* fields and returns.
> > Then the userspace allocates a big enough buffer and calls the ioctl
> > again with buf !=3D NULL, which fills in the buffer pointed by buf as
> > below.
> >
> The maximum requirement size would be confirmed at the first step, a
> ioctl() likes VIDIOC_ENUM_EXT_FMT.
> > {
> >          (struct v4l2_ext_format[]) {
> >                 [0] =3D { ... },
> >                 [num_formats - 1] =3D { ... }
> >          }
> >          (struct v4l2_frame_size[]) {
> >                  [0] =3D { ... },
> >                  [num_frame_sizes - 1] =3D { ... }
> >          }
> >          // [...]
> >          (struct v4l2_ctrl_menu[]) {
> >                  [0] =3D { ... },
> >                  [num_menus - 1] =3D { ... }
> >          }
> > }
> >
> > I think we could also let the user space fill in the version and num_
> > (presumably with 0) to control what information it wants the kernel to
> > return.
> >
> >>
> >> 2. Should we make MC node support this feature only or standard video
> >> node could? A thought from pinchartl is that every driver should have =
a
> >> MC node even for the stateful driver.
> >>
> >
> > The futuristic model that we envisioned back in time would be that
> > there is a media device that gives the user space ability to perform
> > operations on all the interfaces of the respective media controller
> > (or even all interfaces in the system - but that would require some
> > security considerations). In such a model, the userspace could prepare
> > an array (or blob if you prefer) of operations, where each operation
> > refers to an interface entity ID on which to execute the operation. It
> > would allow us to submit complete requests (or even many of them) in a
> > single ioctl, reducing the overhead significantly.
> >
> > That said, it would be a complete overhaul of the API, so it might be
> > a step too big? Not sure. We certainly could benefit from V4L3. ;)
> >
> I thought of that. But I try to convince people those are not a big
> change but essential.

Overhauling the entire querying side of the API is already quite a big
change. It shouldn't really matter if the change is small and big,
assuming a good enough justification is there (and the change meets
the kernel development requirements).

> >>
> >> The implementation of RFC could be a foundation for ext pixel and ext
> >> buffer APIs. I would like to know your feedback before we settle the
> >> problem with the ext pixel format.
> >
> > I feel like this kind of batch operation would be more important for
> > buffer management, because it could allow dequeuing multiple buffers
> > in one ioctl, which is actually something that is starting to show up
> > as a real performance bottleneck for complex devices, such as ISPsI thi=
nk I make it for MC node from the idea of Pinchart.
> > (We have a MediaTek ISP that has a really big number of DMA engines,
> > which accounts to about 200 DQBUFs per frame. Let me add +Yunke Cao
> I need to know how it happens.

I can't share the exact details, but basically it's an ISP, so it has
multiple different processing blocks that have their own inputs and
outputs. They can then be relatively freely arranged into a processing
pipeline.

> > who's been looking into what performance effects it has and how we
> > could improve it.)
> >
> We need to hurry up on settling the design of m2m or v4l2 framework.

Hurry is the biggest foe of API design. ;)
The last thing we want is an API that we'll have to replace again in a
few quarters.
I agree that we need to have people mobilized and invest more time
into modernizing the API, though.

> We meet the fourcc namespace problem at least 5 years ago, but we still
> didn't fix it.

What's the problem with the fourcc namespace?

Best regards,
Tomasz
