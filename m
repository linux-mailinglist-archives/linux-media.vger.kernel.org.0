Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 424C61870F1
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 18:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732159AbgCPRLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 13:11:30 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:34055 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732009AbgCPRLa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 13:11:30 -0400
Received: by mail-ua1-f66.google.com with SMTP id g21so6861420uaj.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 10:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIQbkhWW1CshXc560+02Ghxg2S580YLkWlLvER5vpd4=;
        b=ZfMif4klLvwsM7JIVwgZ8xUYv4ww1dNAWZ3NN/29laKybTlQ9lai/F9s3j0oHql5XG
         pdvwT7/opAURS/pzfdOQT/tQROffq3gCPagPf3QotTKjlDo2PB6WkUjlbq67LnO4cTj6
         nfQqJ9a3qFGn/40wS1grRWQ9Pspgoimd37x4TUgsJmnbr1zaR7yybSU0KJV7lPv+P81p
         qH6rpes/aCfy7V/GGdzDmVIR8EoSVRv1QxMDnKt7E2MArEvFNmNUAx0vge1B8zXyPKge
         UxTYeMHlK4uxf8MARgVIeWJNE3aFF5zZ6SYIXIKag1FwVicoAg9zxRUnxY1mOt772eGx
         ekmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIQbkhWW1CshXc560+02Ghxg2S580YLkWlLvER5vpd4=;
        b=XCvRilJ5UM3RvKA3H1MXKeScGK35ogSI+htg1+/1pZDC7JXYjkYyQNwOab7dA73jbW
         7yXcHAtN1vbYChWiAGyqYuqepxdxAUSBoWgZVO87URC54R29asZEU7MBrKkH7oSH5nX8
         PJLQP2igsHJGicBiwT8vTnAAMyHy3VShbCm3bN7DM9gEKsS3IcffnmUzMZ86q+E0fW7m
         pFp+i3C7gcAaRCLx3EgfQO3XfexTnIpTaInZy6LXB5DyC3w/BKKyz9maURqzTXgeebmn
         5L85qsyTS59qtodG2HXuUgkPfFrltjAMUAoo3doVkj1ROMc5yP2R5TrP1mTaNKJJkthU
         plMQ==
X-Gm-Message-State: ANhLgQ3iGE+nAYITLABzv6HU5qhH3e76CYg63iPdTtGh0gibbbCrRypO
        AmUt3KGAhQXIf28EKFPtn8WZtTXr4LIUPBGejVw=
X-Google-Smtp-Source: ADFU+vtFOnReKy7mdHcw0alejs5WzaKUcLq3Ev3Ze9kGweyUw3cPoIkVFp3QdIv9Fyu36RwsDuUzN35lyUVOnM8eFhY=
X-Received: by 2002:ab0:67:: with SMTP id 94mr794846uai.139.1584378688957;
 Mon, 16 Mar 2020 10:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
 <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com> <CAPj87rM-kmKH6yJZE5vbiQv3KTKXsywe88Na6sGm+Guew++ZfA@mail.gmail.com>
In-Reply-To: <CAPj87rM-kmKH6yJZE5vbiQv3KTKXsywe88Na6sGm+Guew++ZfA@mail.gmail.com>
From:   Tomek Bury <tomek.bury@gmail.com>
Date:   Mon, 16 Mar 2020 17:11:17 +0000
Message-ID: <CAO1ALzn+D-gj93d49BGsu7X+2oKnDobhi9cMeVfR25yAu14Vjw@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Daniel Stone <daniel@fooishbar.org>
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> That's not true; you can post back a sync token every time the client
> buffer is used by the compositor.
Technically, yes but it's very cumbersome and invasive to the point
where it becomes impractical. Explicit sync is much cleaner solution.

> For instance, Mesa adds the `wl_drm` extension, which is
> used for bidirectional communication between the EGL implementations
> in the client and compositor address spaces, without modifying either.
Broadcom driver adds "wl_nexus" extension which servers similar
purpose for both EGL and Vulkan WSI

> OK. As it stands, everyone else has the kernel mechanism (e.g. via
> dmabuf resv), so in this case if you are reinventing the underlying
> platform in a proprietary stack, you get to solve the same problems
> yourselves.
That's an important point. In the explicit synchronisation scenario
the sync token is passed with the buffer. It becomes irrelevant where
the token originated from, as long as it's a commonly used type of
token, i.e. dma_fence in kernel space or sync_fd in user space. That
allows for greater flexibility and works with and without dma
reservation objects.

Cheers,
Tomek
