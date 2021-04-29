Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F214736F0A7
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 22:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhD2TlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 15:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234673AbhD2Tjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 15:39:37 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9545C06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 12:38:50 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id u1so1591698qvg.11
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 12:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+FxQsplSTwtsTS7MiBXRvoge0MGveknHu2H/BzgPM38=;
        b=sCSy8GBrf3NahZO0PVFAaX7QXylbiOLkGTjhcWJfzmVsA3wTTv24cjkKnt9kWRMbMB
         XQpmC/QQvoSFcUKPIaWSWYzUar3vpWfN4GYffRJghJMF3U5j9evmrCNtqiXbgnlDL4aK
         HzQphFdrluHfSmHyvGHa0FUalsilsw+PLVWo3u64juRKbjWuBLt+XFVIYnGDM0UOtvIk
         8a5ob9xyuM2urJtLOcanKBDBkpkUOzeE5Duem4r/auLqlKDJNUwboO4zDTy89KojbICS
         BdZ4ICLm2sgea6pTsAkSFM0MZbQSCttcNvFWFnQ2+kHmH2cD6ZjiZbKNBw2hUc7NLrib
         1UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+FxQsplSTwtsTS7MiBXRvoge0MGveknHu2H/BzgPM38=;
        b=KiJybEPPx1uY04XBX28y9THTtlOyfYj02+GKNw3GTRhppJqUKdnN22DLLmcd/9F9Ba
         lqVab1pbABzo3eLVlgr4wNpZIZRdeq/9SGsFxBvt/dSBRp3J26aGns0n3rXtPsBAHtTk
         inONr2QoFUYA3nMlMoTTo0UUo7+ycffm2eRf8VdukLDCiFF1oDGMh+5u8SQIRWjurksJ
         /BY5JU7uExPKZHQ+MziaRT9UuJrXx2kzzDKikHsxfQvvKjl+qd9xKZ+DOXtmMxNaasGP
         +g4ZqV360OskME4QLnNGzAkUqD9LAbBub3C6ua1Npi7NJ+h+FLOwNhLVtQYdrN4kK/RI
         gXAQ==
X-Gm-Message-State: AOAM531BTaJ69qmGOLmr7yFyCm+1ehnDhgVd6xCSyhoMUvuyCVNRrXht
        YpL2cDDSAuuHNhEV4vqaqVsWHw==
X-Google-Smtp-Source: ABdhPJzLcTus3KFflLF/PC6lmGIOKgmEB7VpeUYOFU5nSaAEjsEhWRk4wQ2V90ZmO11z7SBSgxOYSw==
X-Received: by 2002:a0c:9e0f:: with SMTP id p15mr1417313qve.27.1619725129787;
        Thu, 29 Apr 2021 12:38:49 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 67sm637872qtf.54.2021.04.29.12.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 12:38:49 -0700 (PDT)
Message-ID: <369fe341c13486eff10c7edbe23fb84c8287786e.camel@ndufresne.ca>
Subject: Re: [RFC RESEND 0/3] vp9 v4l2 stateless uapi
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com
Date:   Thu, 29 Apr 2021 15:38:47 -0400
In-Reply-To: <463d2636-6de9-112b-3536-5cef38ef6093@xs4all.nl>
References: <20210421100035.13571-1-andrzej.p@collabora.com>
         <23a4ed00-0993-3567-2664-1fcc643915ab@xs4all.nl>
         <e7b55d3f58a6067ccd68d0e1d772e70bb3c92c93.camel@ndufresne.ca>
         <CAAEAJfB_UdGKnfMRdwu=LRaW+Ujv5pShHYm9i=KO5KaB08JSuA@mail.gmail.com>
         <463d2636-6de9-112b-3536-5cef38ef6093@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 29 avril 2021 à 11:23 +0200, Hans Verkuil a écrit :
