Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A3918C368
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgCSW7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:59:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37763 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCSW7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:59:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id h72so8472pfe.4
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 15:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=uZxhe7vbsN6oTIInh4q5LePpPQ0DMnugX/yjiwGdUtU=;
        b=KQBrUnDMKG0L9x5hBxsIlIxZBZx7d++8QiGd6tv4JR4szSW+pZoXj0ymt/FWxItYO6
         YpNgkM+PEstWNmZxTmcWY3cFsKaC1bS0mIUjCWEkUxMr+PDGBzsK2o/qX5BbjlhYho/R
         tmoY1SxkkuSvkVhp27UUMWFBgRHd0A0yCwE5miOj178zWS4kxrWV+1zHxe/BgfaNF0BF
         oQ3AbfJ0jv4jmO9HvvZousyWJ2NqTUFC8Wyy8wn1MT73Ug1YjobHkpYjLl6PfJ/uyrXb
         XLebHaAMCN9lg7E0k9MEPg5Cr3QQY+Jm2Tf1GoL+FUraVLiBhgVtt2poKiieeaFJs1ZK
         IlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uZxhe7vbsN6oTIInh4q5LePpPQ0DMnugX/yjiwGdUtU=;
        b=r42bXRuJdfeD3Fqa2kbC6h0v+eW796LUgryPIyK6Jnfvjp2s4bBttUF0zkBInG5BwH
         c1+r2fAiEUCB8q0WWUsJHlnJJj6mbcO63z3weuxQoRsCOt12QILePy3fSMD1Gc1TviAQ
         7Avi+n9GIQcDrD+J6B9Mz+FAMa/zQXKw5aOROly/XUXcyVtJTXt+jqGAz5TbsJhMcs5s
         /Nl1fa9sx7vDAa9VacZNqZaIa2cHjc6uLm8+2R/9cQ1uGWvoFRx+5+7Rk8XFxSAZSg5v
         kDu8VBiMfh6QNWHhcTtHkwk2BihH31FkF9Ilm2DStceQkba5WT+C1qG+BSL1dYTYS+I3
         +9ag==
X-Gm-Message-State: ANhLgQ3azZdmstU80Ar0+V5jPU10wPUvVQCGE4LQUmw3VdXIN9mrFNLM
        x0wTtpHAE/O32y4TWSxB8Q6uMoAI
X-Google-Smtp-Source: ADFU+vufICfalJWdgSAlXohSFHuFNyAJvaqIP49XwHXtWn4akGggIGtCBCgC0RK+NtGkyR8EUeSoBA==
X-Received: by 2002:a62:8244:: with SMTP id w65mr4849200pfd.114.1584658783206;
        Thu, 19 Mar 2020 15:59:43 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-67-169-51-108.hsd1.ca.comcast.net. [67.169.51.108])
        by smtp.gmail.com with ESMTPSA id d188sm3425027pfa.7.2020.03.19.15.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 15:59:42 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2] media: imx.rst: Add example media graphs
Date:   Thu, 19 Mar 2020 15:59:36 -0700
Message-Id: <20200319225936.21786-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the media graph topologies for the i.MX6Q SabreSD and SabreAuto.
This makes it easier to understand the topology and follow the
entity descriptions in the following sections.

Also clarify that the SabreSD and SabreLite media pipeline config examples
are for the i.MX6Q boards.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v2:
- Add the SabreAuto graph and expand on the topology descriptions.
- Clarify that the SabreSD and SabreLite pipeline configuration examples
  are for the i.MX6Q boards.
---
 Documentation/media/v4l-drivers/imx.rst       | 43 +++++++++++---
 .../media/v4l-drivers/imx6q-sabreauto.dot     | 51 +++++++++++++++++
 .../media/v4l-drivers/imx6q-sabresd.dot       | 56 +++++++++++++++++++
 3 files changed, 143 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/imx6q-sabreauto.dot
 create mode 100644 Documentation/media/v4l-drivers/imx6q-sabresd.dot

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 1246573c1019..a0f4bc18de31 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -102,6 +102,35 @@ Some of the features of this driver include:
   problems with the ADV718x video decoders.
 
 
