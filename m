Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EB042E0B6
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 20:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbhJNSEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 14:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233806AbhJNSEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 14:04:39 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B05C061570
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 11:02:34 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id f126so3908656vke.3
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=0ANYTNQhZMJbRyqT02UIptyxj8deRUN1Eun1dCV2kiM=;
        b=IXDjIh/VhbTJF5HhcBpoz9S8Qjc9SdSni4sHT8E/8YrgCH7UDYTLaMkkc4AIi+nh6d
         xYpL4d06dvfCbawMqI0i0cFU83I+8H3af3lTkjaPmyF1BuoSCNLGYWLkM7xHjuffvqIz
         vNzaNT+iTEj2Si5k5jQHnOERxCMh+SZruGhcKd94qGoOME4crbl1gYvnQJFwMBxGR9d6
         dtsp5WHG9Usk92WStbblaVMpcsMLKxgm5GTex88RNiQqWvB51PVKodgoQhry+FEku2t1
         XDcOPFkysEiwMhyroiWmBpxSz6rpTLnjnXQZ1zWOKtUFVWKMVmTQB3ycf2ZqX00wIsDD
         wrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=0ANYTNQhZMJbRyqT02UIptyxj8deRUN1Eun1dCV2kiM=;
        b=OZG0vvd9v8wlh85mPJOCKgaiAw1iRKM7JIkhXEABEpkiLQEDjgGLib46tUoiByR2jB
         cPKL1GnPTR5KxTIHjV1gfQOCcykB+LqFp8bQdTxKHwT6MQLy0b/29t+QR3vpsfn9FIhE
         TOd1BzFiNA4kI4fgL85A8uMfxNaTsFsDmvfbz0KLPzZ+fdZlB4vPOdRIVLl1ADx1UFIN
         vloqv4jpgTn8Ox/gh9Xu75DWC5lemezE8ZJeL2h3ruJNePIL+J82ieRdWqkzU4jQdQXJ
         c08rJTY8k6PgGU6y3zMn+VcloeHhWcSMTAwoQaWnGVMlj+mlJR4ssvx1kILVhPLW7HZi
         GdSQ==
X-Gm-Message-State: AOAM531FMsu3ohWuGv38TL7ThIDNbZ2s11lvHuZWaNf1KU0kePDw6MeG
        v1ksXyCxL/DTKliZYW6H4mF+c0aZk/GetM3pUF8PAZLwHUg=
X-Google-Smtp-Source: ABdhPJwy/2jlHWQnM9siZaX6mYa+fVsewMeUNWzwHul9Ba1u02ODp5dh0kZCvPuoPzvFh6Z3RLvOJOMwIQi8nmiIZcU=
X-Received: by 2002:a05:6122:8d6:: with SMTP id 22mr7723273vkg.21.1634234553890;
 Thu, 14 Oct 2021 11:02:33 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 14 Oct 2021 15:02:23 -0300
Message-ID: <CAOMZO5D85o8QC6QnaGm7d4J1SzdCtU01KQ6Q5U9WppRGgS4vtw@mail.gmail.com>
Subject: Linking v4l2convert to kmssink
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Gary Bisson <gary.bisson@boundarydevices.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The following pipeline works correctly on a imx6ull-evk:

gst-launch-1.0 -v videotestsrc ! video/x-raw,format=3DBGRx,width=3D320,heig=
ht=3D240 \
! v4l2convert ! video/x-raw,format=3DBGRx,width=3D160,height=3D120 ! fbdevs=
ink

Now I would like to use kmssink instead of fbdevsink:

export GST_DEBUG=3D"kmssink:7"
gst-launch-1.0 -v videotestsrc ! video/x-raw,format=3DBGRx,width=3D320,heig=
ht=3D240 \
! v4l2convert ! video/x-raw,format=3DBGRx,width=3D160,height=3D120 ! kmssin=
k
can-scale=3Dfalse

