Return-Path: <linux-media+bounces-18911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9298BB2B
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3084B22786
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 11:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5191C3F17;
	Tue,  1 Oct 2024 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F8CQ6njQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663E1C3F02
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782292; cv=none; b=ahHaqVS7CIr02w68B/aQkw0FFXjHbdr9UuZZi8fEmAsYf2y+prhKPzZ0256JwdDB6dyUTb5Bc7Chd6sdseGG6fi1PHA72WG0qcZxEY3CxGWlleGP1d5Et+/9NntxxpaPTAaS+DffPXzOd1hfyvOaKtKhK21H+IQBPrrIl3KLlaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782292; c=relaxed/simple;
	bh=EHoDEsvWTt9VkUwIM9206H+lpKLH7dHhsd9ut8QxmG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iABEdelBFSIBRYBOEvd+OJC0E/mCOx5VM3eGLwArNeoLtPeF0UkvAliKbtsOC9Wt5OoaFrd5YQ+XNMsZqV7PCnEewUHyghP7N/cCgyKdZv/eRqFIYtcZUvmiEJp+MkT/x/zo9QKF1kHzxkP665o6ENaDRJYzDxqnd8xxtizLPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F8CQ6njQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71b8d10e990so2459316b3a.3
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782290; x=1728387090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejGJNBzCUSn/2STvxEtP4Qm9W+BBPtGa+kdNm7gnwwU=;
        b=F8CQ6njQluj4CD91XJndjo2egqyAfZZ70e5IuT4B4vLuKeRFrfkazLFK88NkvlTogC
         07URlJpxMNql/WRqIUVyM3y1mp3t3o5pRbfaJTwbKcfBILToAzRnmTMWBbdcA6RbyWtG
         sZ9WeGboq8AM7coEjR1pz4Mfj4Y4iyniaIvVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782290; x=1728387090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejGJNBzCUSn/2STvxEtP4Qm9W+BBPtGa+kdNm7gnwwU=;
        b=hOdoa0rhmiFQK1U6PNd/fo8B1Sxf36cMPokaR6/SKXWW2rexnzh3HptaV6MAyn/KAZ
         MUblahBxs49M7G3alBRoXV6fDR+eUaJcCccQlbivm18tbpepT3HQNIlcYWmkfb5SAgQz
         zqNGJCEqqr8OozBCRF1PgAlrhaKd4Ivlp7B9aaEjqiF6gEyA4SDCEHLpwvn28EOvKXqo
         xDa77xf6PoHrdjJ591/l6bQiUhIkGzXYF/ZydFVlUO2mJmrMY4IBoAJXubAviHWxDj8e
         1uPrLnh+/9xHnE7+IkxMYx/pnpJJp1Bw0D+U8SH7OxOr2SwW7esvNB/qwIGdh9ntteDd
         gklw==
X-Forwarded-Encrypted: i=1; AJvYcCUJyf4RiKnnZfvRKx4AMCWr80S9QdkELPRs0CGnO+D89W10OdwQG0VBMaBqcUbK5mIQy6mtPjkMZ/1SNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNnIrD2oChOk5Jj9SUMoPdNWwQ2KXDaayp9No2Y6bRb4oOXFGr
	8VHZ6bhcgloeZljdbiK6Tb7e9GPFEvj/+w2HbQZGPs3w1txt4Hi0kzU3R9eMcw==
X-Google-Smtp-Source: AGHT+IGmqm0A1CKXunN+IYhXZlTEbv5bvkc+2qchW2O8DdvX6JHtqPJaxZtG+8eE9yYDL747Fo4WoQ==
X-Received: by 2002:a05:6a21:1583:b0:1d4:e500:ad6c with SMTP id adf61e73a8af0-1d4fa64d6a4mr21967043637.3.1727782289986;
        Tue, 01 Oct 2024 04:31:29 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:29 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/8] dt-bindings: media: mediatek,vcodec: Revise description
Date: Tue,  1 Oct 2024 19:27:22 +0800
Message-ID: <20241001113052.3124869-5-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revise the description of MediaTek video decoder to improve wording, fix
typos, simplify diagram, and extend the pipeline architecture used in
newer MediaTek SoCs (MT8186 and MT8188).

Signed-off-by: Fei Shao <fshao@chromium.org>
---
Feedback are welcome.
I've tried my best to organize the existing information with some
educated guesses, but there might be inaccuracies or gaps still.
Please let me know if you have anything to add so we can make this more
comprehensive. Thanks!

Changes in v2:
New patch.

 .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
 1 file changed, 59 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index a500a585c692..52a96a5aec96 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -5,52 +5,70 @@
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek Video Decode Accelerator With Multi Hardware
+title: MediaTek Video Decode Accelerator With Multi Hardware
 
 maintainers:
   - Yunfei Dong <yunfei.dong@mediatek.com>
 
 description: |
