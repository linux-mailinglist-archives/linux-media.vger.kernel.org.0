Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2C83F994E
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 15:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbhH0NCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 09:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhH0NCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 09:02:52 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2320C061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 06:02:03 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id ay33so6989809qkb.10
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Gn3ssrTPiGbG5p9f9KeoHn60QMJHlHG0mXvevvyVP0=;
        b=LXPwZ9Car2S+sK3HSQaXfFOC3x1uNNmqOgJQXnihE67i7EwLbPxUaYCoVFAfbdevrY
         cSaKn3lyo12qM+UwTt/bOQXDWQLBiEAUpNFnekZ4VH0B7Xp5TCuTkfleG0ziA9C6QVwO
         Qt57/bodLB/dNC2fhzbYlEbxeBN/7XQGswjNHfPL+v82Md4GczvYqjeqmdHWqGqHnGkD
         xGA8aSwQ0qBtRsPZSKZOtbh5MSht8NvX5wgHwZMKfcKbs/VAFFXSvp++ODVcCUk5j4Nz
         SrWD0W6CzhQBgMAX+AySSC91Snq6KKUThyp8KcQLSd2bA6YsewfkX8jjpHlVO+0L0GPy
         JapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Gn3ssrTPiGbG5p9f9KeoHn60QMJHlHG0mXvevvyVP0=;
        b=FQcbV+5ZQNcU0JWrMM5DTWPfVQ5yzGW3yGUuOPDJAoAJldO6yx6lnD95zsA9y+6DyI
         PudftMQgtzxOtjqteMOZW1G61+Rh0lbttEsd8JWLjpbUYOJUbllnJoD4HWb5w4HOplZp
         u+do3O+MLdp7fjaaDb1yZnJvMoHEMXO4XWr0kqhOZ1/i+JuT4YrMXDcJt2sMiKDRx6BL
         qPvYaZJXJIf/tND5NeJ0QwBIwAPuGvkIzCLtju1p7jlSoXFtMlvT7sCLCXfe+qqb6h6n
         g5/jSX5scZaJ842LFQuk6FYbOZ66RTF9NRWU5YpCIuQZZBkcMJKRvQZOv1i8JX6EBfZq
         0kOg==
X-Gm-Message-State: AOAM533Qg2afpSBCNApLVMGK9f0hhnIUZr8R6XdZm9w5aZ3z+4+eqhyR
        BaNrMyrwJfO62t/xxuJvSWk=
X-Google-Smtp-Source: ABdhPJxzJJKHJEF63Kis1F3WvWj0OeBh0UzUw1BFn8ibYDcidjo6eK6TFsEhBisjCOIWdF4/b33LOA==
X-Received: by 2002:ae9:f70e:: with SMTP id s14mr9526006qkg.38.1630069321736;
        Fri, 27 Aug 2021 06:02:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:a04e:f46c:17c2:7e75])
        by smtp.gmail.com with ESMTPSA id v14sm4676346qkb.88.2021.08.27.06.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:02:01 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        jacopo+renesas@jmondi.org, morimoto.kuninori@renesas.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [RFC 1/3] media: tw9910: Allow to probe from device tree
Date:   Fri, 27 Aug 2021 10:01:48 -0300
Message-Id: <20210827130150.909695-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the driver only probes via platform data passed from
board file.

Allow to probe from device tree too.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Hi,

I am currently sending this series as RFC because I was
not able to get the TW9990 to work on a imx6sx board yet.

