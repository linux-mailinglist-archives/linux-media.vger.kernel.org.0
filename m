Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C816418BF80
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 19:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSSjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 14:39:41 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54372 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCSSjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 14:39:41 -0400
Received: by mail-pj1-f66.google.com with SMTP id np9so1386264pjb.4
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 11:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=+v+RPEZwPZEDzUs9bNPfmq3HBKn8LXc51P54GEG+Zlc=;
        b=lk/n1AoQSX4xtj1zLXWTfemx7Q2NXCfKhPy2xOqrpC7sxmNVJ4ZlZjoZqsM/CRlj3A
         dlVIjkeT5OHdLJvapo3alw8svhsYnKi2B5FzmFumFwiclSDS5oha6nkf9VXK7kjo2IfE
         dDkr6yqicI3BmkdZJfvZPxHUGE2zbWmiIlNXq+htKalubOljsBMLNLDfY/DM61UTY2Th
         HIJhw8d74nRAqYwv6/R46oLYL7uGk2Xkw1gwTLbRnCYhUnceG7SXXwxw2QxPwPaemUA7
         rqLv/s+GOKS4VrxlhX2hWsgVrCNuqinFL9AyA7vdtaPjQZPxt10loLVinHaoHBqck8Hh
         Hm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+v+RPEZwPZEDzUs9bNPfmq3HBKn8LXc51P54GEG+Zlc=;
        b=M4s5d8g7482rYJ9Z8OvZAvkGX5ThPweOjjwrpaQJ2cqY+KCE/nLm7KCZ83sXskfV3V
         E4KmQf8D6I7gyCohtzDvH05Q/6oA4sQXCzdHYxmWPosB1z5Gh8bFFDNhlZfHeqYjWKJo
         l7Ay9Cq5MEBWcwfGVAFLYTDyMgMSU0qlQRM8anoRVHoIMEHuZajorrtJfiktfWUW9SIO
         kvZBIEGFgNx2y/SIbP35GmQaV4HHS5oqxILsI6FKdVl9KErnjWC4ALuRJTMuk4AvoLrU
         gvDtBPWE/rnV7RLqCRGmcFSLlkZzdt7bOSOKQJgOx2IjevdGgO0VvpFoBFpWNfgm+XEe
         UeWA==
X-Gm-Message-State: ANhLgQ1Xyop2p5PU2Dfw768bk1BmOEQ5fCkjnfqUEa8ont+YLxeAjrQf
        5VI9KPYJUc0VjRYIWnGFCloVHa46
X-Google-Smtp-Source: ADFU+vuqmtJPB+C3MOFssWHlS+E3nbolzG/Jr7Ewt3/RnWCyjWO7tJlUUano4awG8LxtVw4Pr/m5Ng==
X-Received: by 2002:a17:90b:14c2:: with SMTP id jz2mr5150855pjb.152.1584643179310;
        Thu, 19 Mar 2020 11:39:39 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-67-169-51-108.hsd1.ca.comcast.net. [67.169.51.108])
        by smtp.gmail.com with ESMTPSA id 63sm3171419pfx.132.2020.03.19.11.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 11:39:38 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH] media: imx.rst: Add example media graph
Date:   Thu, 19 Mar 2020 11:39:32 -0700
Message-Id: <20200319183932.12403-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the media graph topology for the i.MX6Q SabreSD.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 Documentation/media/v4l-drivers/imx.rst       | 14 +++++
 .../media/v4l-drivers/imx6q-sabresd.dot       | 56 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/media/v4l-drivers/imx6q-sabresd.dot

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 1246573c1019..9ce4b7d122e5 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -102,6 +102,20 @@ Some of the features of this driver include:
   problems with the ADV718x video decoders.
 
 
+Topology
+--------
+  
+The following shows the media topology for the i.MX6Q SabreSD:
+
+.. _imx6q_sabresd_topology_graph:
+
+.. kernel-figure:: imx6q-sabresd.dot
+    :alt:   Diagram of the i.MX6Q SabreSD media pipeline topology
+    :align: center
+
+    Media pipeline graph on i.MX6Q SabreSD
+
+
 Entities
 --------
 
