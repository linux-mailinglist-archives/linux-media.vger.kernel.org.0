Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDEA6186F8F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 17:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731873AbgCPQE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 12:04:28 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:42780 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731674AbgCPQE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 12:04:28 -0400
Received: by mail-ed1-f42.google.com with SMTP id b21so12281715edy.9
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R0RpgBy6YG2hHlldZBfrskephzxPvYh4Y4G/mDFzT9Q=;
        b=g6bHyQ6jD29Qm0zk88i4B4OuJoRPCkh7TSYGuCQL+rLyd5thyEQTWcCzy9fTMXhWPo
         0oYSl2p3b5xaKcoP6UUVBALARQNYtTO7aQZM1tWcl0f+UAdN8NVpRCxnD65llJ7y7WFa
         RabsB629q3y+Bv1SlOtCLv5YN4KUtcMhy+lJ7FvWPu2IOSryBGN0tWwa03HmlJ/KDVlE
         IbpoQKs6gLeKqG459Ej4Xy2XJIHvik6wrZrAmT6fX0Bw4Zs7DqQdEu4nv3+YT8S1m8M+
         qyNcYgm876BSZM3YYi+s26gZ9suYiUy7p7dNivRF6l8tEcpeN8JZYgCnSLBNbMR5FHDs
         b7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R0RpgBy6YG2hHlldZBfrskephzxPvYh4Y4G/mDFzT9Q=;
        b=o/D5aZL2D2om3v8EOdZt+LvOBRWooJ+/PA0ZqjDPSso+p1WLuSkoWKA+rI0xfJ69/h
         NzL3QLR3H6hlTDsEGwne+upE0/GrsmTm7AZGH4TUXubLILCyuD6eOlhPiuc56Hn2vtlU
         I0c4zQ9EPQk56DOTzZ86VZ3XwA9OEjIN6cHLWcHBYUQY+pxTfpzNrdwkQUg0hjcZU9TV
         E9iBQw3eAF20PF7vvvIIkwUBBuu5t0LdmVqu06CY8jVFDpYAeswDS0tJhgFjtG/DiXoH
         gg4GZg+hb4cWOQCMRt/CJPhdgGbkc1DgTbRVPK7MWOMLjd/MwgskYF+q1gQR/KkSDDIn
         7HwA==
X-Gm-Message-State: ANhLgQ08ymONFA9/koJCW7EnaFWTQgTauyzOZ5CA6p86+6O8WcSb0NcH
        uJhRzmUBmu6VrnhEk3MZWVzBbrHVbIyFMB2AtCwOfA==
X-Google-Smtp-Source: ADFU+vskGVugVeBsQFVCQ9+ZzYiueB+aT7W0P7y2bJnjSMeY3cBEw57ecZ/MejMLCQHrVDk4Wh8kaybsledR7Z2DRZk=
X-Received: by 2002:a17:906:484:: with SMTP id f4mr1706361eja.61.1584374663787;
 Mon, 16 Mar 2020 09:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com> <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
In-Reply-To: <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Mon, 16 Mar 2020 11:04:12 -0500
Message-ID: <CAOFGe94crnBBvjfP=0W3awUrxu+ZZG1_Q3bO03ti6jBckgTf_g@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Tomek Bury <tomek.bury@gmail.com>
Cc:     Daniel Stone <daniel@fooishbar.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
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

On Mon, Mar 16, 2020 at 10:33 AM Tomek Bury <tomek.bury@gmail.com> wrote:
>
> > GL and GLES are not relevant. What is relevant is EGL, which defines
> > interfaces to make things work on the native platform.
> Yes and no. This is what EGL spec says about sharing a texture between co=
ntexts:
>
> "OpenGL and OpenGL ES makes no attempt to synchronize access to
> texture objects. If a texture object is bound to more than one
> context, then it is up to the programmer to ensure that the contents
> of the object are not being changed via one context while another
> context is using the texture object for rendering. The results of
> changing a texture object while another context is using it are
> undefined."
>
> There are similar statements with regards to the lack of
> synchronisation guarantees for EGL images or between GL and native
> rendering, etc. But the main thing here is that EGL and Vulkan differ
> significantly. The eglSwapBuffers() is expected to post an unspecified
> "back buffer" to the display system using some internal driver magic.
> EGL driver is then expected to obtain another back buffer at some
> unspecified point in the future. Vulkan on the other hand is very
> specific and explicit. The vkQueuePresentKHR() is expected to post a
> specific vkImage with an explicit set of set of semaphores. Another
> image is obtained through vkAcquireNextImageKHR() and it's the
> application's decision whether it wants a fence, a semaphore, both or
> none with the acquired buffer. The implicit synchronisation doesn't
> mix well with Vulkan drivers and requires a lot of extra plumbing  in
> the WSI code.

Yes, and that (the Vulkan issues in particular) is what I'm trying to
fix. :-)  (among other things...)  Assuming the kernel patch I linked
to, your usermode driver could stuff fences in the dma-buf without
having that be part of your kernel driver.  This assumes, of course,
that your kernel driver supports sync_file.

> > If you are using EGL_WL_bind_wayland_display, then one of the things
> > it is explicitly allowed/expected to do is to create a Wayland
> > protocol interface between client and compositor, which can be used to
> > pass buffer handles and metadata in a platform-specific way. Adding
> > synchronisation is also possible.
> Only one-way synchronisation is possible with this mechanism. There's
> a standard protocol for recycling buffers - wl_buffer_release() so
> buffer hand-over from the compositor to client remains unsynchronised
>
> - see below.
>
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

I think you may be missing what Daniel is saying.  Wayland allows you
to do basically anything you want within your client and server-side
EGL implementations.  That could include the server-side EGL sending
an event with a fence every single time a flush operation happens in
the server-side GL/GLES implementation. (Could be glFlush, glFinish,
eglSwapBuffers, or other things).  Since wayland protocol events are
ordered, the client-side EGL implementation would get the most recent
flush event before it got the wl_buffer::release.  I fully agree that
it's rather cumbersome though.

> > In every cross-process and cross-subsystem usecase, synchronisation is
> > obviously required. The two options for this are to implement kernel
> > support for implicit synchronisation (as everyone else has done),
> That would require major changes in driver architecture or a 2nd
> mechanisms doing the same thing but in kernel space - both are
> non-starters.
>
> > or implement generic support for explicit synchronisation (as we have
> > been working on with implementations inside Weston and Exosphere at
> > least),
> The zwp_linux_explicit_synchronization_v1 is a good step forward. I'm
> using this extension as a main synchronisation mechanism in EGL and
> Vulkan driver whenever available. I remember that Gustavo Padovan was
> working on explicit sync support in the display system some time ago.
> I hope it got merged into kernel by now, but I don't know to what
> extend it's actually being used.

It is supported by KMS/atomic.  Legacy KMS, however, does not support it.

> > or implement private support for explicit synchronisation,
> If everything else fails, that would be the last resort scenario, but
> far from ideal and very costly in terms of implementation and
> maintenance as it would require maintaining custom patches for various
> 3rd party components or littering them with multiple custom explicit
> synchronisation schemes.

If you want to see explicit synchronization everywhere, I would very
much like to see more developers driving its adoption.  I implemented
support in the Intel Vulkan driver last week:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4169

Hopefully, that will provide some motivation for other compositors
(kwin, gnome-shell, etc.) because they now have a real user of it in
an upstream driver for a major desktop platform and not just a few
weston examples.  However, someone is going to have to drive the
actual development in those compositors.  I'd be very happy if more
people got involved, :-)

--Jason
