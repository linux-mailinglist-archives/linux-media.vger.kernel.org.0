Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA70D387E4B
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 19:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351097AbhERRTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 13:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351090AbhERRTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 13:19:18 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9258C061760
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 10:17:59 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id f8so8026112qth.6
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qJf1xQ+28NnAlK43hj654qEgRrKzipkMXHBsgZzKcQQ=;
        b=jl6nkGRna7urQ78bL7v3bD+QWmlbdVa0MQHADOJeyhwz5p+pm3dVfDF4Te1IzBnPL7
         nlKlPY7CTKcz+kTFU2RxALOk9jUpTe/G/SvqO+4OskPULcE8x7GgnHABgk9/Rv2fkQlM
         rwghuG9qsgzsONAauvf0CRd9lzs9dI2raXJgGQDYKIdZXtN3zraMQXoz/Zly0TPeBva+
         eTiDhnjBoqmJ2MPmOAkfj3DEVLanSR3mRQiv7URcyEm/vqGpN9Adqqm0zmQdgKWvzbAd
         NlKOTlxFnfOBEBWDbE6gQwbfKR+L3/XaMIEMDs3Ct3jN/CcqK/lOXtr/fZqK0GPWIwMc
         /3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qJf1xQ+28NnAlK43hj654qEgRrKzipkMXHBsgZzKcQQ=;
        b=FcveIHSEsbz4/gahJMDNj3r4Feo35f7uKTsT3nhdQ+lWinMFTBL76N5awJhC3ybVqn
         LGfgE63MlZt1kqAhu6KYWZ0t9qA7+5XF5n/Qn1aolaFXM7B2oT+NXhSJql/PyCHG5mwc
         y1f6V8FqT0m/Er+fX18ogGT0aqECswXtSt4O6oTL92hyesmniOQnDlFg5aSx3na7ZDt8
         yknvYo1Hz0Y43SGJHAmV0SDUL/w7X9L16ZctbOa9H2kPR8ctb/s2lw3E4UyO5O9WVxMF
         2vycrdPv6bqJ5u3JIRvfvWczOVjOgzvh7p2gko+NuC1UIpzfbzmRzs7CJ0pULNduXScZ
         ecnw==
X-Gm-Message-State: AOAM531ohXaOAbvAz26yeE3WG0GjQNY6U3SEEF3zZ5I7avlLE8qmt/5R
        u39s3z6UDJHN93hFOyDBF73U9Q==
X-Google-Smtp-Source: ABdhPJwFCakSIEdHaGsprjjlr1VL3AJif3L4ZlgN9vty0qn+s/kb3sZ+RVbgOyQON0pjsh4rPin//A==
X-Received: by 2002:ac8:5846:: with SMTP id h6mr5915303qth.215.1621358278997;
        Tue, 18 May 2021 10:17:58 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id b3sm11931277qtg.55.2021.05.18.10.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 10:17:58 -0700 (PDT)
Message-ID: <a473ea02de9b54482c1d2c82db2e4c7512920022.camel@ndufresne.ca>
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
Date:   Tue, 18 May 2021 13:17:56 -0400
In-Reply-To: <f46b9c889914360348f218b45f10a06bd1bd8595.camel@collabora.com>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
         <20210420121046.181889-7-benjamin.gaignard@collabora.com>
         <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
         <1cf94540-7f4d-0179-dd1e-0b82ee30f6d2@collabora.com>
         <815a4bd6-599b-cfb8-9ddc-efa4b7092c23@xs4all.nl>
         <f46b9c889914360348f218b45f10a06bd1bd8595.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le dimanche 16 mai 2021 à 20:04 -0300, Ezequiel Garcia a écrit :
> Hi Hans,
> 
> On Thu, 2021-05-06 at 14:50 +0200, Hans Verkuil wrote:
> > On 05/05/2021 17:20, Benjamin Gaignard wrote:
> > > 
> > > Le 05/05/2021 à 16:55, Hans Verkuil a écrit :
> > > > On 20/04/2021 14:10, Benjamin Gaignard wrote:
> > > > > The HEVC HANTRO driver needs to know the number of bits to skip at
> > > > > the beginning of the slice header.
> > > > > That is a hardware specific requirement so create a dedicated control
> > > > > for this purpose.
> > > > > 
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > ---
> > > > >   .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
> > > > >   .../userspace-api/media/drivers/index.rst     |  1 +
> > > > >   include/media/hevc-ctrls.h                    | 13 +++++++++++++
> > > > >   3 files changed, 33 insertions(+)
> > > > >   create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
> > > > > new file mode 100644
> > > > > index 000000000000..cd9754b4e005
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/drivers/hantro.rst
> > > > > @@ -0,0 +1,19 @@
> > > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +Hantro video decoder driver
> > > > > +===========================
> > > > > +
> > > > > +The Hantro video decoder driver implements the following driver-specific controls:
> > > > > +
> > > > > +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
> > > > > +    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
> > > > > +    skip in the slice segment header.
> > > > > +    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
> > > > > +    to before syntax element "slice_temporal_mvp_enabled_flag".
> > > > > +    If IDR, the skipped bits are just "pic_output_flag"
> > > > > +    (separate_colour_plane_flag is not supported).
> > > > I'm not very keen on this. Without this information the video data cannot be
> > > > decoded, or will it just be suboptimal?
> > > 
> > > Without that information the video can't be decoded.
> > > 
> > > > 
> > > > The problem is that a generic decoder would have to know that the HW is a hantro,
> > > > and then call this control. If they don't (and are testing on non-hantro HW), then
> > > > it won't work, thus defeating the purpose of the HW independent decoder API.
> > > > 
> > > > Since hantro is widely used, and if there is no other way to do this beside explitely
> > > > setting this control, then perhaps this should be part of the standard HEVC API.
> > > > Non-hantro drivers that do not need this can just skip it.
> > > 
> > > Even if I put this parameter in decode_params structure that would means that a generic
> > > userland decoder will have to know how the compute this value for hantro HW since it
> > > isn't something that could be done on kernel side.
> > 
> > But since hantro is very common, any userland decoder will need to calculate this anyway.
> > So perhaps it is better to have this as part of the decode_params?
> > 
> > I'd like to know what others think about this.
> > 
> 
> As you know, I'm not a fan of carrying these "unstable" APIs around.
> I know it's better than nothing, but I feel they create the illusion
> of the interface being supported in mainline. Since it's unstable,
> it's difficult for applications to adopt them.
> 
> As Nicolas mentioned, this means neither FFmpeg nor GStreamer will adopt
> these APIs, which worries me, as that means we lose two major user bases.
> 
> My personal take from this, is that we need to find ways to stabilize
> our stateless codec APIs in less time and perhaps with less effort.
> 
> IMO, a less stiff interface could help us here, and that's why I think
> having hardware-specific controls can be useful. Hardware designers
> can be so creative :)
> 
> I'm not against introducing this specific parameter in
> v4l2_ctrl_hevc_codec_params, arguing that Hantro is widely used,
> but I'd like us to be open to hardware-specific controls as a way
> to extend the APIs seamlessly.
> 
> Applications won't have to _know_ what hardware they are running on,
> they can just use VIDIOC_QUERYCTRL to find out which controls are needed.

Can you extend on this, perhaps we need an RFC for this specific mechanism. I
don't immediatly see how I could enumerate controls and figure-out which one are
needed. Perhaps we need to add new control flags for mandatory control ? This
way userspace could detect unsupported HW if it finds a mandatory control that
it does not know about ?

> 
> Thanks,
> Ezequiel
> 


