Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70154173D34
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 17:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgB1Qle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 11:41:34 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53706 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgB1Qld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 11:41:33 -0500
Received: by mail-wm1-f66.google.com with SMTP id f15so3844030wml.3;
        Fri, 28 Feb 2020 08:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X5lwKhEkYPb9uFlg3S0kiEOPjUxyOuwawAZ72KaGw1I=;
        b=czUtcTbXEvp4mZ7wtGwtLvOLqcZDZlcZuz3vhgz+v/+rlvyULWIomKGtLHqP8fikwu
         g83gvPCTOCs5rTKZgRIL6gVLYZggOrS5iRFJmwgwj5iIISr9NRYe3v7hdocYspriLyOx
         zQ0xYB9h0wlpxsoi0pb/IMf/O+nB/jgyii3rlke9Hlgn7k3pBu0uGLW/i/11iKeTscB0
         Roghbmt5MLisRFksRBXU6TGaUQfpebPc5oBID2VTurhw3Wglf7nVzXv0+j0kgJLI5bNq
         1eXN0OSorz7i52T937g+ngq+oIh2jMPqLT/316e443cQip13YNuFNi/+/QOoDsIzZcIh
         bD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X5lwKhEkYPb9uFlg3S0kiEOPjUxyOuwawAZ72KaGw1I=;
        b=C8p6n2Ekn4YBljw7ZtkpzHvkkYsXi3Jz+noe3vpgobHMasS2Y4RBRkk+1Mkm/Rwk3W
         6H/UDDjAlrjttAUYipoN8EaZd7U8uCMKE9GrusYor13+DiuY9Qtg4ZnkiDs4TBsT8qp2
         XgO+30H3gyHnel1ftUOvLrbuDnThvp+9wNTe2khUt65WApDR9f/s3JBXNT7zpueHbJ7a
         gk1WVP82rsA+RjeROjiwuPWzZpI60MYg/DXbzz2czfacKoYuNg/iKZWLGmuoW5DWdytU
         OZkc931htUQjKykfDh3+YpH/pD4gWm5J6Y4btpECbANCZvyyZPG1BpTmwvjIMw7YnmGW
         PHhQ==
X-Gm-Message-State: APjAAAWfS2jt8eaeb/GflR2ENcTzh3HOoZ1gcHdmLnv8yvPzdpcNrikt
        JVhb8/Rci1GdR+XjpE36Aec=
X-Google-Smtp-Source: APXvYqzocoSmWjrOQ3OYNBEyzBu4M21vN1njgPy+5EDu+DImCvi/+Wkhc/Ch9Qtn3ou8YPNSaZfcIA==
X-Received: by 2002:a1c:a9d1:: with SMTP id s200mr5766137wme.181.1582908091322;
        Fri, 28 Feb 2020 08:41:31 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:3855:fd13:6b76:a11b])
        by smtp.gmail.com with ESMTPSA id t187sm3028493wmt.25.2020.02.28.08.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 08:41:30 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] media: i2c: ov5645: Add virtual_channel module parameter
Date:   Fri, 28 Feb 2020 16:41:26 +0000
Message-Id: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

OV5645 can operate in virtual channel 0-3 in CSI2 interfaces, this patch
adds support for module parameter virtual_channel to select the required
channel. By default OV5645 operates in virtual channel 0.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a6c17d15d754..0a0671164623 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -54,6 +54,7 @@
 #define OV5645_TIMING_TC_REG21		0x3821
 #define		OV5645_SENSOR_MIRROR		BIT(1)
 #define OV5645_MIPI_CTRL00		0x4800
+#define OV5645_REG_DEBUG_MODE		0x4814
 #define OV5645_PRE_ISP_TEST_SETTING_1	0x503d
 #define		OV5645_TEST_PATTERN_MASK	0x3
 #define		OV5645_SET_TEST_PATTERN(x)	((x) & OV5645_TEST_PATTERN_MASK)
@@ -61,6 +62,11 @@
 #define OV5645_SDE_SAT_U		0x5583
 #define OV5645_SDE_SAT_V		0x5584
 
+static u8 virtual_channel;
+module_param(virtual_channel, byte, 0644);
+MODULE_PARM_DESC(virtual_channel,
+		 "MIPI CSI-2 virtual channel (0..3), default 0");
+
 /* regulator supplies */
 static const char * const ov5645_supply_name[] = {
 	"vdddo", /* Digital I/O (1.8V) supply */
@@ -983,12 +989,34 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5645_set_virtual_channel(struct ov5645 *ov5645)
+{
+	u8 temp, channel = virtual_channel;
+	int ret;
+
+	if (channel > 3)
+		return -EINVAL;
+
+	ret = ov5645_read_reg(ov5645, OV5645_REG_DEBUG_MODE, &temp);
+	if (ret)
+		return ret;
+
+	temp &= ~(3 << 6);
+	temp |= (channel << 6);
+
+	return ov5645_write_reg(ov5645, OV5645_REG_DEBUG_MODE, temp);
+}
+
 static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct ov5645 *ov5645 = to_ov5645(subdev);
 	int ret;
 
 	if (enable) {
+		ret = ov5645_set_virtual_channel(ov5645);
+		if (ret < 0)
+			return ret;
+
 		ret = ov5645_set_register_array(ov5645,
 					ov5645->current_mode->data,
 					ov5645->current_mode->data_size);
-- 
2.20.1

