Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE343A072F
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235465AbhFHWlJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:41:09 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]:33669 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbhFHWlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:41:01 -0400
Received: by mail-qt1-f172.google.com with SMTP id e3so4948647qte.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t2aDM1URYTj/cZhUOY8AnySlXR+xZP1ewZ8+fSzahOs=;
        b=NM30DSAhLHVqVz4KXkiSrd53diDP2xzYLxrbDTuzjnQ1LK88wi5T91JOoSc/3sPe7O
         rYgBNOrwogUwZql5V2jqtPSD5kMTrupX+/Q9HjJIAhWFC74m9uPp4GyhToyukiOj6qdY
         o6019JAic3YW7BDky/cv2WjvBWTtASIIexqP045kXtPxMc/jBtO1HvucqCknwLqh5knG
         7EQ9/icMOpOfanLjcPr8iRJqUl8CbgycFljqMRfENl2r0UoTDNwT0UtJ6aBnn1vRxQV9
         xCrT8RC3MFH3dTN+I1+7pw4MOFe3lOLEQ3pRQs/WvcAEm3jbbYN2YUGbFAO2JIIG2nTD
         pYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t2aDM1URYTj/cZhUOY8AnySlXR+xZP1ewZ8+fSzahOs=;
        b=SfaUIvml5bFEhN2EcXj6Nf8mD0R/r38UxnUTjjXB3vxTfk6ZdGrgWTx6vKZmnyG1Xq
         iCdIvbOSjOSxKTQA3PIUhUr6W/vp4qbLoaiHIsVivxOD+gZrELEkNMtu2NhpRnPaBAo4
         +ONquw0eMnDeQBsl7Gwcxp1DljE1atzBGEkB0V4/pylf5yMUrZ+YBns+UmEzjMYgGeqm
         9QCFo6lNQBiYFjt01hrEwq8yIQWjJMSZ35txoKHLm4W4/xrjyZK7zRwy8B7DbZ92t0J/
         T4gtllF9EWtL/rRy/EwzKtXABy7DuPXJs2LYuRt38bj8S9utffNnIlHVWzTMIPrNdqKZ
         w7nA==
X-Gm-Message-State: AOAM530S730w/3Vcp7kgp77i2g7KIw8Dsg+GyJbgZQN6qwkwe/UkZi8y
        xiDozxmGRi2Bj0NINk+bID3mZA==
X-Google-Smtp-Source: ABdhPJwd3il/U7qh7jj3TzEJIbC6nFaBQQsU/l+UiqmN5Dq8sArZPapbPRL18OhU44Y+bE61KW1ENQ==
X-Received: by 2002:ac8:647:: with SMTP id e7mr23334269qth.156.1623191871678;
        Tue, 08 Jun 2021 15:37:51 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:51 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/17] media: camss: csid-170: don't enable unused irqs
Date:   Tue,  8 Jun 2021 18:34:54 -0400
Message-Id: <20210608223513.23193-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

csid_isr() only checks for the reset irq, so enabling any other irqs
doesn't make sense. The "RDI irq" comment is also wrong, the register
should be CSID_CSI2_RDIN_IRQ_MASK. Without this fix there may be an
excessive amount of irqs.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index aa65043c33037..a006c8dbceb13 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -444,12 +444,6 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
 
-	/* error irqs start at BIT(11) */
-	writel_relaxed(~0u, csid->base + CSID_CSI2_RX_IRQ_MASK);
-
-	/* RDI irq */
-	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
-
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
-- 
2.26.1

