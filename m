Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C92E318BB3B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 16:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgCSPhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 11:37:46 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41878 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbgCSPhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 11:37:46 -0400
Received: by mail-ot1-f66.google.com with SMTP id s15so2794754otq.8
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 08:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KWhsCym1qFlkPfXZlPx8naSH9BTgc67m+/IaL0zlgGQ=;
        b=vfpiHFZNfNCAeZsl2CGMHkVHUX9rCQiBxC+Vu9fNOF2NyWTyAylNr5nAeP9rRQYt0J
         /kSJtRsoD9TSeNoNAxrAZAlPql9i40Ggj4SocLzL21xwmy07zjHBBEMJIegzEUGj7Vbz
         bNjKjmz8p/Tt3Wqg9ZoF4wpnYXxCtBEeNDJy88lpYEpDVTTuFQik7sddqUZVoZ1NGHnJ
         oMy2iUPDDGCntwv3mzx9WsWabu4U+JVLCBhZHu03cQTdyd1sczesHaEd8tbvYei6Brqw
         8+DaaY7fanmTnxI8hOJAa76RQwUkTKpAKVl1HepPHr36MlRO0TVUZ/1pZHBIImseALeh
         w2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KWhsCym1qFlkPfXZlPx8naSH9BTgc67m+/IaL0zlgGQ=;
        b=rM62LiCx6Kx61vMUv+9zqz1jVsYyMEg1o/TpkNSGpt2bBnB78Er3ftgDeljUOiCozl
         Hv84Y4gDCKeAVDB3CgqZYW4uz739LTZNSWw9B/u312Om8lTYfVqJgdXeC7MF5YmsaRuz
         IANB2XhPQIEJL8iH8G4WHMLLrPq+/rhI9tDxG3zOtvYpPPQwwQGn+opTxdA3E/7/n/5m
         SgjiTSEHtN6JSVPvgaKKgC+EQaIA3DIWPaoHSWS3zckJxAynNcxbn9b2f5UFt6tS97X1
         ti4JmVcrcVLM6vGY4EaFn10+TwXIDa0Hn/55Kwk4VHW5XKICG72mWXZo+OcqYE0toabs
         eNkw==
X-Gm-Message-State: ANhLgQ2AUZX37FUzwJWf9pfKDe8Zh0glT4ROcA+R/asUZj9cP6yIrYjp
        Ssboesg2jFsFQIXfYkXqTD7CN5a7gqMkasF9iUlhEQ==
X-Google-Smtp-Source: ADFU+vuSMOSa974wgde7Rk5sk/TZfL37tCOpCDeVpmlyCTr+yGCyAiq3+skc+HPsIsSz3NDeXVR86iTW2eULGelRkCA=
X-Received: by 2002:a9d:6946:: with SMTP id p6mr2828822oto.224.1584632265631;
 Thu, 19 Mar 2020 08:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200318183536.15779-1-p.zabel@pengutronix.de>
In-Reply-To: <20200318183536.15779-1-p.zabel@pengutronix.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 19 Mar 2020 08:37:33 -0700
Message-ID: <CAJ+vNU3=4v-a2x4XWh+HnkQofJ5Gnbu7j=Rtu2hDP00UPH6Oyg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] v4l2 JPEG helpers and CODA960 JPEG decoder
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 18, 2020 at 11:35 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi,
>
> the JPEG header parser is updated to accept up to four components,
> baseline and extended-sequential DCT encoded images, 8-bit and 12-bit
> precision, as well as 8-bit and 16-bit quantization tables. As a
> consequence, all drivers will have to check the number of components,
> precision, and quantization table lengths.
>
> I have not yet added support parsing the Adobe APP14 headers to
> determine the color encoding, as it is unclear to me how it could be
> used to signal RGBA components - for 4-component images it is defined
> to disambiguate between CMYK and YCCK encodings. This is implemented
> in libjpeg.
> Patching the header data in place to normalize the component identifiers
> is not part of the parser and will be added in a separate patch.
>
> For now the rcar_jpu, s5p-jpeg and mtk-jpeg conversions are dropped.
> Instead, a few CODA fixes were added that should avoid alignment issues
> with odd-sized JPEG images and that stop tricking GStreamer into
> negotiating NV12 and then switching to YUV420 instead in S_FMT.
>
> regards
> Philipp
>
> Philipp Zabel (6):
>   media: coda: round up decoded buffer size for all codecs
>   media: add v4l2 JPEG helpers
>   media: coda: jpeg: add CODA960 JPEG decoder support
>   media: coda: split marking last meta into helper function
>   media: coda: mark last capture buffer
>   media: coda: lock capture queue wakeup against decoder stop command
>
>  drivers/media/platform/Kconfig            |   1 +
>  drivers/media/platform/coda/coda-common.c | 188 ++++++-
>  drivers/media/platform/coda/coda-jpeg.c   | 572 ++++++++++++++++++++
>  drivers/media/platform/coda/coda.h        |  10 +-
>  drivers/media/v4l2-core/Kconfig           |   4 +
>  drivers/media/v4l2-core/Makefile          |   2 +
>  drivers/media/v4l2-core/v4l2-jpeg.c       | 632 ++++++++++++++++++++++
>  include/media/v4l2-jpeg.h                 | 135 +++++
>  8 files changed, 1519 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
>  create mode 100644 include/media/v4l2-jpeg.h
>
> --
> 2.20.1
>

Philipp,

Thanks for this!

Tested on GW5404 (IMX6Q) and works great:
gst-launch-1.0 videotestsrc ! jpegenc ! v4l2jpegdec ! kmssink
gst-launch-1.0 videotestsrc ! v4l2jpegenc ! v4l2jpegdec ! kmssink

Tested-by: Tim Harvey <tharvey@gateworks.com>

Tim
