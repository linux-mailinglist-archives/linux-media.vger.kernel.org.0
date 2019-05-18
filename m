Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E643E22449
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 19:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbfERRi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 May 2019 13:38:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44152 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfERRi7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 May 2019 13:38:59 -0400
Received: by mail-pf1-f195.google.com with SMTP id g9so5181805pfo.11;
        Sat, 18 May 2019 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=K1nkYGLmXxVZQrJhOHX5C3Yjum/GvkV8x/L+QphEw5Y=;
        b=VKIycHZ8mOTyhdoH7w67rLsEBUiN8FjSJtD8i98oTd0bVeMq1TDnxyqD+Tygrf5cox
         9RQ01OJDPB9SDuyvZoJiYiW9YK5caCd1M4OnP2jgDDehk5/UIlpfbguJZbhuf1H0wtpi
         7oneN1VrKDPSvo+EkvYw7LvLpp/41+8KiYYbaHPLa/DwrTg4Dw7ZHRafxwmsoXLrd3XM
         +zo7nFPrpU75JFHCRy/2iuZh0Vj9wcv+0NX+GBsjQE7UJXd+160+tZiOVYc7sBP2lOMk
         JcyKKbDq8LNU3STX2N0RYwfijfnAF3UAmCvNun6JT3NES8wxeZ56uXtr+IGco0xvP/qn
         8LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=K1nkYGLmXxVZQrJhOHX5C3Yjum/GvkV8x/L+QphEw5Y=;
        b=DDVL7JkVONqEGU6l/wVLqILT/NpmOvi/Jr6TgB+RbrrPLlMCFqoISv66alpHyor5Cv
         +3+MXXEfjqoiOcD6LHS47YmdsNiXJ/9UBwfhwaLL5tKXRTBNV7u6QBx2VSDl7f8oguO9
         zFufVNtotZIAckvEvV3qj383zeaARYxVsNvotU6XbjfdkYRkN9S+ShMiVAeafIZWd336
         M8BI4vn8aX4QUrvVLFkWzcycmwcsndd8flCJ5pKkGeINvHHAuM2wusMZnvybJQ4H/WUZ
         rU/yvcEOL5EcgDfHYjQCPoVm3gEHFo2HquLyHPD4x4UbSKML8LWJ4JtSP92BVgucs5dD
         ZFgw==
X-Gm-Message-State: APjAAAWWjgCiuIbfBUxpERVQCoQoD5wzNxgTr0M2K4KKC+pylR01Qg9b
        00i/rMUPbAWbYyo0/FjYBWw=
X-Google-Smtp-Source: APXvYqzl9xVBK5tVB4brfCl3wCx/KY1AhgMnASNhuGFaPw+Hu5UPrOmG3gj5xYZHLy+UhgU9oGwz/Q==
X-Received: by 2002:a63:c5b:: with SMTP id 27mr13696567pgm.70.1558201138477;
        Sat, 18 May 2019 10:38:58 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
        by smtp.gmail.com with ESMTPSA id y16sm23283514pfo.133.2019.05.18.10.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 10:38:58 -0700 (PDT)
Date:   Sat, 18 May 2019 23:08:52 +0530
From:   Hariprasad Kelam <hariprasad.kelam@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: imx: fix Unneeded variable: "ret". Return "0"
Message-ID: <20190518173852.GA1191@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fix below warning reported by  coccichec

drivers/staging/media/imx/imx-media-capture.c:617:5-8: Unneeded
variable: "ret". Return "0" on line 630

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 9430c83..b678857 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -614,7 +614,6 @@ static int capture_release(struct file *file)
 	struct capture_priv *priv = video_drvdata(file);
 	struct video_device *vfd = priv->vdev.vfd;
 	struct vb2_queue *vq = &priv->q;
-	int ret = 0;
 
 	mutex_lock(&priv->mutex);
 
@@ -627,7 +626,7 @@ static int capture_release(struct file *file)
 
 	v4l2_fh_release(file);
 	mutex_unlock(&priv->mutex);
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_file_operations capture_fops = {
-- 
2.7.4