> On 27/04/2021 01:34, Ezequiel Garcia wrote:
> > On Mon, 26 Apr 2021 at 14:38, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > 
> > > Le lundi 26 avril 2021 à 09:38 +0200, Hans Verkuil a écrit :
> > > > Hi Andrzej,
> > > > 
> > > > Thank you for working on this!
> > > > 
> > > > On 21/04/2021 12:00, Andrzej Pietrasiewicz wrote:
> > > > > Dear All,
> > > > > 
> > > > > This is an RFC on stateless uapi for vp9 decoding with v4l2. This work is based on https://lkml.org/lkml/2020/11/2/1043, but has been substantially reworked. The important change is that the v4l2 control used to pass boolean decoder probabilities has been made unidirectional, and is now called V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS.
> > > > > 
> > > > > In the previous proposal, to queue a frame the userspace must fully dequeue the previous one, which effectively results in a forced lockstep behavior and defeats vb2's capability to enqueue multiple buffers. Such a design was a consequence of backward probability updates being performed by the kernel driver (which has direct access to appropriate counter values) but forward probability updates being coupled with compressed header parsing performed by the userspace.
> > > > > 
> > > > > In vp9 the boolean decoder used to decode the bitstream needs certain parameters to work. Those are probabilities, which change with each frame. After each frame is decoded it is known how many times a given symbol occured in the frame, so the probabilities can be adapted. This process is known as backward probabilities update. A next frame header can also contain information which modifies probabilities resulting from backward update. The said modification is called forward probabilities update. The data for backward update is generated by the decoder hardware, while the data for forward update is prepared by reading the compressed frame header. The natural place to parse something is userspace, while the natural place to access hardware-provided counters is the kernel. Such responsibilties assignment was used in the original work.
> > > > > 
> > > > > To overcome the lockstep, we moved forward probability updates to the kernel, while leaving parsing them in userspace. This way the v4l2 control which is used to pass the probs becomes unidirectional (user->kernel) and the userspace can keep parsing and enqueueing succeeding frames.
> > > > > 
> > > > > If a particular driver parses the compressed header and does backward probability updates on its own then V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS does not need to be used.
> > > > > 
> > > > > This series adds vp9 uapi in proper locations, which means it is a proper, "official" uapi, as opposed to staging uapi which was proposed in the above mentioned lkml thread.
> > > > 
> > > > Why? I rather liked the way that the other codec APIs started life in a private header
> > > > (like include/media/vp8-ctrls.h) and were given time to mature before moving them to
> > > > the uAPI. Is there a reason why you think that VP9 doesn't need that?
> > > 
> > > I'll be honest, I accepted early code into GStreamer for H264, and it ended up
> > > in a nightmare for the users. We now have a released GStreamer that supports
> > > kernel API up to 5.9, a blackwhole at 5.10 and finally master catched up and can
> > > support 5.11+. It is so complicated for packagers to understand what is going
> > > on, that they endup wasting a lot of their time for a single feature in their
> > > OS. Same breakage is happening for VP8 in 5.13, even though VP8 has been working
> > > great all this time. I will for sure for now on ignore any contribution that
> > > depends on staged uAPI.
> > > 
> > > As for FFMPEG, even though now H264 API is table, the maintainers just simply
> > > ignore the patches as they have been bitten by the reviewing stuff based on
> > > unstable APIs and downstream work.
> > > 
> > > I believe the staged uAPI has been used wrongly in the past. Stuff has been
> > > staged quicky right before associated project budget for it was exhausted, so it
> > > was in the end a way to look good, and someone else had to pick it up and finish
> > > it. Going straight for final API put more pressure on making good research from
> > > the start, doing more in-depth reviews and avoiding delaying for multiple years
> > > the support. I believe the staging API are confusing even for the Linux
> > > projects. Going straight to stable here is a commitment to finish this work and
> > > doing it correctly.
> > > 
> > > This specially make sense for VP9, which is a very Open CODEC and were all HW
> > > implementation are Google/Hantro derivatives. Also, unlike when this work all
> > > started, we do have multiple HW we can look at to validate the API, with more
> > > then enough in-depth information to make the right decisions.
> > > 
> > 
> > +1
> > 
> > Although I can understand how, from the kernel point of view, it's
> > tempting to merge
> > the uAPI as staging first and then de-stage it, I have to say that I
> > agree fully with
> > Nicolas, the experience wasn't really good for the userspace.
> 
> It was a completely new API and it took quite a long time to really understand
> what was needed and how to get it right. Not to mention implement it for
> different platforms. Both H264 and MPEG-2 saw major changes. VP8 was the exception,
> so it might well be that VP9 is equally good at the first attempt.
> 
> > 
> > I really hope we can do better than this for at least VP9. So, let's make sure
> > the hardware decoders that are currently available (Rockchip,
> > Verisilicon, Mediatek)
> > are covered, as well as any future features (dynamic frame resize).
> 
> Sure, if we can have this supported on several platforms and it is well reviewed,
> then I am not opposed to merging it as a public API without going through
> staging. We have build up a lot of experience by now.
> 
> > 
> > A well-thought, honest effort for a sane uAPI is IMO the right way,
> > and if we find out
> > something is missing (which may happen, as we are all humans), we can still
> > introduce another API control (V4L2_CID_STATELESS_VP9_V2) and use it
> > to supersede the current API. If I understand correctly, this should work,
> > and allow backward compatibility without issues.
> 
> Yes, but it is something we'd like to avoid. You need to have sufficient
> confidence that the uAPI has been well tested and is in good shape. If you
> have that, then great, we can merge it without going through staging.
> 
> In particular, if 1) we support at least two HW platforms, and 2) testing
> with test suites (I assume those are available for VP9) passed on those
> platforms, then I'd be happy to merge.
> 
> Regarding the 'userspace mess': why did support for staging APIs end up
> in released gstreamer/ffmpeg implementations at all? What did you expect
> would happen? Released versions of those applications should only support
> public APIs, not staging APIs. Unless perhaps if you explicitly enable it
> with some test config option that is by default off. And once a codec API
> becomes public, rip out the old code.
> 
> I don't use gstreamer/ffmpeg myself, so I hadn't noticed. I thought people
> were testing using test branches of those apps. It's staging for a reason,
> you are completely on your own if you use it.

