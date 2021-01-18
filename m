Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECD32F9E19
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 12:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390086AbhARL1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 06:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388820AbhARLRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:37 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CB1C061793
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 03:16:13 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id w26so17809757ljo.4
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 03:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BiOeQObj1lWg++oDC0igsl1yme7R9sAH9n3rrQCoHD8=;
        b=DpMVg2MbierGpSbhzEntYbaeNip/kLGJBsOF3ZssNvBJd7P3b8GKmSoqDjUhwfwKAM
         YRfi5k8eqKcHArItKgeOnCyRBgPmynrrPstxpeF7QEvzTqmtWYJtFmGHHiB9Y8KT5woH
         PJfCV5EBX4mdQfTKQ5zIfDcH+Lw7d0uRlTGI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BiOeQObj1lWg++oDC0igsl1yme7R9sAH9n3rrQCoHD8=;
        b=rMYV36wBg4YG/he6T8fBP62dtwto2EDw/DKF5kNm/zJmucbhRECS8XsvSNbLwvsVvg
         HpcIWI5MMpgr+tT5rFlledO6dA9Kp+uazzbWAFettgsPwFDbQyeXywdVtDN+o/sgjl7Y
         A3KA1MiALgvz8QtX7Mux8AIQKZQhMLAScUos/Z7hibWKSdOn2fnJ0RyZeLG1JMa3iEQN
         QSCxon362dmrQi/NtVuIKPbBfPNtkAqIA/wenW+71xgFtnb5tInwJN3Qi1mECvR+H1Qq
         bY2Y8CAJ3WuxYIq+wdHY1CvKNsPaWHdqkDktUd8KnEhL2X+sKMlbUqZJTXhULgv+HHfC
         gxww==
X-Gm-Message-State: AOAM5332WwRBg/BuAWgIPB7smS2wMG+3QIG1avu67rhKCTQJc376400L
        QHP72H1/8vabXciPkKQ8I50ljmogNQAyncCw
X-Google-Smtp-Source: ABdhPJyATFhjbQTTPoQABKHpljNhkdWz6eF9QVAjMwZAK+Cml/E35BHPo8PP5NMyHju205Udjybm6Q==
X-Received: by 2002:a2e:5741:: with SMTP id r1mr10296194ljd.15.1610968571899;
        Mon, 18 Jan 2021 03:16:11 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id f23sm1865912lfc.63.2021.01.18.03.16.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 03:16:11 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id w26so17809544ljo.4
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 03:16:09 -0800 (PST)
X-Received: by 2002:a2e:8e63:: with SMTP id t3mr10249115ljk.88.1610968568684;
 Mon, 18 Jan 2021 03:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20200623111325.237158-1-keiichiw@chromium.org>
 <87czy7l6uu.fsf@linaro.org> <CAD90Vca=VPVM7+Cj-2cK3SWaSR_Ciajt7oOr0OyB-34bL15ewg@mail.gmail.com>
 <f3b177a7-1792-25ff-5bef-9e6b7fb4bde3@opensynergy.com>
In-Reply-To: <f3b177a7-1792-25ff-5bef-9e6b7fb4bde3@opensynergy.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 18 Jan 2021 20:15:57 +0900
X-Gmail-Original-Message-ID: <CAPBb6MV=r3yin5cH+VW7s1njhWZFF-Xx6STrtUfOPKeDmJjURg@mail.gmail.com>
Message-ID: <CAPBb6MV=r3yin5cH+VW7s1njhWZFF-Xx6STrtUfOPKeDmJjURg@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH RFC v4 0/1] Virtio Video Device Specification
To:     Matti Moell <Matti.Moell@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
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
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        virtio-dev@lists.oasis-open.org,
        Ruchika Gupta <ruchika.gupta@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Mike Holmes <mike.holmes@linaro.org>, dmitry.sepp@outlook.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I think the v5 should be ready for public review. It has considerably
changed compared to v3, however the changes are mostly simplifications
and addressing issues we experienced with v3 on Chrome OS, so
hopefully it's for the better. Let me do a final check before sending
it to the virtio list.

Cheers,
Alex.

On Sat, Jan 16, 2021 at 1:55 AM Matti Moell <Matti.Moell@opensynergy.com> wrote:
>
>
> On 15.01.21 15:25, Keiichi Watanabe wrote:
> > I think the driver implementation is necessary for the spec to be
> > merged, but it's not yet clear when we can spend time implementing
> > drivers. It's likely to be after April or so.
> >
> > IIRC, OpenSynergy folks, who implemented the v3 driver, also had some
> > plan to implement the driver with the v5 spec.
> > Matti, do you have any update on it? I'd really appreciate it if we
> > could keep working for upstream together.
>
> Hey Keiichi and Alex!
>
> Yeah, I think for us it'll also be in the March/April timeline before we
> can start looking at it again, there's quite a few loose ends when going
> from v3 to v5 so it'll probably take a while to get it in shape and make
> sure that all the comments from the drivers v2 are properly addressed.
>
> I'm not 100% sure how to proceed but perhaps it makes sense to jointly
> iterate on the driver sources together once the v5 is mostly agreed. Any
> suggestions welcome.
>
> Cheers,
>
>                 Matti
>
