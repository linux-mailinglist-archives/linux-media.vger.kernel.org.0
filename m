Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB273F2DF4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 13:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733201AbfKGMLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 07:11:05 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:44425 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfKGMLE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 07:11:04 -0500
Received: by mail-qv1-f65.google.com with SMTP id h3so657839qvu.11
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKA8s1JfODN4WpwTCWOwtgTT+YzZkjzLVM4z9feXflo=;
        b=EKVQuk55NqGEBZhbV8BVxDQYjsoT81dzTmsRxPY6wkvHgR2201EEbrXM/f+4dt4b8x
         MPP/nzcAMrp6SuDo7mbSGX+LcQXh9/pd9oETm1jFw8TBDLojxjDHClV4PYzZjrVoAfzl
         csCkA+bh69AXVz2hqudiqDmMhOKR2EP2/zDBezyvS6xwXVvU6VeH4m5JKswsrvrFK8bR
         HmHUt1XUt7m8iCpGV+8+6/RH8ExPqoITwjlgKh04ScfyEKG2NEHwTyUI4FssxUMUdT+M
         pM9jt1TEN20IHzkT063k8iwpbZp2J6R173q2JvMGx6Bb28lCQmAMELV9z9q/3QBIxOjF
         EIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKA8s1JfODN4WpwTCWOwtgTT+YzZkjzLVM4z9feXflo=;
        b=nWzWnLtoJND42oT08Q7ULttbm1vI81S8tyH6ialZA+cp4af+b+hmOViVa6XyT5vy3/
         hgOKihV4zfAWMeZHI+34hVwrYdjhY5aEKiD7F32UdAmIYV42XQ0oQFhJGWZBCtEZ0IQU
         BDh/YZ63qlVOmouIAdz7BbrHpcGjE8M4THSJZzB32i15HBnq7SlSZMfPwFaTJ4E2sIqM
         623zzeh2AzdFV20zElEN9SasEeTDUsD3vvdVGiz9zlf2i4XPcHqrvxlbVHR4oCSw5Wpt
         wGZlKWPWi37fsMo6mLqamJGMuseMB9lSbIVUzv87Qtm85Vikj+KfDoR9NLtGxr9zUgGv
         t/XA==
X-Gm-Message-State: APjAAAWLs8HWjZyP8FaVNfzAiai4numnqvPtlO3ph1mgbfqhLxT/KIaJ
        7I9lZVuq8KzkhJokqQo2BItLnr9l9c0+3nTmm28=
X-Google-Smtp-Source: APXvYqzsPlvpOUDn7EkcGf9rJWzzK0UmVSKgbkHC5ep6B4ucYn8RQygbhppA26x9x2LAw1qeWeDvK70JS85dMoOF3WQ=
X-Received: by 2002:a0c:87b5:: with SMTP id 50mr3064636qvj.143.1573128663596;
 Thu, 07 Nov 2019 04:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com> <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org>
In-Reply-To: <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org>
From:   Stefan Hajnoczi <stefanha@gmail.com>
Date:   Thu, 7 Nov 2019 13:10:52 +0100
Message-ID: <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 6, 2019 at 1:50 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > In the graphics buffer sharing use case, how does the other side
> > determine how to interpret this data?
>
> The idea is to have free form properties (name=value, with value being
> a string) for that kind of metadata.
>
> > Shouldn't there be a VIRTIO
> > device spec for the messaging so compatible implementations can be
> > written by others?
>
> Adding a list of common properties to the spec certainly makes sense,
> so everybody uses the same names.  Adding struct-ed properties for
> common use cases might be useful too.

Why not define VIRTIO devices for wayland and friends?

This new device exposes buffer sharing plus properties - effectively a
new device model nested inside VIRTIO.  The VIRTIO device model has
the necessary primitives to solve the buffer sharing problem so I'm
struggling to see the purpose of this new device.

Custom/niche applications that do not wish to standardize their device
type can maintain out-of-tree VIRTIO devices.  Both kernel and
userspace drivers can be written for the device and there is already
VIRTIO driver code that can be reused.  They have access to the full
VIRTIO device model, including feature negotiation and configuration
space.

Stefan
