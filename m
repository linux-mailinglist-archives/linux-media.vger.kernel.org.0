Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C36F178E0B
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 11:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgCDKIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 05:08:16 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33876 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgCDKIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 05:08:16 -0500
Received: by mail-ot1-f67.google.com with SMTP id j16so1470917otl.1
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 02:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sFNlb303vXOf6uZAl3GT6yPk8PlWh22iQZBwvfdvj2E=;
        b=TZXZrMKkk758Lg6vVCtng+mEVA184wncNb5kAMpPaKfHqEc1s1uj6+BnwhazveLDgO
         bre0e/8i580ATLM2J9xKYX2EQrsNmcqGQpciJTgyE6LzmGkipaP1ebJ+AHJQJ9hvS/ye
         hsOCZMrwH/1kwmFuTRtWp2zYMcle0qxqoEhZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFNlb303vXOf6uZAl3GT6yPk8PlWh22iQZBwvfdvj2E=;
        b=VyC+x4owbF0TwQRVUQ4EfORVmdX4jURrkpYiByduXae8svuJyfi5Q2xVEyznJPfihi
         YG7DOeYSumXM5otUH+UGzCaRoMKLG8Hj3gJ4PnxPfljpy1vrRerS42RQ8pNl5CfZjIo+
         KJqwJcg87Fsl65Kr084iJmOCD/1Sy1P0XKPQNDJk6lz3GDYFdUICkC+CNpnmeU2Bsq2q
         cXLCI8GCNBWxtwyn0I0D8PVD3c7xyUgnWPmOSbq8OdGgATVr61dPbDFbPVgHzTEF0DHT
         I0/c19DTYWntZYbB8hKXM7Kbexf6VUc23nDZHvueOKKG3+H+T4QtSqKmfW8hQizkTlK3
         ZIzA==
X-Gm-Message-State: ANhLgQ0gOuQzQsg0tGlw2cpRk4Nu+FO2nlLwaPKOUIhWsF00akjGQq+K
        CSsBT3mkEnUafuR4fnKj0PsdoeDCPBye6Q==
X-Google-Smtp-Source: ADFU+vstxZLzd5m6OdUqgA7cKXR1BM3cBIsJVXpUW2FXEvguOq7VvVRZkqXmmKEbZrPeAW48qLin7w==
X-Received: by 2002:a05:6830:22d8:: with SMTP id q24mr1810515otc.0.1583316493166;
        Wed, 04 Mar 2020 02:08:13 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id u62sm4591270oif.49.2020.03.04.02.08.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 02:08:12 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id f21so1410223otp.12
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 02:08:11 -0800 (PST)
X-Received: by 2002:a9d:5cc4:: with SMTP id r4mr1721385oti.33.1583316490692;
 Wed, 04 Mar 2020 02:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-2-keiichiw@chromium.org> <20200225095956.7rtwugfru4dbjj7q@sirius.home.kraxel.org>
 <CAD90VcaTJh5MTRggpOmCK2LAryMHha2+7nPkFVTT8N8S06tf-A@mail.gmail.com>
 <20200227092856.p4kuh5dhh2tk3nnf@sirius.home.kraxel.org> <CAPBb6MWwBbNULCfMxN_KLt_Zd8kmmNy2JPi6XjLF1YgxxCPydw@mail.gmail.com>
 <20200304064251.zzkhevqgth6uets6@sirius.home.kraxel.org>
In-Reply-To: <20200304064251.zzkhevqgth6uets6@sirius.home.kraxel.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 4 Mar 2020 19:07:58 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVPjgLkbVjOY6O3srywNm8Zb1pMR2pGM1NinByhgFaZ_A@mail.gmail.com>
Message-ID: <CAPBb6MVPjgLkbVjOY6O3srywNm8Zb1pMR2pGM1NinByhgFaZ_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
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

On Wed, Mar 4, 2020 at 3:43 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > With a feature flag both driver and device can choose whenever they want
> > > support v1 or v2 or both.  With a version config field this is more
> > > limited, the device can't decide to support both.  So the bonus points
> > > for a smooth transition go to the feature flags not the version field ;)
> >
> > I agree that feature flags would be preferable in general, but I'm
> > concerned by the fact that there is (IIUC) a limited number of them.
>
> We have 64 total, some reserved, 24 are available to devices right now,
> see https://www.kraxel.org/virtio/virtio-v1.1-cs01-video-v3.html#x1-130002
>
> > Video tends to change significantly over time, and to have optional
> > features that would also be presented as feature flags. After a while
> > we may run out of them, while a new protocol version would allow us to
> > extend the config struct with some new flags. Or am I missing
> > something?
>
> Not everything needs a feature flag.  For example we have
> VIRTIO_VIDEO_CMD_QUERY_CAPABILITY, and we can add new video formats
> without needing a feature flag.  Maybe it is a good idea to explicitly
> say in the specs that this can happen and that the driver should simply
> ignore any unknown format returned by the device.
>
> > I also wonder how "support v1 or v2 or both" would work with feature
> > flags. In order to make it possible to opt out of v1, I guess we would
> > need "v1 supported" flag to begin with?
>
> The driver can ignore any device without v2 feature flag set.
> The device can refuse to accept a driver without v2 support (don't allow
> setting the FEATURES_OK bit).

That should work as long as we want to add features. I had deprecation
of old features in mind, but maybe the more reasonable answer to that
is "always remain backward compatible". :)

As for the 24 feature flags, I guess that should we run out of them we
can always use the last one to signal that more flags can be found at
the end of the device configuration space.
