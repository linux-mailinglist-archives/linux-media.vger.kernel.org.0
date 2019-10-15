Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524EED77D2
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 15:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbfJON7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 09:59:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45792 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728880AbfJON7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 09:59:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so11021772pgj.12;
        Tue, 15 Oct 2019 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OQHiqCpXSZVn47ppjdn/hXFH8fLHSyXwnH+G+uWWB+o=;
        b=PG4f7wI6q1dk3mWzLjlecyFFuvz+MvCpjU3+a7kNFzGR7+KG8pztW0pVXuGsU77+pv
         Tg8rtN7LMGYs4zKs5btLmvUm9LQLkZFr1ldniygmnAf3ZgCm9oFHL6dB761IEtafw71x
         r3p2EZl05GyvwaCibRuHibodBjLm20HnBo6IOoMtdRGvCnJioNod0RqSRazny9zmXdhC
         Uny2R0HlAZj0hbtVf7G6mF+mVYMM3XRrXP+dOS/N5qdk8e4e5Kl+fi2fD7iP3JkslAfb
         w3FCwwCDNbH/NTKTNlx57+tap11uYFOB8Lf2DKSvM/LBpQb/kx/Wf/o/vIupQc7uS0MP
         DnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OQHiqCpXSZVn47ppjdn/hXFH8fLHSyXwnH+G+uWWB+o=;
        b=Z5oifoVmYrONmFabLHNvCrsBTYk6cavgt3QHasbvhnRV0LXHcvUB4IlnE4i9Z5FVnC
         cnYQhvt4+aqrXTwezx6OV/1MeJdRdNVLYf5Sgpvo19LfsGkRwSPq7/qFnvggDJMIIJ8/
         i7XbKdrTnqpBC53YuHDJgRJn9mANkcRhvYHG9TWm8qfi4mtbOhzITrV0+vnsbCvbxY29
         nY3eFz1cgsZ4FNnwfHSNVFBqMuYUIGe42KJlzfgZaR1JDu6I7aiTaUkTP8l5Zn//Pf4M
         wRm8IOAu3ItlTNE/SPkXNlGF+eALvN/bz2H5h0/Rn2RKNyMdpsgQonO1ALD9TyQWiqxr
         +7XA==
X-Gm-Message-State: APjAAAVqhsKLjaVZT5fgaCAsGScQDDBn0BzY9wOdxeWc0pO6ODfJuhDQ
        DOdG7bzSDiYWQJ8DqITE7m4=
X-Google-Smtp-Source: APXvYqyXWaPbhXkHRvEhA4Oc8Ytcwswmvg4C2Aw1yEvsNR9Wkx6j5txbHhxZQ54W+B9d7pRnyjZ1/g==
X-Received: by 2002:a17:90a:1617:: with SMTP id n23mr43135972pja.75.1571147976272;
        Tue, 15 Oct 2019 06:59:36 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id m123sm24503127pfb.133.2019.10.15.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 06:59:35 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: imx7-mipi-csis: Add a check for devm_regulator_get
Date:   Tue, 15 Oct 2019 21:59:15 +0800
Message-Id: <20191015135915.6530-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

devm_regulator_get may return an error but mipi_csis_phy_init misses
a check for it.
This may lead to problems when regulator_set_voltage uses the unchecked
pointer.
This patch adds a check for devm_regulator_get to avoid potential risk.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Add a check in mipi_csis_probe for the modified mipi_csis_phy_init.

 drivers/staging/media/imx/imx7-mipi-csis.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 73d8354e618c..e8a6acaa969e 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -350,6 +350,8 @@ static void mipi_csis_sw_reset(struct csi_state *state)
 static int mipi_csis_phy_init(struct csi_state *state)
 {
 	state->mipi_phy_regulator = devm_regulator_get(state->dev, "phy");
+	if (IS_ERR(state->mipi_phy_regulator))
+		return PTR_ERR(state->mipi_phy_regulator);
 
 	return regulator_set_voltage(state->mipi_phy_regulator, 1000000,
 				     1000000);
@@ -966,7 +968,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	mipi_csis_phy_init(state);
+	ret = mipi_csis_phy_init(state);
+	if (ret < 0)
+		return ret;
+
 	mipi_csis_phy_reset(state);
 
 	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.20.1

