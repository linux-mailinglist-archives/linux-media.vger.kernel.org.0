Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523CB36BC11
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 01:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhDZXfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 19:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhDZXfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 19:35:30 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D73C061574
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 16:34:46 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id q6so8483356edr.3
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 16:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7q7dD5woCvUF+dF4SsdpwJ1kZB1YsLs1ij7EdhjhTa8=;
        b=PqR+zB967VO1PilCaCW+x7q1VXcaQXNzU6+QxyJSAkLSte8704b8Mhsfpn/zThr5HD
         L4JyujVnrRvEe8idnpjkAd4bD5womxvw5BCsPqWhj2bnK9zKq4lMto/ZU/e273DePLFc
         XywbZ3iKW2fKs67O2tdxHCN32NRMvRQHbJ/QPgKnxa4hq8Gdi9F7PiLFFnVJjQ1BOZGk
         7jktVKpcGNjR8hRQlMkhk+49CR3FidMSln6uo4yM+AM/IizXm/jhMsBTmp5CCYrL9J6d
         +FbyKB/63XeiWRNGuWZKUZ+ERI5Ju6zxDPeGh3Eip09gAYr8c5arPUhKIesSPx4yZOFZ
         kQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7q7dD5woCvUF+dF4SsdpwJ1kZB1YsLs1ij7EdhjhTa8=;
        b=rhZVRBrwHkxwoLww5jw/fqLNP5BEqv5mvv5MLhSDirIGWQEwHEfjJbNd3nyGUjmejr
         g/j9xMkBd7oUefPl4tskMwo8v48HEfZj1dHUNNSviMHiYh4u7NKr0ccK4pInixVFxd/2
         4EpZSC+uQenDq1kaOU9TF40ndmrcGPjfpDP2phUHRAI4hzVQUBow9WRM1H4manBQ5MG4
         pGBzCmXRP/GLDzMp6iTFm25pwkUgSe4eW0mtxAHWYcrNL2jsFgIuL8QyfVvPLPiYdRR1
         TEUQiw9NSnzHaktUgjrlnNmOSdoQ0NDd7qhggsWAu6R7yUW+EbpOZcaRHvKN9adSXwXu
         npZg==
X-Gm-Message-State: AOAM530u4+XK+uVj1M8uhNVbmw1B+QXX6vrNW0O9uGNFngswlADyqWIR
        oAB3CKa8qSkY5ZiHLuoGEKtCnWt266FaunfLNVLOyg==
X-Google-Smtp-Source: ABdhPJyh/i1WI1Bausdx24sz+52HnE6O0YlWwgo8FqO4JWKIVqWmepDc2N0aiGHa1B6cwNhzxA77jvOMveAw3NXw45E=
X-Received: by 2002:a05:6402:8d4:: with SMTP id d20mr1142683edz.49.1619480084894;
 Mon, 26 Apr 2021 16:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210421100035.13571-1-andrzej.p@collabora.com>
 <23a4ed00-0993-3567-2664-1fcc643915ab@xs4all.nl> <e7b55d3f58a6067ccd68d0e1d772e70bb3c92c93.camel@ndufresne.ca>
In-Reply-To: <e7b55d3f58a6067ccd68d0e1d772e70bb3c92c93.camel@ndufresne.ca>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 26 Apr 2021 20:34:37 -0300
Message-ID: <CAAEAJfB_UdGKnfMRdwu=LRaW+Ujv5pShHYm9i=KO5KaB08JSuA@mail.gmail.com>
Subject: Re: [RFC RESEND 0/3] vp9 v4l2 stateless uapi
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 26 Apr 2021 at 14:38, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Le lundi 26 avril 2021 =C3=A0 09:38 +0200, Hans Verkuil a =C3=A9crit :
> > Hi Andrzej,
> >
> > Thank you for working on this!
> >
> > On 21/04/2021 12:00, Andrzej Pietrasiewicz wrote:
> > > Dear All,
> > >
> > > This is an RFC on stateless uapi for vp9 decoding with v4l2. This wor=
k is based on https://lkml.org/lkml/2020/11/2/1043, but has been substantia=
lly reworked. The important change is that the v4l2 control used to pass bo=
olean decoder probabilities has been made unidirectional, and is now called=
 V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS.
