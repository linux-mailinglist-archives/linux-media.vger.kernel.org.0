Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1662B1B7369
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 13:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgDXLpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 07:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgDXLpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 07:45:52 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB49FC09B045
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 04:45:51 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e25so9617976ljg.5
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 04:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=95uqkebeHf7dQxE+4F7EdCqt0giQUolqlX9+pJlKNo8=;
        b=McRxgPsturGvemx6LQUyKlVq97jV1fp4T8rYSt5QIEJwc4+wPCfqoQaumMASYrRivq
         3Bk79kaP6sGMWJEILojUXj1Zexth3wcWyzJf3Mc26C0CLrNF+l8vS2nf2l8iofWTlNwh
         UvLn5Y5m7wlwO78fXNJQws8NCYYXue5vvJGNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=95uqkebeHf7dQxE+4F7EdCqt0giQUolqlX9+pJlKNo8=;
        b=oTwlWA0nGpuwXmmIGxST+jhLWFwGRXZ/5CQN0N1968ee6kyLfb9QXBmFQFn4n4Rs10
         FucvNvv+cBsgjQ9ybBI1v2uMwmmofyk7eus0HKqIHUtfHHrY9Sg91Ch9p9Zx1837GTDS
         Lr/jzaRuJ7nS4UXhv7MNtj8KAGU/BoqmRuqAee8VKLg89Z/Wt7tM++xBFk9OPeo4XIOL
         kuI4+V03g1yePu+29wT28uz0ihpXpcbZvZayv5e4xqgNNO17ZCMzoJRiZknioSvE558F
         OBlCgBDtj+oz0UkP6HGG9R92py1ZCwwKywjUZ47CcBoQMa58NayVDmUgIDzDH334JRPu
         /a3Q==
X-Gm-Message-State: AGi0PuY/Fq51kAPkwMCKZfGJ0v2Fa6ezrzSyqThM0XMdDAolQTA+eL2M
        mewzzBdratw4kvmcR3PATuY95fJDMjsNLuGRqtGN0Q==
X-Google-Smtp-Source: APiQypJjMfpHfD2gZgpMSn7TIRfXNVPKhn5y+ZajpqtefKWXMDIW4Y/VH39q5Hcm+zIcM9NxPW1spC0H7Ay3l4ttlOE=
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr5765813ljc.86.1587728750324;
 Fri, 24 Apr 2020 04:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <4320831.CvnuH1ECHv@os-lin-dmo> <CAD90Vca4jqLPdK4my3mCmPM45Lwc5te6PbDhA+H=0X1QyTFWzQ@mail.gmail.com>
 <17068786.sWSEgdgrri@os-lin-dmo>
In-Reply-To: <17068786.sWSEgdgrri@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Fri, 24 Apr 2020 20:45:38 +0900
Message-ID: <CAD90Vcbrgf2dK2EYeQDJ=-AFA2NkFnyJhutLX3nfeD7ajNYw=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Thu, Apr 9, 2020 at 10:23 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Keiichi,
>
> On Donnerstag, 9. April 2020 12:46:56 CEST Keiichi Watanabe wrote:
> > Hi,
> >
> > On Tue, Apr 7, 2020 at 11:49 PM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> wrote:
> > > Hi,
> > >
> > > > +\item[VIRTIO_VIDEO_CMD_STREAM_DESTROY] Destroy a video stream
> > > > +  (context) within the device.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct virtio_video_stream_destroy {
> > > > +        struct virtio_video_cmd_hdr hdr;
> > > > +};
> > > > +\end{lstlisting}
> > >
> > > Let's add more strict description to stream_destroy, like as follows:
> > > Device MUST NOT generate any events for the stream in question after
> > > receiving the command. Before completing the command, Device MUST ensure
> > > that all asynchronous commands that are related to the stream have been
> > > completed and all memory objects are unreferenced.
> >
> > Sounds good. But, the device should probably be able to generate
> > VIRTIO_VIDEO_EVENT_ERROR for a device-wide error?
> > Or, should VIRTIO_VIDEO_EVENT_ERROR always be a per-stream error? (I
> > haven't documented it in v3)
> >
>
> In the current version of the driver  I have we interpret it a stream error. I
> think it makes sense as several stream formats might be backed by different
> hardware devices on the host side. So it would be an overkill to mark the
> whole virtio device as broken on the guest side.

It makes sense. I'll explicitly document that it's a per-stream error.

>
> BTW, I think we should add some hard limit to the max_cap_length and
> max_resp_length in the spec, so buggy device does not make us allocate all
> memory for a response on the host side by providing a garbage value. I think
> 4k might be a good value.

Sounds good. Thank you for the suggestion.

Best regards,
Keiichi


>
> Best regards,
> Dmitry.
>
> > Best regards,
> > Keiichi
> >
> > > Best regards,
> > > Dmitry.
>
>
