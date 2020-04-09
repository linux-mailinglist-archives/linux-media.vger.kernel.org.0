Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4C21A32CC
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 12:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgDIKrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 06:47:10 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45755 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgDIKrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 06:47:09 -0400
Received: by mail-lj1-f194.google.com with SMTP id t17so10907187ljc.12
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9cRaeh08mhFE2IVS+WsO4x0a5cpWTPgRt9aIdP5PwiQ=;
        b=jFpYGhmgzOldXb8rpUJ/nVO2sXHaWA79GfNvdt8TouA7H3059Acn2M5bjlzHrGMYeu
         WCdKC2GrhFL1UPT/ZIsmobLgnqCWRZqRwBUZdBWsktKp6VKSNTFwSwx1KFhyKEjZwKtw
         Tasdv0PYbmo7ZbhxYCj1cMBcTIm/eVxR+nNhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9cRaeh08mhFE2IVS+WsO4x0a5cpWTPgRt9aIdP5PwiQ=;
        b=Ec1Ega2dFYiBTOVXzQle0p97tJZrDh9W11hIIexrVOXqtww3m7fWPm8hPjPHY4RD8F
         W8OnyIMW01OUb7AyOz2lEl92JZTzdtcl8kaAxOr0GbgG+xkyVqCKOnoR5bb4r33T9dAU
         qO1jlHFaLPhx8ROnEbarhEzzux4TQXZLd6yPA8LR3JqBSL+JuJCO/v1wd43FypL5sOsd
         lxPP7Sy6xaQnIEWvJPbRhMUoyMFKq6tiI9tZIV+l4GJ0V9cUnnwOVpBq6PasQnyjHDTx
         97wUH9ln8ww6dW46yl+KDCUzw8AWUaI089ry1XNK7zxXoMxeReTQRVE/2H1uZ5Ffnhrv
         VPjg==
X-Gm-Message-State: AGi0PuZivl6zXS7U44PlqSoMTjOEyYc9vYcLJtix9A6yhJXpvCYYly0T
        Jxy7nJun0Cjqywy6Wpyd5oyx4f29B9dfImkBxWToqw==
X-Google-Smtp-Source: APiQypInLkppToS8D1aCf9MmTCvnQdp7Jrrf2sFNxcy0G624vRt+PfF5eMJNF1KZM2/L4mVNdYC05Hw90OYtPGbACOE=
X-Received: by 2002:a2e:b4ca:: with SMTP id r10mr1915591ljm.149.1586429227856;
 Thu, 09 Apr 2020 03:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-2-keiichiw@chromium.org> <4320831.CvnuH1ECHv@os-lin-dmo>
In-Reply-To: <4320831.CvnuH1ECHv@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Thu, 9 Apr 2020 19:46:56 +0900
Message-ID: <CAD90Vca4jqLPdK4my3mCmPM45Lwc5te6PbDhA+H=0X1QyTFWzQ@mail.gmail.com>
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

Hi,

On Tue, Apr 7, 2020 at 11:49 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi,
>
> > +\item[VIRTIO_VIDEO_CMD_STREAM_DESTROY] Destroy a video stream
> > +  (context) within the device.
> > +
> > +\begin{lstlisting}
> > +struct virtio_video_stream_destroy {
> > +        struct virtio_video_cmd_hdr hdr;
> > +};
> > +\end{lstlisting}
>
> Let's add more strict description to stream_destroy, like as follows:
> Device MUST NOT generate any events for the stream in question after receiving
> the command. Before completing the command, Device MUST ensure that all
> asynchronous commands that are related to the stream have been completed and
> all memory objects are unreferenced.

Sounds good. But, the device should probably be able to generate
VIRTIO_VIDEO_EVENT_ERROR for a device-wide error?
Or, should VIRTIO_VIDEO_EVENT_ERROR always be a per-stream error? (I
haven't documented it in v3)

Best regards,
Keiichi

>
> Best regards,
> Dmitry.
>
>
>
