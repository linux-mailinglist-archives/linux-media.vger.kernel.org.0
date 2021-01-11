Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC322F1834
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388644AbhAKOZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:25:28 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51593 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388637AbhAKOZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:25:27 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id CB4DE58067E;
        Mon, 11 Jan 2021 09:23:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 11 Jan 2021 09:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=2UJ5fuVx0fd+N
        mWUjZ3j/otRbpaIkIN2Yqbqj/0LMQI=; b=gmJsgSzmBVOJgCOqeYyuojWlR6fr2
        Se2czyZ8KkbwfC+1qymwyhGA1OEioSYRIT6MtXKulxsuIsbWux2sJQTnNcwpZr0m
        HdCe2s7j3dALoOAxzhk+EbsC2gKSyPmpi0i5fTozbEQS/k1zWFCO+Ks/dlz0yt61
        ety5p4afG0mdSUdf1ajLNO3pH4PS17kL0DQPJ53/ka5cQeVY2+WpsR/FO5++gRWp
        5S8PFCFvIxsKQho3BGfQ+8XQBG8uJB5WoNEpTSbLWYhBCjFlub1X1SxEjqvFEDx9
        ZvgzuYlfaOS5BGcc/N0txAtvrkaStN1e1G2pN4psX1ZTAPukVF6hnNX1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=2UJ5fuVx0fd+NmWUjZ3j/otRbpaIkIN2Yqbqj/0LMQI=; b=qtupaJIJ
        QPjWfZ2lvqir1OKsDTnKi/1v3hhg3B1SNt6Gir/jWhMcIKct5h90FuUo7Wx05cAI
        B644oGNBNhCOiX6K5sovwGH15OTz7UJfnlH7Ag2XLVGPXjSRkmLiMPgE7iyU04Iq
        HRAz4Hz7Vmbme3SBdtTnK/BxCEUcMw5IGIzVApsfeGFw0i2oLNMt506utk4uVtVk
        UJZYRDT7E2n3Z7FyUyOS/Yd5VgP51UVkJcDL5ZmZeeJgYV+AYRWJKoP1LcW3KnR2
        BMeMsB5W3sUvfuCo2fOA/RKImuqnTZyszdKh9HiG5Jh0Le/hGotLh8pcfu7D7lTF
        dzabEm4Es+rLfQ==
X-ME-Sender: <xms:ZF_8X4zXA9D8hF6s9WwFDyNe625VUT7jJMKhhu4YF-qqc--haXkKBQ>
    <xme:ZF_8X8MP0Ip3NBzFXfQOR_VVcX1k8AFQqevJmwCN159hdjprEGFtnxsvHli6NNowk
    L1o6SxURaOBwZ9qtiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZF_8X3PdqEsaWNBAAn-5wxQ2fD7r9hMwda3Ne61n-mJden-INbNphQ>
    <xmx:ZF_8X-SIio-iUAhVyTq9YiJEr2sJ9-XJ2-NEXT_SMAhmUULubeNjCA>
    <xmx:ZF_8X5AqKI7w7EVY6v6z5Kc7Vmb8K47mprZ9xdIF6Ttgso7AT4MUoQ>
    <xmx:ZF_8Xy0M_oXuoVtcLCYagfLbqFUPgk8rvwafjwAa2yEEhZctumKBCQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 660E824005A;
        Mon, 11 Jan 2021 09:23:32 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 15/15] ARM: dts: bcm2711: Add the CEC interrupt controller
Date:   Mon, 11 Jan 2021 15:23:09 +0100
Message-Id: <20210111142309.193441-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC and hotplug interrupts go through an interrupt controller shared
between the two HDMI controllers.

Let's add that interrupt controller and the interrupts for both HDMI
controllers

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 8bb46ae76a92..06b15797ec11 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -316,6 +316,14 @@ bsc_intr: interrupt-controller@7ef00040 {
 			#interrupt-cells = <1>;
 		};
 
+		aon_intr: interrupt-controller@7ef00100 {
+			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
+			reg = <0x7ef00100 0x30>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
 		hdmi0: hdmi@7ef00700 {
 			compatible = "brcm,bcm2711-hdmi0";
 			reg = <0x7ef00700 0x300>,
@@ -338,6 +346,11 @@ hdmi0: hdmi@7ef00700 {
 				    "hd";
 			clock-names = "hdmi", "bvb", "audio", "cec";
 			resets = <&dvp 0>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <0>, <1>, <2>,
+				     <3>, <4>, <5>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "wakeup", "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
 			dmas = <&dma 10>;
 			dma-names = "audio-rx";
@@ -377,6 +390,11 @@ hdmi1: hdmi@7ef05700 {
 			ddc = <&ddc1>;
 			clock-names = "hdmi", "bvb", "audio", "cec";
 			resets = <&dvp 1>;
+			interrupt-parent = <&aon_intr>;
+			interrupts = <8>, <7>, <6>,
+				     <9>, <10>, <11>;
+			interrupt-names = "cec-tx", "cec-rx", "cec-low",
+					  "wakeup", "hpd-connected", "hpd-removed";
 			dmas = <&dma 17>;
 			dma-names = "audio-rx";
 			status = "disabled";
-- 
2.29.2

