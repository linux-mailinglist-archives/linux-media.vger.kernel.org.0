Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 385D0186CEE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 15:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731456AbgCPOUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 10:20:51 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:53660 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729631AbgCPOUv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 10:20:51 -0400
Received: by mail-wm1-f46.google.com with SMTP id 25so17873472wmk.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lCVRcWuoqSFl9sGnC8c12m+SWaVwxGlK7BuQr+QvnO8=;
        b=WFG3xc8zoDgUYH2hvIvTPWgij9nOMlZARwhbcz8a0J4UIGdVU6d5psQ/WGPrbW83Xo
         hZkxS6/7Fapud7w6NM1fSMZlOgnZc09dq8583uiHFzdjNooxWSf9IdhG4vsQeRRigsQi
         cpLrHt4zYe8zKz9st+7Y0RShulPMaQJe0Y20wV2lqBB0dlXM76xwWZd/9ytBy8Xl6Zxt
         1qYW788othu/VjOP4KN4jA65OdXmi/DRuk75uMAMtLhxf/V5tauPE7+RKxxUuOXLjS2E
         wDdCahLhUsyb18VwYLyPaIt2GOK1fLFb1BaXykdcqxgcQKm/Ta2a1AhMiavRtt2epc5f
         Zv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lCVRcWuoqSFl9sGnC8c12m+SWaVwxGlK7BuQr+QvnO8=;
        b=Ub9TOTsR+UdQkvXo/jQnkbwjS1K1igJ3R0R4GhnVeeqqcpRcFLVVNfVtS/b9eqin4B
         woZKUWkfMIhc8gV2P6Fzp0gogfbC3NqR3Hf5WnpfKr7v/2c8ULLz2OqfbPK8WBvJmchr
         B1m7DkMP1NV6F85oWm/N8ygsBjROCXNFLRaOCTQaOEhAbvvLUYPQreBoA2UZzg1j86Tl
         2tYzZz5zhTJxb0R/MFDK8pyA/tVBItiVhHdGu46MW81zmzs7bIsbXdtsm2oqvOZv6Uhg
         Ce580rOJkz2hK9b6Xi9nYNFEdUSz+bCajk2YyLVMh/uCqtppeqf20mQWNSj8gGXsWQ8Q
         dCTg==
X-Gm-Message-State: ANhLgQ1U3Fxi2tgPYULksZBtOinmCy0Tn192cEid+2U6VKOO32jOrblq
        LmANJ7ruu40LRHLkUeWr4DgtWwbpRoWzPUXoDF/Xlg==
X-Google-Smtp-Source: ADFU+vsq3/x6v6lcvejrjC3o0qItXykDeNQ3x01CIM7UBRevRBaz4S+fhsx6tNXYD4+4GWiIl75lPjao9ywpdjb49wA=
X-Received: by 2002:a1c:2e92:: with SMTP id u140mr11155915wmu.84.1584368447789;
 Mon, 16 Mar 2020 07:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
In-Reply-To: <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Mon, 16 Mar 2020 14:19:55 +0000
Message-ID: <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
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

Hi Tomek,

On Mon, 16 Mar 2020 at 12:55, Tomek Bury <tomek.bury@gmail.com> wrote:
> I've been wrestling with the sync problems in Wayland some time ago, but =
only with regards to 3D drivers.
>
> The guarantee given by the GL/GLES spec is limited to a single graphics c=
ontext. If the same buffer is accessed by 2 contexts the outcome is unspeci=
fied. The cross-context and cross-process synchronisation is not guaranteed=
. It happens to work on Mesa, because the read/write locking is implemented=
 in the kernel space, but it didn't work on Broadcom driver, which has read=
-write interlocks in user space.

GL and GLES are not relevant. What is relevant is EGL, which defines
interfaces to make things work on the native platform. EGL doesn't
define any kind of synchronisation model for the Wayland, X11, or
GBM/KMS platforms - but it's one of the things which has to work. It
doesn't say that the implementation must make sure that the requested
format is displayable, but you sort of take it for granted that if you
ask EGL to display something it will do so.

Synchronisation is one of those mechanisms which is left to the
platform to implement under the hood. In the absence of platform
support for explicit synchronisation, the synchronisation must be
implicit.

>  A Vulkan client makes it even worse because of conflicting requirements:=
 Vulkan's vkQueuePresentKHR() passes in a number of semaphores but disallow=
s waiting. Wayland WSI requires wl_surface_commit() to be called from vkQue=
uePresentKHR() which does require a wait, unless a synchronisation primitiv=
e representing Vulkan samaphores is passed between Vulkan client and the co=
mpositor.

If you are using EGL_WL_bind_wayland_display, then one of the things
it is explicitly allowed/expected to do is to create a Wayland
protocol interface between client and compositor, which can be used to
pass buffer handles and metadata in a platform-specific way. Adding
synchronisation is also possible.

> The most troublesome part was Wayland buffer release mechanism, as it onl=
y involves a CPU signalling over Wayland IPC, without any 3D driver involve=
ment. The choices were: explicit synchronisation extension or a buffer copy=
 in the compositor (i.e. compositor textures from the copy, so the client c=
an re-write the original), or some implicit synchronisation in kernel space=
 (but that wasn't an option in Broadcom driver).

You can add your own explicit synchronisation extension.

In every cross-process and cross-subsystem usecase, synchronisation is
obviously required. The two options for this are to implement kernel
support for implicit synchronisation (as everyone else has done), or
implement generic support for explicit synchronisation (as we have
been working on with implementations inside Weston and Exosphere at
least), or implement private support for explicit synchronisation, or
do nothing and then be surprised at the lack of synchronisation.

Cheers,
Daniel
