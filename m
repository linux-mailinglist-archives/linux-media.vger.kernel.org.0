Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9E336B829
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 19:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbhDZRip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 13:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236090AbhDZRin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 13:38:43 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD232C061574
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 10:38:00 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id d19so21604954qkk.12
        for <linux-media@vger.kernel.org>; Mon, 26 Apr 2021 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=hW3Y+cfmAKI+4k5hluylCqidp4omo3JW8per2sMMMnM=;
        b=Ak/1cpX3wZDf1Xyr8ESS6pWeZf8fHkq1TcwezC+QEfG78j3GKON/y2BHDIGj8w+26n
         j865CmC15aRM9D2ePvCcPeC5MPIjO3b1Ne9WENmjjUlLWV+aHFgIwQU9uA+4T4rr7XWO
         p+h4F9lhqpvNzzQPiyVZzNzFW14WyrJ/EqI6ilnd0Zj3xtiR+8SWiW6N1AQH2GVnQG9y
         fSr5cY65s7BgzARu0s/PlAr6CWunQ8Oe9SoHPrz1wac27aaRj4PSnXBH+QcA8AWyn4YJ
         kF3tsK49Z/w0Ez2pZN1Jbjw+aCyyFzFl8749RnR36l/rMJfgpbxiqbkynhLNnBKuTLhz
         XiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hW3Y+cfmAKI+4k5hluylCqidp4omo3JW8per2sMMMnM=;
        b=h2pyLPuunkaDlB1ylk80DxJYe0FVJvxadCqklQA1PnutMnCluz6H+WR0anZ1BY0+Qr
         LjtlDXlQegolvNmkM/3P0H2o5tY5t0XMoBvOyMwFoVX2ERnnGrt++asJN/+1gCRcjXEt
         wuH0ZPF7d7Jhh6LMnXyPAus1Orop+khfy8lf9LYeLXqrDd0bBTOUR/6gWx2fjbXfaJOK
         7benFE8c+V1mJmkIIh/DtEMmwoh5CO3NmxNa+BpkHpn98RUSATfmTwKNcziXrqOTcxJt
         LDtlMDA0WtbkOJ/lNk5ixjiW76NbRh54E1qP569iJ2m4e6ZocE3PITCjMyMR/DSyn7nQ
         ehsg==
X-Gm-Message-State: AOAM530dp2KgYwRYzQY/9cLTZkigBes9DtGfRgHSF/6IPwkIBklBB/O2
        qbkcc7B0epFGCtezC80rzCNEFQ==
X-Google-Smtp-Source: ABdhPJyWoTh4Nj5uuFA4QdUYKSnQUowPE2R4UXwgseH3AJZUk4fLx6/4ffkal1db7FYKyZSoJ6FQkQ==
X-Received: by 2002:ae9:ebd1:: with SMTP id b200mr18616735qkg.200.1619458679842;
        Mon, 26 Apr 2021 10:37:59 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id n11sm703985qkn.33.2021.04.26.10.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 10:37:59 -0700 (PDT)
Message-ID: <e7b55d3f58a6067ccd68d0e1d772e70bb3c92c93.camel@ndufresne.ca>
Subject: Re: [RFC RESEND 0/3] vp9 v4l2 stateless uapi
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com
Date:   Mon, 26 Apr 2021 13:37:58 -0400
In-Reply-To: <23a4ed00-0993-3567-2664-1fcc643915ab@xs4all.nl>
References: <20210421100035.13571-1-andrzej.p@collabora.com>
         <23a4ed00-0993-3567-2664-1fcc643915ab@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 26 avril 2021 à 09:38 +0200, Hans Verkuil a écrit :
