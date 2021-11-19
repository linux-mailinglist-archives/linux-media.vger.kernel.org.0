Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1C04579B2
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 00:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbhKSXr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 18:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhKSXr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 18:47:26 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE16AC061574;
        Fri, 19 Nov 2021 15:44:23 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id u3so50234022lfl.2;
        Fri, 19 Nov 2021 15:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z01Nm/uJionEF6iWPBA/6cDelagndbdDz8b9kVgbqMA=;
        b=XZlD7wScteS3LGMdCBtHhTXCNaGwQQmPVotVuQyFKiLlDuHchPbV1VNng3Z8zEl7PC
         o31YdgCjGw/jz5xmdDO0fFZ3EEfEh4HzDkcxid4QRg470MMFGvRaWw5kA4ulBJylhVNk
         UnREdtodvMD8N6ql8t0Zd+usYImXnGQXFDaoDNR/RWKTaTOSaREI9+4L6klEth504G+x
         PnQcrpU8grzH61ptVKbmB7lRv34vrHGC28Nq1DEFJRGQzH59zGmQzSOO2wFXI72FAaZO
         G1ht9NTKgxl8BPOqYFTWaIyDQz0XO3CbeRwF7l/88z1g2A7gb2KF3Hrt4rNh7vYPtwXj
         NdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z01Nm/uJionEF6iWPBA/6cDelagndbdDz8b9kVgbqMA=;
        b=OUXmpzqCVt6oLtb+DZPbZTCvUmgioDo5hhniEMtz3B8otjvAGTQqCem5ymAU7Nzn9i
         9HppPP1cQRSTmghtgwmGK4Nwf4L4nyIR8EPox83p9wdrHpKq69XXvmz0dZG52Ag3kTCB
         wGPDIHWAYQePOYS8haxnyYNg8+LOqxFEq1qfClev4YwYR/lF8AqwBz+SIpGI5OcGnFdm
         VUKKOGjR1bWBirKcO04HPGFWhQ99nHgI9MOj9OYoKpoEr/B5rAv8Mu7VLSMzSGqAxn+J
         u8S1ZBboDgMHSXJDR09MRDVIYLxGYBCPcwolY7xRzAIDhgQn774t2fK0EWBL8ZwHUZMj
         71Ig==
X-Gm-Message-State: AOAM530MiPjlJepqi13eAcDJ9o6WJy5nos21J7DcNoJPdzaBL2tvsmfB
        reteBIB5poxq0oeaTGfK9xo=
X-Google-Smtp-Source: ABdhPJyEbkKy31LFg3n0D4oycVEMHQdxEop387GRRfuQVq36MKXtqQ540xVMHHDVhNlSj/h8lRN8yA==
X-Received: by 2002:a05:6512:1051:: with SMTP id c17mr38649188lfb.35.1637365462137;
        Fri, 19 Nov 2021 15:44:22 -0800 (PST)
Received: from Taras.localdomain (d130-188.icpnet.pl. [109.173.130.188])
        by smtp.gmail.com with ESMTPSA id u23sm129630lfo.35.2021.11.19.15.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 15:44:21 -0800 (PST)
From:   Daniel Kamil Kozar <dkk089@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Daniel Kamil Kozar <dkk089@gmail.com>
Subject: [PATCH] Print chip type explicitly when loading the Rafael Micro r820t module
Date:   Sat, 20 Nov 2021 00:44:01 +0100
Message-Id: <20211119234401.271193-1-dkk089@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The module currently prints only "Rafael Micro r820t successfully
identified" when successfully loaded, which might be misleading as the
module actually supports various chip types.

Signed-off-by: Daniel Kamil Kozar <dkk089@gmail.com>
---
 drivers/media/tuners/r820t.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/r820t.c b/drivers/media/tuners/r820t.c
index aed2f130e..ce03fd33d 100644
--- a/drivers/media/tuners/r820t.c
+++ b/drivers/media/tuners/r820t.c
@@ -326,6 +326,26 @@ static int r820t_xtal_capacitor[][2] = {
 	{ 0x10, XTAL_HIGH_CAP_0P },
 };
 
+static const char *r820t_chip_enum_to_str(enum r820t_chip chip)
+{
+	switch (chip) {
+	case CHIP_R820T:
+		return "R820T";
+	case CHIP_R620D:
+		return "R620D";
+	case CHIP_R828D:
+		return "R828D";
+	case CHIP_R828:
+		return "R828";
+	case CHIP_R828S:
+		return "R828S";
+	case CHIP_R820C:
+		return "R820C";
+	default:
+		return "<unknown>";
+	}
+}
+
 /*
  * I2C read/write code and shadow registers logic
  */
@@ -2355,7 +2375,9 @@ struct dvb_frontend *r820t_attach(struct dvb_frontend *fe,
 	if (rc < 0)
 		goto err;
 
-	tuner_info("Rafael Micro r820t successfully identified\n");
+	tuner_info(
+		"Rafael Micro r820t successfully identified, chip type : %s\n",
+		r820t_chip_enum_to_str(cfg->rafael_chip));
 
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 0);
-- 
2.34.0

