Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBC0AD367
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731836AbfIIHJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:09:44 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38048 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731728AbfIIHJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 03:09:43 -0400
Received: by mail-ed1-f67.google.com with SMTP id a23so9718135edv.5
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 00:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T38J5nmAgQi8595wEdsPfYYrq9V3o+PpMYRuY7ztHfw=;
        b=RrfqJaTVqJCjoVmi/j/pMcZc2e1kSEhKSZ/FUlnys+Ogq20qtLl9R8dNnDsnYc3GSc
         C3J4f8Qhi1NegRVi1N4MdO1A2eO7Pt4sLAuOGBtBkbOSUrtYLCwo53dBz43W5MLYxUde
         jfhDZOfsovEfTZaW/orJfd9hiJgLxGN2qScmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T38J5nmAgQi8595wEdsPfYYrq9V3o+PpMYRuY7ztHfw=;
        b=QE4rPzhIYNj48tswWBZUbMM6gsmvlrKp7XNB1DZPltJSUcZcdfOgPx8mtjjUdnIuBP
         Vl6G4s6zwRe/KkcgKv/fczQd5QMBHQAdemCy+yUd2e/xxOK7gWLTDu2Wz/TZBUNjJwRw
         LJ2pEy/ZK3boMHM+AGcXbX4tMtydYA5iyanAgNWnovl0OXHAjbJb8EEUnLxJm36tVrW4
         PP44iLK9WW/3nm+l8vPWHKGOMW9lbTce5GpDH+qwTEby6zzunlcDhL/WjOIw4Pjg4aSI
         67VnLLAd97Vq3D+R3GfPz12fOqb/U5f5weLcw0c58jENMwPB2H+ZzRjZ3CyS9hrYiGVW
         hsMQ==
X-Gm-Message-State: APjAAAXCaqOjJni+yTkonXDbWBSrGk+C7ja4voJEdNDrObtRfacol85C
        uLjMd/4tCl2tMKbOxOxhY69cNKdXp2zIGw==
X-Google-Smtp-Source: APXvYqyKGNwywObT7M0+YrK0bJpMzUyWPB4bYjiFMvp2TQko62cvr5KcmP8jfancEX+ooeKcVUYXKA==
X-Received: by 2002:aa7:da90:: with SMTP id q16mr15851170eds.123.1568012980085;
        Mon, 09 Sep 2019 00:09:40 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id bm1sm2810945edb.29.2019.09.09.00.09.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2019 00:09:39 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id r17so12155984wme.0
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 00:09:39 -0700 (PDT)
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr7658465wma.10.1568012978876;
 Mon, 09 Sep 2019 00:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190905101533.525-1-p.zabel@pengutronix.de> <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
 <1567679973.3958.1.camel@pengutronix.de> <cb118783713af210b3ac8a87d00b62dc83cc9c08.camel@collabora.com>
In-Reply-To: <cb118783713af210b3ac8a87d00b62dc83cc9c08.camel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 9 Sep 2019 16:09:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dv3VhybM5qZHQCBgRQmpLrS1Pi1rmwRnt59q9mRUUTjw@mail.gmail.com>
Message-ID: <CAAFQd5Dv3VhybM5qZHQCBgRQmpLrS1Pi1rmwRnt59q9mRUUTjw@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uapi: h264: Add num_ref_idx_active_override_flag
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 5, 2019 at 11:17 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 05 septembre 2019 =C3=A0 12:39 +0200, Philipp Zabel a =C3=A9crit=
 :
> > On Thu, 2019-09-05 at 19:31 +0900, Tomasz Figa wrote:
> > > On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix.de>=
 wrote:
> > > > This flag tells the kernel whether the slice header contained the
> > > > num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
> > > > num_ref_idx_l[01]_default_active_minus1 from PPS should be used
> > > > instead.
> > > >
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > ---
> > > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
> > > >  include/media/h264-ctrls.h                       | 1 +
> > > >  2 files changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Doc=
umentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > index bc5dd8e76567..451a5b0f2a35 100644
> > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding=
_type -
> > > >      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
> > > >        - 0x00000008
> > > >        -
> > > > +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> > > > +      - 0x00000010
> > > > +      - Corresponds to the num_ref_idx_active_override_flag syntax=
 element.
> > > >
> > >
> > > As far as I remember, the idea was for the userspace to always put th=
e
> > > right num_ref_idx in the slice_params and the drivers always use that=
.
> > > Was there any problem with that?
> >
> > I don't think so, at least for currently known hardware.
> >
> > In that case we should drop the unused
> > num_ref_idx_l[01]_default_active_minus1 fields from struct
> > v4l2_ctrl_h264_pps and document that userspace should fill
> > the defaults into v4l2_ctrl_h264_slice_params themselves if
> > num_ref_idx_active_override_flag wasn't set.
>
> It might have been added in a previous effort to allow reconstructing
> the bitstream from the structures.

Wouldn't one still be able to reconstruct a valid (but not exact)
stream without that flag, given the assumption above?

Best regards,
Tomasz
