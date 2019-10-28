Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E67AE7C24
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 23:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfJ1WDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 18:03:18 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:42379 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbfJ1WDR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 18:03:17 -0400
Received: by mail-ed1-f53.google.com with SMTP id s20so9127862edq.9
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 15:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0ztGU8SjR9YfsIEHbmVpnXIJZrZ7MSOLB9mRC+HWPng=;
        b=keOw12c3z4zk67yfws3czUfiXAjPKcec9Lg/+n3ecP0WgVs4sKOdrprMHsuq3keLMc
         FW6deoMAuE601l5L+zUx0HXCPTygDxLQPJZOY8JD1j24WA4xpOykOBU2mkoqvO8jzDCn
         dJdbu+ahINtuJIhpPnKbyz5kP3n+Gk+HDtPok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0ztGU8SjR9YfsIEHbmVpnXIJZrZ7MSOLB9mRC+HWPng=;
        b=ifVnz1ccFaZjg6RPxGb04fSQ/+gDKkUxZVS7g5Hes9ukoky42wLBaGSx8dogxu709U
         WwhObcPog66nfURzy5t4OOMycjoMg+0i8dYkr7ssn24lHuKwHC5T3xhBqXVArrORqXF+
         DmuSKI4KGjq3nFqhAGZpf4P0iWfsVE0Dkkmg635JhXLKnq5mAN185e4RUSo+4miAUAJX
         dXS1qxmSbTRetNOiEg3miYU/JU99GTCMQN8KU/P6E2wagVdNqxp+01x43lf9w+ygwtFy
         dp7I9vy5Z6MkTwHpk8VG/GUFO7FjnHjqOdu2OBdCoebAFcQuNlSUK9r6VYvFBigiDcj8
         d6zw==
X-Gm-Message-State: APjAAAWgEyi3WsSLs2MHS1tA8q1V7bNArpLZRzyP71n5UOjWFr1N/9tR
        3QGArpiXUEtcvEGBXROs+nrDgbIrfUi/cs44Qi6UaQ==
X-Google-Smtp-Source: APXvYqyjK9J4afu8Hz0Ol74h9i4u2K+nIif6HKCTI6kpMq1fQZHAjLPDW0oWq9FBfbV+tiPXuTSO3/fbEo4KThQvuM4=
X-Received: by 2002:a50:c408:: with SMTP id v8mr219324edf.140.1572300196174;
 Mon, 28 Oct 2019 15:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <b5b18a86-6137-99a0-0319-d389bac01206@xs4all.nl>
 <CAAEAJfA+ErfDTj87C7rKmo4qSqHL9+uyFEWrWecpCg8RpJ+Cpg@mail.gmail.com> <a774d273-fa54-d0b8-1043-48404958ca05@collabora.com>
In-Reply-To: <a774d273-fa54-d0b8-1043-48404958ca05@collabora.com>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Mon, 28 Oct 2019 23:03:05 +0100
Message-ID: <CAH1Ww+S7DoMUbqX5hO_MFpM3i0H=1F8SOTRxoPXLrWf45d6RuA@mail.gmail.com>
Subject: Re: [ANN v2] Media sessions in Lyon in October: libcamera
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, 21 Oct 2019 at 08:36, Helen Koike <helen.koike@collabora.com> wrote=
:
>
> Hello,
>
> On 10/20/19 5:13 PM, Ezequiel Garcia wrote:
> > Hello Hans,
> >
> > On Thu, 17 Oct 2019 at 13:16, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> (Just updated the attendee list for this meeting, no other changes)
> >>
> >> Hi all,
> >>
> >> Since we have three separate half-day sessions for different topics I =
decided
> >> to split the announcement for this in three emails as well, so these t=
hings
> >> can be discussed in separate threads.
> >>
> >> All sessions are in room Terreaux VIP Lounge - Level 0.
> >> There is a maximum of 15 people.
> >>
> >> The second session deals with libcamera and is on Wednesday morning
> >> from 9:00 to 13:00.
> >>
> >> Attendees for this session:
> >>
> >> Nicolas Dufresne <nicolas@ndufresne.ca>
> >> Tomasz Figa <tfiga@chromium.org>
> >> Ezequiel Garcia <ezequiel@collabora.com>
> >> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >
> > I beliebe Dafna and I should not be on this list, and instead
> > Helen Koike and Nicolas Dufresne would be attending.
>
> Yes, I'm interested in attending the libcamera session.
>
> Thanks
> Helen
>
> >
> > Thanks,
> > Ezequiel
> >
> >> Eugen Hristev <Eugen.Hristev@microchip.com>
> >> Jacopo Mondi <jacopo@jmondi.org>
> >> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> >> Dave Stevenson <dave.stevenson@raspberrypi.org>
> >> Hans Verkuil <hverkuil@xs4all.nl>
> >>
> >> That's 10 people.
> >>
> >> Planning to use libcamera, but willing to give up their seat if needed=
:
> >>
> >> Daniel Gomez <daniel@qtec.com>
> >> Helen Koike <helen.koike@collabora.com>
> >>
> >> Just interested:
> >>
> >> Boris Brezillon <boris.brezillon@collabora.com>
> >> Alexandre Courbot <acourbot@chromium.org>
> >>
> >> If I missed someone, or you are on the list but won't attend after all=
, then
> >> please let me know.
> >>
> >> Attendees: it is probably useful if you let us know whether you have t=
o
> >> join this meeting because you plan to use libcamera, or if you are 'ju=
st
> >> interested'. After the libcamera presentation on Tuesday afternoon we
> >> should know how many of the 'just interested' list can join.
> >>
> >> Agenda:
> >>
> >> TBD by Laurent.
> >>
> >> Regards,
> >>
> >>         Hans

I would like to know if there are more people you plan to add to the
attendee's list.
If not, I would like to be there.

Thanks,
Daniel
