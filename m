Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261F52E7BF4
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 19:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgL3Sqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 13:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgL3Sqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 13:46:34 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F280C061799
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 10:45:53 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s26so39493986lfc.8
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 10:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QeENytF3F7ahVCLpGopKzQFJvc07A4bGjJONLwUaPDc=;
        b=locakoSPmrgMQW2aLxQyQNPW9PwuYvqTaoZqJb8mbCCsxWuYlpaEhfq1QWxtTNyUXU
         cV1pHm92cHSnlSQafgxeACLEGUDe8m4ujjyPQ0P1NFlNkMgGZPwDWzFQD3GFZQiXPR2b
         wMi1IIU37Cr/AEVK5LiE1wuZDfnWBjHjDOSw+fXBQe61ty0VpSy3l+vH5Y2RjH9I8fQM
         OdFUZfbMXd0ceaUTH1G5/fnaU9qhlaPYwOwZj8C1bmMI8WOS/EBfrPmpXrADW20IKnaf
         jJFweeF44LoppYkisbE32vGX2rsm2O4ZzwUzMN+EXM5VB7cczz/+fNhgXWShNP7xbslz
         nTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QeENytF3F7ahVCLpGopKzQFJvc07A4bGjJONLwUaPDc=;
        b=LozvDAPE/i3ACD9gId5egryGjVzOpJHtuemMzFO4MuTF2crlI9WsfK8h8ye2yoeC3s
         tcixSQxIoz4wn2ed5H6VWj5H71Z0BarjQFt53bdKNnx1Vs/3JZHrlU2z3/FwIc4nXjp6
         p5PXV1mdvDlDhN+xpjqKbvFf4DOWvmqcOuzlMPzDGgr7wPjIAC+66AVdqhiLKhTBsZYs
         W/MgdnA/sfTqmiKP00JwTzq4rDmdMaeAGnq54JmUhia6jTT89LOVQ9RqMSeu++KStzSf
         qscdI9EeP4/hqJnsDJfGb7T6jHQ9jxB1HE34iTcBRVqvhI0t0atd8tkUvYxGlAWpX1mb
         ZB4g==
X-Gm-Message-State: AOAM533MeBnqjYD74EQQJO9gFGieX0Y6aO6DHfAoN3MDUg7Zz8WbYFYR
        H7B96zoxo16gdPSkZQfvYUlLCZhzKGCTm8nJcvs=
X-Google-Smtp-Source: ABdhPJyBa5wz8bDeLukAxi+86kMAUPIw7jIUbCWI72Sq9uYwqnHMps0RirZdyw0sA4lZUDhru+jVTL8pfIpuaGM/ass=
X-Received: by 2002:a19:4856:: with SMTP id v83mr22524045lfa.583.1609353951993;
 Wed, 30 Dec 2020 10:45:51 -0800 (PST)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 30 Dec 2020 15:45:40 -0300
Message-ID: <CAOMZO5D2bEc+g=OVs_cQjcFkurzk6Hj8pZP3F9U8Kdqc4_FP0A@mail.gmail.com>
Subject: Using kmssink with mxsfb-drm
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Gary Bisson <bisson.gary@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am trying to run a simple videotestsrc pipeline on a imx6ull-evk
board running kernel 5.10 and Gstreamer 1.18.2, but it fails as shown
below.

Any ideas?

Thanks,

Fabio Estevam

# modetest -M mxsfb-drm
Encoders:
id      crtc    type    possible crtcs  possible clones
34      33      none    0x00000001      0x00000000

Connectors:
id      encoder status          name            size (mm)       modes   encoders
31      34      connected       unknown-1       95x54           1       34
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  #0 480x272 59.94 480 482 523 525 272 274 284 286 9000 flags: nhsync,
nvsync; type: preferred, driver
  props:
        1 EDID:
                flags: immutable blob
                blobs:

                value:
        2 DPMS:
                flags: enum
                enums: On=0 Standby=1 Suspend=2 Off=3
                value: 0
        5 link-status:
                flags: enum
                enums: Good=0 Bad=1
                value: 0
        6 non-desktop:
                flags: immutable range
                values: 0 1
                value: 0
        4 TILE:
                flags: immutable blob
                blobs:

                value:

CRTCs:
id      fb      pos     size
33      35      (0,0)   (480x272)
  #0 480x272 59.94 480 482 523 525 272 274 284 286 9000 flags: nhsync,
nvsync; type: preferred, driver
  props:
        24 VRR_ENABLED:
                flags: range
                values: 0 1
                value: 0

Planes:
id      crtc    fb      CRTC x,y        x,y     gamma size      possible crtcs
32      33      35      0,0             0,0     0               0x00000001
  formats: XR24 RG16
  props:
        8 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 1

Frame buffers:
id      size    pitch

# gst-launch-1.0 videotestsrc ! kmssink connector-id=31 name=mxsfb-drm
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
ERROR: from element /GstPipeline:pipeline0/GstKMSSink:mxsfb-drm:
GStreamer encountered a general resource error.
Additional debug info:
../sys/kms/gstkmssink.c(1711): gst_kms_sink_show_frame ():
/GstPipeline:pipeline0/GstKMSSink:mxsfb-drm:
drmModeSetPlane failed: Invalid argument (22)
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
