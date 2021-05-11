Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56B037ADFB
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 20:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbhEKSJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 14:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbhEKSJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 14:09:30 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776B5C06134C
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:20 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id q5so10657261qvv.6
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FD0gWPQzpyGXYTVYXXLZlZGqHRAYEmqEcialH8BA1kM=;
        b=ipY1sUpXHg/6ychnBzi8TsrIamFP0VKSDUPcYNfaIPaq5irONguSaL9QafuAkrT5Yv
         hctC3e89mMfK9styMgml8FF09t/pyf19r4IKGudA2i6fgFH8+B+s8BktU1zXgEzc6dcF
         rMRzxq73M7oO/4212S92D2XLNHwcYrXPzG/4cJvd7v2AfzmcTopy5yEI3AExpUJDjEcA
         jOO4gIjYprBKmtH6BJQ1WFiZNsRrdzv6WJmFNyMBe+7VlrH+UN0R0pSYd8qQ3KDL8lEE
         1syKJCm8XBlr6u64jNcyju5ZqFye1LqT18O90xRMQWpQxch8sdttLC0Rn/zfaGR3m9hv
         LceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FD0gWPQzpyGXYTVYXXLZlZGqHRAYEmqEcialH8BA1kM=;
        b=QhX1FCxGCr1j7SGa0cweHahysdtmucxXBmTTdVQTQcYLzz5t2KA3nLFz95gEmTAXyh
         5Aj2yIH4x9sCuOcp2UdkP1pJp4DcI4Jn0E8ZryYc5pLcjFJd5x7uDLFxW7usnTPnghQG
         feyE2nNRYUOfYKNk9LsUPJC1RK6XJCvzGLd3IM8XTKsWuyGy5YclesliuvKXxLX+7W6E
         LXmtDs+pPqJcdnofY71zvRcGmVP/I0C+vax6m6ekSr0YRjNnuLrQBnP49lyxKw8tFQyO
         69LdOHqCDsV6qdABpR4SClkaRvIPCE4ul9KTIS+dLyHUhUMhBI53RJfEK/98C02NNQp8
         4yyw==
X-Gm-Message-State: AOAM532lwHfOz+1XTZMsxX+IZYcEc7UAEAF4zCU/movNDv/56ZeCJ4+9
        X7wLzmvdCSB8M9wqOx4YlHfmmQ==
X-Google-Smtp-Source: ABdhPJzdYwdRh+8ZBp7ScB6or2LzcgmtjVEbMcPqPokjkXgb2+SlddqnAv8ph878cKbTweRMTNHULg==
X-Received: by 2002:ad4:4aa4:: with SMTP id i4mr30878220qvx.29.1620756500321;
        Tue, 11 May 2021 11:08:20 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:20 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 11/17] media: camss: fix VFE irq name
Date:   Tue, 11 May 2021 14:07:18 -0400
Message-Id: <20210511180728.23781-12-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vfe->id isn't set yet, so use "id" instead here.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 15695fd466c4..dec89079c6ae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1290,7 +1290,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	case CAMSS_660:
 		vfe->ops = &vfe_ops_4_8;
 		break;
-
 	case CAMSS_845:
 		vfe->ops = &vfe_ops_170;
 		break;
@@ -1319,7 +1318,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	vfe->irq = r->start;
 	snprintf(vfe->irq_name, sizeof(vfe->irq_name), "%s_%s%d",
-		 dev_name(dev), MSM_VFE_NAME, vfe->id);
+		 dev_name(dev), MSM_VFE_NAME, id);
 	ret = devm_request_irq(dev, vfe->irq, vfe->ops->isr,
 			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
 	if (ret < 0) {
-- 
2.26.1

