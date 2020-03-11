Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C567D181B69
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbgCKOfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:35:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45152 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgCKOfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:35:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id m9so2890886wro.12
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IQs+phBZ3S/GYnVfw9fs/6+DM3h/UBTUu4IQmErnRl0=;
        b=nSr92DBMadEBkWQ6le78I7owyV7u1YAk7udC/1HFUrHu+gXkp6DDe4xJsRvldP14aQ
         82kPuDnG6uMTxNtPT4XiN11eRpoitgBgS0JuJruBvYHAgrzsBk/C0usbgiY3dSzDnkrj
         s4MPHGMAAIkfjbW6FvTwk4rTuq/N2FfpdLwR0GQIxAYrTw3qTjrxzbpwpzhXtQXacjbZ
         xgjZJ3lN/qKlSVJr98J2zNtkdVE3bAuvkwIM0JNALFoKjLjRaMv0S9LpMSWye2MDcoZz
         r6CXnAUk1sEqOauu0uQwl+ffTIsMvsv1sX4PryZkRvQEJA/Jdty7KlPMgi9OjB7ZaTd2
         OHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IQs+phBZ3S/GYnVfw9fs/6+DM3h/UBTUu4IQmErnRl0=;
        b=hfp71uLCwv78ENJg/1jB75T59NUwjs/vKvT/2ZopyvP4jWpTXOS2qCv1yXqORgASS7
         0MLCW06ep/0/LUim2scxE2yXS75WsjwThMXJmoNHYXhilc+PVaop2lLycIjcZPR54x2Y
         ehfA8vbwX6kgDOsyW32+/UExczRIfbEPEjuwU6MOIdZuO3Zup3/CbkRdISs06G18HhRd
         BlXanqr4CWn/kq9m7tLfsqPDd853czpNNQ9eOUc065Mey8c6d7ZXQFliuuUPAtn5WGG9
         giZML+3h+C5GsuNrhD9+qEJnIyeeWZM7WuQuMe8JPoTdrwRLSm4asNBphbxOYHCAXJBM
         YnIw==
X-Gm-Message-State: ANhLgQ2n22Ez1lrAS96KGgoArHnZDCCSTW8hOFtlUdSsDq2usSig5slk
        6SYv0cptS7nO05djJdYlHWk=
X-Google-Smtp-Source: ADFU+vsVLsGvDctUv5N3FkS0igaaWFRRfqrOrvYtJRyM3CFSaUi8/aVYtssZIOaYgZGF0iNc8OCD/w==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr4920154wrv.308.1583937318624;
        Wed, 11 Mar 2020 07:35:18 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id p10sm69610393wrx.81.2020.03.11.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 07:35:17 -0700 (PDT)
Date:   Wed, 11 Mar 2020 14:35:15 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
Message-ID: <20200311143515.j2k6hfaw5tjwjo7e@arch-thunder.localdomain>
References: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310161845.1588-1-laurent.pinchart@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks for the cleanups on this.
On Tue, Mar 10, 2020 at 06:18:37PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This patch series started as an attempt to fix the format get and set
> subdev operations on the i.MX7 CSI-2 receiver subdev, which it does in
> patch 1/8. Patch 2/8 further cleans up the format-related code in that
> subdev.

for the imx7 part:

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> 
> Patches 3/8 to 8/8 pushes the cleanups further as I was attempting to
> fix the format enumeration on the video node at the end of the pipeline.
> I realized as part of that effort that there's more work than I
> anticipated, and I'm currently evaluating the possible options.
> Nonetheless, I think the cleanups make sense even without what I wanted
> to build on top of them, so I'm sending them out already.
> 
> Laurent Pinchart (8):
>   media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
>   media: imx: imx7-mipi-csis: Centralize initialization of pad formats
>   media: imx: utils: Inline init_mbus_colorimetry() in its caller
>   media: imx: utils: Handle Bayer format lookup through a selection flag
>   media: imx: utils: Simplify IPU format lookup and enumeration
>   media: imx: utils: Make imx_media_pixfmt handle variable number of
>     codes
>   media: imx: utils: Remove unneeded argument to (find|enum)_format()
>   media: imx: utils: Rename format lookup and enumeration functions
> 
>  drivers/staging/media/imx/imx-ic-prp.c        |   8 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |   6 +-
>  drivers/staging/media/imx/imx-media-capture.c |  22 +-
>  .../staging/media/imx/imx-media-csc-scaler.c  |   2 +-
>  drivers/staging/media/imx/imx-media-csi.c     |  26 +-
>  drivers/staging/media/imx/imx-media-utils.c   | 313 ++++++++----------
>  drivers/staging/media/imx/imx-media-vdic.c    |   6 +-
>  drivers/staging/media/imx/imx-media.h         |  24 +-
>  drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
>  drivers/staging/media/imx/imx7-mipi-csis.c    | 138 ++++----
>  10 files changed, 271 insertions(+), 289 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
>
> 
