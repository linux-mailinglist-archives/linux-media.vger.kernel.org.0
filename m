Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4E3C184453
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 11:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgCMKFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 06:05:51 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46138 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgCMKFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 06:05:51 -0400
Received: by mail-ed1-f66.google.com with SMTP id ca19so11145332edb.13
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 03:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6UW1kyALb0MWdPqUFI/DjUTNu9cZzTceWzWbjXh9Wco=;
        b=ZSk+RRM8aNjzXnNc5t6sm2oslZz/CXajOLKz8EPhj1lrUpbXL8QOr7imAuPTyKDJNg
         sA9z06z/jwpoMTkUBY/MfDz5/8knIWBtSdogSc7LZe+0xjkGQUyaqYeTG2jtNIWkX7uw
         VStYvxFBpfN0NbeRQ46J+pMpAEEUBwR2q8JGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6UW1kyALb0MWdPqUFI/DjUTNu9cZzTceWzWbjXh9Wco=;
        b=j96PSYoNFV7wE6gdNn36R9Wo60DHm4wSVp9MZa/1Xp+pQz40Y7l3ezMJPOGbY1hBQg
         kgX/pV3WzDCitv3U4o4hg5J6vIw24tMogQ0jbwiXhoVFm2cne4LuV3lusEIpPPwPk00O
         A9eVCFCyGQWdIZ5BQqqyRVzR1SjsbgBEOn1vix9zPoQKYnOePrWEDFxy0Q0LR5LAn6lb
         a4sXim37l/78sPgsA7DQjEbPj+8DCY6Wttv0R749os//RFjygPRHiyh/c6vgNPOGrhA/
         zG4FxPY8ZkDH2zefY4yGJM7BzI57I/f91V201W21zjWiRtDAblaNio7B7choxmVrPUAk
         Dc4g==
X-Gm-Message-State: ANhLgQ2aWbDjVtXJmod9GUZVGgMdXM8Jztukb3r9jQoRDHwtUwJS1w1w
        GLi3jgL2qrbZ1c/7lKCTXiwwk31tmW4=
X-Google-Smtp-Source: ADFU+vsHwXFf/V0wHdaJm+RwlL23uyZqVXvf7saSvHbQ/MK0AJ0T4QUuoQp4YlgOfajhRjNMirMQKQ==
X-Received: by 2002:a17:906:5c04:: with SMTP id e4mr10593480ejq.80.1584093948693;
        Fri, 13 Mar 2020 03:05:48 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id t1sm3917035eju.35.2020.03.13.03.05.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 03:05:47 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id a25so11303641wrd.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 03:05:46 -0700 (PDT)
X-Received: by 2002:a5d:42c8:: with SMTP id t8mr17105382wrr.415.1584093946082;
 Fri, 13 Mar 2020 03:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
 <20719772.EfDdHjke4D@os-lin-dmo> <6f8c37b1-8dc4-e3bb-01ed-4ebedaf90915@xs4all.nl>
 <12620787.dW097sEU6C@os-lin-dmo>
In-Reply-To: <12620787.dW097sEU6C@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 13 Mar 2020 11:05:35 +0100
X-Gmail-Original-Message-ID: <CAAFQd5BdS2oT+vgM3Qg64wPqWdPRi1uE6ZmOPwXwudv==3JQVA@mail.gmail.com>
Message-ID: <CAAFQd5BdS2oT+vgM3Qg64wPqWdPRi1uE6ZmOPwXwudv==3JQVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>, dstaessens@chromium.org,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 12:48 PM Dmitry Sepp
<dmitry.sepp@opensynergy.com> wrote:
>
> Hi Hans,
>
> One more thing:
>
> > GFP_DMA? That's unusual. I'd expect GFP_DMA32. All V4L2 drivers use tha=
t.
>
> GFP_DMA32 had no effect for me on arm64. Probably I need to recheck.
>

What's the reason to use any specific GFP flags at all? GFP_DMA(32)
memory in the guest would typically correspond to host pages without
any specific location guarantee.

Best regards,
Tomasz

> Best regards,
> Dmitry.
>
> On Donnerstag, 12. M=C3=A4rz 2020 11:18:26 CET Hans Verkuil wrote:
> > On 3/12/20 11:15 AM, Dmitry Sepp wrote:
> > > Hi Hans,
> > >
> > > Thank you for your great detailed review!
> > >
> > > I won't provide inline answers as your comments totally make sense. T=
here
> > > is>
> > > only one thing I want to mention:
> > >>> + struct video_plane_format plane_format[VIRTIO_VIDEO_MAX_PLANES];
> > >>
> > >> Why is this virtio specific? Any reason for not using VIDEO_MAX_PLAN=
ES?
> > >
> > > I'd say this is because VIDEO_MAX_PLANES does not exist outside of th=
e
> > > Linux OS, so for whatever other system we need a virtio specific
> > > definition.
> > OK, good reason :-)
> >
> > It's probably a good thing to add a comment where VIRTIO_VIDEO_MAX_PLAN=
ES is
> > defined that explains this.
> >
> > Regards,
> >
> >       Hans
>
>
