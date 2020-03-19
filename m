Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2598018B1B6
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 11:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgCSKve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 06:51:34 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:40680 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCSKvd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 06:51:33 -0400
Received: by mail-wr1-f44.google.com with SMTP id f3so2236978wrw.7
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/RXi4E6N2BrHZ7nZPIDPshoq9XlJz4tXbLpi7SJ8rvk=;
        b=IrUTJak5anMDl/TSTYtpbGyjX4cb7wbtHeGdMjFolrQW9YexSz8k7vzEZWaX/wqjvI
         khTEPPcieXiAUCVnMFn1T6l9EWkt7TvY4115BOHxoH6tefXDxZG+6eOUInXUN/N2+S6E
         2pvbfpU2ujUz1BD2achNsFhbTamXb+kQrrUVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/RXi4E6N2BrHZ7nZPIDPshoq9XlJz4tXbLpi7SJ8rvk=;
        b=mujOPEadaFEPpkoDwaM6dOPrsAjiMhgTVvq3JNAUO97PlHlZLeG32GOtGHuT9qNWNq
         gnd+I+MJlCqdK5z8K3opU/MSf8Y/MZbQTqVsEXEHoUtXA28Fr0rNYgbJnSkPmOZZEiOl
         1S9csJphKxqr+tXdE3ljGeEiqelINvfMx1tT4qWn/pPsBRMYjeUjyGV4dZpURBc7BjUS
         /3ehLjZBJTrnyDx2c8THD9b46IYjzArWUFjcPxysxrS/WDZhRh5EmLPxbHlBY+IxQ9BV
         QIKKV8YDS4C58GvKbykEuFIs0q5xxUxRKQR4PafulbtEUG85lEMPVBj8UIytP3sozKgX
         h+vA==
X-Gm-Message-State: ANhLgQ0pvYvXfw5NWGUldctnk4GdZaS520YFNbm62fNKsL6YkfnifA91
        jnGjOxjGaeyWytuIMRJpxmNziA==
X-Google-Smtp-Source: ADFU+vvUA2QcRpbnGKfFXs6t1PT7JukCMEhlBYJupowdhcJ7r9ZnCkaEdec3wJdJloK5j9a2Av8QAQ==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr3483827wrn.421.1584615091968;
        Thu, 19 Mar 2020 03:51:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v10sm2555208wml.44.2020.03.19.03.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 03:51:31 -0700 (PDT)
Date:   Thu, 19 Mar 2020 11:51:29 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc:     Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Jason Ekstrand <jason@jlekstrand.net>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        linux-media@vger.kernel.org
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
Message-ID: <20200319105129.GF2363188@phenom.ffwll.local>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
 <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
 <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea771b02-b74b-2a89-e55c-2977d641558d@daenzer.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 11:01:57AM +0100, Michel Dänzer wrote:
> On 2020-03-16 7:33 p.m., Marek Olšák wrote:
> > On Mon, Mar 16, 2020 at 5:57 AM Michel Dänzer <michel@daenzer.net> wrote:
> >> On 2020-03-16 4:50 a.m., Marek Olšák wrote:
> >>> The synchronization works because the Mesa driver waits for idle (drains
> >>> the GFX pipeline) at the end of command buffers and there is only 1
> >>> graphics queue, so everything is ordered.
> >>>
> >>> The GFX pipeline runs asynchronously to the command buffer, meaning the
> >>> command buffer only starts draws and doesn't wait for completion. If the
> >>> Mesa driver didn't wait at the end of the command buffer, the command
> >>> buffer would finish and a different process could start execution of its
> >>> own command buffer while shaders of the previous process are still
> >> running.
> >>>
> >>> If the Mesa driver submits a command buffer internally (because it's
> >> full),
> >>> it doesn't wait, so the GFX pipeline doesn't notice that a command buffer
> >>> ended and a new one started.
> >>>
> >>> The waiting at the end of command buffers happens only when the flush is
> >>> external (Swap buffers, glFlush).
> >>>
> >>> It's a performance problem, because the GFX queue is blocked until the
> >> GFX
> >>> pipeline is drained at the end of every frame at least.
> >>>
> >>> So explicit fences for SwapBuffers would help.
> >>
> >> Not sure what difference it would make, since the same thing needs to be
> >> done for explicit fences as well, doesn't it?
> > 
> > No. Explicit fences don't require userspace to wait for idle in the command
> > buffer. Fences are signalled when the last draw is complete and caches are
> > flushed. Before that happens, any command buffer that is not dependent on
> > the fence can start execution. There is never a need for the GPU to be idle
> > if there is enough independent work to do.
> 
> I don't think explicit fences in the context of this discussion imply
> using that different fence signalling mechanism though. My understanding
> is that the API proposed by Jason allows implicit fences to be used as
> explicit ones and vice versa, so presumably they have to use the same
> signalling mechanism.
> 
> 
> Anyway, maybe the different fence signalling mechanism you describe
> could be used by the amdgpu kernel driver in general, then Mesa could
> drop the waits for idle and get the benefits with implicit sync as well?

Yeah, this is entirely about the programming model visible to userspace.
There shouldn't be any impact on the driver's choice of a top vs. bottom
of the gpu pipeline used for synchronization, that's entirely up to what
you're hw/driver/scheduler can pull off.

Doing a full gfx pipeline flush for shared buffers, when your hw can do
be, sounds like an issue to me that's not related to this here at all. It
might be intertwined with amdgpu's special interpretation of dma_resv
fences though, no idea. We might need to revamp all that. But for a
userspace client that does nothing fancy (no multiple render buffer
targets in one bo, or vk style "I write to everything all the time,
perhaps" stuff) there should be 0 perf difference between implicit sync
through dma_resv and explicit sync through sync_file/syncobj/dma_fence
directly.

If there is I'd consider that a bit a driver bug.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
