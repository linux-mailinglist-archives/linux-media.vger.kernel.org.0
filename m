Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B777F183EB1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 02:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgCMBhj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 21:37:39 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:32813 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgCMBhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 21:37:39 -0400
Received: by mail-qt1-f195.google.com with SMTP id d22so6264622qtn.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1su1FtYhvLukRFjOPJKpPGzMks5TFRo2RUOnu8jvPBc=;
        b=RS0wu07mMtJJnQAZZ+RJ9cJoUiamFx+ctkyOC0dKGnY4F7Eq5JsEnODLd0EzQZhJtv
         vnaPfanoSbQbD2wZJH8GTCSeUApDCgNrobr/l5rGc5b+voD+Yj8vcJ0TtVpjS7eikVbm
         +srB6fExh7Egd2H1C0uZ8KWrMFW6WrnMnBGgKI7W8CcH+qU3CYSs5485IsIEfA9t+MlI
         gmsy2lTNEYDeA6ZMbz4rflSrgvTpYDl9dDLEa55pbpKSAH+J5DOZwyHhnfvMCrf3zgfF
         lOZUbAybewLiO1Iq6GTAjrl/uH6nJ0UNpCMXyz/uY8SY/lqVDy8Ycpc4J1dfPZoe9GAi
         Mh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1su1FtYhvLukRFjOPJKpPGzMks5TFRo2RUOnu8jvPBc=;
        b=PCU2xw96P5WmQ/YzmzcROq8IckyGn8KCp4dxgV4Y8uM92eGPTH22s3f7QUdDBoCZAy
         UmzSl7I9EvZKv+mgNjxzVhRBHKaX+xXw2reZIz4CMhzeDIyD15Vabl9EUbgSfbmGn6YI
         f2R29jjCnFKYTsVYQX9I3rr3X/8Lmt4fWNxYG5S4O4N2ui0uATmjuLpVxwPEyzdUagX2
         xfZRq/Pws26m9iExZFwHTlXnDhHlekpfSshmzYmrTb2Ia2m0sYsWEGuueJ5FuxZaFfjG
         O8SfEJXPji5givEAM33UImSuqsuMOGjF2eECJMCQwT0ooc/IEue/RcJtIdemOPGjOXTi
         uvRg==
X-Gm-Message-State: ANhLgQ05hhB1Bi7wSTqzQ6pNqD5+B35/cGF9bdEo96Nps+qimIhGFMYc
        rkHQzGmzzSHac8Z0MUwS5TQ3TcVFKxQ+35DXMoo=
X-Google-Smtp-Source: ADFU+vvmSRq9n6Q6n0ceO8TSTRtXhQnYI3GMv38CZ1di8cNtVi7n3a97Cbr2iuX0QTFJVst+QiFSpnd+OgSQAL8YXMY=
X-Received: by 2002:aed:2533:: with SMTP id v48mr2029402qtc.39.1584063458349;
 Thu, 12 Mar 2020 18:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
In-Reply-To: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
From:   "Alexander E. Patrakov" <patrakov@gmail.com>
Date:   Fri, 13 Mar 2020 06:37:27 +0500
Message-ID: <CAN_LGv20iPVmPQ_cXFATNp94Hp9ubnVb2ViUYndLihRk_uOgEw@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 6:36 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> From the perspective of a Wayland compositor (I used to play in this
> space), they'd love to implement the new explicit sync extension but
> can't.  Sure, they could wire up the extension, but the moment they go
> to flip a client buffer to the screen directly, they discover that KMS
> doesn't support any explicit sync APIs.  So, yes, they can technically
> implement the extension assuming the EGL stack they're running on has
> the sync_file extensions but any client buffers which come in using
> the explicit sync Wayland extension have to be composited and can't be
> scanned out directly.  As a 3D driver developer, I absolutely don't
> want compositors doing that because my users will complain about
> performance issues due to the extra blit.

<troll>
Maybe this is something for the Marketing Department to solve? Sell
the extra processing that can be done during such extra blit as a
feature?

As a former user of a wide-gamut monitor that has no sRGB mode, and a
gamer, I would definitely accept the extra step (color conversion, not
"just a blit"!) between the application and the actual output. In
fact, I have set up compicc just for this purpose. Games with
poisonous oversaturated colors (because none of the game authors care
about wide-gamut monitors) are worse than the same games affected by
the very small performance penalty due to the conversion.

We just need a Marketing Person to come up with a huge list of other
cases where such compositing step is required for correctness, and
declare that direct scanout is something that makes no sense in the
present day, except possibly on embedded devices.
</troll>

Of course the above trolling does not solve the problem related to
inability to be sure about the correct API usage.

-- 
Alexander E. Patrakov
CV: http://pc.cd/PLz7
