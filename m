Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACFF3203C
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 19:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfFARvo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 13:51:44 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33646 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFARvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 13:51:44 -0400
Received: by mail-qt1-f195.google.com with SMTP id 14so4985107qtf.0
        for <linux-media@vger.kernel.org>; Sat, 01 Jun 2019 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RdduJKj2trEmgoT+DdzB//Cnls3cdUZxQ17xflBYkFw=;
        b=r/uAG6FiPAwZoo9zCfDolgFJK+vazEzAEbtRJ5F8X7kgyCwpx6hRWxTjxQKDV/yiyq
         e8Chj3C+ywJoU6QTTnZI1Wp+zH3G4Rmm7Y4x1kK1ibM3DQn4Ru65CVihcEq6y9PnzHvc
         Ni5gyh4VAomUV6ZdX5XCN/gK7uWVxfh6nx9z3xfpz5O2qKa8ysUsd0Ahj7uZd7iKE2El
         0by+eCSJ7nIT5m3oDXMKv7Ec1yUclEv7Cr43nGQk3iBsmSY0b9zCxiecS0RbTW00bqUL
         yNwtD83HEGEHzz11ONr6FuGxgpZjw0uXgtqgehGL5WU5cUIcRYNU4IylTzYv23DJZehW
         vb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RdduJKj2trEmgoT+DdzB//Cnls3cdUZxQ17xflBYkFw=;
        b=dfPj+VsGWm4g4S8kNpinMcdxVFig3/RfIiFmhtHvWSSFHqY3liq9IKBXWossoIwBzf
         uz8oaBXBWxZB+shIQmFRdNvTxAjsNZjZCTgrmRUHwV9ek/rysA/wCH9tkzE3qMI6UR26
         SB8cmX5MMshDMOSSxsfb8HTeeZe4Go8+gd8+nQ1iPPMNe9Dum3f93fhSY/sq+pHqWU/b
         VoUMs7URcv4D9g66MzvdYNaPqtgM/enZ0ZG6PkGOQXJ4SUg6ud/92OSW6XGyAsLKCziQ
         4T+buYqBYC9vdS8UmEbU+jVNPLQ6mOUSXHXdZAbUVzgpBeAdWVQ/JA3Zapxh0UZ0tmie
         ROvQ==
X-Gm-Message-State: APjAAAXBqamSwUGZv3aaldA72fiqZ7A4LimiCjypAo0FIkhSAloQsG1Y
        w5IDHr8xTPeR8UbmOWPVVPc=
X-Google-Smtp-Source: APXvYqw43sZUlXlMdFVeniixc4MneF8mLjjXI2+qkhbzAWVgkSBZ2wyJ3Dl4iXMa6U2/yRI3NoVocQ==
X-Received: by 2002:a0c:986e:: with SMTP id e43mr14867334qvd.78.1559411503372;
        Sat, 01 Jun 2019 10:51:43 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id v8sm1558977qkj.77.2019.06.01.10.51.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 10:51:42 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rmfrfs@gmail.com, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] media: imx7-media-csi: Use functions instead of macros
Date:   Sat,  1 Jun 2019 14:51:38 -0300
Message-Id: <20190601175140.16305-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently there is a macro for reading and another macro for writing
to the CSI registers.

Functions can do parameter type checking, which leads to a safer code,
so switch from macro to function implementation.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b1af8694899e..8abdf253696d 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -195,10 +195,16 @@ struct imx7_csi {
 	struct completion last_eof_completion;
 };
 
-#define imx7_csi_reg_read(_csi, _offset) \
-	__raw_readl((_csi)->regbase + (_offset))
-#define imx7_csi_reg_write(_csi, _val, _offset) \
-	__raw_writel(_val, (_csi)->regbase + (_offset))
+static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
+{
+	return readl(csi->regbase + offset);
+}
+
+static void imx7_csi_reg_write(struct imx7_csi *csi, unsigned int value,
+			       unsigned int offset)
+{
+	writel(value, csi->regbase + offset);
+}
 
 static void imx7_csi_hw_reset(struct imx7_csi *csi)
 {
-- 
2.17.1

