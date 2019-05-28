Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A26FB2CB86
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfE1QPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:15:00 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33954 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfE1QPA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:15:00 -0400
Received: by mail-wr1-f66.google.com with SMTP id f8so20931112wrt.1;
        Tue, 28 May 2019 09:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9liOXPsd3FXJL6A6hHO3yEhmEbo+emmwpujmCXjpXw=;
        b=lAN3nk6BcHTbA9hMqBoHlaoQPbKumXQmvaUsGmEFMfU70ngnOsGFbtxDiXJ/AGLxdd
         r64/kh3ayQTPIo1NbUam1LmsoDMXpnfp3dcES4XvY6BJ0gUAkIJxKzg5mMinPhqLMURP
         mdSUts6La6ZEXMbjHG3ZmL990Dg+qwKXAwTyOiCUTO0U2a/s83bMNsxjIHrgaqHU7g2w
         c3p3pOG+rE+pbwKUza5raE0oZkhVH0tKue27/UAVCxXqG9gd4erZhDAu0R1wZpT69/P5
         qBPZh90AzOXpSvmmaU3GY3RtviSoxy00Uty0qlqh4fiZUtvu5FBHz53RSuoLoCtw9zgq
         xHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9liOXPsd3FXJL6A6hHO3yEhmEbo+emmwpujmCXjpXw=;
        b=b8xU+yNAyLdTIZCefRNRBLjK3W1KoxJvr+gBX+5HybtYeQ9qgwfsz1a6NXGJmUCCM/
         MOS6vNGot20M839NzX9liHsEGXDqLODdm5tE6WuF0A43wrIaCAr+Xezg0wk/6g6qh0Pi
         Y4ImSRKToHFHMLPHuPUFZuI7BmwFS62ZRuw8R4FYSAzbffpLlxdNAp860XDP6snr1U/7
         BgIIH3MgX4p3U57gaqiJ1cY3fPzu2EJKlotzYuYWlyiYmpLh4gJrxmdrvy7R5UMiUkAC
         RjDl15i0PzYVxNurMxGgB3fBOQXVPWA1mwOd/cbqVPb6RjEP+H19GybJZimllNAB5G1R
         RjZg==
X-Gm-Message-State: APjAAAWEIT9l87Bi5cjSC4NE6KmyH1V9Tk1cBzo+aDSfNw3oypRQrITq
        Mns33p6ax8qdX+wGCK8yNXA=
X-Google-Smtp-Source: APXvYqxkXdupOTx0Qvelttq93DUjprFEtCpp13vAvBO1yy2nKVU/gZJzkZwaLYnnuYy/Zv8kLSXzaQ==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr4091897wrm.174.1559060098168;
        Tue, 28 May 2019 09:14:58 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.14.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:14:57 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 03/12] media: rc: sunxi: Add A31 compatible
Date:   Tue, 28 May 2019 18:14:31 +0200
Message-Id: <20190528161440.27172-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
References: <20190528161440.27172-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwiner A31 has a different memory mapping so add the compatible
we will need it later.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index d02dcb6fd0a5..0504ebfc831f 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -343,6 +343,11 @@ static const struct sunxi_ir_quirks sun5i_a13_ir_quirks = {
 	.fifo_size = 64,
 };
 
+static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
+	.has_reset = true,
+	.fifo_size = 64,
+};
+
 static const struct of_device_id sunxi_ir_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-ir",
@@ -352,6 +357,10 @@ static const struct of_device_id sunxi_ir_match[] = {
 		.compatible = "allwinner,sun5i-a13-ir",
 		.data = &sun5i_a13_ir_quirks,
 	},
+	{
+		.compatible = "allwinner,sun6i-a31-ir",
+		.data = &sun6i_a31_ir_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
-- 
2.20.1