It's the exact same reason Kernel folks stage stuff and releases kernel with
staged driver (and now APIs). There is no more to add, if you do it in the
kernel, and can't handle having side kernel branches due to complexity when
comes to exchange, collaborate and test, it's identical for GStreamer.

The support was landed in GStreamer own staging area, called gst-plugins-bad
(from the movie the bad the good and the ugly). But GStreamer release cycle is
way slower then kernel release cycle, and that's what created a lot of headache
to the integrators, which in fact have no other choice then using this staging
stuff.

p.s. nothing of that is merged in ffmpeg, upstream ffmpeg in fact seems to be
ignoring the patches (even the latest one based on stable API).

> 
> I wonder if I should make a patch that issues some really serious messages
> in the kernel log if someone attempts to use these staging APIs.

We could of course, I think users (the developers/integrator) are well aware,
but they have no other choices but to deal with it. What I think I would rather
prefer would be to version the specific staging API, so we can explicitly assert
that we have a matching kernel in staging enabled builds of userspace
application. (In our meaculpa, we added kernel version check now, that was our
mistake, but as kernel stuff get backported all the time, this check can be
quite in the way).

Consider that H264 breakage in 3 consecutive Linux kernel was the most agressive
usage of stating uAPI we have come across so far. 3 Linux kernel is a relatively
short delay, so one may wonder if we should not have just skipped some middle
breakage and aimed at public API sooner.

I think the other thing that bugs me, is that when the staging is final, even if
you made no changes, moving from staging to public cause an API break. If that
break could be removed, it would also be easier. In GStreamer as an example, we
have some staging libs in -bad, but the day we move the libs to -base (our
stable), there will be nothing else needed but to rebuild to fix the linking
(and there is not linking with the linux kernel). Or perhaps that how the
transition should have gone and we just didn't do that properly ?

> 
> Of course, ideally you would have a perfect API from the beginning, but that
> wasn't an option here, and keeping everything out of the kernel entirely until
> we're happy with the uAPI would be almost impossible to maintain.

I understand, arguably I'm simply looking for avoiding what may or may not be an
abuse of the staging area. Which is to use it as a shortcut into being
"mainline" and bragging in the social media with hope someone will pay to finish
the work. While the staging should be used when multiple unrelated individual
and companies need to collaborate into a specific component, with a engagement
to do so (can be weak engagement, but there must be something).

Let's at least start VP9 as final, we have more experience, more HW to look at,
and to help even further, most of the HW is derived from Hantro (Google) design,
as that design was given for free to interested HW vendors.

> 
> Regards,
> 
> 	Hans


