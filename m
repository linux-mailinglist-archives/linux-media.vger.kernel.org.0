Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2C4186F9C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 17:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731990AbgCPQF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 12:05:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36781 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731674AbgCPQF1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 12:05:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id s5so21982053wrg.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l/vmXaFjbOkxFMx9winQUMvtTz4uZpE15ayBD6BK3wM=;
        b=ovnGmPF6xds0bUBLKzjuoGFHt+/d5snFy2UlX5ubC1HiA+CGyn5yOIMLyZ6JmhRDct
         3Up8Q+dB7N3HrdwLQvSWXi2JYm8idFGJzkwMR0PAP/zuqE64sjgs/eu+b9fptAq0HMpo
         7tM8lowpwEMIWNYdf7DmDsifH+LxVkl4cNL1AIdFoN8s/oleW9GD8KWPcGpjtvB2V1Kq
         gN4638ZDiTqPGTAgPTr/703hIJ0McZ10+uE1EBbpoXl1du/7GeJaYLrveEWiWK+DV1Rk
         SuOmPcVi05mIbD+fy/YZMFLtQCqWwRo9nIXsVXaPL1eSgSe31dkfzGBxB8IAQ7fyNATS
         rH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l/vmXaFjbOkxFMx9winQUMvtTz4uZpE15ayBD6BK3wM=;
        b=IpyPt17jM+qb3YHjUIqMW0304fHWUhVr++9ZSyjtj5bcj0qVtEgcJJs0vEKCPwag8+
         0FQwXfefQVqsOHjmNwyRrpg64duZnK2c8EzGj57g2DktVn1IUk3SzOaE9I0dBCmmqN+p
         tUB5ywhUaz/sPt+Jr/H4Zz6KQGxdDlZrKvv8M7lbUKIsc6ugBQ4qkfcXJK/ZtRQ22DcL
         vhe3usFa8wqI6k7SvK7yPZwQDjEIokh696ViigQLFrFE6rQpaLEOeRH1votxB0uyDP0p
         +hM3DcnaKfkdaK6ZXMtGpcY0/wM8QHP/2M9wEOJ+p2IIilWwYGlDaQWUPpxVnzo8OLwQ
         OG0g==
X-Gm-Message-State: ANhLgQ1XD7HgYoMLyfv0OZGQ2/q3fRPHpX7SkWdjKYdoXBwh5SCX/fiQ
        NO6fgmBqhmWc8GC8dVCpFSEj3emjlNdp4uq5m6uVvA==
X-Google-Smtp-Source: ADFU+vsXwyftza70a81WFd79xHS0y3MhptvOdKri5uWgusKXXrdhl9aADFueQFz9igu3ZdUil19mYVvFuV83UWqLkP4=
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr87382wrq.256.1584374725149;
 Mon, 16 Mar 2020 09:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com> <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
In-Reply-To: <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Mon, 16 Mar 2020 16:04:32 +0000
Message-ID: <CAPj87rM-kmKH6yJZE5vbiQv3KTKXsywe88Na6sGm+Guew++ZfA@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Tomek Bury <tomek.bury@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Dave Airlie <airlied@gmail.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Mon, 16 Mar 2020 at 15:33, Tomek Bury <tomek.bury@gmail.com> wrote:
> > GL and GLES are not relevant. What is relevant is EGL, which defines
> > interfaces to make things work on the native platform.
> Yes and no. This is what EGL spec says about sharing a texture between co=
ntexts:

Contexts are different though ...

> There are similar statements with regards to the lack of
> synchronisation guarantees for EGL images or between GL and native
> rendering, etc.

This also isn't about native rendering.

> But the main thing here is that EGL and Vulkan differ
> significantly.

Sure, I totally agree.

> The eglSwapBuffers() is expected to post an unspecified
> "back buffer" to the display system using some internal driver magic.
> EGL driver is then expected to obtain another back buffer at some
> unspecified point in the future.

Yes, this is rather the point: EGL doesn't specify platform-related
'black magic' to make things just work, because that's part of the
platform implementation details. And, as things stand, on Linux one of
those things is implicit synchronisation, unless the desired end state
of your driver is no synchronisation.

This thread is a discussion about changing that.

> > If you are using EGL_WL_bind_wayland_display, then one of the things
> > it is explicitly allowed/expected to do is to create a Wayland
> > protocol interface between client and compositor, which can be used to
> > pass buffer handles and metadata in a platform-specific way. Adding
> > synchronisation is also possible.
> Only one-way synchronisation is possible with this mechanism. There's
> a standard protocol for recycling buffers - wl_buffer_release() so
> buffer hand-over from the compositor to client remains unsynchronised
> - see below.

That's not true; you can post back a sync token every time the client
buffer is used by the compositor.

> > > The most troublesome part was Wayland buffer release mechanism, as it=
 only involves a CPU signalling over Wayland IPC, without any 3D driver inv=
olvement. The choices were: explicit synchronisation extension or a buffer =
copy in the compositor (i.e. compositor textures from the copy, so the clie=
nt can re-write the original), or some implicit synchronisation in kernel s=
pace (but that wasn't an option in Broadcom driver).
> >
> > You can add your own explicit synchronisation extension.
> I could but that requires implementing in in the driver and in a
> number of compositors, therefore a standard extension
> zwp_linux_explicit_synchronization_v1 is much better choice here than
> a custom one.

EGL_WL_bind_wayland_display is explicitly designed to allow each
driver to implement its own private extensions without modifying
compositors. For instance, Mesa adds the `wl_drm` extension, which is
used for bidirectional communication between the EGL implementations
in the client and compositor address spaces, without modifying either.

> > In every cross-process and cross-subsystem usecase, synchronisation is
> > obviously required. The two options for this are to implement kernel
> > support for implicit synchronisation (as everyone else has done),
> That would require major changes in driver architecture or a 2nd
> mechanisms doing the same thing but in kernel space - both are
> non-starters.

OK. As it stands, everyone else has the kernel mechanism (e.g. via
dmabuf resv), so in this case if you are reinventing the underlying
platform in a proprietary stack, you get to solve the same problems
yourselves.

Cheers,
Daniel
