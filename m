Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5521CD7AB2
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731373AbfJOQAy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:00:54 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37082 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfJOQAy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:00:54 -0400
Received: by mail-qt1-f195.google.com with SMTP id n17so11927121qtr.4
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nVqrz98oY1dHStSXJAO5WqcsucAEGj9JBq48FimaBIM=;
        b=GSwutxy+g9Ss/nhDDGLKgNoGwBrg9T87PpYKN9tX8QKmIwninaAJMVekvN5VLgYsNC
         C4DN8A0hTDi7D0ID145X/vu7Ino6pO3prhzCJxlQU5LYaT0o79XZzVUnBkUGcgIpkSSk
         V+YHKh7wwbYLfwJgrHVz4GAGL/tiZ+8nGpHE8HVvWQYC/Yh1+K9MkPeSnuOMqBXhHD6Y
         RdQxe6Ot6jISnONG9xRZ7EkpR8ZveS5hJwKw+DdqLlEdgdf4Zw1+xlyYrDIS1JdDBxkw
         GSWQizy5wEF199eRWeuw1RZBqSZVbcZEaHzCM1D4TsKMz08hKbpnpuGe8ujrtA/8pSSd
         5euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nVqrz98oY1dHStSXJAO5WqcsucAEGj9JBq48FimaBIM=;
        b=M4t2DtAmPJnPioMC5V7oVVUC4SfR3DfNvPwNT97nY/8onkY9CwzCvu33XqXIsqpGKe
         m8lRCm9obYzuYlN8F1qQi1NAWGytalv6BuCtW2Vg9PFSOQPMLJDtbjHL3gvFRV00xd4W
         G4X+1/5oPDbNqb2zsDRX5Plg9YmGDno5MLlU2u5z+D20sRQFvgMIRbhciSZ4wQgz7Pkm
         53XMewZxhSAc1/lKgghumlSNh4CX7U8JwHsmiy4ZYUYQ4MghHACi44IiPXTLL9jCxwUX
         v+sphJ3DrNZXsc9LGBFRALqjFV+FvJr/3eySkT/+sKJ85AQLqFeaY1Sjp5EKhxv8NNFA
         Hq0Q==
X-Gm-Message-State: APjAAAWvszlRDQ+LNAPvh5DvG3rk33nrCxTZuaqQNwMUWhXzgLyu6t7j
        PyQhz38fFqq9GPjQenGwC9LBHdFdTUw=
X-Google-Smtp-Source: APXvYqz5kp1WrsvNQ0Jx5kCJLKbGEMCbrlA2o4LpvKD8sTBekXEpAq+Fiw7aJQWHmJ4gXRY/WZg8kg==
X-Received: by 2002:ac8:6793:: with SMTP id b19mr6768151qtp.354.1571155253043;
        Tue, 15 Oct 2019 09:00:53 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id n21sm10304930qka.83.2019.10.15.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:00:52 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, slongerbeam@gmail.com, tharvey@gateworks.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 1/4] media: imx.rst: Specify the sabreauto variant
Date:   Tue, 15 Oct 2019 13:00:39 -0300
Message-Id: <20191015160042.28113-1-festevam@gmail.com>
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
Acked-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes since v2:
- None

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

