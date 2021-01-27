Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B1F305EB2
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 15:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbhA0Owb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 09:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbhA0Ovg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 09:51:36 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D188C06178A
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:11 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id r12so3009858ejb.9
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 06:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxEhFanRiIwaURE1Asj018eMvsFp7g2C+jPywv6JQCM=;
        b=NeglsrrixY9rZEEIxHEyT/suHbI1Gfos+GErBk/xQmZkr6Gv28ZysCDosyRnCSKZwf
         /p8Rp6ibysS4eoSIbEwiq8K8YdMHUFS+wDpVI/Csp7xHhEmrldo0Tv2ZzLY4TmJsxJi5
         b4Qn1A1WGFRk+gR2Ka8wYtVs07gY4+FER1LI84dywp+7grOt/VeAt+s0NeUW6wJPqWWS
         YuUVoOnq6kP4fBk+DVVsvszn1UitOMIkpQgPv71TIWNzGqkfiN4e5WPL0ncM9hhV8Z16
         abEvo5028UNiVYORG1kY55tS08RWBtPl7MDLza/ZEQpE5Mb62KmWCjrUzYr6Wr7KNq8b
         ugKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxEhFanRiIwaURE1Asj018eMvsFp7g2C+jPywv6JQCM=;
        b=HDhDbIpkinSc159ruXQEA+3vt8vuETGtzxvnkpbFH5VEUGtwYXnOXO4JfyRR7Okwyn
         yAtefjLW2GsladhBivFkQHMIHIUrxi8GJEFYiCu+5clqRb1THhgYi0c83D99ZXQokovt
         TkyRrQZBRKvp5rvF0uWSiIeZ1R0a5t5sQ43D3F4wl0kZ32bhebp+5f1lp0ktTt+MaALV
         CviPI9EygD8W1CyKuhFUVF8PAHAys+EvBJlWQwrJsWzyyjlAGq3A10JZv13zek7/rWCS
         5a4t2QQjsD/IOGi3DlocBO7Vy3rBqktkVWGAAe11QZT36nT65vRazJ9JN3ryhvzlaGnx
         xTPg==
X-Gm-Message-State: AOAM533u6DH3vAF8zM7JjD+46MpXc2ptiv1N4cq5Tm8eHLLJkVjkb1V8
        GcSUWEBf78PQDa1IiJ7sh0znHA==
X-Google-Smtp-Source: ABdhPJzZ5y4B62ekX5qoKUdz96g02k/wijLaOyht7V5SlAXjVlvpG48MiaSso54Xo7Zsx1yLvpV9oQ==
X-Received: by 2002:a17:906:3c41:: with SMTP id i1mr7248047ejg.443.1611759010240;
        Wed, 27 Jan 2021 06:50:10 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:50:09 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v3 02/22] media: camss: Fix vfe_isr comment typo
Date:   Wed, 27 Jan 2021 15:49:10 +0100
Message-Id: <20210127144930.2158242-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comment refers to ISPIF, but this is incorrect. Only
the VFE interrupts are handled by this function.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1
 - Bjorn: Add r-b


 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d..a1b56b89130d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -922,7 +922,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index b5704a2f119b..84c33b8f9fe3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1055,7 +1055,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
-- 
2.27.0

