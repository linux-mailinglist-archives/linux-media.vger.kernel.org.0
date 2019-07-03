Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 303275DDA0
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 06:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfGCE6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 00:58:54 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:39783 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfGCE6y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 00:58:54 -0400
Received: by mail-ed1-f47.google.com with SMTP id m10so695442edv.6
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2019 21:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uf5aCU6aY5t/9fyL90O/cqUCzIfpNsCzgBmR7PWCe0Y=;
        b=kJASSwao08QQ12P0yrheKoob6wHDYCL0MeriSYWmYAymiP4LABpOrMNoNyF/wCA3kr
         uYFEqJKV4aZsU7s8nJUFIWjf5HHdnAlnZ3xEyNpTUvFXTHaVcbC79gezsNkfl80hnR/g
         fu07wEe13+Ad9Xzpx+1j3p/HXJlP2X2+GVKE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uf5aCU6aY5t/9fyL90O/cqUCzIfpNsCzgBmR7PWCe0Y=;
        b=Uwr80w8oBmQxqSleZmaYUKFwZWELGhcMGvh/rwU875MqOSoNwHTn1omg60Yl0+ZDug
         Ob93Rbe10RnPwH4JeccL+sY3Lb9z3AzSjxH7E7eEncRK/xvQ0bZOohnI6BVqrACgtFBq
         bhgXX4WHKkcIpbMyix1LxS2idbrfV6Ie1duZwEwSQXq59+g/KmRVNkR9Upfyq8jN8BfD
         unC45rWXT4ODFEc8RReuEvMkmy879JN6t0O7sKOrphYozHMDpgxWVs8w74aNEE2hQzi4
         JtPtltA8fBDHBFOfw7prIWb+F+yLlZz8YbQz2hlU06hunPqqjMkh6RqcrWC14sZMeY11
         vPeQ==
X-Gm-Message-State: APjAAAWyrazFfcV5+xTG1Irt+LbCaWvsmBxAsUst8aicJFS0n93wKyNF
        ytP3ZoUHkSNxjkc2j6SYZtYvvJVGmLupKw==
X-Google-Smtp-Source: APXvYqys36X7QpTduJZ0fXzmEcgS6G1rpcKnBCS23NVTiRZj/ZiBGpXXUs6TH6DzWA/tSCuQkPzq8Q==
X-Received: by 2002:a17:906:9416:: with SMTP id q22mr32065569ejx.153.1562129932312;
        Tue, 02 Jul 2019 21:58:52 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id e12sm327618edb.72.2019.07.02.21.58.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 21:58:50 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id p13so1062605wru.10
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2019 21:58:50 -0700 (PDT)
X-Received: by 2002:a05:6000:1150:: with SMTP id d16mr2514295wrx.48.1562129929689;
 Tue, 02 Jul 2019 21:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl> <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190603112835.19661-2-hverkuil-cisco@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 3 Jul 2019 13:58:38 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Aa-PQEakeg3sC_EDYdKy15hHx09Qmk6Jik4COeBe3xVA@mail.gmail.com>
Message-ID: <CAAFQd5Aa-PQEakeg3sC_EDYdKy15hHx09Qmk6Jik4COeBe3xVA@mail.gmail.com>
Subject: Re: [PATCHv4 1/2] media: docs-rst: Document memory-to-memory video
 decoder interface
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Jun 3, 2019 at 8:28 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrot=
e:
>
> From: Tomasz Figa <tfiga@chromium.org>
>
> Due to complexity of the video decoding process, the V4L2 drivers of
> stateful decoder hardware require specific sequences of V4L2 API calls
> to be followed. These include capability enumeration, initialization,
> decoding, seek, pause, dynamic resolution change, drain and end of
> stream.
>
> Specifics of the above have been discussed during Media Workshops at
> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API that
> originated at those events was later implemented by the drivers we alread=
y
> have merged in mainline, such as s5p-mfc or coda.
>
> The only thing missing was the real specification included as a part of
> Linux Media documentation. Fix it now and document the decoder part of
> the Codec API.
>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++++
>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    8 +-
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |    5 +
>  Documentation/media/uapi/v4l/v4l2.rst         |   10 +-
>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
>  5 files changed, 1132 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
>

Thanks a lot for helping with remaining changes.

Just one thing inline our team member found recently.

[snip]
> +Capture setup
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
[snip]
> +4.  **Optional.** Set the ``CAPTURE`` format via :c:func:`VIDIOC_S_FMT` =
on the
> +    ``CAPTURE`` queue. The client may choose a different format than
> +    selected/suggested by the decoder in :c:func:`VIDIOC_G_FMT`.
> +
> +    * **Required fields:**
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +      ``pixelformat``
> +          a raw pixel format.

The client should be able to set the width and height as well. It's a
quite frequent case, especially in DMA-buf import mode, that the
buffers are actually bigger (e.g. more alignment) than what we could
get from the decoder by default. For sane hardware platforms it's
reasonable to expect that such bigger buffers could be handled as
well, as long as we update the width and height here.

It's more like a clarification anyway, so if you think it would be
better to just merge the current revision, I could send a follow up
patch.

Regardless of that and FWIW:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