# media-ctl -p
Media controller API version 5.14.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial          
bus info        
hw revision     0x0
driver version  5.14.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
		[fmt:UYVY8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
		<- "tw9910 2-0044":0 [ENABLED,IMMUTABLE]
	pad1: Source
		[fmt:UYVY8_2X8/800x600 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
		-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
	pad0: Sink
		<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: tw9910 2-0044 (1 pad, 1 link)
             type V4L2 subdev subtype Decoder flags 0
             device node name /dev/v4l-subdev1
	pad0: Source
		[fmt:UYVY8_2X8/640x480 field:interlaced-bt colorspace:smpte170m
		 crop.bounds:(0,0)/640x480
		 crop:(0,0)/640x480]
		-> "csi":0 [ENABLED,IMMUTABLE]

I get the following error when setting up the pipeline:

media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
media-ctl -l "'csi':1 -> 'csi capture':0[1]"
media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/800x480 field:any]"

Opening media device /dev/media0
Enumerating entities
Found 3 entities
Enumerating pads and links
Setting up format UYVY8_2X8 800x480 on pad tw9910 2-0044/0
Unable to set format: No such device or address (-6)
Unable to setup formats: No such device or address (6)

This -6 (ENXIO) error comes from:

tw9910_set_frame() ---> tw9910_mask_set() ---> i2c_smbus_read_byte_data():


static int tw9910_mask_set(struct i2c_client *client, u8 command,
			   u8 mask, u8 set)
{
	s32 val = i2c_smbus_read_byte_data(client, command);

I am able to dump TW9990 registers via i2cdetect and also via the probe
function, so I2C access is OK.

Not sure why I am getting these i2c_smbus_read_byte_data() errors.


Any ideas?

Thanks!


 drivers/media/i2c/tw9910.c | 47 ++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 09f5b3986928..04f3c2dbc1cc 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/videodev2.h>
@@ -928,22 +929,27 @@ static const struct v4l2_subdev_ops tw9910_subdev_ops = {
  * i2c_driver function
  */
 
+static int tw9910_parse_dt(struct i2c_client *client, struct tw9910_priv *priv)
+{
+	priv->info = devm_kzalloc(&client->dev, sizeof(*priv->info), GFP_KERNEL);
+	if (!priv->info)
+		return -ENOMEM;
+
+	/* Use default for now. Will retrieve from dt later */
+	priv->info->mpout = 0;
+	priv->info->buswidth = 8;
+
+	return 0;
+}
+
 static int tw9910_probe(struct i2c_client *client,
 			const struct i2c_device_id *did)
 
 {
 	struct tw9910_priv		*priv;
-	struct tw9910_video_info	*info;
 	struct i2c_adapter		*adapter = client->adapter;
 	int ret;
 
-	if (!client->dev.platform_data) {
-		dev_err(&client->dev, "TW9910: missing platform data!\n");
-		return -EINVAL;
-	}
-
-	info = client->dev.platform_data;
-
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&client->dev,
 			"I2C-Adapter doesn't support I2C_FUNC_SMBUS_BYTE_DATA\n");
@@ -954,7 +960,18 @@ static int tw9910_probe(struct i2c_client *client,
 	if (!priv)
 		return -ENOMEM;
 
-	priv->info = info;
+	if (IS_ENABLED(CONFIG_OF) && client->dev.of_node) {
+		ret = tw9910_parse_dt(client, priv);
+		if (ret < 0) {
+			v4l_err(client, "DT parsing error\n");
+			return ret;
+		}
+	} else if (client->dev.platform_data) {
+		priv->info = client->dev.platform_data;
+	} else {
+		v4l_err(client, "No platform data!\n");
+		return -ENODEV;
+	}
 
 	v4l2_i2c_subdev_init(&priv->subdev, client, &tw9910_subdev_ops);
 
@@ -1007,13 +1024,25 @@ static int tw9910_remove(struct i2c_client *client)
 
 static const struct i2c_device_id tw9910_id[] = {
 	{ "tw9910", 0 },
+	{ "tw9990", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9910_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id tw9910_of_id[] = {
+	{ .compatible = "renesas,tw9910", },
+	{ .compatible = "renesas,tw9990", },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, tw9910_of_id);
+#endif
+
 static struct i2c_driver tw9910_i2c_driver = {
 	.driver = {
 		.name = "tw9910",
+		.of_match_table = of_match_ptr(tw9910_of_id),
 	},
 	.probe    = tw9910_probe,
 	.remove   = tw9910_remove,
-- 
2.25.1

