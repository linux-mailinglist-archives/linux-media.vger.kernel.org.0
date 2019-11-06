Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB2CF155F
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 12:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfKFLqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 06:46:20 -0500
Received: from mail-qv1-f51.google.com ([209.85.219.51]:44544 "EHLO
        mail-qv1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfKFLqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 06:46:20 -0500
Received: by mail-qv1-f51.google.com with SMTP id h3so1253927qvu.11
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 03:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ff4rTf71EaaA6mDalMOvcUyB0YnCYPZvyXrWDdkjzLY=;
        b=R3Y5/K4FpSGl/JBDa6luAfZN1wJEVODtQQYIXXVMud/7MFhzUyi1wNTd4CXXvspyXA
         Np1QSYFRTIpakGlS3B+TXTCXmFzGhj3QgyTrhSU19TPOsWeKjjhHhLJQlMmwWjQvg/Oa
         NlA+bQe2LTa4aSuBh+VFONS721EwkfA8b+4NJMCDozfMGD+hPkt+O6kOmiKlOio9ZrdC
         31TD57/2Qk4hA5cQxf/QaM6Csg9rP49Godm2fe+CwynOD17JK7eEigA0QrFowsgQvLgx
         DiRNcH6M7viFHn93SlGe4ireJbhRDBjy37FSiqLOoN/S8Qo40w/Puia7T+lfX/atu72z
         u1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ff4rTf71EaaA6mDalMOvcUyB0YnCYPZvyXrWDdkjzLY=;
        b=jAyYlsCMlnodhAFprOnpm1t64zw3kEAL9W8gA4CvUPBg2yYUcp/K4NBqGiH6Rk6v93
         KMxpYuyCCH89nM/m9PAHm70PwjVqsh+AAXHt8NOhzEwSl59wW9f2Bnj+rDb52m3zMu1a
         3WpfKr1sOkQ4YEE1wilEQSK9MTGq4urfmOrxDHGRQ5QcXr9jAgfUZulEgIhKjcXEXURR
         qMzOTcZNayVNGU1ZwdBL65lblgYtbInAP8WjmEkWpipHtDdpGr7hZ4l1uWM7byjH9sJP
         +XP4B+8TGj9r5KmPWEen65X6tW5DVxdPfaSjnpHu4frjNm6b8VWGBL4zMO1h46mPA9c5
         A2Kw==
X-Gm-Message-State: APjAAAU9zReuNDIp1rGUKIgz8h0fW6vRViS+q96juxN5E8RZjMELmpX5
        JMrEQnFM7CUsmqRYictDasDFeq1HviRby7DCL20=
X-Google-Smtp-Source: APXvYqxiW7m5BcPoYQedl9pTBVFzRV+opTQ9XBEb+aAhdBe/1UuZKWWxX6FmvT5qwm+9kfhdgNYpP1vfa3BNI+Y7U6I=
X-Received: by 2002:a0c:c70a:: with SMTP id w10mr1805353qvi.218.1573040779005;
 Wed, 06 Nov 2019 03:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
In-Reply-To: <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
From:   Stefan Hajnoczi <stefanha@gmail.com>
Date:   Wed, 6 Nov 2019 12:46:07 +0100
Message-ID: <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
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

On Wed, Nov 6, 2019 at 10:51 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
> > > resources" is really a good answer for all the different use cases
> > > we have collected over time.  Maybe it is better to have a dedicated
> > > buffer sharing virtio device?  Here is the rough idea:
> >
> > My concern is that buffer sharing isn't a "device".  It's a primitive
> > used in building other devices.  When someone asks for just buffer
> > sharing it's often because they do not intend to upstream a
> > specification for their device.
>
> Well, "vsock" isn't a classic device (aka nic/storage/gpu/...) either.
> It is more a service to allow communication between host and guest

There are existing applications and network protocols that can be
easily run over virtio-vsock, virtio-net, and virtio-serial to do
useful things.

If a new device has no use except for writing a custom code, then it's
a clue that we're missing the actual use case.

In the graphics buffer sharing use case, how does the other side
determine how to interpret this data?  Shouldn't there be a VIRTIO
device spec for the messaging so compatible implementations can be
written by others?

Stefan
