Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8E7DD6475
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 15:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732072AbfJNNye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 09:54:34 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44017 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730477AbfJNNye (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 09:54:34 -0400
Received: by mail-qt1-f195.google.com with SMTP id t20so20186636qtr.10
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2019 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LzVXaohTRKLDsK6yEtEyY1yfr/FV+08hT78+N320IhY=;
        b=VeDBW7H3rA+QUQNsLpin5MN/bZ5NHkNp1SFcSTg13Mldl1emArJpYztJLe6hiUMoyN
         frhMDBjPe939IETYV9tuFddXidx6Oo1m0Duujrzcj8X1H0M9xqNoZ8C7BRw+u9riteAr
         e04ZwJSjT0jL+2GwO2S0LOZWiXHbgdvas4y1c9FGzdDx/myZ8alQCjL0h+XQLD/dydQc
         yEMYxA6v2vAzGxHyJeE7WyNIjoj3ZLTfNQyzAeIuKJjhGorHcgGkzPxJnzrzD9UluzIj
         bVSRptOyoxmBBofurVq53geLMHw7n6v75tzlwF+TSeexUgT0JN1Hz9HvQD3Kwvpp/sFy
         Da9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LzVXaohTRKLDsK6yEtEyY1yfr/FV+08hT78+N320IhY=;
        b=tNgw6pKiBKzzDX6RBRUCyllMU8jZdiQk+RTX3LpZIFC9KJkRg1mZjcbbR0d54901et
         BYTaM5CrSmvrdY77mpLPLdwxFksMqPGisq3p/dbyxVGUVHOVBuMlERwAnjRfXd0sCk2L
         e3a8dVUpJoKvgcVoPmG6EFfDAy4TarxLfbchjAKR7xAFPtDN/qlSYxAVeVwD1vLb7KYl
         N6CmKZ36H9Hh5OV8Ssso89ieY5ZrtnQ2tuLHq8c0vLTG1kNaAlQd3JB9qoeZVVkBkXJO
         nV+5on5rnILMQqYQolmijjdHWwxIXCRykcMKG6RE5c+vAUUTWpHom0sdbg88WmKn7+f+
         +UuQ==
X-Gm-Message-State: APjAAAX1ZW9QgHHrzTLwgX9q75KDMWOr4hpWDxeyXPH3aY1xYykpxc+N
        7xeQofsOjO1LLo2IBMfd5HFdyvQ2GQk=
X-Google-Smtp-Source: APXvYqwKTSE/Y0Dp+86TNF/CAeK1vRCR2mmKcBvAs22WOQcQy1rmD2Cs7py1mgYzpJl7LE+Apgb4AQ==
X-Received: by 2002:ac8:1e89:: with SMTP id c9mr33224504qtm.226.1571061273081;
        Mon, 14 Oct 2019 06:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:99::1])
        by smtp.gmail.com with ESMTPSA id n21sm8501666qka.83.2019.10.14.06.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 06:54:32 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/3] media: imx.rst: Specify the sabreauto variant
Date:   Mon, 14 Oct 2019 10:54:22 -0300
Message-Id: <20191014135424.7000-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve the documentation by specifying that the instructions
are related to the i.MX6Q sabreauto variant.

This avoids confusion if someone follows these steps on a i.MX6DL
sabreauto, which has different numbering on the I2C bus and
I2C muxes.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- New patch

 Documentation/media/v4l-drivers/imx.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 1d7eb8c7bd5c..3d72e411b93d 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -515,10 +515,10 @@ Streaming can then begin independently on the capture device nodes
 be used to select any supported YUV pixelformat on the capture device
 nodes, including planar.
 
-SabreAuto with ADV7180 decoder
-------------------------------
+i.MX6Q SabreAuto with ADV7180 decoder
+-------------------------------------
 
-On the SabreAuto, an on-board ADV7180 SD decoder is connected to the
+On the i.MX6Q SabreAuto, an on-board ADV7180 SD decoder is connected to the
 parallel bus input on the internal video mux to IPU1 CSI0.
 
 The following example configures a pipeline to capture from the ADV7180
-- 
2.17.1

