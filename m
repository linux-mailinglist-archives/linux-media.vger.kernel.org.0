Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD1E4CEFD3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 02:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbfJHAP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 20:15:27 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:36196 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfJHAP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 20:15:27 -0400
Received: by mail-lj1-f182.google.com with SMTP id v24so15603541ljj.3
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 17:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=24N3XM5K3yVLT58p2kEFkznKZy2wx25LovO1aDbNAF0=;
        b=s1cppDwRYsm7XKMrZ/A9USUhC7QOzJ+FVDey35XtCQT40fEwrfAqWA++cm/21XtF82
         PBlf7yJuBdy5GYeihclAyuAL3s/ub/87kX9M84dvxWBy4uo25sZS3ol8+tVyPRghtWKK
         c1HUEJ0hpbsOEKuatI9AdeShnt3OubVZQlrEGO2/PqzezKLPuNLQC0qX+sU5FbWZhWUy
         OZ+/zZh16tAgiRjRMB04auBWlpQMcKMZHV1KDysFNaBcxaZ/lrd3KqNQjM+K/3+jWLbb
         IO177DFKk/pLAgHtwIF6TGms9lTimgECNDL0IPp1p/8NxmtcpkTWH2BgY62bAJQj9aWX
         wy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=24N3XM5K3yVLT58p2kEFkznKZy2wx25LovO1aDbNAF0=;
        b=P/KvCqFzNMVYA/1cAQ/jga1Y0Tr7fvKmPqGhviru3zKZ0CIoGwGdc7ShX3ODsRMYZ2
         0j9husEOKihM56B2M0oXCfguiTVKvlAedQ+3r3z52jJUwXPot9aGiCloVgveIp1O0URy
         rudjJ7c++abgL89wnvfJe4TB/v9tilo7T8RY7ToT2c1sH0KIDJpRpt4YDJVbPVRMfjan
         Tb1zhpCdJP4fF5IM8iZSTMVwdNHuipmPtxKh9K2TzeVG9iGl0T3B1+CYjVdIGZWaaSsO
         dMNKi2vJ1GB/QBDOIFvYsDvUolcrPN4mp/sDjAZ013xs8VrkPdpD4pbkTWAhUKUh+f3L
         8X1Q==
X-Gm-Message-State: APjAAAW8yMK88BYqsHDyvQ3O/C+9iSAKs/6okSZht9E+It3MNPIEVupo
        hzKAMfcBD7YIOxB7iQjVmXj9ZASjaoFWI1YqyQM=
X-Google-Smtp-Source: APXvYqy626LMbD+TdjIwAE+lgKwmuF5OnKQvcp5EgA5iGk4y8pyZ+0KrP0VJz2E6Kd1eEj6HgD3HLTYvdd1knsYQKoM=
X-Received: by 2002:a2e:b1d0:: with SMTP id e16mr5938669lja.0.1570493725412;
 Mon, 07 Oct 2019 17:15:25 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 7 Oct 2019 21:15:13 -0300
Message-ID: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
Subject: ADV7180 Capture with i.MX53
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Are you still able to capture from the camera on the imx53-smd board
with kernel 5.3.x?

I have a custom board with a ADV7180 and it gets detected like this:

[    2.970246] ipu1_csi0: Registered ipu1_csi0 capture as /dev/video0
[    2.979741] ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as /dev/video1
[    2.988930] ipu1_ic_prpvf: Registered ipu1_ic_prpvf capture as /dev/video2
[    2.996264] imx-media: ipu1_csi0:1 -> ipu1_ic_prp:0
[    3.001685] mmc0: host does not support reading read-only switch,
assuming write-enable
[    3.009925] imx-media: ipu1_csi0:1 -> ipu1_vdic:0
[    3.014659] imx-media: ipu1_vdic:2 -> ipu1_ic_prp:0
[    3.019929] imx-media: ipu1_ic_prp:1 -> ipu1_ic_prpenc:0
[    3.025305] imx-media: ipu1_ic_prp:2 -> ipu1_ic_prpvf:0
[    3.032039] mmc0: new high speed SDHC card at address aaaa
[    3.038252] imx-media: subdev ipu1_csi0 bound
...
[   24.974982] adv7180 1-0021: chip found @ 0x21 (63fc4000.i2c)
[   25.324516] imx-media: adv7180 1-0021:0 -> ipu1_csi0:0

Then I setup the pipelines:

# media-ctl -l "'adv7180 1-0021':0 -> 'ipu1_csi0':[1]"
# media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
# media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
# media-ctl -V "'ipu1_csi0':2 [fmt:AYUV32/720x480]"

# gst-launch-1.0 v4l2src ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[  929.317827] ipu1_csi0: pipeline start failed with -32
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../../../gst-plugins-good-1.14.4/sys/v4l2/gstv4l2src.c(658):
gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.035375819
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...

My device tree changes to add the ADV7180 are listed here:
http://code.bulix.org/ez8yax-901750

Am I calling the correct media-ctl commands?

Any ideas, please?

Thanks,

Fabio Estevam
