Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D42515726D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 11:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgBJKEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 05:04:22 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50019 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727061AbgBJKEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 05:04:21 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id BFA4D1C28;
        Mon, 10 Feb 2020 05:04:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 10 Feb 2020 05:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=aFqJHi2DxkxEhthklRhVe9pAV9
        MnZcHeB0F11l4pfqQ=; b=AUDYwrrMA0q0yfov4T3x/hofaL6gtCUu1viGTdTT9N
        vpzVTMt7J7ro6OchNXo69nKoTOMP+k3mS4nQzX0pX30yoFFV4n/Yr33hRU1wrNVu
        53AiSIPEdOvofULxLieFkDGrJVZPsmKYlm0OtxNy2jQAwJqbn9p5Uuk6bSd4JbGY
        4QNXNwghPJz0cZoMeC+rSxFVEw4Tsf1ydNdYNTro3I7nV4+Ok/vvctmNOE08eRdP
        a7RyO2tUS6LVgOYtNwBX4isEHWTOelMNXewg77Cgy4sXPS9OaLXjvJVaOJ3Fn/u/
        /qH+w6eTwlb6p7Noq6NcuAOw2Q+86th1n+nEFm/7e9nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aFqJHi2DxkxEhthkl
        RhVe9pAV9MnZcHeB0F11l4pfqQ=; b=rx9mXnhFWcLsQilC1Xm0TIfT8AVKlEOB0
        6LOmDZOtPhiqaDXT6Nx0Or2HblJGEzfwnoOGhJMkZXGvhJGw5NCDmlK7GfsoWu71
        mp90kJR+sQHvZIofrEBFrIloHuWOOumCkPcpKTdqgfl0Pqgei2YYTcbanf12N/8g
        BUPJuviPHfu/y7gV4Ssd4isOfzGpkVbIDd/RZtMjffMA6vs6helP/KBipWkgA8zJ
        NCF2CmaOzNb0AU7x3wRClMKrJ+RnE1YycFLp3xKFBkx3v1dcaBVWXu/baHO8nxtD
        YYF30YyCBhCzAamqdLw9j6MB2YxfvrOoIoNbE+eSn8cMJ8nEnoogA==
X-ME-Sender: <xms:oypBXt18sxPnzpQkl9kpJnyAEReV6_plzQW6E-kH7aDdexM9FlG7Rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
    drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oypBXvHIMtmjPaNZ9JWzqB6AvIQK-kEBbdZW1ROsi42GiUU1q3h1Xw>
    <xmx:oypBXkhnHCbTtnqt463RC0mpP0nIpNiWlmqkK2jrBz8HXL8EEy0ECQ>
    <xmx:oypBXoe7i2TJ6IsAkKYYHzlSdpDROxyoD45_jjUo_saMMRBCcnRIhQ>
    <xmx:pCpBXjA30VkQgO6b-Gi9-xH2rNizDoeKWTcySJL7fmzsoHMLhcnAhw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9596C3280066;
        Mon, 10 Feb 2020 05:04:19 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        mchehab+huawei@kernel.org, linux-media@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] dt-bindings: media: csi: Add interconnects properties
Date:   Mon, 10 Feb 2020 11:04:16 +0100
Message-Id: <20200210100417.78583-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Allwinner CSI controller is sitting beside the MBUS that is represented
as an interconnect.

Make sure that the interconnect properties are valid in the binding.

Fixes: 7866d6903ce8 ("media: dt-bindings: media: sun4i-csi: Add compatible for CSI0 on R40")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/media/allwinner,sun4i-a10-csi.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 9af873b43acd..afde17d9dab1 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -51,6 +51,16 @@ properties:
   resets:
     maxItems: 1
 
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnects:
+    maxItems: 1
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnect-names:
+    const: dma-mem
+
   # See ./video-interfaces.txt for details
   port:
     type: object
-- 
2.24.1

