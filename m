Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A37E18B1A7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 11:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgCSKmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 06:42:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51485 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCSKmf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 06:42:35 -0400
Received: by mail-wm1-f65.google.com with SMTP id c187so1563553wme.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 03:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wrCnl50923ooR99IVXGrzyLo3gD95lf5EcrmhIw2T/U=;
        b=k7ptxr7r6tVxQml/fxPdoD1r7WkFfy38t+nRdEvgOq/Jg5JXpoQy3TApI+9X/PqHBs
         34r5HdTz/NTJweI9gDvV9uHZDNkg7puLNgVPol6Q3cqraSnyv1LeBiOuUlhmnMD2yV1w
         PtEiPxEwXA3YqExVwlthYRYcdo3nGMW95pX18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wrCnl50923ooR99IVXGrzyLo3gD95lf5EcrmhIw2T/U=;
        b=QnLDMlO+6Kg6paAb5hGmYFlgX5wW2av/KDwoFH+ttKKXkfVkISoTnWVCVSvGEU5AUr
         tvgZQpTuDC5zHwDHpVXLb5bTKEiGMzATjMCLc8V7sCnB/nc1ULHznRMU92MaZDKGPLPg
         ehWM7oWjH95E+EL3oYQpagyK0xi0VlDZU9VQKIckvrP56v5V3XYSe+sTYYljD+Rtt5vH
         6XHmo3SeJiNrVDX2a3g+I+AIvdKFfPABClCdD4asakid2Kom8Ej2TPwPn0bmbHOS5CRs
         7ww2k9WbvGMTBDgV1JCJ7wHyXNBuMcSZDxDJ+Oq4AZICF0zKDO4IAz7XuLU8iGanne4R
         bHKg==
X-Gm-Message-State: ANhLgQ2S/9yNKEnAJtdSsW3cRz0GXYsfZdTnfyptJfyUV/2u4Uu8aMug
        0lBrOAUH8dycNtZE1jzL+aFicw==
X-Google-Smtp-Source: ADFU+vtb/6CSbOxpnVNWstrUW9Bx3WyrMXNbpvZsxC0e4GMAIQvuf/kkzGA428rRu1Qchn20TXkMNQ==
X-Received: by 2002:a1c:6385:: with SMTP id x127mr2916492wmb.141.1584614551970;
        Thu, 19 Mar 2020 03:42:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i1sm2730943wrq.89.2020.03.19.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 03:42:30 -0700 (PDT)
Date:   Thu, 19 Mar 2020 11:42:28 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
Message-ID: <20200319104228.GE2363188@phenom.ffwll.local>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 11:27:28AM -0500, Jason Ekstrand wrote:
> On Tue, Mar 17, 2020 at 10:33 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> >
> > Le lundi 16 mars 2020 � 23:15 +0200, Laurent Pinchart a �crit :
> > > Hi Jason,
> > >
> > > On Mon, Mar 16, 2020 at 10:06:07AM -0500, Jason Ekstrand wrote:
> > > > On Mon, Mar 16, 2020 at 5:20 AM Laurent Pinchart wrote:
> > > > > Another issue is that V4L2 doesn't offer any guarantee on job ordering.
> > > > > When you queue multiple buffers for camera capture for instance, you
> > > > > don't know until capture complete in which buffer the frame has been
> > > > > captured.
> > > >
> > > > Is this a Kernel UAPI issue?  Surely the kernel driver knows at the
> > > > start of frame capture which buffer it's getting written into.  I
> > > > would think that the kernel APIs could be adjusted (if we find good
> > > > reason to do so!) such that they return earlier and return a (buffer,
> > > > fence) pair.  Am I missing something fundamental about video here?
> > >
> > > For cameras I believe we could do that, yes. I was pointing out the
> > > issues caused by the current API. For video decoders I'll let Nicolas
> > > answer the question, he's way more knowledgeable that I am on that
> > > topic.
> >
> > Right now, there is simply no uAPI for supporting asynchronous errors
> > reporting when fences are invovled. That is true for both camera's and
> > CODEC. It's likely what all the attempt was missing, I don't know
> > enough myself to suggest something.
> >
> > Now, why Stateless video decoders are special is another subject. In
> > CODECs, the decoding and the presentation order may differ. For
> > Stateless kind of CODEC, a bitstream is passed to the HW. We don't know
> > if this bitstream is fully valid, since the it is being parsed and
> > validated by the firmware. It's also firmware job to decide which
> > buffer should be presented first.
> >
> > In most firmware interface, that information is communicated back all
> > at once when the frame is ready to be presented (which may be quite
> > some time after it was decoded). So indeed, a fence model is not really
> > easy to add, unless the firmware was designed with that model in mind.
> 
> Just to be clear, I think we should do whatever makes sense here and
> not try to slam sync_file in when it doesn't make sense just because
> we have it.  The more I read on this thread, the less out-fences from
> video decode sound like they make sense unless we have a really solid
> plan for async error reporting.  It's possible, depending on how many
> processes are involved in the pipeline, that async error reporting
> could help reduce latency a bit if it let the kernel report the error
> directly to the last process in the chain.  However, I'm not convinced
> the potential for userspace programmer error is worth it..  That said,
> I'm happy to leave that up to the actual video experts. (I just do 3D)

dma_fence has an error state which you can set when things went south. The
fence still completes (to guarantee forward progress).

Currently that error code isn't really propagated anywhere (well i915 iirc
does something like that since it tracks the depedencies internally in the
scheduler). Definitely not at the dma_fence level, since we don't track
the dependency graph there at all. We might want to add that, would at
least be possible.

If we track the cascading dma_fence error state in the kernel I do think
this could work. I'm not sure whether it's actually a good/useful idea
still.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
