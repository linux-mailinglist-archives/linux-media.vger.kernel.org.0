Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB6411A2210
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 14:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgDHMbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 08:31:51 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:45506 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgDHMbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 08:31:51 -0400
Received: by mail-qt1-f196.google.com with SMTP id 71so5336777qtc.12
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+q+seak13ylX0CXT7gqP2UMp4PkbkAJ3zkFCaFVZjBE=;
        b=cIqjvGm2aWtRoahrYw6PFtHhEHreUvBr4jY+tUkJS9VtvIQemcQzAJaKA6ZgP4krDx
         WgYbdt+Yclyvar8fS09AKtUHzxWCCW+1wOvSpbzu5TDH0fVFybaPwoa/DEzCNa2HKhbe
         rzL5fuyLYocL0eYN0mkf905IU5ahnrKWhs0Nz6Qk7IPMyoJmYDDeZRRR49BpcWkjTjtU
         hp0i0vqHDPVXh5qZXuaWLvzxJT67CJekmOfYlA0KLnueb0VqPOrdoaOta4NQbrPWUtEg
         CvA6PjFv19g6m+5aoJtm6YzNW0ppUC51J0rppSqwLsjSM5HWMI95VEvLHVMLU9oC941Y
         qUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+q+seak13ylX0CXT7gqP2UMp4PkbkAJ3zkFCaFVZjBE=;
        b=JBHeuHxmz6J9hk8n3k/WYjSV18GUyLO3Z8YlExWSoPwONSV7jYX8EiAZ860rg1RyUL
         Qg0w9m43hl1aNE2Ga3a9j7rk6pSxVTN4goZl6WFR9TrYYAARwBwRv5LENicNlbGzR1XH
         ht49SXrtSifZmrWMlXU/aPthF+TZ+bY6RzbNYtwQlpK+Y7RypeaBFGNkjX2vhCO2GAiA
         DdoWMExXPfJC5+UTdIlNyKBiPgbt9N7D8zkfI51y37Hap/ZqrXdzINamYuxam2spy7Ew
         QSnhHZfadfKGriEMmmAt7+e21O+3JzaMnGMQloW0MLjjTbHFr4wdUU1HCw8Wues8/uPR
         jwQg==
X-Gm-Message-State: AGi0PuZ7+VpLwzuMp/97lzkOOZ7wW0O5bKS6tmFNQN4e5/WxruzBo+Pk
        I8iARiEukconTnJgOp9xuMs=
X-Google-Smtp-Source: APiQypKIE1sZZRV1rqNIby9y/yzrhmt1mkLuIH52s5xg5Nx4I7pZLMJGyT+nzMmzDsEQe3CDitIdqw==
X-Received: by 2002:ac8:7292:: with SMTP id v18mr7095818qto.304.1586349110164;
        Wed, 08 Apr 2020 05:31:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id z40sm9120377qtj.45.2020.04.08.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 05:31:49 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/4] media: imx.rst: Provide an example for unprocessed video capture
Date:   Wed,  8 Apr 2020 09:32:13 -0300
Message-Id: <20200408123215.2531-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408123215.2531-1-festevam@gmail.com>
References: <20200408123215.2531-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current example for imx6q-sabresd is for a direct conversion pipeline.

Provide an extra example using unprocessed video capture for completeness.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/media/v4l-drivers/imx.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 7c3afd32e456..3b4767f5f422 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -670,6 +670,26 @@ Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
 tool can be used to select any supported YUV or RGB pixelformat on the
 capture device node.
 
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
+tool can be used to select any supported YUV or RGB pixelformat on the
+capture device node.
+
 
 Known Issues
 ------------
-- 
2.17.1

