Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534BC386BCE
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 22:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbhEQU7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 16:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbhEQU7u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 16:59:50 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB57C061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 13:58:33 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id p20so8909422ljj.8
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 13:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Vy+4NbQtUcpytx5J/kSjiKXaDNowTxqlFYU7k+cUrEY=;
        b=hljkE2a1N3BG3F2NjjIRAkllmCTKgAqEy6mCu/pcKBx9hIE3tGnw+DP/v8gD1sBtyN
         BWv7UMDDO8tIIqtIchVdDg37C62inVX5nPr+GTV95BWIhDURhLMzlYdLXiA8UnY/KC7E
         EGpcQchBj+4Qj8Z84mNc0twK01KkN+aF7HN88RVM3Ju2oHakVrLQnl0OU54GxRGMWFpP
         4WvuYHf9LrNxMbPFd1AIvWWbNKxnvoSC7ORt+DX4HagFDdVAmJUPUVs9Hsbm+ey143yh
         /klfduHwuJmJYZvWmXtt69uBA1fe6lKZQfN+D63vhRoFj6hmqsNiwC5uNmhd5WWIkIDW
         qUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Vy+4NbQtUcpytx5J/kSjiKXaDNowTxqlFYU7k+cUrEY=;
        b=CyHQK3RhSM9LBq76tIvKFaSuAVe8dJTeiX9hiyKIn55rqzUWar/8a303oZlJ7SkOTx
         kIfShs8ABKcX6UJoJ7Fjf7s16tdI5oUewxJue5WCwdreQrvRYrc44FJaZGp68qn18WZ9
         7ORsYJXuq0gOcsduC3Aiejes43kBAXJlTUZgWouY+Cz0viwh/YaPSn/MWzUnis/nwO7e
         WT31dzTeb7gsPgJPYsiKWOlR0BMsDoPonVGD+bsBNJ+mbPt1ShyQG/qs0JXa7Xxfo+eA
         gTp6ntc8oCpxzEura42Qc2RJvHrPv8jbPtJg/dUV+AM1KjnCW5D/v9wy7Jgdcvzv5cHs
         Bp2Q==
X-Gm-Message-State: AOAM530JaTYQhXdrVruebqVrou2zxXUq7LztTZjQUuGmO1jB+2Ky1ncq
        UlbFyKn7+m3cSHb2PcvbzHBiqUwQfGc06lesd0o=
X-Google-Smtp-Source: ABdhPJw4bv/5pTzB8ouRxs7nVyvwBSbE90frgPlK7XzBaHUf6zwPfYXnv0W3hqjrUB6+nqS/RviB24fB8YZiT3NCUdI=
X-Received: by 2002:a2e:2c01:: with SMTP id s1mr1006309ljs.17.1621285111500;
 Mon, 17 May 2021 13:58:31 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 17 May 2021 17:58:19 -0300
Message-ID: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
Subject: Unable to capture adv7280-m on i.MX6Q
To:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am trying to capture from an adv7280-m (via MIPI-CSI2 interface) on
an imx6q board.

Here is the configuration:

media-ctl -e "adv7180 2-0020"
/dev/v4l-subdev13

media-ctl -e "ipu1_ic_prpvf capture"
/dev/video2

v4l2-ctl --device /dev/v4l-subdev13 --set-standard PAL
media-ctl -l "'adv7180 2-0020':0 -> 'imx6-mipi-csi2':0[1]"
media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':1 -> 'ipu1_vdic':0[1]";
media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
media-ctl -V "'adv7180 2-0020':0 [fmt:UYVY2X8/720x480 field:seq-tb]"
media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY2X8/720x480]"
media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/800x480]";
media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/800x480 field:none]"
media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/800x480 field:none]"
media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/800x480 field:none]"
v4l2-ctl -d2 --set-fmt-video=field=none

Then when I try to launch Gstreamer:

gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink

Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[  124.519578] ipu1_ic_prpvf: pipeline start failed with -32
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.032104334
Setting pipeline to NULL ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)

Does anyone have any ideas as to why the pipeline fails?

Thanks,

Fabio Estevam
