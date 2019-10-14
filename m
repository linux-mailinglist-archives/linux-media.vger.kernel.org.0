Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5879CD6478
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 15:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732256AbfJNNyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 09:54:41 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40277 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730477AbfJNNyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 09:54:41 -0400
Received: by mail-qk1-f193.google.com with SMTP id y144so15924376qkb.7
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2019 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U0Y58GrMRaAQDRiooAdhhEXG+M9ftr3ukVNIPw83erI=;
        b=k0wnBOljNKAf693rVFR4hRwRgjltbyMJ2YQrF0no6zmN/ct/Pfcyg5jMu+ByvD0bOv
         9X3uOjIp8CSPDSPAQVeHOAMVTiusrk4CKmQi2Wc3uD2bSU/aCNscTAkDfakgyw2h4c80
         OvZjYhYEXRte01vItrZl70mniqQsAqS929dPKEzVtX6fyJAqyoHRXmbULoguXx3JSn2P
         pmHFTOP8twkcSAczw6/k/nHeO6x3BK77Ic7OlEHe9KTToWcGVaAGbyYFWl10U8U3NSRb
         8TPE4vFDjfWW3LdN/KGnFqYsw8PjcfR6Ih9gGoenCSIRAxIxk3J7FKb6R6tzEoyCzbSY
         9XfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U0Y58GrMRaAQDRiooAdhhEXG+M9ftr3ukVNIPw83erI=;
        b=A2mvdlaCqJF1eyRGgDdKiefID20hkLY7QwLnZXBRCngAr9o9rx/F55w/tJ1yWnWGGd
         JEbACwKw9DDGIUxyd1qt2qnvkIoY9D4PGWIAXk9tsu9+poU8sdWTV7KuH4M64blNG5f7
         gdh/YmReQBg5vOz4u35lTtJxbn7AKOTjQUtPH1JaBmiUvNOQBjE3jiypsr4Lp5D2GKpZ
         tixx/7yhpF/S8+tyOlbkF4tVdpsQtq1HK1ntloAkZk7Ews8SwM4C7JRwSTBCVcYSN68F
         cBjF6u2c0vCbvM7mJxKaHq1910dlW59aCDoh0Pe/UoKNCs71U08PRLHds2DNdQmRTSHX
         PobQ==
X-Gm-Message-State: APjAAAU4halFEG1zERwxjInEDN4ZSyxaLWowO6TAPHxwMUS2lqCBVGjK
        QNKR1X/YdyrX9xGyduDbfF8cNAcCNyU=
X-Google-Smtp-Source: APXvYqzMbgIc2EHk+mqfAcyGP5/aPZ0e6fwfm9r5LOKiZ0cs5kSJR0SgLOJeqjzJ4u2lVm6vqAfCoQ==
X-Received: by 2002:a05:620a:101b:: with SMTP id z27mr27036981qkj.365.1571061279928;
        Mon, 14 Oct 2019 06:54:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:99::1])
        by smtp.gmail.com with ESMTPSA id n21sm8501666qka.83.2019.10.14.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 06:54:39 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 3/3] media: imx.rst: Provide instructions for the i.MX6DL sabreauto
Date:   Mon, 14 Oct 2019 10:54:24 -0300
Message-Id: <20191014135424.7000-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014135424.7000-1-festevam@gmail.com>
References: <20191014135424.7000-1-festevam@gmail.com>
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
configure the pads that are specific to the i.MX6DL sabreauto.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Add a new entry for the mx6dl sabreauto

 Documentation/media/v4l-drivers/imx.rst | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 36e8d1226ac6..6a9dad8b050b 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -572,6 +572,63 @@ supported YUV or RGB pixelformat on the capture device node.
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
+   # Configure "ipu1_csi0 capture" interface (assumed at /dev/video4)
+   v4l2-ctl -d4 --set-fmt-video=field=interlaced_bt
+
+Streaming can then begin on /dev/video4. The v4l2-ctl tool can also be
+used to select any supported YUV pixelformat on /dev/video4.
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
+   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
+   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x576]"
+   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
+   media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
+   media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
+   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
+
+Streaming can then begin on the capture device node at
+"ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
+supported YUV or RGB pixelformat on the capture device node.
+
+This platform accepts Composite Video analog inputs to the ADV7180 on
+Ain1 (connector J42).
+
 SabreSD with MIPI CSI-2 OV5640
 ------------------------------
 
-- 
2.17.1

