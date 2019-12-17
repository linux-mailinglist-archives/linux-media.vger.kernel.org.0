Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52091122E17
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 15:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728575AbfLQOJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 09:09:30 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37421 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfLQOJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 09:09:30 -0500
Received: by mail-lj1-f193.google.com with SMTP id u17so11108001lja.4
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 06:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NMUgXN848+ZhpYTZV1nLH5JC6UIaTrL1pcLKTnII8o8=;
        b=U+Rmgw0hGFb1Hq59GQ9gCk2+HaOg6HUbTF9jpqfcBNqU4Fl3MU8kD0IMqONtPBFrsk
         pd4utiWCQgguMpf9Sf/eUEpcJzIl2G7hpK5DM6SKG41U8wCmwdWOyrGhXA2kHeEs9LSd
         FfhzX57px4ySztjT/xXpq529YqSXTY/9V0tss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NMUgXN848+ZhpYTZV1nLH5JC6UIaTrL1pcLKTnII8o8=;
        b=King+rp1re6HfnQHuYrPpwZYd8Bxu2qhKhK/yMdEzCloIdDcI9C7FiLFYZbmsGgwPy
         St3OhYjTWeWZ1S+ZoDv1f3kGWOaTs4Bv1viKiWeE2ucTtEcTvofNFkRwUCkvCCaNSIg7
         f5B5qfSeKPXplUx+O9TIj505s/MLI+v53WUHJuCRVm2dXedqL5h7b6fo3B1/FKRyFJW3
         6fJQXId7GLzX6TH2evX3kc4nFndDETvUX9Kh6W2hI+KeCwjPApqly9IFrsts2TtJy7cF
         sHWwgdqL9VTm7GN54l1c0E1u+rYhj+B3h7Ph4mwE5RmCcL+964uZmybwfjTdHMQMuno9
         TxeQ==
X-Gm-Message-State: APjAAAUJZ6TqHthaHCotxiP9Etg/ViV5tVh1qgn28HR8JD4KzfD6RE83
        zpfcOlbCHLF5J+9eIAProBNHzDF76NRtVoZyx4Hh8LiGhTM=
X-Google-Smtp-Source: APXvYqyLKEWFHJJR718+cay0eg64oEEgb0KbCUtihCWGh48K/gj2NOMNYaFoSb5Custi15gi6BImVhBP7/zVBT7MgNM=
X-Received: by 2002:a2e:824a:: with SMTP id j10mr3405686ljh.209.1576591767857;
 Tue, 17 Dec 2019 06:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
 <20191120112929.gvsne7ykvcyw65lu@sirius.home.kraxel.org> <7736193.Whgddqjo8n@os-lin-dmo>
 <CAD90VcbYAhk9CiagSEi=ouNMioR4v71uc40rRHGMe_+wvAm+0g@mail.gmail.com>
 <20191204091620.zpnd7jttkpkduort@sirius.home.kraxel.org> <CAAFQd5Bs6NnsoOP1NFLREQSLNJs-K33ZvW5ZcdAZTv95WHmPBA@mail.gmail.com>
 <20191216103236.ugjorzq5pntc7gtt@sirius.home.kraxel.org> <CAAFQd5BN+enTk3-4aUCCB+ZUA+7ZsOP=zndXh4Y=a8faoRk1Pw@mail.gmail.com>
 <20191217133945.oxnassyjr6hwtjbf@sirius.home.kraxel.org>
In-Reply-To: <20191217133945.oxnassyjr6hwtjbf@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 17 Dec 2019 23:09:16 +0900
Message-ID: <CAD90VcaXDXgmJ1-aDMu-o_zFCaJ4+rxN0FxHh7x6Q8MTPAr-jw@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thanks Tomasz and Gerd for the suggestions and information.

On Tue, Dec 17, 2019 at 10:39 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > On the host side, the encode and decode APIs are different as well, so
> > having separate implementation decoder and encoder, possibly just
> > sharing some helper code, would make much more sense.
>
> When going down that route I'd suggest to use two device ids (even when
> specifying both variants in one spec section and one header file due to
> the overlaps) instead of feature flags.

Sounds good. It makes sense to use different device IDs for different devices.

>
> > > I don't think using fourcc is a problem, and given that both drm and
> > > v4l2 use fourcc already this would be a good choice I think.
> >
> > Both DRM and V4L2 use two mutually incompatible sets of FourCCs, so
> > I'm not sure how it could be a good choice. At least unless we decide
> > to pick a specific set of FourCC. It doesn't help that Windows/DirectX
> > has its own set of FourCCs that's again slightly different than the
> > two mentioned before.
>
> Ouch, wasn't aware of that.  That makes reusing fourcc codes much less
> useful.
>
> > > But the definition should be more specific than just "fourcc".  Best
> > > would be to explicitly list and define each format supported by the
> > > spec.
> >
> > Why not be consistent with virtio-gpu and just define new formats as
> > we add support for them as sequential integers?
>
> Yes, lets do that.
>

It makes sense. I seems to have overestimated FourCC.

Best,
Keiichi

> cheers,
>   Gerd
>
