Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4590111685B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfLIIjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:39:21 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:47064 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbfLIIjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:39:20 -0500
Received: by mail-lj1-f196.google.com with SMTP id z17so14539113ljk.13
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 00:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M6xBk2t3JSq6Gm+btMkUw0HvLbeKjwldK9lPc/9p6IU=;
        b=vFQKn9BvVVUUQ4Y9uusSgffYFjQKPOk2bHHTZorOpYzW/4FB9kB6JzD1XbXDirsL66
         NJhJcFSJBS9/9nXEbtC4h3cl0FQ9w3y0WHYi/zqUm06sd3JfJjSIfaZTPQfTVEvIL9Nx
         kwThT+MoV+y5uvtbP83Hoe1MPxjqQyz9E2MYnYL7N3U7Vt6onDSv+PlqO/P0Fxto37YB
         9zAywrd1pHIk68ouG2NpoiLA4GEz04/VVpDXnRTcMbH9d5jo4uQBhJcUBy8qFLL1JgVM
         rD/gDDq6nMW+NtJi+oVMZx/sL53+sIDMBMcspigWp//UCstQBEPwEJqCo+xH8CoXmcCQ
         Z5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M6xBk2t3JSq6Gm+btMkUw0HvLbeKjwldK9lPc/9p6IU=;
        b=HwZm/3fZ8E/3igo0h1JwJp/rkk87c95+eJXjwqxo/SCWTr2CQfvvzyiK7lDchmslHy
         aQ1G0yiAJIQst1kCyvKQADVZ1UrpqLQELCaw78TCYE1qAfopSB7e17LUwYiB1OI4eAtr
         1ZAw0I+G+irgc+Udq0XjlwCi8p4yZzz5eiIuKsPB6N7nsOf9b3ssq9QhYiwsnvVHoWkL
         3M4XafaP+lBFZaVOwqaPFMBdrIcC6SMeq25Nn6FYSxnuNGy2o5bOScMon3HRnLyz660m
         AVmqhJAKKK00Mur/bIoYNKw5g483TF4+b0AdYw04IPsfwy5y4ZlOg8R6eKpEFisF9ePQ
         5nQw==
X-Gm-Message-State: APjAAAWVVmsNRaXxTaR27+jbZIjaeSojrM88+1yjhbY/xKw5arvQT/mi
        e81xNTfoV0z3SCALXS2jiHO2tJDTrTc=
X-Google-Smtp-Source: APXvYqyd/Hl/dcqTOW4HAPtSVFyeUDEZNQ0Muro85srrZE45Au6soKwyk1tCfVT095Stl7QIjLEjvw==
X-Received: by 2002:a2e:844e:: with SMTP id u14mr12502198ljh.183.1575880758682;
        Mon, 09 Dec 2019 00:39:18 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:18 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/6] dt-bindings: media: venus: describe sdm845 with optional pmdomains
Date:   Mon,  9 Dec 2019 10:38:22 +0200
Message-Id: <20191209083824.806-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209083824.806-1-stanimir.varbanov@linaro.org>
References: <20191209083824.806-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Describe an optional DT binding for sdm845 with power-domain-names
and clocks in Venus DT node. After that the binding for sdm845 will
have two options, the first will be to describe vcodec clocks and
pmdomains in (encoder and decoder) subnodes and the second will be
to describe vcodec clocks and pmdomains in the Venus DT node
(the parent). Both option will be handled in driver, and the second
one will give an opportunity to the driver to dynamically assign
vcodec pipelines for every given instance depending on its load.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../devicetree/bindings/media/qcom,venus.txt  | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus.txt b/Documentation/devicetree/bindings/media/qcom,venus.txt
index b602c4c025e7..69a104fcb8eb 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus.txt
+++ b/Documentation/devicetree/bindings/media/qcom,venus.txt
@@ -35,6 +35,21 @@
 		- "iface"	Video accelerator AHB clock
 		- "bus"		Video accelerator AXI clock
 		- "mbus"	Video MAXI clock
+- clock-names:
+	Usage: required for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "core"	Core video accelerator clock
+		- "iface"	Video accelerator AHB clock
+		- "bus"		Video accelerator AXI clock
+- clock-names:
+	Usage: optional for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "vcodec0_core"	Codec0 core clock
+		- "vcodec0_bus"		Codec0 AXI clock
+		- "vcodec1_core"	Codec1 core clock
+		- "vcoded1_bus"		Codec1 AXI clock
 - power-domains:
 	Usage: required
 	Value type: <prop-encoded-array>
@@ -72,7 +87,12 @@ Every of video-encoder or video-decoder subnode should have:
 	Value type: <stringlist>
 	Definition: Should contain the following entries:
 		- "core"	Subcore video accelerator clock
-
+- clock-names:
+	Usage: required for sdm845
+	Value type: <stringlist>
+	Definition: Should contain the following entries:
+		- "core"	Video codec accelerator clock
+		- "bus"		Video codec AXI clock
 - power-domains:
 	Usage: required for msm8996
 	Value type: <prop-encoded-array>
-- 
2.17.1

