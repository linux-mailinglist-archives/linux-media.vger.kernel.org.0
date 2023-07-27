Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5473764F28
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbjG0JQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbjG0JQX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:16:23 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF3B83D2
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 02:07:34 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-403b6b7c0f7so4527291cf.0
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690448853; x=1691053653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhLZH2czO2JKy1CZ/NtH/uHtfd1qc+NfXeCV/sF7tKU=;
        b=PnuFdVPpoFbdN0uKFkNOC+Fz3Ke0pS3rmtx0mbBfp5mRcT0nGnLKW2PGzm+beZDZQO
         CzecJY9cNM9wU3+ACLmT+K+DRQpUAgimTcJjwqeId/cnRMuMlS+7Snp5rtriwkUT3uR6
         QEQvDzJZtWCjywgM5HT6BTDSVIQZCxAj2YPi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448853; x=1691053653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhLZH2czO2JKy1CZ/NtH/uHtfd1qc+NfXeCV/sF7tKU=;
        b=a8VcrEJr2H3D2m+rMQzyXWjs6TmGl1BgACAcxPWcctNFB0DBxer9IWhEah11DCb9tV
         l5zZD07g+qZ3L3pLo9ifALCZdU/1j+a8Nl1tyCLJkFk8boM0eyqwGdNI4yTKXYUERd1r
         PlOI+t/SGOPrglzLkk6L8f58gA/VywO7skNQMTyGkYwMiFSReTonCRSAdB4ZW+HJGn4p
         E+2/MTPhWqVMgveSdHKzdIUDY6kct+0NOY9TgEBM0xhkjHy86A8mW/1/h4dLI63TEvJb
         T9shft0NlLkm3ywnce4AahCsfQ4+tewQs/1tvPeM3Lzu5i+COXkYUmWWSZ0iuiL8EQMW
         xgQw==
X-Gm-Message-State: ABy/qLbl2G06lqXY+vAFECLsNnQsXaqlvUc2+tzCXDH6SLd2mnpZJUeB
        k0mST467g2CCAoC7IG0GabYtEKjIUZy4zXZUS52Rew==
X-Google-Smtp-Source: APBJJlE9Co6xfdiekpUBfjGGsoDG6/sRHb3OQatNLLWpfgqFWJrQp7pe0yxaqFm3zERt1S4f2za6iA==
X-Received: by 2002:ac8:5804:0:b0:403:eecb:9cfd with SMTP id g4-20020ac85804000000b00403eecb9cfdmr5293743qtg.23.1690448852715;
        Thu, 27 Jul 2023 02:07:32 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id h10-20020ac85e0a000000b00406bf860430sm296339qtx.11.2023.07.27.02.07.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 02:07:32 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7672303c831so62314985a.2
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 02:07:32 -0700 (PDT)
X-Received: by 2002:a05:620a:84a:b0:767:c3fb:bd22 with SMTP id
 u10-20020a05620a084a00b00767c3fbbd22mr4553725qku.43.1690448851783; Thu, 27
 Jul 2023 02:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <3df23ff7-7a62-ed92-b9fb-a988e96c9790@synaptics.com>
In-Reply-To: <3df23ff7-7a62-ed92-b9fb-a988e96c9790@synaptics.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 27 Jul 2023 18:07:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DBwCL8vELwJpFZPseLgLeXq-p2LWO9t=PYc0wXVjGB9w@mail.gmail.com>
Message-ID: <CAAFQd5DBwCL8vELwJpFZPseLgLeXq-p2LWO9t=PYc0wXVjGB9w@mail.gmail.com>
Subject: Re: [RFC]: media: mc: storing query status in variable length buffer
 likes blob in DRM
To:     Hsia-Jun Li <Randy.Li@synaptics.com>,
        Yunke Cao <yunkec@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 4, 2023 at 5:41=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics.com>=
 wrote:
>
> Hello All
>
> This RFC will address the problem that some ioctl() commands would be
> called many times until that command got all the all its entries. Those
> ioctl() command are:
>
> - VIDIOC_ENUM_FMT
>
> - VIDIOC_QUERYCTRL
>
> - VIDIOC_ENUMSTD and VIDIOC_SUBDEV_ENUMSTD
>
> Generally speaking, all enumeration type commands would lead to
> frequently context switch between userspace  and kernel space. A few
> enumeration commands listed below may not meet this problem in some
> cases, as they could present their entries in a step wise way.
>
> - VIDIOC_ENUM_FRAMESIZES
>
> - VIDIOC_ENUM_FRAMEINTERVALS
>