> > >
> > > In the previous proposal, to queue a frame the userspace must fully d=
equeue the previous one, which effectively results in a forced lockstep beh=
avior and defeats vb2's capability to enqueue multiple buffers. Such a desi=
gn was a consequence of backward probability updates being performed by the=
 kernel driver (which has direct access to appropriate counter values) but =
forward probability updates being coupled with compressed header parsing pe=
rformed by the userspace.
> > >
> > > In vp9 the boolean decoder used to decode the bitstream needs certain=
 parameters to work. Those are probabilities, which change with each frame.=
 After each frame is decoded it is known how many times a given symbol occu=
red in the frame, so the probabilities can be adapted. This process is know=
n as backward probabilities update. A next frame header can also contain in=
formation which modifies probabilities resulting from backward update. The =
said modification is called forward probabilities update. The data for back=
ward update is generated by the decoder hardware, while the data for forwar=
d update is prepared by reading the compressed frame header. The natural pl=
ace to parse something is userspace, while the natural place to access hard=
ware-provided counters is the kernel. Such responsibilties assignment was u=
sed in the original work.
> > >
> > > To overcome the lockstep, we moved forward probability updates to the=
 kernel, while leaving parsing them in userspace. This way the v4l2 control=
 which is used to pass the probs becomes unidirectional (user->kernel) and =
the userspace can keep parsing and enqueueing succeeding frames.
> > >
> > > If a particular driver parses the compressed header and does backward=
 probability updates on its own then V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_=
PROBS does not need to be used.
> > >
> > > This series adds vp9 uapi in proper locations, which means it is a pr=
oper, "official" uapi, as opposed to staging uapi which was proposed in the=
 above mentioned lkml thread.
> >
> > Why? I rather liked the way that the other codec APIs started life in a=
 private header
> > (like include/media/vp8-ctrls.h) and were given time to mature before m=
oving them to
> > the uAPI. Is there a reason why you think that VP9 doesn't need that?
>
> I'll be honest, I accepted early code into GStreamer for H264, and it end=
ed up
> in a nightmare for the users. We now have a released GStreamer that suppo=
rts
> kernel API up to 5.9, a blackwhole at 5.10 and finally master catched up =
and can
> support 5.11+. It is so complicated for packagers to understand what is g=
oing
> on, that they endup wasting a lot of their time for a single feature in t=
heir
> OS. Same breakage is happening for VP8 in 5.13, even though VP8 has been =
working
> great all this time. I will for sure for now on ignore any contribution t=
hat
> depends on staged uAPI.
>
> As for FFMPEG, even though now H264 API is table, the maintainers just si=
mply
> ignore the patches as they have been bitten by the reviewing stuff based =
on
> unstable APIs and downstream work.
>
> I believe the staged uAPI has been used wrongly in the past. Stuff has be=
en
> staged quicky right before associated project budget for it was exhausted=
, so it
> was in the end a way to look good, and someone else had to pick it up and=
 finish
> it. Going straight for final API put more pressure on making good researc=
h from
> the start, doing more in-depth reviews and avoiding delaying for multiple=
 years
> the support. I believe the staging API are confusing even for the Linux
> projects. Going straight to stable here is a commitment to finish this wo=
rk and
> doing it correctly.
>
> This specially make sense for VP9, which is a very Open CODEC and were al=
l HW
> implementation are Google/Hantro derivatives. Also, unlike when this work=
 all
> started, we do have multiple HW we can look at to validate the API, with =
more
> then enough in-depth information to make the right decisions.
>

+1

Although I can understand how, from the kernel point of view, it's
tempting to merge
the uAPI as staging first and then de-stage it, I have to say that I
agree fully with
Nicolas, the experience wasn't really good for the userspace.

I really hope we can do better than this for at least VP9. So, let's make s=
ure
the hardware decoders that are currently available (Rockchip,
Verisilicon, Mediatek)
are covered, as well as any future features (dynamic frame resize).

A well-thought, honest effort for a sane uAPI is IMO the right way,
and if we find out
something is missing (which may happen, as we are all humans), we can still
introduce another API control (V4L2_CID_STATELESS_VP9_V2) and use it
to supersede the current API. If I understand correctly, this should work,
and allow backward compatibility without issues.

Thanks,
Ezequiel