Setting pipeline to PAUSED ...
0:00:00.940630791   249  0x1e394c0 INFO                 kmssink
gstkmssink.c:364:log_drm_version:<kmssink0> DRM v1.0.0 [mxsfb-drm =EF=BF=BD=
=E2=80=94
MXSFB Controller DRM =EF=BF=BD=E2=80=94 20160824]
0:00:00.946571791   249  0x1e394c0 INFO                 kmssink
gstkmssink.c:409:get_drm_caps:<kmssink0> prime import (=EF=BF=BD=E2=9C=93) =
/ prime
export (=EF=BF=BD=E2=9C=93) / async page flip (=EF=BF=BD=E2=9C=97)
0:00:00.951843708   249  0x1e394c0 INFO                 kmssink
gstkmssink.c:542:ensure_allowed_caps:<kmssink0> ignoring format RG16
0:00:00.956671416   249  0x1e394c0 DEBUG                kmssink
gstkmssink.c:579:ensure_allowed_caps:<kmssink0> allowed caps =3D
video/x-raw, format=3D(string)BGRx, width=3D(int)[ 120, 65535 ],
height=3D(int)[ 1
20, 65535 ], framerate=3D(fraction)[ 0/1, 2147483647/1 ]
0:00:00.960598125   249  0x1e394c0 INFO                 kmssink
gstkmssink.c:789:gst_kms_sink_start:<kmssink0> connector id =3D 35 /
crtc id =3D 33 / plane id =3D 31
0:00:00.965056000   249  0x1e394c0 INFO                 kmssink
gstkmssink.c:811:gst_kms_sink_start:<kmssink0> display size: pixels =3D
480x272 / millimeters =3D 95x54
Pipeline is PREROLLING ...
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width =3D 480
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height =3D 272
0:00:01.011140500   249  0x1e3d838 DEBUG
/GstPipeline:pipeline0/GstVideoTestSrc:videotestsrc0.GstPad:src: caps
=3D video/x-raw, format=3D(string)BGRx, width=3D(int)320, height=3D(int)240=
,
framerat
e=3D(fraction)30/1, multiview-mode=3D(string)mono,
interlace-mode=3D(string)progressive, colorimetry=3D(string)1:1:5:1,
pixel-aspect-ratio=3D(fraction)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =3D
video/x-raw, format=3D(string)BGRx, width=3D(int)320, height=3D(int)240,
framerate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mod
e=3D(string)progressive, colorimetry=3D(string)1:1:5:1,
pixel-aspect-ratio=3D(fraction)1/1
kmssink gstkmssink.c:1015:gst_kms_sink_get_caps:<kmssink0> Proposing
caps video/x-raw, format=3D(string)BGRx, width=3D(int)480,
height=3D(int)272, framerate=3D(fraction)[ 0/1, 2147483647/1 ],
pixel-aspect-ratio=3D
(fraction)1/1; video/x-raw, format=3D(string)BGRx, width=3D(int)[ 120,
65535 ], height=3D(int)[ 120, 65535 ], framerate=3D(fraction)[ 0/1,
2147483647/1 ], pixel-aspect-ratio=3D(fraction)1/1
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:src: caps =3D
video/x-raw, framerate=3D(fraction)30/1, multiview-mode=3D(string)mono,
interlace-mode=3D(string)progressive, format=3D(string)BGRx, width=3D(int)
160, height=3D(int)120, pixel-aspect-ratio=3D(fraction)1/1
0:00:01.026995416   249  0x1e3d838 DEBUG                kmssink
gstkmssink.c:1015:gst_kms_sink_get_caps:<kmssink0> Proposing caps
video/x-raw, format=3D(string)BGRx, width=3D(int)480, height=3D(int)272,
framer
ate=3D(fraction)[ 0/1, 2147483647/1 ], pixel-aspect-ratio=3D(fraction)1/1;
video/x-raw, format=3D(string)BGRx, width=3D(int)[ 120, 65535 ],
height=3D(int)[ 120, 65535 ], framerate=3D(fraction)[ 0/1, 2147483647/1 ],
pixel-aspect-ratio=3D(fraction)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter1.GstPad:src: caps =3D
video/x-raw, framerate=3D(fraction)30/1, multiview-mode=3D(string)mono,
interlace-mode=3D(string)progressive, format=3D(string)BGRx, width=3D(int
)160, height=3D(int)120, pixel-aspect-ratio=3D(fraction)1/1
0:00:01.034106458   249  0x1e3d838 DEBUG                kmssink
gstkmssink.c:1015:gst_kms_sink_get_caps:<kmssink0> Proposing caps
video/x-raw, format=3D(string)BGRx, width=3D(int)480, height=3D(int)272,
framer
ate=3D(fraction)[ 0/1, 2147483647/1 ], pixel-aspect-ratio=3D(fraction)1/1;
video/x-raw, format=3D(string)BGRx, width=3D(int)[ 120, 65535 ],
height=3D(int)[ 120, 65535 ], framerate=3D(fraction)[ 0/1, 2147483647/1 ],
pixel-aspect-ratio=3D(fraction)1/1
0:00:01.038949625   249  0x1e3d838 DEBUG                kmssink
gstkmssink.c:1117:gst_kms_sink_calculate_display_ratio:<kmssink0>
scaling to 160x120
0:00:01.043342583   249  0x1e3d838 DEBUG                kmssink
gstkmssink.c:1158:gst_kms_sink_set_caps:<kmssink0> negotiated caps =3D
video/x-raw, framerate=3D(fraction)30/1, multiview-mode=3D(string)mono, in
terlace-mode=3D(string)progressive, format=3D(string)BGRx, width=3D(int)160=
,
height=3D(int)120, pixel-aspect-ratio=3D(fraction)1/1
/GstPipeline:pipeline0/GstKMSSink:kmssink0.GstPad:sink: caps =3D
video/x-raw, framerate=3D(fraction)30/1, multiview-mode=3D(string)mono,
interlace-mode=3D(string)progressive, format=3D(string)BGRx,
width=3D(int)160,
 height=3D(int)120, pixel-aspect-ratio=3D(fraction)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter1.GstPad:sink: caps =3D
