Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF86D10A8A2
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2019 03:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK0CKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 21:10:40 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:44011 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfK0CKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 21:10:39 -0500
Received: by mail-il1-f195.google.com with SMTP id r9so19533537ilq.10
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 18:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBXbyIX5wSQod1Ur3aJ2xhtj0ZSo0HlsX5eg6WTuPyw=;
        b=kpHyzTAh2MgM2031NlOmfmVs7PcgBHOug2sfhvqX14otxLCcXrmmNej2JEKvDnvB2j
         yENqQuROTNRzH+uybLA35yKXBdSkRcrc7de3Cyr1onAdA6Eh9SY3R7a+87VhSuuJru8F
         ejR+u18g756BqrKhk3++wZ1NEhVnOvbc19hArK3f9c4MPGvaWpVCeOUjkgkH8GX4R+rg
         LFUeDyBCV5/5NnvSRd8JurNdgJGo6Vp4BU1x8T7oqn7Syz0LlCDrOZxvfm2pvgqoAEuj
         h0s2kaPp/kDIqN1I2Wiir1/j59uRHhNlS8DplX9mLPDvvKilv1CtRNy1qYbLaxIhkDqw
         PS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBXbyIX5wSQod1Ur3aJ2xhtj0ZSo0HlsX5eg6WTuPyw=;
        b=ftWXAdZpp49vXFf7/dp+CrMbDbV01A6U73YyusasWEzDSmNI6FL7YWUgcjSCs1al65
         zAROSszv69cIDmNUzg8oUkgIIbXdC5hNahuPHvdMU44EaJGkQ8oc3b6b8zDlT70GZ5P5
         DDOadJYt8TX46kD/8eIzXPxGnLkPlcc3EgLwGPR3puU58KI884JrCEXfUCLBi3JTg/uc
         fAaX8m24yX0B/KRvVoujRg8t0v9w2wWu/lhyJ4QFm6vb/FZgeEVuVkK7xIATsZxr26hH
         2VCFP4ifJwJPj3/wUhjmS9UBgvrG43cxqxM5sB6LMitXc04Keb8dDfdNkU/Px/YaRhpS
         DA/w==
X-Gm-Message-State: APjAAAUi8joJPsOF4JBy2W2nOiiJpFYjQwOSwmT/xi9Njmd7oA5yZKiZ
        R+eN3q1Y8MvrbHyiyPLyUFEOREMNv30t9LNUGqA=
X-Google-Smtp-Source: APXvYqwDkQCP8ZlT5tDAWnQpSiC+mCL0RJRLZEmiO8uUItRxhgZMxskbrJyH2bxr1i50e6NvMUZxM0+V4Fu5ohfP/Ws=
X-Received: by 2002:a92:7e18:: with SMTP id z24mr41012367ilc.276.1574820638322;
 Tue, 26 Nov 2019 18:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20191124190703.12138-1-slongerbeam@gmail.com>
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 26 Nov 2019 20:10:27 -0600
Message-ID: <CAHCN7x+vXszc_CBNtqHgjhuKpYyRgTdTGGyD1Rto_bNa_athPQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] media: imx: Create media links in bound notifiers
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 24, 2019 at 1:08 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> Move media link creation into the notifier bound callbacks in the
> subdevices required by imx, making use of media_entity_get_fwnode_pad().
>
> In the process, improve the behavior of media_entity_get_fwnode_pad().
> The function is also being used inconsistently by current callers, so
> that is fixed in this serieas as well.
>
> The default behavior of media_entity_get_fwnode_pad() fails when
> the entity has multiple sink and/or source pads. Wrt imx, there are
> two such entities: the imx6 csi-2 receiver, and the video mux.

Out of curiosity, what is required to get the imx drivers out of
staging and into the regular media directory?

At least for the i.MX6, the pipeline and CSI2 drivers appear to be
functioning well and have for some time.

I haven't had a chance to try this series, but on the surface, this
seems reasonable.


