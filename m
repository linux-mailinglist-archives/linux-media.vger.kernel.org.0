Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7A126C914
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 21:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbgIPTDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 15:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbgIPRsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58338C0611C1
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 04:09:50 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o5so6386725wrn.13
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BtfD39sd0nMdQV9/O9Z3aVwFFH7FdxRsFaEXRfET0Pk=;
        b=JMfXnKjc+V6oefEfHPxrJc0ASOsVHknp4fC393byiq1s0Wql02e0UwVma6O/xdLogB
         nv/VzMLg8R/G7mEK2+SPJ1OEaPWP3MzPXqsclLSgp/7owr30xJaGLb0Ry+hZJ5nnmWYb
         YaRDlgJrAthFEr3jt0X+9LJ4zoLdS48c0KxJKfoeE2JYDNitMe0YGWCGDQjFXTlVYWDV
         cC1oakzx3NmihAnNqwXMUtXgUOvgrAH7d886SwQLbzVQrD1MMTVe1cLUj8/MNZzHCarf
         5lhwB7o1YQFnaeumfaS0uBCXxq59uESPZi0vIXkOJcE+fz8JWOgtd2RCe8QXmAinUAqI
         8jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BtfD39sd0nMdQV9/O9Z3aVwFFH7FdxRsFaEXRfET0Pk=;
        b=Q1CWo0t+aAbWfsL8yh6sVZTuQW8UxS4M8/od8st7z2x8tFOlHYrJp+QgOPKdKB+7rK
         ss0wYrDXvHIIfSNW63XB1WFgo11kwfITVqr8XMEIaRwE9DwG2mHsC7N58jgBVOaFEICq
         1RCNT5dPuxyr8u9ZQsUWo1I0dT4gn1vhwPdonzZ/7TcmW/NCzfeIS4qybTjZPSBMonxv
         tE02U/5MtdNyLwGqPTsJN7FYbk0Ditt2CDFGPQ65Ys/Alt4PscHLrNQSreej4B6cZlSz
         kB1yykPud8nW9QA2zv8PmiHczUQ4wVWZgMhfDKY3YX2Cog3rw9q2sWxJw2JpF4VFm2E3
         Tl4g==
X-Gm-Message-State: AOAM532LndR1mj1Z76KGrIF/CMsgXkh/RwcyAef+36MDRdidRYfIJpX6
        /UPB51k+kecS22w6eDOCFJ8kZw==
X-Google-Smtp-Source: ABdhPJy4dZpmUwlAyx/BKQK6y4C9acThXDJDxCXFc5C+hNp6beal5vCckquXeaDceJb14bG9teu8aQ==
X-Received: by 2002:adf:ef03:: with SMTP id e3mr21385449wro.146.1600254589005;
        Wed, 16 Sep 2020 04:09:49 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id v9sm31876597wru.37.2020.09.16.04.09.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 04:09:48 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     stanimir.varbanov@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH] media: platform: Remove depends on interconnect
Date:   Wed, 16 Sep 2020 14:09:47 +0300
Message-Id: <20200916110947.6933-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dependency on interconnect in the Kconfig was introduced to avoid
the case of interconnect=m and driver=y, but the interconnect framework
has been converted from tristate to bool now. Remove the dependency as
the framework can't be a module anymore.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/media/platform/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index bbf32086b607..1dbfb9b9d129 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -484,7 +484,6 @@ config VIDEO_QCOM_VENUS
 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
-	depends on INTERCONNECT || !INTERCONNECT
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM if ARCH_QCOM
 	select VIDEOBUF2_DMA_SG
