Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD273AD5E2
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 11:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388095AbfIIJkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 05:40:40 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40974 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfIIJkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 05:40:40 -0400
Received: by mail-ed1-f68.google.com with SMTP id z9so12320705edq.8
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lzp9VH0+hr4Ni9blq23MrBd3Uvu6wD/MjRZwYh+P0fw=;
        b=HoM2ZeyOOG43XzD12deRYm6QmAWGOemnlk3v7JqG1zmHF+wZ1kfoXWHsgSYdoLAESq
         x8BLcOLa1bAmD5XN//2AsF7cgUymlp7PIJsgMk53KKtET1wBp3LuLVGqEM4S++QMSrbd
         7teG3yeX5+FLFlQsbQRQDC9oqUuDTR5F26O4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lzp9VH0+hr4Ni9blq23MrBd3Uvu6wD/MjRZwYh+P0fw=;
        b=fFz9kxygIc0keQ/kzCmSqhpp4hw3Ju3oDzPBqdNIKPcz+dLJneY6PCgu/3WejJLjwG
         Fk87Z5on61c7AqOjdYIQ2nmJwxlrtrM+QcMDBDLpif9O9GWQjXysj3YYFRkbGlSE6XfJ
         Nx+g+ff2EKUQ2qlVp9G71yRjSfsRXd3hL32HYlvN85TygROst5DNlJ90LtXRFKcounOv
         wzWyGFRsTDeoFKJiTwTqCYz1iD/xh7M9FswtS+x4cO7Y7dQdEssaEayS1zc3YuanJm6h
         aZll/0mudOw8Uz9PI6ytobyuvROid+uPzfLsNQI9Mrp131GSWT8FClrqvVaAjorgyjiz
         /d7w==
X-Gm-Message-State: APjAAAWQz7VnrJkePc472wZzUTH1nJUFu9Lftb9/MNgKgcLpaslhVBJs
        VtnGG8lVQgOxV4esJE2+D1uLJmgn2hqjuA==
X-Google-Smtp-Source: APXvYqy/cJ0039ULUVL1Jld9/eO0eSkVfL9EbL2RxUXLtKzLY+ICoAsEJSDxjMtIkxv2v+CiE6oNfg==
X-Received: by 2002:a50:adea:: with SMTP id b39mr22972526edd.16.1568022037686;
        Mon, 09 Sep 2019 02:40:37 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id e52sm2910510eda.36.2019.09.09.02.40.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2019 02:40:36 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id q14so13030511wrm.9
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 02:40:36 -0700 (PDT)
X-Received: by 2002:adf:e503:: with SMTP id j3mr17833953wrm.166.1568022036198;
 Mon, 09 Sep 2019 02:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190905101533.525-1-p.zabel@pengutronix.de> <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
 <1567679973.3958.1.camel@pengutronix.de> <cb118783713af210b3ac8a87d00b62dc83cc9c08.camel@collabora.com>
 <CAAFQd5Dv3VhybM5qZHQCBgRQmpLrS1Pi1rmwRnt59q9mRUUTjw@mail.gmail.com> <1568014207.2956.1.camel@pengutronix.de>
In-Reply-To: <1568014207.2956.1.camel@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 9 Sep 2019 18:40:24 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C9ca0JqTA3Ha+APP9VW9HY=Ve-n+L6FK54xxKAM-akdQ@mail.gmail.com>
Message-ID: <CAAFQd5C9ca0JqTA3Ha+APP9VW9HY=Ve-n+L6FK54xxKAM-akdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uapi: h264: Add num_ref_idx_active_override_flag
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
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

On Mon, Sep 9, 2019 at 4:30 PM Philipp Zabel <p.zabel@pengutronix.de> wrote=
:
>
> On Mon, 2019-09-09 at 16:09 +0900, Tomasz Figa wrote:
> > On Thu, Sep 5, 2019 at 11:17 PM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Le jeudi 05 septembre 2019 =C3=A0 12:39 +0200, Philipp Zabel a =C3=A9=
crit :
> > > > On Thu, 2019-09-05 at 19:31 +0900, Tomasz Figa wrote:
> > > > > On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
> > > > > > This flag tells the kernel whether the slice header contained t=
he
> > > > > > num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
> > > > > > num_ref_idx_l[01]_default_active_minus1 from PPS should be used
> > > > > > instead.
> > > > > >
> > > > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > > ---
> > > > > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
> > > > > >  include/media/h264-ctrls.h                       | 1 +
> > > > > >  2 files changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b=
/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > index bc5dd8e76567..451a5b0f2a35 100644
> > > > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > > @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_co=
ding_type -
> > > > > >      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
> > > > > >        - 0x00000008
> > > > > >        -
> > > > > > +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> > > > > > +      - 0x00000010
> > > > > > +      - Corresponds to the num_ref_idx_active_override_flag sy=
ntax element.
> > > > > >
> > > > >
> > > > > As far as I remember, the idea was for the userspace to always pu=
t the
> > > > > right num_ref_idx in the slice_params and the drivers always use =
that.
> > > > > Was there any problem with that?
> > > >
> > > > I don't think so, at least for currently known hardware.
> > > >
> > > > In that case we should drop the unused
> > > > num_ref_idx_l[01]_default_active_minus1 fields from struct
> > > > v4l2_ctrl_h264_pps and document that userspace should fill
> > > > the defaults into v4l2_ctrl_h264_slice_params themselves if
> > > > num_ref_idx_active_override_flag wasn't set.
> > >
> > > It might have been added in a previous effort to allow reconstructing
> > > the bitstream from the structures.
> >
> > Wouldn't one still be able to reconstruct a valid (but not exact)
> > stream without that flag, given the assumption above?
>
> If the Hantro G1, as appears to be the case, parses the slice header and
> decides itself whether to use the override from the slice or the default
> that was written to a register, it needs the
> num_ref_idx_l[01]_default_active_minus1 field to fill the register, but
> doesn't need either the num_ref_idx_l[01]_active_minus1 override nor the
> flag.
>
> A decoder that doesn't parse the slice header can always be told to use
> the override (thus no need to have the flag in the uapi), if userspace
> fills the default into the override fields as a fallback. Such a decoder
> does need the num_ref_idx_l[01]_active_minus1 override, but doesn't need
> the num_ref_idx_l[01]_default_active_minus1 field nor the flag.
>
> That is my current understanding of the intention behind this interface,
> I hope this is accurate.
> I've tried to make the docs reflect this in ("media: uapi: h264: clarify
> num_ref_idx_l[01]_(default_)active fields") [1].
>
> [1] https://lore.kernel.org/linux-media/20190905114210.9232-1-p.zabel@pen=
gutronix.de/T/#u

Yes, makes sense for me.

Best regards,
Tomasz
