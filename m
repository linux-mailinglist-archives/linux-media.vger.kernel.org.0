Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAA9326A71
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 00:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhBZXi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 18:38:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhBZXiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 18:38:25 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A145FC061574;
        Fri, 26 Feb 2021 15:37:44 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u4so12523269ljh.6;
        Fri, 26 Feb 2021 15:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KnW56IPe7cM7eCh2ZZGsMpvgk4gpaWE3V70afPWQ50k=;
        b=YE+hUqzismWFru2vRxe7H4amenr3nAgMT4V55nxIYBZbbns49bTGWnKxj84xpqLGqp
         vDUUr9hJZxsIKNKGaUjMQCncBuh5q1yzFWpSAYUsq0sM+FbT7l2ePWtDLGl/VmH2du08
         HJ72ZJgwQpbaXfG/tc8PaZmbXYsNKrOzRDcH8mckQ2WmxRXd5IjuBJWu1Kw4+vd6ZBU2
         9O7VdxHrpiET1aqlNCHOptCEJQeou0n6NwYa4AvumLkHBPBE6e5FsoNjw5/R+fwym5Qn
         iahbYkqrdnr++3yAJasmTATytKQOrdw9x90vlEo+gNTE+oaoRhdELCMzbzfkL6Eqi0NC
         v2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KnW56IPe7cM7eCh2ZZGsMpvgk4gpaWE3V70afPWQ50k=;
        b=ehVL7Urm2ZU3lbS+TUzOGQZ4MoKUZt9olZnOl5TXVgPO6cBJJHRewxL1sIwx8vosCV
         3MAEVlCT+yvthluOkQiErri5NcuiFKQNrwZVVfNSLzpm4+8kGlphFvhfAS85e/Iz+e3k
         Y7H2teeV3uHlN7Y4UcE0ZmSYJany3l7W2Ekq0m48ANif+a5CQZ+zy36Wi/BjYdPdTvTw
         xBoI1jhnE1NgHtE52JYdnLbJ9K5OiJkuOe8ohhgUJK9h8J8rAjsqBW1A/w5YS4K/uV7z
         tJry8VUsgWyw3nY8MLLmESOmhGLje6lCx32LuJbh4sGJOD12C6Bi/+p/0hrpz8dpEEtB
         wZ0Q==
X-Gm-Message-State: AOAM530HSG5eSD8N+JFuPrpA2rJBTW5XXYEqWYEsG9bBuyiJ/9ZZKIHb
        QxNU53zO7DV/10IgTgzD1YM=
X-Google-Smtp-Source: ABdhPJzLDNSCEzlv70+y8aDIfuSk8FCNPbQe8YqbYU1grfhDTgx934bVSuXiss8tvTLFz5V0Lwtxaw==
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr2852883lja.168.1614382657954;
        Fri, 26 Feb 2021 15:37:37 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.59])
        by smtp.gmail.com with ESMTPSA id c13sm1590068ljd.4.2021.02.26.15.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 15:37:37 -0800 (PST)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     hverkuil@xs4all.nl, mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+e7f4c64a4248a0340c37@syzkaller.appspotmail.com
Subject: [PATCH] drivers/media/usb/gspca/stv06xx: fix memory leak
Date:   Sat, 27 Feb 2021 02:37:31 +0300
Message-Id: <20210226233731.614553-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported memory leak in hdcs_probe_1x00()[1].
hdcs_probe_1x00() allocates memory for struct hdcs, but if hdcs_init() fails in gspca_dev_probe2()
this memory becomes leaked.

int gspca_dev_probe2(struct usb_interface *intf,
		const struct usb_device_id *id,
		const struct sd_desc *sd_desc,
		int dev_size,
		struct module *module)
{
...

	ret = sd_desc->config(gspca_dev, id);
	if (ret < 0)
		goto out;
	ret = sd_desc->init(gspca_dev);
	if (ret < 0)
		goto out;
...
out:
	if (gspca_dev->input_dev)
		input_unregister_device(gspca_dev->input_dev);
	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
	v4l2_device_unregister(&gspca_dev->v4l2_dev);
	kfree(gspca_dev->usb_buf);
	kfree(gspca_dev);
	return ret;
}

Reported-by: syzbot+e7f4c64a4248a0340c37@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Change-Id: Ia198671177ee346de61780813025110c7c491d7a
---
 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
index 5a47dcbf1c8e..24df13b33a02 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
@@ -485,7 +485,7 @@ static int hdcs_init(struct sd *sd)
 					   stv_bridge_init[i][1]);
 	}
 	if (err < 0)
-		return err;
+		goto error;
 
 	/* sensor soft reset */
 	hdcs_reset(sd);
@@ -496,12 +496,12 @@ static int hdcs_init(struct sd *sd)
 					     stv_sensor_init[i][1]);
 	}
 	if (err < 0)
-		return err;
+		goto error;
 
 	/* Enable continuous frame capture, bit 2: stop when frame complete */
 	err = stv06xx_write_sensor(sd, HDCS_REG_CONFIG(sd), BIT(3));
 	if (err < 0)
-		return err;
+		goto error;
 
 	/* Set PGA sample duration
 	(was 0x7E for the STV602, but caused slow framerate with HDCS-1020) */
@@ -512,9 +512,13 @@ static int hdcs_init(struct sd *sd)
 		err = stv06xx_write_sensor(sd, HDCS_TCTRL,
 				(HDCS_ADC_START_SIG_DUR << 5) | hdcs->psmp);
 	if (err < 0)
-		return err;
+		goto error;
 
 	return hdcs_set_size(sd, hdcs->array.width, hdcs->array.height);
+
+error:
+	kfree(hdcs);
+	return err;
 }
 
 static int hdcs_dump(struct sd *sd)
-- 
2.25.1

