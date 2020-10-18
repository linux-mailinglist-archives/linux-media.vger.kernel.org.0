Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F59E29177A
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgJRMxV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgJRMwr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:52:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D2EC0613CE;
        Sun, 18 Oct 2020 05:52:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t9so8357809wrq.11;
        Sun, 18 Oct 2020 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GcSwE61bzfkXAIzBJDfMjo+Esm9BgU/rSmkEPoQhkeY=;
        b=R7PWdOxkdjpR3v+ADXul4u/kAxbuKoZAGt7kK1MC5Inc2BDsFLs/XEGll9qjVQdpky
         /Z9yVi9qGMQajFSOko6ZDyTUtHjjHGY1LTmexkIntWCpuEEzjijfPvUe2Mg6KMrM6eUS
         A/+XvAYBUit5l8p7WNU3VdpX8I0zMpPRgZH4w0pLPGtLpZOMQ97FRqXWw4leOFeLi0pT
         40bBwLRaWDYTpSezIWkKPZDyYberabrsVky3EqaOBnO6bveyxCPIJDDqML3fVP6e+QXC
         kMQ5EwK3o1wFKkfcx6qVqDUs5qYUlgqXCOZ4jXacWZKxT2+OPbxTxhAjxn3nvssfSdQ2
         0/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GcSwE61bzfkXAIzBJDfMjo+Esm9BgU/rSmkEPoQhkeY=;
        b=lwiml8KeVYrch1AUpbeF92cfBoxJmb36SsbW/sWN8oYULtqF+h51Z+xY4hbwQZpmw+
         UiZVnSHkg+CAI9XBmuUWThgzhC2tvAlX/Am60N4lzw+U6L6n+WlFuoLmJsHmF6SP7aea
         MED7hw43kag48n1d6lYRkjM2Z/A1tPt8XJG2xrMvaSIboBOehhO31x3ihk3nasTBUfAX
         J0raLvCUEG0PRaxFAEJkYy/r7aa7Sdc3gBE4MdQwss4tXwJ0ft9o14EK48hHqCUlCqPO
         J4sIOqW/HYCGDowDItHIc+dIYEaW6V7XHfzOn8SpAbfDSigNcxcO1A4kn/ksp7BsT9x9
         jEqA==
X-Gm-Message-State: AOAM533wFpoH2jJRhxP6nJG/mbn/XKQJrrb0rBrXxvTnnOygGdZSrBIX
        T0bUaw/c1P53piRCtN+TWDU=
X-Google-Smtp-Source: ABdhPJyzBVPMPe6iikfEZdZDFX9oue76G9hOG8vjv94y3ghKA+myOdeSQWzYisDyv5fWvzHmNx2OMg==
X-Received: by 2002:adf:bc13:: with SMTP id s19mr15236190wrg.338.1603025566041;
        Sun, 18 Oct 2020 05:52:46 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u2sm11940158wme.1.2020.10.18.05.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:52:45 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 5/6] media: dt-bindings: media: qcom,camss: Add bindings for SDM660 camss
Date:   Sun, 18 Oct 2020 14:52:36 +0200
Message-Id: <20201018125237.16717-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018125237.16717-1-kholk11@gmail.com>
References: <20201018125237.16717-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add bindings for qcom,sdm660-camss in order to support the camera
subsystem on SDM630/660 and SDA variants.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
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