adam
>
> Modify the default behavior of media_entity_get_fwnode_pad() to first
> determine if the port number at the provided endpoint firmware node
> corresponds to a valid pad for the entity. That way the default behavior
> will work for any entities that implement 1:1 mappings, without requiring
> they implement the .get_fwnode_pad op.
>
> In other words, the old behavior of media_entity_get_fwnode_pad() required
> entities implement .get_fwnode_pad if they have multiple sink or source pads.
> The new behavior requires entities implement .get_fwnode_pad only if they
> have multiple sink or source pads, and do not have 1:1 port:pad mappings.
>
> Also, as part of the above work, it was discovered that all of the
> current callers of media_entity_get_fwnode_pad() are not using that
> function in a consistent way. In all but one case the driver passes the
> firmware node of the subdevice itself to the function, not one of it
> endpoint nodes as the function expects. In more detail:
>
>   - Cadence MIPI-CSI2 Receiver,
>   - ST Micro MIPID02 CSI-2,
>   - Allwinner V3s CSI,
>   - Allwinner A10 CSI,
>   - STM32 DCMI:
>     These drivers call media_entity_get_fwnode_pad() in the subdev bound
>     notifier callback, but passes sd->fwnode to the function. This is
>     usually the fwnode of the subdevice itself, not one of its endpoint
>     nodes. This only works now because there are no implementations of the
>     .get_fwnode_pad op. This will break as soon as the bound subdevice
>     implements the .get_fwnode_pad op.
>
>   - Renesas R-Car MIPI CSI-2 Receiver:
>     Calls media_entity_get_fwnode_pad() in the subdev bound notifier
>     callback. In this case the driver passes the async subdev descriptor
>     match fwnode. Again for most subdevices, this is the fwnode of the
>     subdevice itself, not one of its endpoint nodes. However on the
>     Salvator-X platform, the bound subdevice happens to be the ADV748x
>     CSI-2 transmitter, which does indeed place the endpoint node in the
>     asd match fwnode. But the problem is that the driver is now making
>     assumptions about what subdevices it is binding to.
>
> To resolve the above issues, this series adds a new function
> media_create_fwnode_pad_links(), which creates the media links from/to
> all pads on a remote entity, to/from a single specific local entity pad,
> using the fwnode endpoint connections between them. It's API makes it
> convenient to call from subdev bound notifier callbacks.
>
> Another function media_create_fwnode_links() is added that will create
> links from/to all pads on a remote entity, to/from all pads on a local
> entity. It's API also makes it convenient to call from subdev bound
> notifier callbacks, and can be called for entities that link to remote
> entities via multiple pads (for example the video-mux which has multiple
> sink pads that link to multiple bound subdevices).
>
> This series has been tested on i.MX6Q SabreSD, SabreLite, and SabreAuto
> platforms, and the Renesas Salvator-X platform.
>
> The series needs testing on i.MX7, Cadence, ST Micro MIPID02, STM32 DCMI,
> and Allwinner V3s and A10 platforms. Testing only needs to verify that the
> media graph is unchanged, no stream testing is required. If the media graph
> is broken, it means the subdevice(s) that bind to the drivers listed
> above need to implement the .get_fwnode_pad op.
>
> History:
>
> v2:
> - rename/move the notifier-to-state inlines in imx7-mipi-csis.c and
>   imx7-media-csi.c, suggested by Rui Silva.
> - rewrite imx_media_create_links() to only add the missing media links
>   from the imx6 MIPI CSI-2 receiver.
>
>
> Steve Longerbeam (23):
>   media: entity: Pass entity to get_fwnode_pad operation
>   media: entity: Modify default behavior of media_entity_get_fwnode_pad
>   media: entity: Convert media_entity_get_fwnode_pad() args to const
>   media: Move v4l2_fwnode_parse_link from v4l2 to driver base
>   media: entity: Add functions to convert fwnode endpoints to media
>     links
>   media: adv748x: csi2: Implement get_fwnode_pad
>   media: rcar-csi2: Fix fwnode media link creation
>   media: cadence: csi2rx: Fix fwnode media link creation
>   media: sun6i: Fix fwnode media link creation
>   media: st-mipid02: Fix fwnode media link creation
>   media: stm32-dcmi: Fix fwnode media link creation
>   media: sunxi: Fix fwnode media link creation
>   media: v4l2-fwnode: Pass notifier to
>     v4l2_async_register_fwnode_subdev()
>   media: video-mux: Create media links in bound notifier
>   media: imx: mipi csi-2: Create media links in bound notifier
>   media: imx7-mipi-csis: Create media links in bound notifier
>   media: imx7-media-csi: Create media links in bound notifier
>   media: imx: csi: Implement get_fwnode_pad
>   media: imx: csi: Embed notifier in struct csi_priv
>   media: imx: csi: Create media links in bound notifier
>   media: imx: csi: Lookup upstream endpoint with
>     imx_media_get_pad_fwnode
>   media: imx: Create missing links from CSI-2 receiver
>   media: imx: TODO: Remove media link creation todos
>
>  drivers/base/property.c                       |  63 ++++++
>  drivers/media/i2c/adv748x/adv748x-csi2.c      |  21 ++
>  drivers/media/i2c/st-mipid02.c                |  20 +-
>  drivers/media/mc/mc-entity.c                  | 209 +++++++++++++++++-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |  27 +--
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |  23 +-
>  drivers/media/platform/stm32/stm32-dcmi.c     |  15 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  27 +--
>  .../platform/sunxi/sun4i-csi/sun4i_csi.h      |   1 -
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  36 +--
>  drivers/media/platform/video-mux.c            |  30 ++-
>  drivers/media/platform/xilinx/xilinx-vipp.c   |  69 +++---
>  drivers/media/v4l2-core/v4l2-fwnode.c         |  50 +----
>  drivers/staging/media/imx/TODO                |  29 ---
>  drivers/staging/media/imx/imx-media-csi.c     |  92 +++++---
>  .../staging/media/imx/imx-media-dev-common.c  |  60 ++---
>  drivers/staging/media/imx/imx-media-of.c      | 114 ----------
>  drivers/staging/media/imx/imx-media-utils.c   |  33 +++
>  drivers/staging/media/imx/imx-media.h         |   5 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  29 ++-
>  drivers/staging/media/imx/imx7-media-csi.c    |  55 +++--
>  drivers/staging/media/imx/imx7-mipi-csis.c    |  30 ++-
>  include/linux/fwnode.h                        |  14 ++
>  include/linux/property.h                      |   5 +
>  include/media/media-entity.h                  |  99 ++++++++-
>  include/media/v4l2-fwnode.h                   |  56 +----
>  26 files changed, 735 insertions(+), 477 deletions(-)
>
> --
> 2.17.1
>