video/x-raw, framerate=3D(fraction)30/1, multiview-mode=3D(string)mono,
interlace-mode=3D(string)progressive, format=3D(string)BGRx, width=3D(in
t)160, height=3D(int)120, pixel-aspect-ratio=3D(fraction)1/1
0:00:01.052128833   249  0x1e3d838 DEBUG                kmssink
gstkmssink.c:1204:gst_kms_sink_propose_allocation:<kmssink0> propose
allocation
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:sink: caps =3D
video/x-raw, format=3D(string)BGRx, width=3D(int)320, height=3D(int)240,
framerate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mod
e=3D(string)progressive, colorimetry=3D(string)1:1:5:1,
pixel-aspect-ratio=3D(fraction)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =3D
video/x-raw, format=3D(string)BGRx, width=3D(int)320, height=3D(int)240,
framerate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mo
de=3D(string)progressive, colorimetry=3D(string)1:1:5:1,
pixel-aspect-ratio=3D(fraction)1/1
0:00:01.082080458   249  0x1e3d838 TRACE                kmssink
gstkmssink.c:1357:gst_kms_sink_import_dmabuf:<kmssink0> Found a dmabuf
with 1 planes and 1 memories
0:00:01.679061083   249  0x1e3d838 LOG                  kmssink
gstkmssink.c:1408:gst_kms_sink_import_dmabuf:<kmssink0> found these
prime ids: 22, 0, 0, 0
0:00:01.687960166   249  0x1e3d838 LOG                  kmssink
gstkmssink.c:1416:gst_kms_sink_import_dmabuf:<kmssink0> setting KMS
mem 0x1e65178 to DMABuf mem 0x1e64f28 with fb id =3D 38
0:00:01.692443458   249  0x1e3d838 TRACE                kmssink
gstkmssink.c:1602:gst_kms_sink_show_frame:<kmssink0> displaying fb 38
0:00:01.697410416   249  0x1e3d838 TRACE                kmssink
gstkmssink.c:1659:gst_kms_sink_show_frame:<kmssink0> drmModeSetPlane
at (160,76) 160x120 sourcing at (0,0) 160x120
0:00:01.701847291   249  0x1e3d838 DEBUG                kmssink
gstkmssink.c:1707:gst_kms_sink_show_frame:<kmssink0> result =3D { 160,
76, 160, 120} / src =3D { 0, 0, 160 120 } / dst =3D { 0, 0, 480 272 }
0:00:01.706981083   249  0x1e3d838 WARN                 kmssink
gstkmssink.c:1711:gst_kms_sink_show_frame:<kmssink0> error:
drmModeSetPlane failed: Resource temporarily unavailable (11)
ERROR: from element /GstPipeline:pipeline0/GstKMSSink:kmssink0:
GStreamer encountered a general resource error.
Additional debug info:
../sys/kms/gstkmssink.c(1711): gst_kms_sink_show_frame ():
/GstPipeline:pipeline0/GstKMSSink:kmssink0:
drmModeSetPlane failed: Resource temporarily unavailable (11)
ERROR: pipeline doesn't want to preroll.
Setting pipeline to NULL ...
ERROR: from element
/GstPipeline:pipeline0/GstVideoTestSrc:videotestsrc0: Internal data
stream error.
Additional debug info:
../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstVideoTestSrc:videotestsrc0:
streaming stopped, reason error (-5)
ERROR: pipeline doesn't want to preroll.
Freeing pipeline ...
#

Does anyone know what needs to be changed in the PXP or mxfdb driver
to allow the
Gstreamer pipeline to work with kmssink?

Thanks,

Fabio Estevam
