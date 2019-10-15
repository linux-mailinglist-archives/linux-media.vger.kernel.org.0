Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFC6DD7AB4
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387438AbfJOQBC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:01:02 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43602 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731936AbfJOQBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:01:02 -0400
Received: by mail-qk1-f195.google.com with SMTP id h126so19647862qke.10
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6PRk9eSGKNiTKFO64B5AMs7UJU1pd0a09q1UeOtdYVw=;
        b=VPTsNdb/Doe58RnFc8HLL7CNbCMt9Da4CVb/OHgY9eY7awY/xmT0YTyzItRGhrl0KL
         S/BKOBlg14RG6sWWESE9TMBRiOFzsH/sb3mOSEmNUrpM7uowM6tw03gQfBxIX56YSVsr
         WoeSVnRwZEyzLJZ70ITOQCqeQCtbmMjrMF/59uphk/7zwSepMAx9tUNyNuNF5bMfPMMn
         HVoEPG1PytilY6rSVNFfJRQv+X/UV/04sSKYU/Ens7wvfzCdceHi2+kIM3xNDga0t6WF
         AXyO8E+TDxvkzDuMrcjkqCUQji3xkET7AvIgewGiWjBDrtegVmVItiPV7yDGfRBLA5ep
         O0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6PRk9eSGKNiTKFO64B5AMs7UJU1pd0a09q1UeOtdYVw=;
        b=fk/JrkHtFcuEzIqAmFbimKv90vpABl5j0oLqyoUZiueCLVtEsmvCvtQHpEpM2CpXym
         4eYvu3qCkFCP2KqnQ08qJ/oQ/1g7a2snCBdp2H9bDv7OIRA9j/bPyWSqL1soUDhknOWO
         qtPVDLpHz8gacU2yVp/mU+XKAkktnBKQ1xR8RDpJGGCGgHmPoK/pGZUXLHAItmfFyFT6
         Fx6W+pD0wlOGi+xP9Ydkui9KRYRPRu5uu3yH/hOSYpM/ktpSDtUO8gX3J5Jhdjc2uGaK
         ElFFf17Z7Lt5DV50JS8o+LX6sJcSZNQaF9SuLx/HxBWUJzZhIk943ZCpDXjmskCPt5jX
         YWrQ==
X-Gm-Message-State: APjAAAUFqRMrgV6XXNEjQ+uAx7MQcoKi5PwXi9XXFTW59Kv0t/R9jZZ/
        UdLgwiVwQDpOx2uG11qhuZE=
X-Google-Smtp-Source: APXvYqxyK8INEU1Lo0JYb6wPDdkrnNG4RrO2WzaYR8PEn2WbRNmn6mmyrI3EPOJdZ1Z3WZsj7q/8rw==
X-Received: by 2002:a37:68c2:: with SMTP id d185mr36101232qkc.297.1571155260951;
        Tue, 15 Oct 2019 09:01:00 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id n21sm10304930qka.83.2019.10.15.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:01:00 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, slongerbeam@gmail.com, tharvey@gateworks.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 3/4] media: imx.rst: Provide instructions for the i.MX6DL sabreauto
Date:   Tue, 15 Oct 2019 13:00:41 -0300
Message-Id: <20191015160042.28113-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015160042.28113-1-festevam@gmail.com>
References: <20191015160042.28113-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX6DL sabreauto has different numbering on the I2C bus and
I2C muxes compared to the i.MX6Q as shown in the kernel log below:

[    5.159423] imx-media: ipu1_csi0_mux:5 -> ipu1_csi0:0
[    5.164618] imx-media: ipu1_csi1_mux:5 -> ipu1_csi1:0
[    5.169953] imx-media: adv7180 4-0021:0 -> ipu1_csi0_mux:4

To avoid confusion, add an entry that shows how to setup the links and
configure the pads that are specific to the i.MX6DL sabrea

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Fix I2C and CSI mux numbering (Steve)
- Passed the v4l2-ctl configuration (Steve)

 Documentation/media/v4l-drivers/imx.rst | 58 +++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 36e8d1226ac6..aab68d8ef2c9 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -572,6 +572,64 @@ supported YUV or RGB pixelformat on the capture device node.
 This platform accepts Composite Video analog inputs to the ADV7180 on
 Ain1 (connector J42).
 
+i.MX6DL SabreAuto with ADV7180 decoder
+--------------------------------------
+
+On the i.MX6DL SabreAuto, an on-board ADV7180 SD decoder is connected to the
+parallel bus input on the internal video mux to IPU1 CSI0.
+
+The following example configures a pipeline to capture from the ADV7180
+video decoder, assuming NTSC 720x480 input signals, using simple
+interweave (unconverted and without motion compensation). The adv7180
+must output sequential or alternating fields (field type 'seq-bt' for
+NTSC, or 'alternate'):
+
+.. code-block:: none
+
+   # Setup links
+   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
+   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
+   media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
+   # Configure pads
+   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
+   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x480]"
+   media-ctl -V "'ipu1_csi0':2 [fmt:AYUV32/720x480]"
+   # Configure "ipu1_csi0 capture" interface (assumed at /dev/video0)
+   v4l2-ctl -d0 --set-fmt-video=field=interlaced_bt
+
+Streaming can then begin on /dev/video0. The v4l2-ctl tool can also be
+used to select any supported YUV pixelformat on /dev/video0.
+
+This example configures a pipeline to capture from the ADV7180
+video decoder, assuming PAL 720x576 input signals, with Motion
+Compensated de-interlacing. The adv7180 must output sequential or
+alternating fields (field type 'seq-tb' for PAL, or 'alternate').
+
+.. code-block:: none
+
+   # Setup links
+   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
+   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
+   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
+   media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
+   media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
+   media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
+   # Configure pads
+   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
+   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x576]"
+   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
+   media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
+   media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
+   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
+   # Configure "ipu1_ic_prpvf capture" interface (assumed at /dev/video2)
+   v4l2-ctl -d2 --set-fmt-video=field=none
+
+Streaming can then begin on /dev/video2. The v4l2-ctl tool can also be
+used to select any supported YUV pixelformat on /dev/video2.
+
+This platform accepts Composite Video analog inputs to the ADV7180 on
+Ain1 (connector J42).
+
 SabreSD with MIPI CSI-2 OV5640
 ------------------------------
 
-- 
2.17.1

