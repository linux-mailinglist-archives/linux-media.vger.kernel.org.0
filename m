Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5771178994
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 05:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgCDEbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 23:31:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42658 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgCDEbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 23:31:35 -0500
Received: by mail-oi1-f196.google.com with SMTP id l12so741836oil.9
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 20:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i1xlbs3ZbDJUunrG0mUnxMqSYzI4Jrrt9ZvoGKTfYcA=;
        b=mKz8qgktXJjlsD4v4w7CRBUnqXzujHbbWhudDh37GcM/8kPum3j/j3WHX/fK9GmDUE
         TF0lKoAK2oJTLDxrxHbEOzW9mLfLJedSz5hT2EnY1334JPNFvxK2E27Sza3GmNpG4MHR
         YEtktMPfSPIc0bZSaYESIvhgzq3ZP4tjaaBPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1xlbs3ZbDJUunrG0mUnxMqSYzI4Jrrt9ZvoGKTfYcA=;
        b=uMuB4S3wBRttR2R/alEB3oJ8N/ReySGcYmQ343kihqMBDAJxeL7E7bWyNeQf0bS+fd
         eGs8b/+gil4GzxhR4169wv+W7gDXculMrhUCD9NIuvxUtiJkX3xf6XmZR5AtcIT72CI4
         S8AfFt0peJE2dudGL+JHZ4vQ+Rtty55r2KWLb5k9CWnO1cOf2SDuy8bpBoec760HrL6w
         r5eGaOrTTJLSoXZgaHL9MNxwvM6Kf4c5Y25nIg3lhqrXEl2KvxJ530zvlCAlgVenfUQI
         gQW7Riu4REnzRcXBAmjLOXtt7JZKPxRJeq1dlZM7HKkbSk308Z2DkvmqIfLPOeMRb6ef
         hRRg==
X-Gm-Message-State: ANhLgQ1hGkzPXZ1dhnDTAKnmVjvicVz0yGK6mGJYH2s2SQ40HIMznBNL
        8xwieASHWsmtnv7A4LXcYQViAeG3KSw=
X-Google-Smtp-Source: ADFU+vsc9rAcCZlwlvdvlWR1SFWlmOYelomKish8GoWX80cvqlj8g/or5oj4XCAjt4nnXJGmkqE1mA==
X-Received: by 2002:aca:1317:: with SMTP id e23mr548685oii.109.1583296292712;
        Tue, 03 Mar 2020 20:31:32 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id w15sm7847312oth.1.2020.03.03.20.31.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 20:31:31 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id j14so761522otq.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 20:31:31 -0800 (PST)
X-Received: by 2002:a9d:75ca:: with SMTP id c10mr897245otl.97.1583296290586;
 Tue, 03 Mar 2020 20:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-2-keiichiw@chromium.org> <20200225095956.7rtwugfru4dbjj7q@sirius.home.kraxel.org>
 <CAD90VcaTJh5MTRggpOmCK2LAryMHha2+7nPkFVTT8N8S06tf-A@mail.gmail.com> <20200227092856.p4kuh5dhh2tk3nnf@sirius.home.kraxel.org>
In-Reply-To: <20200227092856.p4kuh5dhh2tk3nnf@sirius.home.kraxel.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 4 Mar 2020 13:31:19 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWwBbNULCfMxN_KLt_Zd8kmmNy2JPi6XjLF1YgxxCPydw@mail.gmail.com>
Message-ID: <CAPBb6MWwBbNULCfMxN_KLt_Zd8kmmNy2JPi6XjLF1YgxxCPydw@mail.gmail.com>
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

On Thu, Feb 27, 2020 at 6:29 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Dmitry's virtio-video driver
> > https://patchwork.linuxtv.org/patch/61717/.
> > Once it becomes fully functional, I'll post a list of possible
> > improvements of protocol.
>
> Cool.  Actually implementing things can find design problems
> in the protocol you didn't notice earlier.
>
> > > > +\begin{description}
> > > > +\item[\field{version}] is the protocol version that the device talks.
> > > > +  The device MUST set this to 0.
> > >
> > > What is the intended use case for this?
> > >
> > > Given that virtio has feature flags to negotiate support for optional
> > > features and protocol extensions between driver and device, why do you
> > > think this is needed?
> >
> > While feature flags work well when we "extend" the protocol with an
> > optional feature, they don't when we want to "drop" or "modify"
> > features.
> > For example, I guess it'd be useful when we want:
> > * to abandon a non-optional command,
> > * to change a non-optional struct's layout,or
> > * to change the order of commands in which the device expects to be sent.
> >
> > Though it might be possible to handle these changes by feature flags,
> > I suspect the version number allow us to transition protocols more
> > smoothly.
>
> Feature flags can be mandatory, both device and driver can fail
> initialization when a specific feature is not supported by the other
> end.  So in case we did screw up things so badly that we have to
> effectively start over (which I hope wouldn't be the case) we can add a
> VERSION_2 feature flag for a new set of commands with new structs and
> new semantics.
>
> With a feature flag both driver and device can choose whenever they want
> support v1 or v2 or both.  With a version config field this is more
> limited, the device can't decide to support both.  So the bonus points
> for a smooth transition go to the feature flags not the version field ;)

I agree that feature flags would be preferable in general, but I'm
concerned by the fact that there is (IIUC) a limited number of them.
Video tends to change significantly over time, and to have optional
features that would also be presented as feature flags. After a while
we may run out of them, while a new protocol version would allow us to
extend the config struct with some new flags. Or am I missing
something?

I also wonder how "support v1 or v2 or both" would work with feature
flags. In order to make it possible to opt out of v1, I guess we would
need "v1 supported" flag to begin with?

Sorry for the newbie question about feature flags, I'm still in the
process of wrapping my head around virtio. :)
