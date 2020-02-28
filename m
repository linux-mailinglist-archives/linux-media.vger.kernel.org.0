Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D28AC173FA1
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 19:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgB1Sc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 13:32:57 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:43203 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgB1Sc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 13:32:57 -0500
Received: by mail-oi1-f180.google.com with SMTP id p125so3758703oif.10
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 10:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=1QVABSZmDRrvX1etxRV5HByt0VtblRiV24w+rwCYQuc=;
        b=eDu6EsAevUw/yjA91jmqdqypHw+gfgrJ2xxnb+gXrphxqkLAtCz0emDh4AoTSyieV6
         E0VJN7S74cwsSL6kecoGB7laAdgsTDyK9M7RSlJt73Psj6AWsJF+08IegEGXteMx3J9Q
         WZ89uMCFTLVyoovhFjL8qEsT6hgKVcyyOsrJ40O2y4aPrJLxOM08/lF+i0I5Uy5l8bCE
         d4W1pdzh9GapHmbY7xSkFGajlvFnwsel0Op5Vf7WzzWmVHH6Cnr1UkoUODdPKoiVQE+R
         oZX74q2g3YBzAoACtreBWqwHIEO18eTnGKi2vw3OZnvbS66Sff+Zia8FNtXmSz20Dr4S
         sHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1QVABSZmDRrvX1etxRV5HByt0VtblRiV24w+rwCYQuc=;
        b=N0daa7J7+jyay0A6MGMPukw8Qc6K3rLb5uzELllhVe8xrxHuOTxTR58nMu/bLNNY1J
         ttN5ilcqAQJWkiNF9Km+4pb8hjH8UUdyk66rMX02hqDrt9S4YG+UctmQBLRJHx3xYWza
         oTusFRbESyTud3QVpT9snwkb3BNqHhN5JENtY5lEjIEvtFryBC3A+LcjU8GczPBNFH7B
         mPICNwZ9nVpOowyMBIUgcxswdEKqmZSmmQkomp6FOGLz7OXSTeZi83jH6wxkQIWOsVVw
         2e6LZpTo/AtC1FUXmjalkGpB9BPx1rAaje0kQLM07vioi0dLjm6+KqtAopeSu7/S+NtE
         65kg==
X-Gm-Message-State: APjAAAXhEUG5O3Bv/0e+p/FKutMFeOU5YL7jq3Ln1daL3gFiRLkD4+Aq
        Yqth4ktUdU0DOv58vR2zM9ex/TTANmCw3ZDI8xuuFhifUFI=
X-Google-Smtp-Source: APXvYqw/De2JqDMSQm2LgJ/Dz6rf1HV8w+zdJ0N23viZvSYxQ1lokbvVUQZ5rzOn0xpzxypKBPGGyLzNn/x4tw6MTv8=
X-Received: by 2002:aca:3194:: with SMTP id x142mr2857253oix.172.1582914774882;
 Fri, 28 Feb 2020 10:32:54 -0800 (PST)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 28 Feb 2020 10:32:43 -0800
Message-ID: <CAJ+vNU3DWQX5ud7yreVG3E-Ky6M_NE5nbrwjAJ0x-1xxz4A92A@mail.gmail.com>
Subject: imx-media colorimetry
To:     linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

I'm running into a colorimetry issue when trying to h264 encode video
from adv7180 on an imx6q. I'm using the following setup on a Gateworks
GW5404 which last worked on a 4.20 kernel with a bunch of backports.

setup script:
# imx6q-gw54xx adv7180 IPU2_CSI1 MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
# imx6q-gw54xx IPU2_CSI1 adv7180 UYVY8_2X8 240i@29.9Hz YUV
MODE3:sensor->mux->csi->vdic->ic_prp->ic_prpvf
# reset all links
media-ctl --reset
# setup links
media-ctl -l "'adv7180 2-0020':0 -> 'ipu2_csi1_mux':1[1]"
media-ctl -l "'ipu2_csi1_mux':2 -> 'ipu2_csi1':0[1]"
media-ctl -l "'ipu2_csi1':1 -> 'ipu2_vdic':0[1]"
media-ctl -l "'ipu2_vdic':2 -> 'ipu2_ic_prp':0[1]"
media-ctl -l "'ipu2_ic_prp':2 -> 'ipu2_ic_prpvf':0[1]"
media-ctl -l "'ipu2_ic_prpvf':1 -> 'ipu2_ic_prpvf capture':0[1]"
# configure pads
media-ctl --set-v4l2 "'adv7180 2-0020':0 [fmt:UYVY2X8/720x240 field:alternate]"
media-ctl --set-v4l2 "'ipu2_csi1_mux':2 [fmt:UYVY2X8/720x240]"
media-ctl --set-v4l2 "'ipu2_csi1':0 [fmt:UYVY8_2X8/720x240@1001/30000
field:alternate colorspace:rec709 ycbcr:709]"
media-ctl --set-v4l2 "'ipu2_csi1':1 [fmt:AYUV32/720x480]"
media-ctl --set-v4l2 "'ipu2_vdic':2 [fmt:AYUV32/720x480 field:none]"
media-ctl --set-v4l2 "'ipu2_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
media-ctl --set-v4l2 "'ipu2_ic_prpvf':1 [fmt:AYUV32/720x480]"

device details:
~# media-ctl -e "ipu2_ic_prpvf capture"
/dev/video6

~# for i in $(ls -d /sys/class/video4linux/video*); do echo $i:$(cat
$i/name); done
/sys/class/video4linux/video0:ipu1_csi0 capture
/sys/class/video4linux/video1:ipu1_ic_prpenc capture
/sys/class/video4linux/video10:coda-decoder
/sys/class/video4linux/video2:ipu1_ic_prpvf capture
/sys/class/video4linux/video3:ipu1_csi1 capture
/sys/class/video4linux/video4:ipu2_csi0 capture
/sys/class/video4linux/video5:ipu2_ic_prpenc capture
/sys/class/video4linux/video6:ipu2_ic_prpvf capture
/sys/class/video4linux/video7:ipu2_csi1 capture
/sys/class/video4linux/video8:ipu_ic_pp csc/scaler
/sys/class/video4linux/video9:coda-encoder

gstreamer:
~# gst-launch-1.0 --version
gst-launch-1.0 version 1.16.2
GStreamer 1.16.2
Unknown package origin
~# gst-inspect-1.0 | grep -e "v4l2.*convert*"
video4linux2:  v4l2convert: V4L2 Video Converter

# gst-launch-1.0 v4l2src device=/dev/video6 ! v4l2convert
output-io-mode=dmabuf-import ! v4l2h264enc
output-io-mode=dmabuf-import ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
'/dev/video6' does not support 2:0:0:0 colorimetry
Additional debug info:
../sys/v4l2/gstv4l2object.c(3845): gst_v4l2_object_set_format_full ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Device wants 2:4:5:1 colorimetry
Execution ended after 0:00:00.009831000
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...

Any ideas?

Best Regards,

Tim
