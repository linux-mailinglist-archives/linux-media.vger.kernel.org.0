Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD28D597A
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 04:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729750AbfJNCJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 22:09:57 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35835 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729494AbfJNCJ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 22:09:56 -0400
Received: by mail-pg1-f196.google.com with SMTP id p30so9154304pgl.2;
        Sun, 13 Oct 2019 19:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkHBk/oYXM6517BAgEL0tKLuS2H0cul0uF9oC7gkoSI=;
        b=g0CNjKkzhyTA61CsKBL3iHOy8nLVAGAa3cJ5rCVNL1BN+SBG/vzrLhjUGkRWjlW/W0
         JYqfPxA6SiW5JscfbYjjGHVZCvtO2L2VsjMdTxS4Dsl4DjKC8ayzmiJQWoTbhBT7D8WE
         1nvvRVtDYtCHKCeL8BGlrTZLFtoh3u5sueL5Vl/vNPFo/McUdpIRVF4gCoIpllmVEvJU
         HRaocmIeVyO8KOnVOBLQcUxlioZMDUmElvLXCmb9oPSEQxijkgkLsFfvDZ9jazraowWd
         3/+Y2aSR5tO2k5Gk4bDv5iiQwuCl8swt9p+GtEtxsxJ+oiySHwRe6POlJwI6CIiyuq9X
         nAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JkHBk/oYXM6517BAgEL0tKLuS2H0cul0uF9oC7gkoSI=;
        b=V/Eom9+6u4QGz881xwyAkKkyDHb9r9lTqrjjONf7SVjRAzMMrPeCQsv0wOUb2Ra1rg
         UVGLygOgDY635Kmw8gnSy7IbQvXRD6pxwbkfIHZT4cIcDns8WogQDqjwYEYOadztS6iP
         nPwudrp3tkM9S5LCbgt62WNJtpGCbz8rBYlBuSnV7PeTcuPQAfghU0ayIwcfh8nU1Kx1
         O0jvAf8bjEPSBbkcOsi8ec5FnFYU35YqoUkRGs72WKP+baC6hR/tIWMlqIL0iW/lUXCs
         Su48sb5Y55dhyVpu8xHbInPfAsod9yzPClaA4+JPOxiIWHU215Lt3V3d2HaHxQ+MV4RT
         0n5w==
X-Gm-Message-State: APjAAAX+132Csx/k5AvVa4ZWGjgtKNBBTFuPy3Q9lRWbgNKH2R1cq9TL
        Y2kfUVdnbGWPO78nsXgQFgM=
X-Google-Smtp-Source: APXvYqyHAW0ZGrxC+x3fqBgDGqyUuLIvlW9MkiUlzXZSZrs3uS94Jw7zBKKzmWK2wSSKmIEzfOXIOw==
X-Received: by 2002:a17:90a:be09:: with SMTP id a9mr8687157pjs.5.1571018996018;
        Sun, 13 Oct 2019 19:09:56 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id q128sm16589880pga.24.2019.10.13.19.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 19:09:55 -0700 (PDT)
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
Subject: [PATCH] media: imx7-mipi-csis: Add a check for devm_regulator_get
Date:   Mon, 14 Oct 2019 10:08:48 +0800
Message-Id: <20191014020847.9203-1-hslester96@gmail.com>
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
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 73d8354e618c..9a07b54c4ab1 100644
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
-- 
2.20.1

