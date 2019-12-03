Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C43A10FA93
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 10:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfLCJSP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 04:18:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:41048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbfLCJSP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 04:18:15 -0500
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0553206E0;
        Tue,  3 Dec 2019 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575364694;
        bh=HbSHcV5BJo+8R8xmjwxSvwHVTJEBb+W1qSt8gJw5qPU=;
        h=From:Date:Subject:To:Cc:From;
        b=dk0Fg08C4EVDTP+pLzY0yrupf1Jjk8XJPuJ4QdmriGV8AiWraQqXsnz8QmNAk877k
         sfqNaM5+kBwZDLbdF6JoHEmuuOESSqedZDdheKHPDzJl9Mks5zXk1x3/xzYCLcxBiD
         OM9hmpxX2wcYoJX9qXZ5Z5ICNtkMcgZJHEFSUrzw=
Received: by mail-wm1-f54.google.com with SMTP id p17so2599939wma.1;
        Tue, 03 Dec 2019 01:18:13 -0800 (PST)
X-Gm-Message-State: APjAAAXRYf7aoqdCKTjv2xRWS8qYUHrciBUMRwYOlfAevA9sr4xIZvdY
        H2+S3Tp/kw3EX7ZQWYI9jro0OuXvQ9BS+CiQoiU=
X-Google-Smtp-Source: APXvYqwi6BrYe0Q9/wGK25IymqSmUDgapH0cTTtuFjVya6iYOXV+W89jAU+pgiBj+LmCicozQ73AlAtJM786Zi3Zw24=
X-Received: by 2002:a7b:c216:: with SMTP id x22mr32913819wmi.51.1575364692336;
 Tue, 03 Dec 2019 01:18:12 -0800 (PST)
MIME-Version: 1.0
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Tue, 3 Dec 2019 17:17:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v66k7+KMgVPYy0i9CF9VyNnNQEMP0y0AyCrrLX7PBKN+Jw@mail.gmail.com>
Message-ID: <CAGb2v66k7+KMgVPYy0i9CF9VyNnNQEMP0y0AyCrrLX7PBKN+Jw@mail.gmail.com>
Subject: Parallel Camera Interface Timings, Signal Definitions and Polarity?
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Recently, Ond=C5=99ej posted a patch fixing the polarity of VSYNC/HSYNC
signals in the sun6i-csi driver [1].

Allwinner documents use the terms VSYNC and HSYNC in their camera
sensor interface hardware description, but based on the timing diagrams
included, they actually mean VREF (or inverted VSYNC) and HREF instead:
the polarity is reversed, and HSYNC is active only when valid data is
being sent over the parallel bus.

Based on my limited experience, it seems camera sensors mostly use VSYNC
and HREF, where VSYNC is defined to be a pulse that is sent after a full
frame or field has been transmitted, and HREF is a level signal which is
active when there is valid data during a horizontal line.

I'm guessing we (sunxi / Allwinner) are not the only platform to get it
wrong. Is there a concrete definition of what VSYNC and HSYNC mean, and
what active high vs active low correspond to?

For SYNC signals, I would assume the pulse portion is the active part,
so a signal such as the following would be considered active low.

    ________      ____________
            |    |
            |    |
            |____|  <- active low SYNC pulse


Also, if HSYNC is used instead of HREF, there doesn't seem to be a way
to specify how long the horizontal back porch is, i.e. how many clock
cycles should the hardware skip before capturing data. Same goes for
VSYNC instead of VREF.

Does the hardware work because we got lucky that sensors use HREF,
which means no horizontal back porch when HREF is considered an inverted
HSYNC, and no vertical back porch because HREF is only asserted starting
with the first valid line, instead of having preceding blanking lines?

The device tree bindings only have hsync-active and vsync-active. VREF
and HREF are only mentioned in passing in the header file [2], without
describing the differences or how to specify which type of signal is
used. I believe this deserves some clarification and improvement. This
would help authors of new hardware drivers immensely.

Any thoughts or comments on the matter?


Regards
ChenYu

[1] https://lkml.org/lkml/2019/11/27/1816
[2] https://elixir.bootlin.com/linux/latest/source/include/media/v4l2-media=
bus.h#L27
