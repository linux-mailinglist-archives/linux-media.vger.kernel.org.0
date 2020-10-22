Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B914E2963F4
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369327AbgJVRrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369287AbgJVRrY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:47:24 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6B6C0613CE;
        Thu, 22 Oct 2020 10:47:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s9so3558205wro.8;
        Thu, 22 Oct 2020 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jH/ymGX8PoDvgpabHM/T5bVI+BdOAPlLIfRyuOHjEQI=;
        b=FbUY1HpwA26SipLrAG85P9mW0HIXjCTlolMVt9/V5oak9lBnb4uEYdtvtYYVfagoQk
         D1kZG5r+3wUaKre9Azx+M18d1RIjYS/F7KnVWtLEG/1961AthM8yeeyNaIZ8ly80zEvq
         3Yjg+FYwmYO0cD8D0deGBz9B86IlNkevDvAnQYjar5lguS/kbTgtCxkpIQPT58stCajW
         WqYekRXC/sudRXy6Us0lJZk/LSXHqoWDaSuoL5qlXPhfhz2SSJOYoKveNk0UWW41lGZm
         UhYMx6PYnyB170VeZRekSO7FsBs3unixmkeNRvSPf0Kaev4rDiDa7iPgKHYbdsc9TXMO
         r/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jH/ymGX8PoDvgpabHM/T5bVI+BdOAPlLIfRyuOHjEQI=;
        b=VFRVIkpDbIqTBvVgrpfBtVEAPhvOZxMTEGbgmlCVWRsxo9qXYSV1aCZJ+C8X/aIyvx
         QSyKm7/Ne2C4WUP+i7tqP8WPdoU7dM8ZNhO2Y4aYVtU5ygYr7DF1sJWzpCoTZaST/Pol
         eXSlkLzOENbNWAr4i4AeqIu3SI1aEwDyU/6avA9vNsgI6QbpC3b4FgUCSCdsz0yk+HSj
         kxijo0rxZPTJm2d+F3BNwMG7iNY4E8yfxdXwmTHWZdnEvo7+cBMAR/fgNfpyITe9/pcC
         deo+6cGTlXhiwTzO0XaI3FgmqqaEO1E8Kg9Ul7bmgxl2ICMI0ZiOLiTTwgLilcemS/w9
         SDfA==
X-Gm-Message-State: AOAM532xlsL/v03P9JgvRJuQ6r3HoeRRyp1djrHx8+vzADeDlIST7TgQ
        JdHU+vK5+VMQ2osL8gzsyZPdaZdfDCnRkMd4
X-Google-Smtp-Source: ABdhPJxmFONADjaKkwOtRDdTyie6u8BOmNegv6NapdqPaa7u2WhGTqHfmgcl98EGyo5GQcTSWoXO/w==
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr4033766wrn.345.1603388842936;
        Thu, 22 Oct 2020 10:47:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u202sm5368355wmu.23.2020.10.22.10.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 10:47:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robert.foss@linaro.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 6/7] media: dt-bindings: media: qcom,camss: Add bindings for SDM660 camss
Date:   Thu, 22 Oct 2020 19:47:05 +0200
Message-Id: <20201022174706.8813-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022174706.8813-1-kholk11@gmail.com>
References: <20201022174706.8813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add bindings for qcom,sdm660-camss in order to support the camera
subsystem on SDM630/660 and SDA variants.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,camss.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
index 09eb6ed99114..498234629e21 100644
--- a/Documentation/devicetree/bindings/media/qcom,camss.txt
+++ b/Documentation/devicetree/bindings/media/qcom,camss.txt
@@ -8,6 +8,7 @@ Qualcomm Camera Subsystem
 	Definition: Should contain one of:
 		- "qcom,msm8916-camss"
 		- "qcom,msm8996-camss"
+		- "qcom,sdm660-camss"
 - reg:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -64,30 +65,36 @@ Qualcomm Camera Subsystem
 	Value type: <stringlist>
 	Definition: Should contain the following entries:
 		- "top_ahb"
+		- "throttle_axi"	(660 only)
 		- "ispif_ahb"
 		- "csiphy0_timer"
 		- "csiphy1_timer"
 		- "csiphy2_timer"	(8996 only)
+		- "csiphy_ahb2crif"	(660 only)
 		- "csi0_ahb"
 		- "csi0"
 		- "csi0_phy"
 		- "csi0_pix"
 		- "csi0_rdi"
+		- "cphy_csid0"		(660 only)
 		- "csi1_ahb"
 		- "csi1"
 		- "csi1_phy"
 		- "csi1_pix"
 		- "csi1_rdi"
+		- "cphy_csid1"		(660 only)
 		- "csi2_ahb"		(8996 only)
 		- "csi2"		(8996 only)
 		- "csi2_phy"		(8996 only)
 		- "csi2_pix"		(8996 only)
 		- "csi2_rdi"		(8996 only)
+		- "cphy_csid2"		(660 only)
 		- "csi3_ahb"		(8996 only)
 		- "csi3"		(8996 only)
 		- "csi3_phy"		(8996 only)
 		- "csi3_pix"		(8996 only)
 		- "csi3_rdi"		(8996 only)
+		- "cphy_csid3"		(660 only)
 		- "ahb"
 		- "vfe0"
 		- "csi_vfe0"
-- 
2.28.0