Right, it's something that often comes in conversations with user
space developers on how it's difficult to query information from V4L2.
That said, we've mostly found it as an annoyance rather than a
practical problem. Do you have some specific case where the current
approach of enumeration causes a problem for the application (e.g.
performance)?

>
> A simple solution that we could bring and improve from DRM is the blob
> object(struct drm_property_blob).
>
> We could extend the existing ioctl() in this way:
>
> 1. VIDIOC_ENUM_EXT_FMT would turn a blob id and the memory size
> requirement that usespace should prepare
>
> for storing.
>
> 2. Appication call VIDIOC_GETPROPBLOB with blob id and a userspace
> pointer which should be enough for storing.
>
> 3. V4L2 framework fill the that userptr with context likes this:
>
> struct v4l2_blob_prop {
>
> __u32 version;
>
> __u32 payload_size;
>
> __u32 payload[];
>
> };
>
> 4. The parsing of payload would depend on its version which
> v4l2_blob_prop.version says, and each entry in the payload could be
> variable length, likes this:
>
> struct v4l2_ext_pix_mod_desc {
>
> __u64 modifier;
>
> __u64 allocate_hints; /* heap flags shard by DMA-heap */
>
> __u32 num_of_planes;
>
> __u32 plane_sizes[8];
>
> __u32 colorimetry_flags;
>
> };
>
> struct v4l2_ext_pix_desc {
>
> __u32 fourcc;
>
> __u32 num_of_modifies;
>
> struct v4l2_ext_pix_mod_desc[];
>
> };
>

Since I'm not familiar with the DRM blob approach it might be an
obvious thing, but what happens when the application was written when
let's say the version was 3, but the kernel it's running on now was
upgraded to version 4?

>
> In this design, we could avoid the problem that we could hardly extend
> our uAPI for V4L2, all the structure must be a fixed size.
>
> Here are some options design that people want for this RFC:
>
> 1. Do we need to call the ioctl() command itself(likes
> VIDIOC_ENUM_EXT_FMT) which let the driver to flush its internal property
> cache or calling VIDIOC_GETPROPBLOB is enough?

Wouldn't the former make it thread-unsafe?

I'd imagine something like this:

struct v4l2_property_array {
        __u32 version; // Could be equal to the length of the struct

        void __user *buf;
        __u32 len;

        __u32 num_formats;
        __u32 num_frame_sizes;
        __u32 num_modifiers;
        __u32 num_controls;
        __u32 num_menus;

       // More fields could be added here for more types of
information to query, with next versions, which could be ignored by
old userspace.
};

If out_buf is NULL, the kernel fills len and num_* fields and returns.
Then the userspace allocates a big enough buffer and calls the ioctl
again with buf !=3D NULL, which fills in the buffer pointed by buf as
below.

{
        (struct v4l2_ext_format[]) {
               [0] =3D { ... },
               [num_formats - 1] =3D { ... }
        }
        (struct v4l2_frame_size[]) {
                [0] =3D { ... },
                [num_frame_sizes - 1] =3D { ... }
        }
        // [...]
        (struct v4l2_ctrl_menu[]) {
                [0] =3D { ... },
                [num_menus - 1] =3D { ... }
        }
}

I think we could also let the user space fill in the version and num_
(presumably with 0) to control what information it wants the kernel to
return.

>
> 2. Should we make MC node support this feature only or standard video
> node could? A thought from pinchartl is that every driver should have a
> MC node even for the stateful driver.
>

The futuristic model that we envisioned back in time would be that
there is a media device that gives the user space ability to perform
operations on all the interfaces of the respective media controller
(or even all interfaces in the system - but that would require some
security considerations). In such a model, the userspace could prepare
an array (or blob if you prefer) of operations, where each operation
refers to an interface entity ID on which to execute the operation. It
would allow us to submit complete requests (or even many of them) in a
single ioctl, reducing the overhead significantly.

That said, it would be a complete overhaul of the API, so it might be
a step too big? Not sure. We certainly could benefit from V4L3. ;)

>
> The implementation of RFC could be a foundation for ext pixel and ext
> buffer APIs. I would like to know your feedback before we settle the
> problem with the ext pixel format.

I feel like this kind of batch operation would be more important for
buffer management, because it could allow dequeuing multiple buffers
in one ioctl, which is actually something that is starting to show up
as a real performance bottleneck for complex devices, such as ISPs.
(We have a MediaTek ISP that has a really big number of DMA engines,
which accounts to about 200 DQBUFs per frame. Let me add +Yunke Cao
who's been looking into what performance effects it has and how we
could improve it.)

>
> --
> Hsia-Jun(Randy) Li
>
