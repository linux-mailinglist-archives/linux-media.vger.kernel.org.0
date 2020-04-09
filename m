Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7361A3806
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 18:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgDIQ3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 12:29:24 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44139 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgDIQ3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 12:29:23 -0400
Received: by mail-qt1-f193.google.com with SMTP id w24so348474qts.11
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w3Df8xLGfV/1bGxtqXtvF8/jtUvkTYDFnMbV6MxMdlU=;
        b=n7HAG9r8mnJExzjmaEA/S1jpDDdEMKIsc76hn+DKOwRCi+MZxSaeG7cWLBMcXwseUd
         UE7I/PHoyYZU2kJTN0WYqTzazsifFvInjG0DmcsPBoG5xHpA2kPhi+yzMf0YuoNSBh0r
         SuX/wwe/Mlg7Bd4SAx7Sownau/fZoNGWd2ehe6/Y+jDzNhxCJrMNC07gZkUBGolodWlc
         0mJk6GqFD1mMLtMPM1Ph/w8yBO2SSWzV0QkbZO+RW1FFppWUdqMKI9sjgSrVdP6ybNlC
         Md+EnN0HgxxyUbE87hGGCv0yFqpr3ZG3md1SJ0ZeX23OWAo8T5yGKa5Y+8817N4mqdMr
         /AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w3Df8xLGfV/1bGxtqXtvF8/jtUvkTYDFnMbV6MxMdlU=;
        b=MzP9kmBs3Q/1VN084z/U4/Xoo/PMBazMDSNY0WPts/7Qr4h+JUR5lq+GSDkL3mh8yQ
         zT7GQ97Ygv8ozlbb6kKQ1ZtH5GmjiIek816+MHYIblDU86dZ4b/SmX0XcOQlgnRHzeIE
         Ovai+8AmGnMPc+qGCTPFkTbZpL5p0CfLkLxcphIV9YMcKlu/RNuXdgM/8uQQir/uXZNH
         VRgyvbZrVx7bbtlON8EocgNh8uI/MeoCPs3e5CITvXOThahOETeCFAnrG/hIes20slbG
         rHFUdHujnEaD5zz3cVwWOY5Af0OwqkmTXeEYtdPtgWFdGXedaH3dB9cEp6t1r81i5OaU
         Uq+A==
X-Gm-Message-State: AGi0PuavDyVXMsY3vQ2avl/gzacE35TfyKL+fF4D1t2gKoxLvBA72xSV
        2tvI/guidC+HH+x422ZIvps=
X-Google-Smtp-Source: APiQypJCkRwhTllJ3Gmt7DLt2ZOHNnbuKQWwwcTtOnHcx82d5RUIMKKcAqqSWqLgy/8VL2w7bc9WoQ==
X-Received: by 2002:ac8:7396:: with SMTP id t22mr146210qtp.15.1586449761428;
        Thu, 09 Apr 2020 09:29:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::3])
        by smtp.gmail.com with ESMTPSA id x66sm16980587qka.121.2020.04.09.09.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 09:29:20 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/4] media: imx.rst: Provide an example for unprocessed video capture
Date:   Thu,  9 Apr 2020 13:29:43 -0300
Message-Id: <20200409162945.3559-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409162945.3559-1-festevam@gmail.com>
References: <20200409162945.3559-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current example for imx6q-sabresd is for a direct conversion pipeline.

Provide an extra example using unprocessed video capture for completeness.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes since v1:
- None

 Documentation/media/v4l-drivers/imx.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index b8df91f83f14..fb6e01976254 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -644,6 +644,26 @@ CSI-2 OV5640 has been tested, so the OV5642 node is currently disabled.
 The OV5640 module connects to MIPI connector J5 (sorry I don't have the
 compatible module part number or URL).
 
+The following example configures unprocessed video capture pipeline to
+capture from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:
+
+.. code-block:: none
+
+   # Setup links
+   media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
+   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
+   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
+   media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
+   # Configure pads
+   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0_mux':0 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0':0 [fmt:AYUV32/640x480]"
+
+Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
+tool can be used to select any supported pixelformat on the capture
+device node.
+
 The following example configures a direct conversion pipeline to capture
 from the OV5640, transmitting on MIPI CSI-2 virtual channel 0. It also
 shows colorspace conversion and scaling at IC output.
-- 
2.17.1

