Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44772F6956
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbhANSTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729705AbhANSTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:19:45 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DFAC061757
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 10:18:52 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t30so6816621wrb.0
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 10:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=PCah/n5rkh/QtCy+v8eMm30PJ5w4gNLWd9gaHy4xfQU=;
        b=f7UNY2cDz+S8bXMqpz9RBnXI0HW5mYqeCcHgUOg5LMxSTy+jJwvWYgPX0HlnRMJI/X
         ivj00WKs6Hob98esMhBFKi2sPy6LiZ3IgIqwwIywMJLdapx2o1z7EQa3bsONKGEnifqM
         sKEVp8xsXNATPsd4J80hvUQpg7A+FX2kF0OMmio4NbG/y/2vYCKWH0wTNz4wbUrGXi/2
         4epDtws8nraqNS9qBIVqkaZ2jZZTPGXXH4Ic9QMql5CQbdKDsmnv4bTZx2HQF4aDk7b6
         b9mopU1dWsK7KZsjz6EbY6RLUYmGSZMlUyMPHx/tQM3tfsOE3TFhZXEOkxbqbsLkO0UU
         qvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=PCah/n5rkh/QtCy+v8eMm30PJ5w4gNLWd9gaHy4xfQU=;
        b=gcnMYLBJhaiq5kILk5MO3gyB8FMWgK7XWpyr+RBQlcbfJwnrep2h1zizfSe7H0nB4y
         R6gzJ4Dsd64x86/LU076VPUilv3+5DzWV9gmVjzW/fimRL4NROh2HWgqaytQYR8Cn9qu
         LAqP8EDSSnpyAQ0EFatNit9+HUyFT5cn8xLRbDt1TEgChSk5p2nvuFCx6x4rAwkWba86
         XjLLtdKLDC9XJp2SObPQOnB+Q06oB6XqxpxL0JtsurpymK98GnCN/u1yBOoZk9YBBdDV
         /ezV7P/S4pww246QKze9g13aiISVBg3Yrt+pW2ElOaAAhxNgP+jkoGead9cZHQ9K2XPi
         ++Aw==
X-Gm-Message-State: AOAM530J2Vlkm249/tifufjH5DaSxtTptH7bEQtH52wwAQeDSinh9dbV
        RAhsCnhUsQn3NY6dk6I6T81Q4g==
X-Google-Smtp-Source: ABdhPJzzBeSmLxP/bOvQx2acvXsOknE9G+4YnoxmumbkIHtGGvqhehMKCM97cgaXFObAuOEt6c/qXA==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr9228610wrd.207.1610648330834;
        Thu, 14 Jan 2021 10:18:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z6sm9253273wmi.15.2021.01.14.10.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 10:18:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
        by zen.linaroharston (Postfix) with ESMTP id 16A451FF7E;
        Thu, 14 Jan 2021 18:18:49 +0000 (GMT)
References: <20200623111325.237158-1-keiichiw@chromium.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From:   Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     linux-media@vger.kernel.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, dmitry.sepp@opensynergy.com,
        egranata@google.com, fziglio@redhat.com, hverkuil@xs4all.nl,
        kraxel@redhat.com, marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com,
        saket.sinha89@gmail.com, laurent.pinchart@ideasonboard.com,
        nicolas@ndufresne.ca, mst@redhat.com,
        virtio-dev@lists.oasis-open.org,
        Ruchika Gupta <ruchika.gupta@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Mike Holmes <mike.holmes@linaro.org>
Subject: Re: [virtio-dev] [PATCH RFC v4 0/1] Virtio Video Device Specification
Date:   Thu, 14 Jan 2021 17:55:39 +0000
In-reply-to: <20200623111325.237158-1-keiichiw@chromium.org>
Message-ID: <87czy7l6uu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Keiichi Watanabe <keiichiw@chromium.org> writes:

> This is the v4 RFC of virtio video device specification.
> PDF versions are available at [1, 2].
>
> Note that this patch depends on a recent patchset "Cross-device resource
> sharing" [3].
>
> Here is a list of major changes from v3:
> * Redesingned struct definitions for each command and request based on
>   discussions at [4].
> * Renamed commands/structs/enums to more descriptive names.
> * Had different structs and fields for image formats and bitstream format=
s.
> * Added more detailed specification for supported video codecs.
> * Made stream_id be allocated by the device.
> * Had a single parameter struct per-stream instead of per-queue parameter=
s and
>   controls.
> * Allowed the driver to specify the number of buffers to use via
>   "cur_{image,bitstream}_buffers".
> * Renamed RESOURCE_CREATE command to RESOURCE_ATTACH command and allow the
>   driver to use this command when replacing backing memories as well.
>
> [5] is the diff of the header file from v3. Note that it only contains ch=
anges
> in the header. We haven't updated the driver nor device implementation to=
 focus
> on protocol design discussion first.
>
> While it may appear that many parts have been changed since the previous
> revision, these changes are to address the issues raised in previous disc=
ussions
> or/and to make the protocol simpler and easier to prevent misuse.
> I'd appreciate any types of feedback.
>
> Best regards,
> Keiichi
>
> [1] (full): https://drive.google.com/file/d/1DiOJZfUJ5wvFtnNFQicxt0zkp4Ob=
1o9C/view?usp=3Dsharing
> [2] (only video section): https://drive.google.com/file/d/188uAkIWE0BsXET=
ECez98y5fJKw8rslj3/view?usp=3Dsharing
> [3] https://lists.oasis-open.org/archives/virtio-comment/202003/msg00035.=
html
> [4] https://markmail.org/thread/c6h3e3zn647qli3w
> [5]
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/=
+/2164411

Hi Keiichi,

I wanted to ask what the current status of this spec was. Are you
planning to submit a new revision of the specification due or are things
fairly stable now?

We are starting to think about next steps for virtualised video as part
of Linaro's Stratos work. Specifically we are thinking about
implementing backends and getting a stack up and running which we can
use to experiment with multiple hypervisors and VM deployment
approaches.

Longer term goals included looking at how to integrate virtio-video with
a secure world on ARM (e.g. feed video data to a secure world device for
playback via virtio). As part of that we will also be looking at how to
minimise the memory profile of the backend to do this.

Looking at the virtio-spec repo it looks like the cross-device resource
sharing is now merged:

  87fa6b5 * virtio-gpu: add support for mapping/unmapping blob resources
  89e7eb5 * virtio-gpu: add resource create blob
  162578b * virtio-gpu: add the ability to export resources
  68f66ff * content: define what an exported object is

are there any other prerequisites?

From a backend implementation point of view it makes sense to wait until
there is a working frontend driver up-streamed into the kernel. I guess
that is blocked on the final call for vote on the virtio spec?

I'm sure there is scope for parallelism here but I wanted to get a sense
of the current direction before embarking on work that would require a
big re-write down the line.

Regards,

--=20
Alex Benn=C3=A9e
