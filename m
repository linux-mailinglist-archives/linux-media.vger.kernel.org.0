Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB04373E95
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 17:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbhEEPeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 11:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhEEPeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 11:34:24 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7C4C06174A
        for <linux-media@vger.kernel.org>; Wed,  5 May 2021 08:33:28 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id j11so1460728qtn.12
        for <linux-media@vger.kernel.org>; Wed, 05 May 2021 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=O6w0cG9YtDPDCbidOpCE3ksxspkqrocA0oYzTOOZmTY=;
        b=YQKbrBTtFj9MppoNVFsLxDdSZ/GmVwL/zzYHnJqJJ+CymA6PwkB1RXQU/zknmwLbOx
         nRuC+c3zVZagrt5JC1/dbTDziLPRnMg7fkfFoSsi9M0fP6X0Abrrd6/b+rh/HqznwT82
         AVGURakeDyDD3GwV+EAlU+XQLqbIfFHRztLt1XV19fmpF4hhWB0aFK3J7yhunE6E1FU6
         derUunuLRMB9p+K3jUD1ccJ5ibKnrOtLRqvme4dyVnPIeSxkHxC4iGnQaPUudJSovhEz
         DPKouVJD32Yk98btYA8W5kzdlIpnm+FtXJJLsnua4l8pxYbXL45ANgqX4SVaqy3RhWbz
         5v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=O6w0cG9YtDPDCbidOpCE3ksxspkqrocA0oYzTOOZmTY=;
        b=itNQhoI+XMRGgi3Khlvbj6d87ncorCBOZYnYV0SwSeceK/7JS2VfL9VIRQydlPprIt
         opl/qEpKoF+eQBt/rQugPorHpqP0uPLqhOVxyWATXdXDzbSUjCw7Kt3qTL3MVAZSztoa
         cY4WkDfRWed0aE/P8ZtVL2QjVbLcjdHX1DhrlPlZx8208rTJaeTK9Zr/T4tY2WoMSaox
         40rT/dZDuGKJ9Q7yWcrWE5GKABg5H/P36Uyb7mMt8yT5/BGGCuMX6QVNXD0HNzIX3+Gq
         divAuPX3voCCR6W4jjgJkeons+HA1zgSCqVjCjXYcUeift6Rk4SzewJ81erAF9Psqdhx
         4daw==
X-Gm-Message-State: AOAM533f2FZVDNogy7Sb2g44Hv/Poqey47bIvvXNfkmDzuLkjOBkG7ze
        kngOsZ/Lckw+KycPLaxzsfy7pQ==
X-Google-Smtp-Source: ABdhPJxhPUMuK8ha1j9GrZqzuSO7vV5fOOc6RgsQZm7A+tYOpJMWKo4YcFwkk9ghgDO7D11M6Zd0SA==
X-Received: by 2002:a05:622a:1014:: with SMTP id d20mr8092919qte.64.1620228807158;
        Wed, 05 May 2021 08:33:27 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id t18sm13994897qkj.75.2021.05.05.08.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:33:26 -0700 (PDT)
Message-ID: <fbee67d620d456b5f2988b7f0ba28d5c6335ee6c.camel@ndufresne.ca>
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
Date:   Wed, 05 May 2021 11:33:24 -0400
In-Reply-To: <6bd59glrp4fq3j3ngmbl5p4u7aethvrv34@4ax.com>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
         <20210420121046.181889-7-benjamin.gaignard@collabora.com>
         <6bd59glrp4fq3j3ngmbl5p4u7aethvrv34@4ax.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 05 mai 2021 à 16:18 +0100, John Cox a écrit :
> > The HEVC HANTRO driver needs to know the number of bits to skip at
> > the beginning of the slice header.
> > That is a hardware specific requirement so create a dedicated control
> > for this purpose.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> > .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
> > .../userspace-api/media/drivers/index.rst     |  1 +
> > include/media/hevc-ctrls.h                    | 13 +++++++++++++
> > 3 files changed, 33 insertions(+)
> > create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/hantro.rst
> > b/Documentation/userspace-api/media/drivers/hantro.rst
> > new file mode 100644
> > index 000000000000..cd9754b4e005
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/hantro.rst
> > @@ -0,0 +1,19 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Hantro video decoder driver
> > +===========================
> > +
> > +The Hantro video decoder driver implements the following driver-specific
> > controls:
> > +
> > +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
> > +    Specifies to Hantro HEVC video decoder driver the number of data (in
> > bits) to
> > +    skip in the slice segment header.
> > +    If non-IDR, the bits to be skipped go from syntax element
> > "pic_output_flag"
> > +    to before syntax element "slice_temporal_mvp_enabled_flag".
> > +    If IDR, the skipped bits are just "pic_output_flag"
> > +    (separate_colour_plane_flag is not supported).
> 
> What happens if it is a dependant_slice_segement or
> output_flag_present_flag?  Those flags are all dependant on
> dependant_slice_segement being false.  I'm guessing 0 but it maybe
> should be documented.

Zero indeed.

> Likewise if output_flag_present_flag is false pic_output_flag will not
> be coded, so maybe express it as "after slice_type" rather than "before
> pic_output_flag"?

Should work too.

> 
> Regards
> 
> John Cox
> 
> > +.. note::
> > +
> > +        This control is not yet part of the public kernel API and
> > +        it is expected to change.
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst
> > b/Documentation/userspace-api/media/drivers/index.rst
> > index 1a9038f5f9fa..12e3c512d718 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -33,6 +33,7 @@ For more details see the file COPYING in the source
> > distribution of Linux.
> > 
> > 	ccs
> > 	cx2341x-uapi
> > +        hantro
> > 	imx-uapi
> > 	max2175
> > 	meye-uapi
> > diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> > index 8e0109eea454..b713eeed1915 100644
> > --- a/include/media/hevc-ctrls.h
> > +++ b/include/media/hevc-ctrls.h
> > @@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
> > 	__u64	flags;
> > };
> > 
> > +/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2
> > */
> > +#define
> > V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
> > +/*
> > + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
> > + * the number of data (in bits) to skip in the
> > + * slice segment header.
> > + * If non-IDR, the bits to be skipped go from syntax element
> > "pic_output_flag"
> > + * to before syntax element "slice_temporal_mvp_enabled_flag".
> > + * If IDR, the skipped bits are just "pic_output_flag"
> > + * (separate_colour_plane_flag is not supported).
> > + */
> > +#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	(V4L2_CID_CODEC_HANTRO_BASE
> > + 0)
> > +
> > #endif