diff --git a/Documentation/media/v4l-drivers/imx6q-sabresd.dot b/Documentation/media/v4l-drivers/imx6q-sabresd.dot
new file mode 100644
index 000000000000..7d56cafa1944
--- /dev/null
+++ b/Documentation/media/v4l-drivers/imx6q-sabresd.dot
@@ -0,0 +1,56 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0} | ipu1_csi0\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port2 -> n00000005 [style=dashed]
+	n00000001:port1 -> n0000000f:port0 [style=dashed]
+	n00000001:port1 -> n0000000b:port0 [style=dashed]
+	n00000005 [label="ipu1_csi0 capture\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000b [label="{{<port0> 0 | <port1> 1} | ipu1_vdic\n/dev/v4l-subdev1 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000b:port2 -> n0000000f:port0 [style=dashed]
+	n0000000f [label="{{<port0> 0} | ipu1_ic_prp\n/dev/v4l-subdev2 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000f:port1 -> n00000013:port0 [style=dashed]
+	n0000000f:port2 -> n0000001c:port0 [style=dashed]
+	n00000013 [label="{{<port0> 0} | ipu1_ic_prpenc\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000013:port1 -> n00000016 [style=dashed]
+	n00000016 [label="ipu1_ic_prpenc capture\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n0000001c [label="{{<port0> 0} | ipu1_ic_prpvf\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000001c:port1 -> n0000001f [style=dashed]
+	n0000001f [label="ipu1_ic_prpvf capture\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n0000002f [label="{{<port0> 0} | ipu1_csi1\n/dev/v4l-subdev5 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000002f:port2 -> n00000033 [style=dashed]
+	n0000002f:port1 -> n0000000f:port0 [style=dashed]
+	n0000002f:port1 -> n0000000b:port0 [style=dashed]
+	n00000033 [label="ipu1_csi1 capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n0000003d [label="{{<port0> 0} | ipu2_csi0\n/dev/v4l-subdev6 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000003d:port2 -> n00000041 [style=dashed]
+	n0000003d:port1 -> n0000004b:port0 [style=dashed]
+	n0000003d:port1 -> n00000047:port0 [style=dashed]
+	n00000041 [label="ipu2_csi0 capture\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000047 [label="{{<port0> 0 | <port1> 1} | ipu2_vdic\n/dev/v4l-subdev7 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000047:port2 -> n0000004b:port0 [style=dashed]
+	n0000004b [label="{{<port0> 0} | ipu2_ic_prp\n/dev/v4l-subdev8 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000004b:port1 -> n0000004f:port0 [style=dashed]
+	n0000004b:port2 -> n00000058:port0 [style=dashed]
+	n0000004f [label="{{<port0> 0} | ipu2_ic_prpenc\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000004f:port1 -> n00000052 [style=dashed]
+	n00000052 [label="ipu2_ic_prpenc capture\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+	n00000058 [label="{{<port0> 0} | ipu2_ic_prpvf\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000058:port1 -> n0000005b [style=dashed]
+	n0000005b [label="ipu2_ic_prpvf capture\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
+	n0000006b [label="{{<port0> 0} | ipu2_csi1\n/dev/v4l-subdev11 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000006b:port2 -> n0000006f [style=dashed]
+	n0000006b:port1 -> n0000004b:port0 [style=dashed]
+	n0000006b:port1 -> n00000047:port0 [style=dashed]
+	n0000006f [label="ipu2_csi1 capture\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
+	n00000079 [label="{{<port0> 0} | imx6-mipi-csi2\n/dev/v4l-subdev12 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000079:port2 -> n0000002f:port0 [style=dashed]
+	n00000079:port3 -> n0000003d:port0 [style=dashed]
+	n00000079:port1 -> n0000007f:port0 [style=dashed]
+	n00000079:port4 -> n00000083:port0 [style=dashed]
+	n0000007f [label="{{<port0> 0 | <port1> 1} | ipu1_csi0_mux\n/dev/v4l-subdev13 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000007f:port2 -> n00000001:port0 [style=dashed]
+	n00000083 [label="{{<port0> 0 | <port1> 1} | ipu2_csi1_mux\n/dev/v4l-subdev14 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000083:port2 -> n0000006b:port0 [style=dashed]
+	n00000087 [label="{{} | ov5640 1-003c\n/dev/v4l-subdev15 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000087:port0 -> n00000079:port0 [style=dashed]
+}
-- 
2.17.1

