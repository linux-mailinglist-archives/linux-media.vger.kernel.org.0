Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC8318B18E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 11:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCSKeo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 06:34:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34123 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgCSKeo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 06:34:44 -0400
Received: by mail-wr1-f66.google.com with SMTP id z15so2185401wrl.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+HsihkrBV/Vt2ATCPXC+nbaVsuM4g0AQNEdfwqBce2w=;
        b=i7ytroA6IFoY56neWMQRdmqsJF+XwgwP0QuMdAXb+b8Q67dIexlUI2biFAF1sa/cmN
         mtAdTS8M7LC92pRr4HjTcfkPryjW+itGJiwyqYg/+YXjRWjOdB6hL2YEEiBPiWu+ao17
         Z9mjkmydrTqqMr2ZiD3kd+3XxNA5AuDs+uPPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+HsihkrBV/Vt2ATCPXC+nbaVsuM4g0AQNEdfwqBce2w=;
        b=M7LzYwOPwWlTbfzgfcAuGS9V+BK8aiEesgi0VbgnujY+50CtT/Qo8fBqXmESV04TeK
         TX/26/ZzvrD702KI4ufuwCYAOyTc7KOmrBk5K1u93p3HiOxj+0sDc89o42tcNF4JrKYd
         IVp/4afbxGuO1JIOqn9lkmB/lWfGzPQVEcbfSoWDRxKYy//iadZTtPprzMGmRRYy3Hw3
         uDRPZU0DYX45UQ7IJn1GD+rbtdRUjbuVP2Nmuj04nQwp7wWGKuNSJZPsK4iq2q1HiXuP
         J/HceOOoa4cV44XPf3XnDHjb+yaqkwEG09WlGqA1VeMNvg6n55S9InAD6Gkj428BjMGW
         ZX5Q==
X-Gm-Message-State: ANhLgQ236VAwHaxG+B8xS66penTrksOF9TuzWEK5NmL7eScBgQDVipSY
        ZNS+GEcwM35ysauhYvpxcna5Yw==
X-Google-Smtp-Source: ADFU+vsMVI1BEcGQKKKo+aVa8NuKFNjePiIKK/z1ToX/o3DCKebfP+Mg2xY266tS9kf2MfW9je6Bjw==
X-Received: by 2002:adf:e891:: with SMTP id d17mr3387478wrm.348.1584614082081;
        Thu, 19 Mar 2020 03:34:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h12sm1550335wml.12.2020.03.19.03.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 03:34:41 -0700 (PDT)
Date:   Thu, 19 Mar 2020 11:34:39 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     Jacob Lifshay <programmerjake@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
Message-ID: <20200319103439.GC2363188@phenom.ffwll.local>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <CAOFGe94vX5CMyjs8jehXj3f7t9yu__=-N+etNz5eY7sqwqb-jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe94vX5CMyjs8jehXj3f7t9yu__=-N+etNz5eY7sqwqb-jA@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 12:18:47PM -0500, Jason Ekstrand wrote:
> On Tue, Mar 17, 2020 at 12:13 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
> >
> > One related issue with explicit sync using sync_file is that combined
> > CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> > rendering in userspace (like llvmpipe but for Vulkan and with extra
> > instructions for GPU tasks) but need to synchronize with other
> > drivers/processes is that there should be some way to create an
> > explicit fence/semaphore from userspace and later signal it. This
> > seems to conflict with the requirement for a sync_file to complete in
> > finite time, since the user process could be stopped or killed.
> 
> Yeah... That's going to be a problem.  The only way I could see that
> working is if you created a sync_file that had a timeout associated
> with it.  However, then you run into the issue where you may have
> corruption if stuff doesn't complete on time.  Then again, you're not
> really dealing with an external unit and so the latency cost of going
> across the window system protocol probably isn't massively different
> from the latency cost of triggering the sync_file.  Maybe the answer
> there is to just do everything in-order and not worry about
> synchronization?

vgem does that already (fences with timeout). The corruption issue is also
not new, if your shaders take forever real gpus will nick your rendering
with a quick reset. Iirc someone (from cros google team maybe) was even
looking into making llvmpipe run on top of vgem as a real dri/drm mesa
driver.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