> Hi Andrzej,
> 
> Thank you for working on this!
> 
> On 21/04/2021 12:00, Andrzej Pietrasiewicz wrote:
> > Dear All,
> > 
> > This is an RFC on stateless uapi for vp9 decoding with v4l2. This work is based on https://lkml.org/lkml/2020/11/2/1043, but has been substantially reworked. The important change is that the v4l2 control used to pass boolean decoder probabilities has been made unidirectional, and is now called V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS.
> > 
> > In the previous proposal, to queue a frame the userspace must fully dequeue the previous one, which effectively results in a forced lockstep behavior and defeats vb2's capability to enqueue multiple buffers. Such a design was a consequence of backward probability updates being performed by the kernel driver (which has direct access to appropriate counter values) but forward probability updates being coupled with compressed header parsing performed by the userspace.
> > 
> > In vp9 the boolean decoder used to decode the bitstream needs certain parameters to work. Those are probabilities, which change with each frame. After each frame is decoded it is known how many times a given symbol occured in the frame, so the probabilities can be adapted. This process is known as backward probabilities update. A next frame header can also contain information which modifies probabilities resulting from backward update. The said modification is called forward probabilities update. The data for backward update is generated by the decoder hardware, while the data for forward update is prepared by reading the compressed frame header. The natural place to parse something is userspace, while the natural place to access hardware-provided counters is the kernel. Such responsibilties assignment was used in the original work.
> > 
> > To overcome the lockstep, we moved forward probability updates to the kernel, while leaving parsing them in userspace. This way the v4l2 control which is used to pass the probs becomes unidirectional (user->kernel) and the userspace can keep parsing and enqueueing succeeding frames.
> > 
> > If a particular driver parses the compressed header and does backward probability updates on its own then V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS does not need to be used.
> > 
> > This series adds vp9 uapi in proper locations, which means it is a proper, "official" uapi, as opposed to staging uapi which was proposed in the above mentioned lkml thread.
> 
> Why? I rather liked the way that the other codec APIs started life in a private header
> (like include/media/vp8-ctrls.h) and were given time to mature before moving them to
> the uAPI. Is there a reason why you think that VP9 doesn't need that?

I'll be honest, I accepted early code into GStreamer for H264, and it ended up
in a nightmare for the users. We now have a released GStreamer that supports
kernel API up to 5.9, a blackwhole at 5.10 and finally master catched up and can
support 5.11+. It is so complicated for packagers to understand what is going
on, that they endup wasting a lot of their time for a single feature in their
OS. Same breakage is happening for VP8 in 5.13, even though VP8 has been working
great all this time. I will for sure for now on ignore any contribution that
depends on staged uAPI.

As for FFMPEG, even though now H264 API is table, the maintainers just simply
ignore the patches as they have been bitten by the reviewing stuff based on
unstable APIs and downstream work.

I believe the staged uAPI has been used wrongly in the past. Stuff has been
staged quicky right before associated project budget for it was exhausted, so it
was in the end a way to look good, and someone else had to pick it up and finish
it. Going straight for final API put more pressure on making good research from
the start, doing more in-depth reviews and avoiding delaying for multiple years
the support. I believe the staging API are confusing even for the Linux
projects. Going straight to stable here is a commitment to finish this work and
doing it correctly.

This specially make sense for VP9, which is a very Open CODEC and were all HW
implementation are Google/Hantro derivatives. Also, unlike when this work all
started, we do have multiple HW we can look at to validate the API, with more
then enough in-depth information to make the right decisions.

> 
> > 
> > The series adds vp9 support to rkvdec driver.
> > 
> > Rebased onto media_tree.
> > 
> > I kindly ask for your comments.
> > 
> > TODO:
> > 
> > - potentially fine-tune the uAPI (add/remove fields, move between structs)
> > - write another driver (intended g2 @ iMX8)

The commitment is subtly describe here, the commitment is to implement a second
driver, Hantro G2 which has a different design), and that even if we have no use
for it in the short term.

> > - verify the added documentation
> > 
> > Regards,
> > 
> > Andrzej
> > 
> > Andrzej Pietrasiewicz (1):
> >   media: uapi: Add VP9 stateless decoder controls
> > 
> > Boris Brezillon (1):
> >   media: rkvdec: Add the VP9 backend
> > 
> > Ezequiel Garcia (1):
> >   media: rkvdec: Fix .buf_prepare
> 
> Isn't this just a bug fix? Should it be part of this series at all?
> 
> If it is just a bug fix, then please post it separately and let me know if it is
> a fix that should go to 5.13 (i.e. the current mainline) or if 5.14 is fine.
> 
> Regards,
> 
> 	Hans
> 
> > 
> >  .../userspace-api/media/v4l/biblio.rst        |   10 +
> >  .../media/v4l/ext-ctrls-codec-stateless.rst   |  523 +++
> >  .../media/v4l/pixfmt-compressed.rst           |   15 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |    8 +
> >  .../media/v4l/vidioc-queryctrl.rst            |   12 +
> >  .../media/videodev2.h.rst.exceptions          |    2 +
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  244 ++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
> >  drivers/staging/media/rkvdec/Makefile         |    2 +-
> >  drivers/staging/media/rkvdec/rkvdec-vp9.c     | 2846 +++++++++++++++++
> >  drivers/staging/media/rkvdec/rkvdec.c         |   62 +-
> >  drivers/staging/media/rkvdec/rkvdec.h         |    6 +
> >  include/media/v4l2-ctrls.h                    |    4 +
> >  include/uapi/linux/v4l2-controls.h            |  455 +++
> >  include/uapi/linux/videodev2.h                |    6 +
> >  15 files changed, 4190 insertions(+), 6 deletions(-)
> >  create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
> > 
> 


