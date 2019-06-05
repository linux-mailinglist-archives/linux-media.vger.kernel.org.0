Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C8E35512
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 03:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfFEBuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 21:50:02 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42779 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfFEBuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 21:50:02 -0400
Received: by mail-pl1-f193.google.com with SMTP id go2so9063155plb.9;
        Tue, 04 Jun 2019 18:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=oLcbN+sqNNUljN8SYZgZre8PT46JsMzRtoXG7+KZZ+Y=;
        b=D2ZhmDd8IgeO63b01TNQ6LlzGQoxkyA0e0DSkKG6rrnq3Q4IhVICRMbR0WZh34tEpd
         shqUkEkW3hE+q7G5/w0BQZK2RtZYd/at1/P4uPuF7moMYapZZiy5Q3b4CwI6W8j7+r8c
         OOIOTfogtwO+PbWsYPWQ1X9CNyb+PRMy3ziRqBpFun2YzTqTT5RhAnhmLsv4Mfj278CK
         H+1/DP8+9calXzBJcBRKUKvIT/mYf3fAoKTxTzmGmlovv5K1MVqkc2yV5ge93FeiIQaS
         aFBC9is2Zz0zeLbaoFxDZ8r+nwiFUOkI8AYPgenrJSLsf9+HcU3dYAv9umK4oAXEAtfs
         LuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=oLcbN+sqNNUljN8SYZgZre8PT46JsMzRtoXG7+KZZ+Y=;
        b=n2xHymxmRKXn9+iMIY7VBhnesucC1WKI3zmUbtHJkGNrWTlVYhSS60ZcR16L1tAtEC
         xJ7qKInPcIWHfy5owySCMNiEg+HX+YPp3JloR5arRkx8hCs2iU5oUAMQVZRN+J2r2R90
         oKfs6q4f6aCxfR4T8BZ8JATE3OCn016/0jDDO97yOu1p8Pxl2cWRhmKcJ8Hw0s7NJ3ON
         qx0LUJ44q97ArcSD9WtHWtbXj69SfD12n93GTkimPt1rVdV/lY8s6AOkGTl4PI1L/oIo
         tubn50Q5+uyKk28NmVsvufuh5vGKyNp973VhDBBuEmqS0vSGpk3CZooLHhfdK8YAJb2o
         ISwA==
X-Gm-Message-State: APjAAAWMQalEnQwsObgvFc7E7lTveVruyymBZVP/ssZW2Rh/WQOQFmeq
        HQzgJN28j0hIpdZc88NyBHc=
X-Google-Smtp-Source: APXvYqyyBoxg5MuZwMd4gEFNxoBQznN4qlivJRyMCm3oDum4O+DVprxx7d0aKb+vDLAWAI8dNK5ysw==
X-Received: by 2002:a17:902:b201:: with SMTP id t1mr40607734plr.328.1559699401652;
        Tue, 04 Jun 2019 18:50:01 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
        by smtp.gmail.com with ESMTPSA id p6sm6884415pfp.88.2019.06.04.18.49.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 18:50:00 -0700 (PDT)
Date:   Tue, 4 Jun 2019 18:49:58 -0700
From:   Shobhit Kukreti <shobhitkukreti@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     shobhitkukreti@gmail.com
Subject: [PATCH] media: platform: Fix Warning of Unneeded Semicolon reported
 by coccicheck
Message-ID: <20190605014955.GA3077@t-1000>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fixed the warning in the files below

drivers/media/platform/pxa_camera.c:1391:2-3: Unneeded semicolon
drivers/media/platform/qcom/venus/vdec_ctrls.c:78:2-3: Unneeded semicolon
drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c:146:3-4: Unneeded semicolon

Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
---
 drivers/media/platform/pxa_camera.c                  | 2 +-
 drivers/media/platform/qcom/venus/vdec_ctrls.c       | 2 +-
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 6addc5e..1c9bfaa 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -1388,7 +1388,7 @@ static int pxa_buffer_init(struct pxa_camera_dev *pcdev,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 	buf->nb_planes = nb_channels;
 
 	ret = sg_split(sgt->sgl, sgt->nents, 0, nb_channels,
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index f4604b0..90f7620 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -75,7 +75,7 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	return 0;
 }
diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
index 075d469..a79250a 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
@@ -143,7 +143,7 @@ int c8sectpfe_frontend_attach(struct dvb_frontend **fe,
 				"%s: stv0367ter_attach failed for NIM card %s\n"
 				, __func__, dvb_card_str(tsin->dvb_card));
 			return -ENODEV;
-		};
+		}
 
 		/*
 		 * init the demod so that i2c gate_ctrl
@@ -203,7 +203,7 @@ int c8sectpfe_frontend_attach(struct dvb_frontend **fe,
 				"%s: stv6110x_attach failed for NIM card %s\n"
 				, __func__, dvb_card_str(tsin->dvb_card));
 			return -ENODEV;
-		};
+		}
 
 		stv090x_config.tuner_init = fe2->tuner_init;
 		stv090x_config.tuner_set_mode = fe2->tuner_set_mode;
-- 
2.7.4

