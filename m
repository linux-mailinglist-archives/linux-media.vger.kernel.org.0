Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F1139EDF9
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 07:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhFHFPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 01:15:15 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42]:40692 "EHLO
        mail-ej1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhFHFPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 01:15:12 -0400
Received: by mail-ej1-f42.google.com with SMTP id my49so13742759ejc.7
        for <linux-media@vger.kernel.org>; Mon, 07 Jun 2021 22:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QuDJmVmyieWyWVbePsQ2eGCd98MdY66PJOcY/6szco0=;
        b=Cfte/PlLgxDK5hhkDr6UdFRUXH+YghYOESNlgYguzsfiZX4lRy+E+cRJZerDTb0FYX
         VFGGcS5NrkBkjWHlXPJvxG1F1MpiTtCRSnYYdcWwTWs+QSga8lq6pWuQhJ6Bg4TK08mY
         wiOGxVRCWZJxntTC56KxaCPwXiRBnC0+N2OZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QuDJmVmyieWyWVbePsQ2eGCd98MdY66PJOcY/6szco0=;
        b=XAtXhmqAH/Nxr7Yame7/N/4eMxMUI6KmT8g3nSwhtvHuJ2OQVmmf8f85cup5NbfyFK
         /9Y5Q8moWyTDBuCWMlWkmVClaCvHpvA9JViUtJ0ODPpbXMM8FXAeKrGeiA7S1/fVFrAK
         WoaYGIXJh57UhejDaqZQlSvp0dueQUNQEyFK9nrNFgi0poGQPYANNbLbkZyTC/XH3KTi
         q/90Hrjl35sfyOFL+MuHtfiR8Jyma+OoVebitnVPeL6JIlnaUFiIA54HLm32+MfP2ss6
         yAlplzWHBCGrPAefjPr8igl/UFOrxUhWE5Dsp9oviaTFn/0D4G00KE9YayvMeQGqREWG
         F+SQ==
X-Gm-Message-State: AOAM533yy/KqguBhWMRSqlfm/VPBlr6RJ0ai+3aDrpY8iYWYib84UAgw
        9X1B0A84zlnnPpdsv8YZnEcKwKgLXvlFhw==
X-Google-Smtp-Source: ABdhPJwjYFi3R0cWHWq2objL6ifcZ/c7zDtypLbBAF2zI0DVfgDRr64iBBFEXNQt48TUFM7Rz3Mfcw==
X-Received: by 2002:a17:906:22c7:: with SMTP id q7mr21072132eja.547.1623129124892;
        Mon, 07 Jun 2021 22:12:04 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id z7sm7111715ejm.122.2021.06.07.22.12.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 22:12:04 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so951470wmq.5
        for <linux-media@vger.kernel.org>; Mon, 07 Jun 2021 22:12:04 -0700 (PDT)
X-Received: by 2002:a1c:98d0:: with SMTP id a199mr2221358wme.22.1623129123638;
 Mon, 07 Jun 2021 22:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
 <20210412110211.275791-2-tomi.valkeinen@ideasonboard.com> <YLoKxlXsC/nT4rF7@chromium.org>
 <5ee0e9a7-c6cb-fe75-7a91-5159c3233072@ideasonboard.com>
In-Reply-To: <5ee0e9a7-c6cb-fe75-7a91-5159c3233072@ideasonboard.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Jun 2021 14:11:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BCDOiFQuQS7Sp+V=DgNd9_+AJsoGP8ArXtErnAd-vEKA@mail.gmail.com>
Message-ID: <CAAFQd5BCDOiFQuQS7Sp+V=DgNd9_+AJsoGP8ArXtErnAd-vEKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: videobuf2-v4l2.c: add vb2_queue_change_type()
 helper
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 4, 2021 at 11:09 PM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi Tomasz,
>
> On 04/06/2021 14:13, Tomasz Figa wrote:
> > Hi Tomi,
> >
> > On Mon, Apr 12, 2021 at 02:02:09PM +0300, Tomi Valkeinen wrote:
> >> On some platforms a video device can capture either video data or
> >> metadata. The driver can implement vidioc functions for both video and
> >> metadata, and use a single vb2_queue for the buffers. However, vb2_queue
> >> requires choosing a single buffer type, which conflicts with the idea of
> >> capturing either video or metadata.
> >>
> >> The buffer type of vb2_queue can be changed, but it's not obvious how
> >> this should be done in the drivers. To help this, add a new helper
> >> function vb2_queue_change_type() which ensures the correct checks and
> >> documents how it can be used.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++++
> >>   include/media/videobuf2-v4l2.h                  | 15 +++++++++++++++
> >>   2 files changed, 29 insertions(+)
> >>
> >
> > Good to see you contributing to the media subsystem. Not sure if you
> > still remember me from the Common Display Framework discussions. ;)
>
> I barely remember CDF... ;)
>
> > Anyway, thanks for the patch. I think the code itself is okay, but I'm
> > wondering why the driver couldn't just have two queues, one for each
> > type?
>
> There was an email thread about this:
>
> https://www.spinics.net/lists/linux-media/msg189144.html
>
> struct video_device has 'queue' field, so if you have two queues, you'd
> need to change the vd->queue based on the format. Possibly that could be
> a solution too (and, if I recall right, that's what I initially tried as
> a quick hack). Changing the whole queue sounds riskier than changing
> just the type.

Okay, I see. Thanks for the pointer.

Generally I'm fine with this, although it's worth noting that it's not
true that one video_device can only have 1 queue. See the numerous
mem-to-mem devices, which use two queues simultaneously.

Anyway,

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
