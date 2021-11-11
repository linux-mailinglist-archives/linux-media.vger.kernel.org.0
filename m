Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EECD44D9EE
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhKKQLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbhKKQLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:46 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAF0C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:56 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so4779552wmd.1
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRpNVGa1JbcZn1FKX6AjH+HRmVh5j5nACRnygN1F+XI=;
        b=NQfOKW7XOn0+EwhcuS7ACqh+hDRehzcWEiPerjuMUZF9JKmhvhY0IhwoOBMobmJmuv
         JOtSYKhM40y3Zs8lxKFumef/r0FDLhgembwBp3H/YigaverYSH2iLi4KkibXvEUn5ZXN
         SlS0QjLd2PkOa+Fdk4Bt1YhAjc+cDtDwEQzYpZSPXPVv5jQVZSq+tBUed+Nzdftue5V4
         /CW7GovlZmx/7ZmIysb9ucN3R348J2JLwDhVnsNbJ6yLxaWkOX4rFLjKPJ8B152AcF/N
         8Rf0GJ2bOJUj5JDRSL7I4o4JWSu49Z628vaaeWQpA/m4uoROlsSSCloZ3a9xau7FvlAT
         mGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRpNVGa1JbcZn1FKX6AjH+HRmVh5j5nACRnygN1F+XI=;
        b=DO8OmeiLmnYC0YNDNgdcnYhuzk1aApOXKLy2d68o0eBRbYqn+iPojyOpy/NdTtwjDK
         +b8QBiw4mPAGOnPhiAFOTljHUS7A+TcWQbNrNM+e4xpIEX0YOPWbaAtxobfl6cPqzInz
         /vUBZpWCKGXPGPZwi//OPzmAWL5bdGH9pQlrQY7TtOpJnbsGhUEj41Fyg0dGxuv0sav+
         muPH+gAmv9TABYPkZ1Xp4iPeda0o5CgIpbZruTtXpZLBsXH1hHzbS5poF7RKZeGy67i7
         UKYaOYcYP+oQVa5vL92YfTlB1vQauxwRy+6EVM4TFrTwEoIaCgRD3tN0/H4PyvRF3tV6
         rjbQ==
X-Gm-Message-State: AOAM532lJymsyq/58WPKaFCZGR8oQUp1QzVZ1kYD8P70j21skmHCUj7g
        XdZarFm2JMrLPz/D4hTbSLJM/w==
X-Google-Smtp-Source: ABdhPJwDddESTHpYVDH7YIYAf8bjpXZHjUXY04Y2k0BQzt783Gp41DvJG+Cxb6U7+T0nyC8a63qkXw==
X-Received: by 2002:a1c:183:: with SMTP id 125mr9765401wmb.0.1636646935272;
        Thu, 11 Nov 2021 08:08:55 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:54 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 13/18] media: camss: vfe-170: fix "VFE halt timeout" error
Date:   Thu, 11 Nov 2021 16:10:33 +0000
Message-Id: <20211111161038.3936217-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

This function waits for halt_complete but doesn't do anything to cause
it to complete, and always hits the "VFE halt timeout" error. Just delete
this code for now.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 5c083d70d495..af71dc659bb9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -402,17 +402,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
  */
 static int vfe_halt(struct vfe_device *vfe)
 {
-	unsigned long time;
-
-	reinit_completion(&vfe->halt_complete);
-
-	time = wait_for_completion_timeout(&vfe->halt_complete,
-					   msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
-	if (!time) {
-		dev_err(vfe->camss->dev, "VFE halt timeout\n");
-		return -EIO;
-	}
-
+	/* rely on vfe_disable_output() to stop the VFE */
 	return 0;
 }
 
-- 
2.33.0

