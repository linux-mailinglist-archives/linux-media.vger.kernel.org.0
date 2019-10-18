Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1690BDBB5F
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 03:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409490AbfJRBrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 21:47:14 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42483 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388373AbfJRBrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 21:47:14 -0400
Received: by mail-pl1-f193.google.com with SMTP id g9so715685plj.9;
        Thu, 17 Oct 2019 18:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2kk7X005Ar2BFdxRKCbKY/I/VGc2KKAT5TivkNAg7sM=;
        b=sbc6VoK/nFyBVX7DSlpC61TBuhJOkiBVDT/Gy1dnbRXQqVZ0e3/3y0T6l2cVyCkq7k
         DUqGL205d7n3RtmxJATfffvi9cRSCBNd9tSDLGlRaaOmYbhhI3B7zDJQTjcMq3SMzEpT
         74axVvPexEy7WoTOv6hF2aPCh+dzJFFhije6+mQf9t72Rt5hyCXYGKzcJWpql8R5NwhX
         f+XznsUtV9WpTURwwncV32ZUlq8bqXziPnI7exoCDX1zCUfyUxJ5ouqhWpqw+1rXli0n
         DxmG39nf4lMxSZfsZlF6z0Y4u6h9ePPajTh01xoFWwhbbfEHBlBIOJkhSdBKmTODRF+E
         sbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2kk7X005Ar2BFdxRKCbKY/I/VGc2KKAT5TivkNAg7sM=;
        b=hBUPaUViNJEMfHk2fE2hrsp02pMi2yUzo6/aj912r+EYUvEynVUVQQaXQ9hdPrVvIo
         2c6ZIGYugjJO2UyC/aq+ZnS5ARvt3cIdiuzl+5cYdjOKOQYiK4/n/pabEN6yN1E3VrXP
         58NBss0xao3zvK8r91BejCiIS31V4dtIJHPmanZ5uDXI1blcdsNf0FYkQyIwwHme7aJz
         06Z8qKJWIT+Iagc/JhniHIkmYGUCvf+RzVaYUmuJPoiICpoWoL6lgio2Qui0wehgV8Lu
         XLr4Td+Mx3Q5tfvDZqg4EN1nyGNcTGgMqO8CHCHxHwW+lNubdwyNwlZsdXxxpqNqo2/c
         0qjw==
X-Gm-Message-State: APjAAAWLjRu5h6Gh7iIfeQmsnFPtOiBEDPt+5iPSLu/zXvKig1Jbb1J2
        6EeY6H0CD9mXdBi29IteY4c=
X-Google-Smtp-Source: APXvYqyDUNt8gGK8WNdUqQFb983SiqbyJ94aZR3YaoW2t14EgEkAXtJ1ymDDnE3+GduXuoG0ejV3UQ==
X-Received: by 2002:a17:902:6b4c:: with SMTP id g12mr7242573plt.78.1571363231542;
        Thu, 17 Oct 2019 18:47:11 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id p1sm3812633pfb.112.2019.10.17.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 18:47:10 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Mickael Guene <mickael.guene@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: st-mipid02: add a check for devm_gpiod_get_optional
Date:   Fri, 18 Oct 2019 09:46:56 +0800
Message-Id: <20191018014656.5563-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mipid02_probe misses a check for devm_gpiod_get_optional and may miss
the failure.
Add a check to fix the problem.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Add an error message.

 drivers/media/i2c/st-mipid02.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 81285b8d5cfb..003ba22334cd 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -971,6 +971,11 @@ static int mipid02_probe(struct i2c_client *client)
 	bridge->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 
+	if (IS_ERR(bridge->reset_gpio)) {
+		dev_err(dev, "failed to get reset GPIO\n");
+		return PTR_ERR(bridge->reset_gpio);
+	}
+
 	ret = mipid02_get_regulators(bridge);
 	if (ret) {
 		dev_err(dev, "failed to get regulators %d", ret);
-- 
2.20.1