-  Mediatek Video Decode is the video decode hardware present in Mediatek
-  SoCs which supports high resolution decoding functionalities. Required
-  parent and child device node.
-
-  About the Decoder Hardware Block Diagram, please check below:
-
-    +------------------------------------------------+-------------------------------------+
-    |                                                |                                     |
-    |  input -> lat soc HW -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output  |
-    |            ||             ||                   |                     ||              |
-    +------------||-------------||-------------------+---------------------||--------------+
-                 ||     lat     ||                   |               core workqueue  <parent>
-    -------------||-------------||-------------------|---------------------||---------------
-                 ||<------------||----------------HW index---------------->||        <child>
-                 \/             \/                                         \/
-               +-------------------------------------------------------------+
-               |                          enable/disable                     |
-               |                 clk     power    irq    iommu               |
-               |                   (lat/lat soc/core0/core1)                 |
-               +-------------------------------------------------------------+
-
-  As above, there are parent and child devices, child mean each hardware. The child device
-  controls the information of each hardware independent which include clk/power/irq.
-
-  There are two workqueues in parent device: lat workqueue and core workqueue. They are used
-  to lat and core hardware decoder. Lat workqueue need to get input bitstream and lat buffer,
-  then enable lat to decode, writing the result to lat buffer, dislabe hardware when lat decode
-  done. Core workqueue need to get lat buffer and output buffer, then enable core to decode,
-  writing the result to output buffer, disable hardware when core decode done. These two
-  hardwares will decode each frame cyclically.
-
-  For the smi common may not the same for each hardware, can't combine all hardware in one node,
-  or leading to iommu fault when access dram data.
-
-  Lat soc is a hardware which is related with some larb(local arbiter) ports. For mt8195
-  platform, there are some ports like RDMA, UFO in lat soc larb, need to enable its power and
-  clock when lat start to work, don't have interrupt.
-
-  mt8195: lat soc HW + lat HW + core HW
-  mt8192: lat HW + core HW
+  MediaTek Video Decode Accelerator is the video decoding hardware present in
+  MediaTek SoCs that supports high-resolution decoding functionalities.
+  It consists of parent and child nodes.
+
+  The decoder hardware block diagram is shown below:
+
+    +------------------------------------------------+------------------------------+
+    |                                                |                              |
+    |  input -> LAT-SoC HW -> LAT HW -> LAT buffer --|--> Core HW -> output buffer  |
+    |              ||           ||                   |       ||                     |
+    +--------------||-----------||-------------------+-------||---------------------+
+                    LAT Workqueue                    |  Core Workqueue       <parent>
+    ---------------||-----------||-------------------|-------||----------------------
+                   ||<----------||---------HW index--------->||              <child>
+                   \/           \/                           \/
+           +-------------------------------------------------------------+
+           |                          enable/disable                     |
+           |                 clk     power    irq    iommu               |
+           |                   (lat/lat-soc/core0/core1)                 |
+           +-------------------------------------------------------------+
+
+  The child nodes represent the individual hardware blocks within the decoding
+  pipeline, such as LAT-SoC, LAT and Core.
+  Each child node is responsible for managing the dedicated resources of the
+  hardware, such as clocks, power domains, interrupts and IOMMUs.
+
+  The parent node is a central point of control for the child nodes.
+  It identifies the specific video decoding pipeline architecture used by the
+  SoC, manages the shared resources like workqueues and platform data, and
+  handles V4L2 API calls on behalf of the underlying hardware.
+
+  The parent utilizes two workqueues to manage the decoding process.
+  1. LAT Workqueue, for LAT-SoC and LAT decoder:
+     Its workers take input bitstream and LAT buffer, enable the hardware for
+     decoding tasks, write the result to LAT buffer, and disable the hardware
+     after the LAT decoding is done.
+  2. Core Workqueue, for Core decoder:
+     Its workers take LAT buffer and output buffer, enable the hardware for
+     decoding tasks, write the result to output buffer, and disable the hardware
+     after the Core decoding is done.
+
+  These hardware decode each frame cyclically.
+
+  The hardware might be associated with different SMI-common devices.
+  To prevent IOMMU faults during DRAM access in such cases, each hardware with
+  the unique SMI-common device must be placed under a separate parent node in
+  the device tree.
+
+  LAT-SoC refers to another hardware block that connected to additional LARB
+  (local arbiter) ports, such as RDMA and UFO.
+  It requires independent power and clock control to work with LAT decoder, and
+  it doesn't have a dedicated interrupt.
+
+  The used video decoding pipeline architecture across various Mediatek SoC:
+    MT8195: LAT-SoC + LAT + Core
+    MT8192: LAT + Core
+    MT8188: LAT + Core
+    MT8186: Core
 
 properties:
   compatible:
-- 
2.46.1.824.gd892dcdcdd-goog


