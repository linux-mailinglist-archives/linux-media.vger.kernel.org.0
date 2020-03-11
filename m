Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21200182581
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 00:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731382AbgCKXCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 19:02:45 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54623 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729739AbgCKXCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 19:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583967764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S22WCBK32dW62v5FBfF/eaiBnVwh5JRqi9VfbTFA4vk=;
        b=co8v6T7EE0IvKKwulsXHOT9jgcI+FHkfg6Rds6IXX9yOC0t3WHHHYai+cmvGv9mfKRzyhY
        4Q4DkE4tw+KDJnDefn6XizEbxIuKhplK2Tf9uhlh4ACSJdsoHNz++2SWnxu/Zxf3Q9viFB
        Z+5a0MviTCj3OmFYq3vLCnyuEyYKiHg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-0_LJSmxhM-K-NmYjUzd9iQ-1; Wed, 11 Mar 2020 19:02:43 -0400
X-MC-Unique: 0_LJSmxhM-K-NmYjUzd9iQ-1
Received: by mail-qv1-f72.google.com with SMTP id g12so2351671qvp.20
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 16:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S22WCBK32dW62v5FBfF/eaiBnVwh5JRqi9VfbTFA4vk=;
        b=gZI3ScrDKPfY/AmrHeRiBxMdlB1TaWHYETmu7PH2wAujJMpp7xQ6eE2JJvUex6a9DD
         J9LH493j9N0re80Ra09eupcaC3X2R+nfMYD4oHVrgD/fQ8Nd1q7usRlAh90/Gr2BQu3R
         iojTXUQYK1Hm5G0++ORj/vHp+DSCppl0RgxQng9Uy5/ngcVJgLgzg16kVt4SLJmfxL/3
         FPXtuHojdRVc/gdss18wRj1ZK4DwJ6b22/koqeDizCI/wq1CQZ/vIWZK5Q/EH+LhIpEt
         llc0za0uesjiqJly5F3xESOQiliL/QFesxi13QbFroz3J/oXvHRvrtTar8GfUy3FnsMg
         IzpQ==
X-Gm-Message-State: ANhLgQ0fQ7KpTO36UQlPwkr6tfJb68x6JtApIAe9AZ44bE14HILzque7
        x/A5J9DxJ1i6/lOh4NVZgRH70LszlNT3K214qtNBzOHZoJ9I2VdfSCmhHOvZPUFHBd3cR8jMOIf
        kYVIPVen1C7Pd5D39E6CR7zs=
X-Received: by 2002:a0c:fb06:: with SMTP id c6mr5062587qvp.122.1583967762535;
        Wed, 11 Mar 2020 16:02:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvS/go2gmlbv8VHFqdnlZeBdO239g7k/V8qddp+HdRMjPSgdahO9YGEzt44xW+XIjVC7ERSmQ==
X-Received: by 2002:a0c:fb06:: with SMTP id c6mr5062573qvp.122.1583967762308;
        Wed, 11 Mar 2020 16:02:42 -0700 (PDT)
Received: from desoxy (c-24-61-245-152.hsd1.ma.comcast.net. [24.61.245.152])
        by smtp.gmail.com with ESMTPSA id x51sm5490005qtj.82.2020.03.11.16.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:02:41 -0700 (PDT)
Message-ID: <59bce0ac12d70810880f77d276571dc5d686a9f8.camel@redhat.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
From:   Adam Jackson <ajax@redhat.com>
To:     Jason Ekstrand <jason@jlekstrand.net>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Daniel Stone <daniel@fooishbar.org>
Date:   Wed, 11 Mar 2020 19:02:37 -0400
In-Reply-To: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-03-11 at 12:31 -0500, Jason Ekstrand wrote:

>  - X11: With present, it has these "explicit" fence objects but
> they're always a shmfence which lets the X server and client do a
> userspace CPU-side hand-off without going over the socket (and
> round-tripping through the kernel).  However, the only thing that
> fence does is order the OpenGL API calls in the client and server and
> the real synchronization is still implicit.

I'm pretty sure "the only thing that fence does" is an implementation
detail. PresentPixmap blocks until the wait-fence signals, but when and
how it signals are properties of the fence itself. You could have drm
give the client back a fence fd, pass that to xserver to create a fence
object, and name that in the PresentPixmap request, and then drm can do
whatever it wants to signal the fence.

> From my perspective, as a Vulkan driver developer, I have to deal with
> the fact that Vulkan is an explicit sync API but Wayland and X11
> aren't.

I'm quite sure we can give you an explicit-sync X11 API. I think you
may already have one.

- ajax