+Topology
+--------
+
+The following shows the media topologies for the i.MX6Q SabreSD and
+i.MX6Q SabreAuto. Refer to these diagrams in the entity descriptions
+in the next section.
+
+The i.MX5/6 topologies can differ upstream from the IPUv3 CSI video
+multiplexers, but the internal IPUv3 topology downstream from there
+is common to all i.MX5/6 platforms. For example, the SabreSD, with the
+MIPI CSI-2 OV5640 sensor, requires the i.MX6 MIPI CSI-2 receiver. But
+the SabreAuto has only the ADV7180 decoder on a parallel bt.656 bus, and
+therefore does not require the MIPI CSI-2 receiver, so it is missing in
+its graph.
+
+.. _imx6q_topology_graph:
+
+.. kernel-figure:: imx6q-sabresd.dot
+    :alt:   Diagram of the i.MX6Q SabreSD media pipeline topology
+    :align: center
+
+    Media pipeline graph on i.MX6Q SabreSD
+
+.. kernel-figure:: imx6q-sabreauto.dot
+    :alt:   Diagram of the i.MX6Q SabreAuto media pipeline topology
+    :align: center
+
+    Media pipeline graph on i.MX6Q SabreAuto
+
 Entities
 --------
 
@@ -461,8 +490,8 @@ The following are specific usage notes for the Sabre* reference
 boards:
 
 
-SabreLite with OV5642 and OV5640
---------------------------------
+i.MX6Q SabreLite with OV5642 and OV5640
+---------------------------------------
 
 This platform requires the OmniVision OV5642 module with a parallel
 camera interface, and the OV5640 module with a MIPI CSI-2
@@ -631,12 +660,12 @@ used to select any supported YUV pixelformat on /dev/video2.
 This platform accepts Composite Video analog inputs to the ADV7180 on
 Ain1 (connector J42).
 
-SabreSD with MIPI CSI-2 OV5640
-------------------------------
+i.MX6Q SabreSD with MIPI CSI-2 OV5640
+-------------------------------------
 
-Similarly to SabreLite, the SabreSD supports a parallel interface
-OV5642 module on IPU1 CSI0, and a MIPI CSI-2 OV5640 module. The OV5642
-connects to i2c bus 1 and the OV5640 to i2c bus 2.
+Similarly to i.MX6Q SabreLite, the i.MX6Q SabreSD supports a parallel
+interface OV5642 module on IPU1 CSI0, and a MIPI CSI-2 OV5640
+module. The OV5642 connects to i2c bus 1 and the OV5640 to i2c bus 2.
 
 The device tree for SabreSD includes OF graphs for both the parallel
 OV5642 and the MIPI CSI-2 OV5640, but as of this writing only the MIPI
diff --git a/Documentation/media/v4l-drivers/imx6q-sabreauto.dot b/Documentation/media/v4l-drivers/imx6q-sabreauto.dot
new file mode 100644
index 000000000000..bd6cf0b358c0
--- /dev/null
+++ b/Documentation/media/v4l-drivers/imx6q-sabreauto.dot
@@ -0,0 +1,51 @@
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
+	n00000079 [label="{{<port0> 0 | <port1> 1} | ipu1_csi0_mux\n/dev/v4l-subdev12 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000079:port2 -> n00000001:port0 [style=dashed]
+	n0000007d [label="{{<port0> 0 | <port1> 1} | ipu2_csi1_mux\n/dev/v4l-subdev13 | {<port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000007d:port2 -> n0000006b:port0 [style=dashed]
+	n00000081 [label="{{} | adv7180 3-0021\n/dev/v4l-subdev14 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000081:port0 -> n00000079:port1 [style=dashed]
+}
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

