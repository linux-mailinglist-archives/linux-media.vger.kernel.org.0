Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 270181A220F
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 14:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgDHMbt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 08:31:49 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:41686 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgDHMbt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 08:31:49 -0400
Received: by mail-qv1-f65.google.com with SMTP id b4so1145980qvw.8
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=av+V9OCAoiE9wtnyqgCwAxBKSBlWviHFTCRPpGmAtvU=;
        b=Z7WCMy6LxDEH1nSXf/TkIYBm5fK++iqegBNETRE0NB4Jq/82ADO8MK5MI8I5/Wu0vc
         MGt68ogxcH9XjObrRw3ycZj11nModlbt8lJT5KD32TURV6q+1/sNCeE0LOwdgvV60YV0
         /ZwsWGuDcUALLNa1v5x1/U1FmU52iny0xoQZapJx4+kJMsRo04bdPA45WMgBdvso0brm
         XinieRsFULr7fZg8fpOAO2kcnPyvUR6TsUdzR3vlMFlqEEMwt+cGIk9uS2uDVevPtIdj
         X6foaJP/ppbwPRn7KSWxRvXjw6cCEtTNXues309EHDyNlMJRKb0s91jIKsuZA/id8DRK
         hCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=av+V9OCAoiE9wtnyqgCwAxBKSBlWviHFTCRPpGmAtvU=;
        b=jtd2BnPtK74KKt/dvwfhhzEJOL85NWZydkIdr6isPV8QVy90URmpLvWz+aqzQSJxKW
         QTyiZbwJYsfO+R1eZLsgRq+Cwa35tnyOdsy4JaxSSffLoOnCTAYvBQ3Gz3GpGVZ86PDW
         pAgyVLnoVD/RAwdlM835ij1BsHxQKTB8o5rj8qlurlyJPBv8qR8HQzsqewyfZqNC+18q
         k6raTt4hQa1EJJUBwuKGhTczthqxY4f5lBYDKXHNPSVj/IHo4TbHMaKmYM9Vm+p+Aaqv
         2O1O/fZreHdXY3EFrPcQ4tbu2GW0zyLsiP+WUfonqAjySyDvUB7unqMTAOvgeGqyjpyw
         9WJg==
X-Gm-Message-State: AGi0PuaX05k3Y1VFt6eHIP4Lf9gu3+eMufBaguUjm3j05FmbLqmzM1p5
        hCbiOpgKY40xCbHPp7zzL6g=
X-Google-Smtp-Source: APiQypJNIT/5/nRRJ7TyCCN6So8dlvQ5boMzqnjNCfhcNEz3mFPGfHWbkrZ/ant4mxBwYkXvcs6lLQ==
X-Received: by 2002:a0c:c28c:: with SMTP id b12mr7279894qvi.26.1586349107460;
        Wed, 08 Apr 2020 05:31:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id z40sm9120377qtj.45.2020.04.08.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 05:31:46 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
Date:   Wed,  8 Apr 2020 09:32:12 -0300
Message-Id: <20200408123215.2531-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current instructions for imx6q-sabresd do not lead to functional
capture on OV5640 MIPI CSI-2.

The reason for this, as explained by Steve Longerbeam, is that OV5640 by
default transmits on virtual channel 0, not channel 1 as is given in the
instructions.

Adapt the instructions to use virtual channel 0 so that a working
camera setup can be achieved on imx6q-sabresd.

Suggested-by: Steve Longerbeam <slongerbeam@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Hi Steve,

I don't have access to a imx6q sabrelite with camera, but I think
it needs fixing as well.

 Documentation/media/v4l-drivers/imx.rst | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 1246573c1019..7c3afd32e456 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -645,25 +645,26 @@ The OV5640 module connects to MIPI connector J5 (sorry I don't have the
 compatible module part number or URL).
 
 The following example configures a direct conversion pipeline to capture
-from the OV5640, transmitting on MIPI CSI-2 virtual channel 1. $sensorfmt
-can be any format supported by the OV5640. $sensordim is the frame
-dimension part of $sensorfmt (minus the mbus pixel code). $outputfmt can
-be any format supported by the ipu1_ic_prpenc entity at its output pad:
+from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:
 
 .. code-block:: none
 
    # Setup links
    media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
-   media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
-   media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
+   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
+   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
+   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
    media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
    media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
    # Configure pads
-   media-ctl -V "'ov5640 1-003c':0 [fmt:$sensorfmt field:none]"
-   media-ctl -V "'imx6-mipi-csi2':2 [fmt:$sensorfmt field:none]"
-   media-ctl -V "'ipu1_csi1':1 [fmt:AYUV32/$sensordim field:none]"
-   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/$sensordim field:none]"
-   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:$outputfmt field:none]"
+   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0':0 [fmt:UYVY2X8/640x480]"
+   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
+   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
+   media-ctl -V "'ipu1_ic_prpenc':0 [fmt:AYUV32/640x480]"
+   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/640x480]"
 
 Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
 tool can be used to select any supported YUV or RGB pixelformat on the
-- 
2.17.1

