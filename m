Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE1F37ADEA
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhEKSJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbhEKSJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:21 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15AEC06174A
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:14 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id f8so11107273qth.6
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6EnogKluwcsh/pR3Ugtb3jxsHv9fsBdtTnJcs6QGPPM=;
        b=pVyV8UMP2Zs3bVEPeaK/7xHyx5omdnupOpIzbyIBS6Lsg+Qed9iMuBEKWfVIhkog0l
         TKQIqo1dmbwKuXWyquUX53i3fNoGvKZk/ARVO8Kl5PZJyO3eDl6AUw01j/cFKWvUO5P/
         cKbo1tnyubNp6VXR4r2i6aXyjIpg5tefG5rIQP7KGhlXvtQGI5y2Sy6qEwDJxiEFJTwO
         7YZ9bKAPSXWvjy3rgjqQSQAzroHtf10jyJqWKX1IcyVvaDGcfLGgaMtTphCE5KH0zPI9
         Enz7ShPwPsY0ki/+EdXn5xd/VbcQWYdN80t7nGtMrkjzd6GUSI+AGOV3z/HOgMsaqJqc
         PwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6EnogKluwcsh/pR3Ugtb3jxsHv9fsBdtTnJcs6QGPPM=;
        b=Vns51AgmfYkPAZhLN97XmCGepysxTXu8lmMVDXyziSOAm034nwUVguJi0mFeQaaXdm
         yfq0kLn32DPCTSj58IJq7oo/hvoB2aiwhJw42Uj5aytrRtDtLPThhx5hNMVbOgTEVjQO
         e5oXNbgLqcPJM4kQ8AvvJmk77rCj6kLcVxIk42JVt5G8ON40Hy/yZLNDBgKdIyU+cL4A
         ybTo8ax6qyo9ZXZgN5cx84RpR9AwlBC9P25Z3fufKHmNzAXmD0ZWMzuyoBGqANGek8vM
         h6HQkYgFJWCGxUKLNXHWtbX5hYyTIy7LFTLr2T7thYIkRr5q5qVeHRtoVlypD7PZKIIN
         RRkg==
X-Gm-Message-State: AOAM530lBp7H0CjTtujUq1EXxgh/VlXTT8bWejSBmty9Dw6cEkYXWBO4
        PTxb7xhiibT1DXcm7t3N7AU2HA==
X-Google-Smtp-Source: ABdhPJzRLUC7xHdun6LiYTns4U8cKfjV4l3WBR2LIcG6eZSKDlCN3GYWA2ELbZ9EyaHWNeAISgZ/TA==
X-Received: by 2002:ac8:7f53:: with SMTP id g19mr29280882qtk.249.1620756494059;
        Tue, 11 May 2021 11:08:14 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:13 -0700 (PDT)
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
Subject: [PATCH 06/17] media: camss: csid-170: remove stray comment
Date:   Tue, 11 May 2021 14:07:13 -0400
Message-Id: <20210511180728.23781-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a leftover from my original patches, it doesn't serve any purpose.
(it was a reminder to figure out how downstream sets a particular field in
the register).

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 2bc695819919..3958bacd7b97 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -441,7 +441,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
-	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
+	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
 	val = 1 << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
-- 
2.26.1

