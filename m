Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAEED2DFC
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 17:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfJJPo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 11:44:27 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46505 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJPo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 11:44:27 -0400
Received: by mail-qt1-f196.google.com with SMTP id u22so9308893qtq.13
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wne/uQF1RDK/LcdWEsIHm5m9khu31Sn08bzpLKHvHN8=;
        b=WIJcU4Uc4PZ3+rI9bWqZYXcfcasS9g7de+rifPOVF+uCrjwXkZJG7XyD1fOOTLzVKB
         +vffztJTwZKrzPrf9XrXApnoGpMrTDF0mOkNgVST2+OaPeav9ADIeYYT4VHQ7JSPSTtH
         YuK8hmEy/gQIWAunB9MhsECcQ4Mfgb+5CmFxkQcKajrsLcL7RLxk804ki+SbSYp/uSlG
         rq9jJnNCGXUlRazN70a0vtXQX4Jv2qhf8g3TibYl6uE6NN7UOiItBIYn6I5aIrdCmnLW
         N5BhboNrnQ/9UOu7UTS7eIxDUwr46BS5r9tPrZLDckyK33JKDc8eJ1HPZaIHDqw5mALq
         dMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wne/uQF1RDK/LcdWEsIHm5m9khu31Sn08bzpLKHvHN8=;
        b=IDjuJs0ithYeyT/5+44Efe5ShkMFvZscZ0a9RJgMlnN8tiSChbEExTW4IlPVvp+oPR
         oRuhchCcQkZ0xjkKSmebVgDYLAGBOEAyW/0ZQ1N+ZYUmZ1SsolKW6TqaV+rNTDCKTxa6
         EPoepsrgTVUGu93Ms8YeIb0ROuuFMUSM8d0Hmi3doIeiiF17VllTEUfFj0gFPvv60jiv
         6GwQ7guhENvoohgwiZVEtfH4ZkBiP/6Plvpl131U/pMLFK85UKUEh+J5WGy7vkUws8CC
         ISmGU/6VKX1nJxu58vjHDVTcvrtR8x8UFpXt34ICNy/gixFe1CrpWAx1KMKD/NJZXzi6
         zTWQ==
X-Gm-Message-State: APjAAAVPnqvc14/TnUl/xoVNhkR4YAMzERyjEpN2fqrEbq728kTfLRXH
        3W0SJspi+gGjsJnCmuM2q9s=
X-Google-Smtp-Source: APXvYqy8claqrOCM5tB5cxzsdVZhjtdP8LfRginWAoc4EKvqoo/qqXYPIY4tPFUAcfPVpFLi4A04Kw==
X-Received: by 2002:aed:29e7:: with SMTP id o94mr10908122qtd.161.1570722266153;
        Thu, 10 Oct 2019 08:44:26 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 207sm2176339qkh.33.2019.10.10.08.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 08:44:25 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
Date:   Thu, 10 Oct 2019 12:44:17 -0300
Message-Id: <20191010154417.9437-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In kernel 5.3.x the I2C bus that the adv7180 is under has changed from
bus 3 to 4 and the ipu_csi0_mux numbers has also changed as shown by
the kernel log below: 

[    5.159423] imx-media: ipu1_csi0_mux:5 -> ipu1_csi0:0
[    5.164618] imx-media: ipu1_csi1_mux:5 -> ipu1_csi1:0
[    5.169953] imx-media: adv7180 4-0021:0 -> ipu1_csi0_mux:4

Update the instructions accordingly.

Also, in the last line pass the fmt field explicitly as done in the
previous lines.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/media/v4l-drivers/imx.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 1d7eb8c7bd5c..75430cd2f222 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -530,12 +530,12 @@ NTSC, or 'alternate'):
 .. code-block:: none
 
    # Setup links
-   media-ctl -l "'adv7180 3-0021':0 -> 'ipu1_csi0_mux':1[1]"
-   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
+   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
+   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
    media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
    # Configure pads
-   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
-   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x480]"
+   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
+   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x480]"
    media-ctl -V "'ipu1_csi0':2 [fmt:AYUV32/720x480]"
    # Configure "ipu1_csi0 capture" interface (assumed at /dev/video4)
    v4l2-ctl -d4 --set-fmt-video=field=interlaced_bt
@@ -553,19 +553,19 @@ at its output pad:
 .. code-block:: none
 
    # Setup links
-   media-ctl -l "'adv7180 3-0021':0 -> 'ipu1_csi0_mux':1[1]"
-   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
+   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
+   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
    media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
    media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
    media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
    media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
    # Configure pads
-   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
-   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x576]"
+   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
+   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x576]"
    media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
    media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
    media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
-   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:$outputfmt field:none]"
+   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
 
 Streaming can then begin on the capture device node at
 "ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
-- 
2.17.1

