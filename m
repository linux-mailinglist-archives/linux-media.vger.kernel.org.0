Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FE5411388
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 13:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236864AbhITL3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 07:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbhITL3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 07:29:31 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D9AC061574
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 04:28:05 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id u15so28649147wru.6
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m5T7PqIcHvN0436k6MS8jI5HG5ISOLzYumqmz8oYLHM=;
        b=R9ispwTGdbxJZwMY+1pgccJTUnXIwWyYcUW7mfMEGgvxkcju1wHmS+7Rw+sI/lQL95
         v99VuF3sOpyERvtdimL8F80W8iQJkxRoDONtOZwTupOmHd7lxXyo5bqR6N3h9SNeIHeN
         ogS0ogtYxDkrBz+UAE3TsNUE5VZ9APy7fbGbtcZIBt9IxBWZeRYE/8tYVaB2T6PNhfKx
         JJpeo4TtM4IGBqsgZaItVBCyqLOoQjNsXzNdMw1hqnI88dQnf/eCt0bSn8bdmXZipUL8
         vRkc7arHdwec81GebTSx4bxPZ9kgic3MS8uGlWPn7FXwUfAJ6/kfGTTicO8kQie3nTg4
         ahBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m5T7PqIcHvN0436k6MS8jI5HG5ISOLzYumqmz8oYLHM=;
        b=LcrBKsjNX3U49buDZU4NIunORlpVB/UqftDOlIuDPOK6FIyMBZ5joSFIce2DVFr48b
         VJ9+qUTRVMN51pNcvcyfwxgGTq2kcW1h0Kwa0nGDCyycOo7set8VIn3B7uw1gsjPFzX8
         /OoMhv3rgmGfJjRhLi+7VeA/gCJYfQQNiZVtcqEMX19x5g3ER1AGb0WnilQMs0fHQVu1
         plWe/Z3s9+24XjPpvLp9WIPEm/udlQOotU0aQ181HmqXjYtBArPJ490lLpvLjMbIFTPE
         W0mjIUVSPh189x1mGsDmWtRQ3EZ2xfo6c/+PDNmyOWj/CafkxfVNzSseh6PVONlHWTAT
         sS6Q==
X-Gm-Message-State: AOAM530jSAV7/LldBO7r3XWfQ6OFd49trKR+qCMnbSVtbNE+XJtPIAUX
        yYD+9hK6Dz1LX4FjRdhkfxWEa8C4+RYFsZ+I62nubgckGOWTBw==
X-Google-Smtp-Source: ABdhPJz+YgTJDOyC3e0aOnoq0lz+pHDY98boHKB6WyRdiLjkesudgDd7dyF909cMX8GDuEoaSDNaP4JMu5TkQ0riM4o=
X-Received: by 2002:a5d:5386:: with SMTP id d6mr27869497wrv.112.1632137283699;
 Mon, 20 Sep 2021 04:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <01d4c7efb1ef900c499fda6af2c5a19ce923dc15.camel@tq-group.com>
In-Reply-To: <01d4c7efb1ef900c499fda6af2c5a19ce923dc15.camel@tq-group.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 20 Sep 2021 12:27:48 +0100
Message-ID: <CAPY8ntB-7g5FigO9rNV4YGWCeHUWkO4v1kp96mW-icGwT-rk9w@mail.gmail.com>
Subject: Re: Sony IMX290 link frequency
To:     "Stein, Alexander" <Alexander.Stein@tq-group.com>
Cc:     "mani@kernel.org" <mani@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander

On Mon, 20 Sept 2021 at 08:15, Stein, Alexander
<Alexander.Stein@tq-group.com> wrote:
>
> Hello,
>
> the imx290 driver specifies 2 tables of link frequencies, depending on
> number of lanes and the vertical resolution.
> These numbers vary from 148.5 MHz up to 445.5 MHz.
> I'm wondering where these number come from, it's not clear for me. Also
> shouldn't those numbers also depend in bits per pixel and the frames
> per second?
> I suspect that the returned link frequency is not correct which breaks
> things further down using v4l2_get_link_freq().

I looked at imx290 and little brother imx327 a few months back to get
it running with libcamera on the Pi. I have a couple of patches that
ought to be upstreamed when I get a chance [1].

The Sony datasheet provides register configurations for specific modes
(1080p, window cropping, and 720p) and frame rates, rather than a full
description of what the registers do.

It has two clock paths - one driving the pixel array, and one driving
the MIPI core. There is a FIFO between the two, so they can run at
different rates.

My conclusion is that the pixel array always runs at the same pixel
rate, whether 1080p, 720p, or cropped - 148.5MPix/s. Certainly that is
the result needed for vblank and hblank controls to work correctly in
computing frame rate. The datasheet again contains fixed register
settings for 25, 30, 50, 60, 100, and 120fps by changing HMAX
(register 0x301c/d), but they are all just linearly scaled values of
each other, so it maps cleanly onto V4L2_CID_HBLANK. VMAX is fixed for
1080p and 720p modes, so maps to V4L2_CID_VBLANK.

The MIPI PHY then runs at a link frequency sufficient to convey the
desired pixels:
- 3564 Mbit/s across 4 lanes for 1080p100/120 10bpp
- 1782 Mbit/s split across 2 or 4 lanes for 1080p or window cropped
modes up to 60fps, 10 or 12bpp.
- 1188 Mbit/s split across 2 or 4 lanes for 720p up to 60fps, 10 or 12bpp
This is controlled predominantly by INCKSEL1 & 2 (registers 0x305c/d).
I verified the actual link frequencies used on a scope, and they are
as described.
1782Mbit/s is sufficient for 1920x1080@60fps 12bpp. Cropping or 10bpp
just increases the per line blanking period on the CSI2 interface.

AFAICT you could just always run at the 1782 Mbit/s rate with slightly
increased idle time on the CSI2 bus for the 720p mode, but that isn't
the way Sony have specified it.

There is a further register to halve the link frequency again for max
25/30fps modes (0x3405), although doing so has limited benefit (it'd
increase rolling shutter effects as it would increase the temporal
difference between each line).

I hope that makes things a little clearer. Indeed the current driver
is slightly wrong, but only in relation to pixel rate, not link
frequency.

  Dave

[1] https://github.com/raspberrypi/linux/commits/rpi-5.10.y/drivers/media/i=
2c/imx290.c

> Best regards
> Alexander
> --
> i.A. Alexander Stein
> Entwicklung Standort Chemnitz
> Tel. +49 371 433151-0, Fax +49 371 433151-22
> Zwickauer Stra=C3=9Fe 173, 09116 Chemnitz
> mailto: Alexander.Stein@tq-group.com
>
> TQ-Systems GmbH
> M=C3=BChlstra=C3=9Fe 2, Gut Delling, 82229 Seefeld
> Amtsgericht M=C3=BCnchen, HRB 105018
> Sitz der Gesellschaft: Seefeld
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> www.tq-group.com
