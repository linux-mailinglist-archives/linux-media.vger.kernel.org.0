Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9613114523C
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 11:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgAVKNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 05:13:53 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43251 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbgAVKNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 05:13:53 -0500
Received: by mail-qk1-f194.google.com with SMTP id j20so1816884qka.10
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 02:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v/v4gsunZW3/SK3txv49RS3OswX6Moo8iJj9KiNLNZk=;
        b=OgjwJ6ipmysY8QY7m+iVUYCtrCC4Gq60ZF7VknltICjgEeV/IlRhLkejG3/BbyPeKZ
         jZHigYJ61VVy0eMV+i703qL93FoYcUV7YXryizSnFXClFrKTVwvIxlB4EqXxNhRibPUH
         x+01SFXzBtGJJegbKdhk19B3e2dZw+OX9l5jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v/v4gsunZW3/SK3txv49RS3OswX6Moo8iJj9KiNLNZk=;
        b=AyZ1Yb3fzkDY+Z3cd79Fxgxuh8GY4lte3nwedQ04fkEpiaQwWXjVEskf6dgWA8QE1N
         IRCm4pN4TszVxgfRNoRFmSeumiqjiErVxeS8q7eFTgVa1ZlU3xLMvisPd9B4yjuHANoi
         BwnXJlH10Cj3mVmqf2xhgseRz+N3nkKXEan1L2awQyUAqIo0ClYK8NO5ParKrdgPGcmk
         4O/xuIHV5MjCdSsCE9BmJD2to0BfXMD5IhOCviqQrUwCUdz1FYbJrGXLufGGg7/2FFZz
         seIZ7dCDzfly3zf0Y3/A50dDCgZQkyYGvR+WQS+aQFqaCc1tfze7aH3D437vM8IW8yh1
         iIkQ==
X-Gm-Message-State: APjAAAX5uhwqYDZ7Yl2nL5YZVrmuDLl3yU1ZcA15QPg6sJFEMJcK6sUl
        W+3RVrvRezDSsqZRx79Y44DEoyYl0Uy/6jEILw7WIg==
X-Google-Smtp-Source: APXvYqwUv897TNxhaRUh9087ToKhnGrEv4kyAiCMXN4m5pnLcbNPvv45TSY+d77prKdAy3FM+9B3p4HD4eKhdGOjIxA=
X-Received: by 2002:a37:63c7:: with SMTP id x190mr9140006qkb.232.1579688032385;
 Wed, 22 Jan 2020 02:13:52 -0800 (PST)
MIME-Version: 1.0
References: <CAD=HUj640QfNwO4J_tdcSx36YOVAVT_dZUXYuKPaCKvZVWeHsg@mail.gmail.com>
 <20200122032103-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200122032103-mutt-send-email-mst@kernel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 22 Jan 2020 19:13:41 +0900
Message-ID: <CAD=HUj4pORJK1SQ2+n_oiXJyGaKqakSiOGcXdRCGSAMnuxY4cw@mail.gmail.com>
Subject: Re: [virtio-dev][RFC PATCH v1 1/2] content: define what an exported
 object is
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > +When an object created by one virtio device needs to be
> > +shared with a seperate virtio device, the first device can
> > +export the object by generating a \field{uuid}
>
> This is a field where?

It's a property of the exported object, but I guess it doesn't really
correspond to any concrete field. I'll remove \field.

> > which the
> > +guest can pass to the second device to identify the object.
>
> s/guest/Driver/ ?

The uuid can be passed to a second device controlled by a different
driver, so I think 'driver' by itself is ambiguous. I'm using guest as
a shorthand for 'system which includes the drivers and software which
sits on top of the drivers', and that meaning does seem to be
compatible with language in the rest of the spec. If that shorthand
isn't acceptable, I can rewrite the sentence passively as '... a uuid
which can then be passed to a second device ...'.

> Also - what are guest and host here?

There are a number of places in the virtio spec where 'guest' is used
to refer to the system where drivers run and where 'host' is used to
refer to the system where devices run. I guess those terms aren't
concretely defined within the spec, but they do seem to have a well
understood meaning. Or is the guest/host language discouraged in new
additions to the spec?

-David
