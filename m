Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1E52C3047
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 19:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390969AbgKXS5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 13:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389340AbgKXS5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 13:57:46 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F73C0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 10:57:45 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id j15so19611084oih.4
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 10:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQvA+gzyOlwcrQTYLcbh+JVhQ8vrnP0glY0CX55ovyw=;
        b=hoV9a0tru1XrM0PN94vfdrkGnGpCNWNEwo/32YusI1pTbAei+ybZdAf/eGFMo6toKh
         3Haebkuw9HUQ0bZb6CEo++QF+NCGOT9M3mw3ndGCPpFbUdNaGsmni6ltPI0e183aAilg
         eUkCczMYH9u5/X6dLxzgo42js9o7y+c3SBnM4sOB6Y7fcnVWpQo78LVrzFqvXEAIF9Qp
         cWrFXqlv+3DDq8NPAIcs8ghau3qujNzeJK4o4iKuZjJ33uQK33/x/r9JD0Spykdn2btX
         r9+m/V85XrM15M8z1ZVsYb/DmekctbtqsFr6F6Ndr/6h8XCvPkyRw0iQe7kPXzXleicY
         pRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YQvA+gzyOlwcrQTYLcbh+JVhQ8vrnP0glY0CX55ovyw=;
        b=CGPCU9WBZoy7LEJM/0NxxgLNSibw4vXEEBLJv2n1twW6ITzGAmU6HfTNZSvQzq5aUg
         NlWZflGCkQrZid6Srb5HWJmqHzbabXYQnnEn2Cgw1o4nYiF9Zwh+AbM9wsWbmO+Yvg8l
         m+MRDdIjCw1WlNcGkSGDSykbm3w44sfYganRaumnwvQTwljQk51xaPRqRUQjfJaKT3gU
         C2LmBm7DdIa3ZHZPuvZKLEWiJPaFCk1QEKG3VJ5Mu+YRq2Vtb8y0AiT+GQoS5YPfO0vV
         Axd6hDUBnB0hnPwZch1hurnU+Utb9LO52y46r++pEt6Qz1AsEcAV9sPhNeS9o8zdNHmW
         jdSg==
X-Gm-Message-State: AOAM533kY/rCqqPNY9VI9xISPEllnZtN087MFKZ3/VGoOfPnMkiuENfh
        akUeZarORK+p0dfisSclSuoTu+SCoM45Sg==
X-Google-Smtp-Source: ABdhPJyVCPwvTVWKEZBheVICFsAHDUw6QNEFpvQcHI9TbAmeovDh3KxOSb484UpKebcMuFh4bxvkAw==
X-Received: by 2002:aca:4a51:: with SMTP id x78mr2449oia.86.1606244265287;
        Tue, 24 Nov 2020 10:57:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k20sm9079930ots.53.2020.11.24.10.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 10:57:44 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga C630"
Date:   Tue, 24 Nov 2020 12:57:43 -0600
Message-Id: <20201124185743.401946-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A combination of recent bug fixes by Doug Anderson and the proper
definition of iommu streams means that this hack is no longer needed.
Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
Disable DMA processing on the Lenovo Yoga C630")'.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dce75b85253c..046d241183c5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -353,13 +353,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t rx_dma;
 	unsigned long time_left;
-	void *dma_buf = NULL;
+	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	if (!of_machine_is_compatible("lenovo,yoga-c630"))
-		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
-
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -394,13 +392,11 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t tx_dma;
 	unsigned long time_left;
-	void *dma_buf = NULL;
+	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	if (!of_machine_is_compatible("lenovo,yoga-c630"))
-		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
-
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
-- 
2.29.2

