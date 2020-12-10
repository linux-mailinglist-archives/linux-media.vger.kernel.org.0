Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF8F2D5C63
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 14:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389162AbgLJNs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:48:56 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:58307 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389313AbgLJNsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:48:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 5FD093DB;
        Thu, 10 Dec 2020 08:47:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Dec 2020 08:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=U1K9CT6BAj2yS
        ZWLXy5gbPJsyoT3Q5gJl2rqRfiHtgY=; b=CXygC3Nk3R1wTsazEChyXKFfzl6r4
        /Gw8fvPx7Rey/VLw8QvfTLvLcBf5v9CjZfptriGTassqsZeILVNnx4RwJiQxZnmM
        ibuvPeDWn2WPGiVMuK4L4mLK6nDmMIG6wRBdPV61NzK33j9VoxIIHKKqailcUG0L
        OejVvaAw0agFChyMkHKnr6MC+hmCVCaPTbyDu5hEKQZUpKWHZWRIeHuo8PHXFQBB
        /T3mpxLyTCyw+TxlFIhuGcQEN3F9FeXHtU2J/M/JNdp1H8MPpzA7aOnFs0Whe24y
        H+9Salq9XdHfnADGYGF0gj5yRrTloglHMBNr33XNaJGw+G3kwQAPChIpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=U1K9CT6BAj2ySZWLXy5gbPJsyoT3Q5gJl2rqRfiHtgY=; b=ASeCylp9
        Ipzj0CJC3HVU1MCeqY19Jt0rvVI5UA4lPdopEKffCDtoRxdSOiw8KO8s7iihwxf7
        TBw6DhgkjXMPefSnwKvppf+xGcK5S7SdGYFvePtk84RaMC3Tz2KKT/4+6OBen48U
        S4wMOiENXPAmvLjKtOyjYWIJg2GcPtPfQNB4HB0VB+yduTQSRNEXgYFPo0vL+Ifz
        7vyzb12avB5Mp7ucTMmbPnB4AHhHWy5jG4N+aQ3MFfaQfneogmOr8aTl56KTtw84
        tUVRIszdl98mwzFcqNDpAves5XSB9eyJdAJ28owzfZ1pCr7KhJ5Iis9tmb4FhQLj
        Ku2XwladxFdsKA==
X-ME-Sender: <xms:1ybSXwnzm4Sd-vu4IPoyI3tXYGa4NeJnR7XixyVi_6C57uk4IyncVQ>
    <xme:1ybSX7tj8WNer9V6x-GJOl1GFIHZgIE0zRtdG2AOgrPoYQ-q6zp4xtCpwQ_46OYVF
    EmPUscBe3jLZa5-8NM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1ybSX7qTkFdSp2fuozu2UQb0Sc61kSsX9t_AK7qBUGHUkWn5vzSYcg>
    <xmx:1ybSXxdt8WVfeMFXHMbkX2tDAxt_FsofNRLGZrvFYfzrvuLTqmyzzA>
    <xmx:1ybSXzlWU5tdRsuDzv3qbyNIsEeOJJJoXagY1ztNZbJly-ulAe1_3A>
    <xmx:1ybSX-KtMjX8fdGE5pLzLu8Ktvrrh7JvHbVwwGhywPfj03B5jXsyll_TeWw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id ACC16108005B;
        Thu, 10 Dec 2020 08:47:03 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     Jason Cooper <jason@lakedaemon.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 10/15] drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
Date:   Thu, 10 Dec 2020 14:46:43 +0100
Message-Id: <20201210134648.272857-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HDMI controller found in the BCM2711 has an external interrupt
controller for the CEC and hotplug interrupt shared between the two
instances.

Let's add a variant flag to register a single interrupt handler and
deals with the interrupt handler setup, or two interrupt handlers
relying on an external irqchip.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 42 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 ++++++
 2 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 80a81fcea315..d208b7d1d937 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1593,9 +1593,11 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 			   ((3600 / usecs) << VC4_HDMI_CEC_CNT_TO_3600_US_SHIFT) |
 			   ((3500 / usecs) << VC4_HDMI_CEC_CNT_TO_3500_US_SHIFT));
 
-		HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
+		if (!vc4_hdmi->variant->external_irq_controller)
+			HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
 	} else {
-		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
+		if (!vc4_hdmi->variant->external_irq_controller)
+			HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
 		HDMI_WRITE(HDMI_CEC_CNTRL_5, val |
 			   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
 	}
@@ -1670,8 +1672,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
 	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
 
-	HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
-
 	value = HDMI_READ(HDMI_CEC_CNTRL_1);
 	/* Set the logical address to Unregistered */
 	value |= VC4_HDMI_CEC_ADDR_MASK;
@@ -1679,12 +1679,32 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
-	ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
-					vc4_cec_irq_handler,
-					vc4_cec_irq_handler_thread, 0,
-					"vc4 hdmi cec", vc4_hdmi);
-	if (ret)
-		goto err_delete_cec_adap;
+	if (vc4_hdmi->variant->external_irq_controller) {
+		ret = devm_request_threaded_irq(&pdev->dev,
+						platform_get_irq_byname(pdev, "cec-rx"),
+						vc4_cec_irq_handler_rx_bare,
+						vc4_cec_irq_handler_rx_thread, 0,
+						"vc4 hdmi cec rx", vc4_hdmi);
+		if (ret)
+			goto err_delete_cec_adap;
+
+		ret = devm_request_threaded_irq(&pdev->dev,
+						platform_get_irq_byname(pdev, "cec-tx"),
+						vc4_cec_irq_handler_tx_bare,
+						vc4_cec_irq_handler_tx_thread, 0,
+						"vc4 hdmi cec tx", vc4_hdmi);
+		if (ret)
+			goto err_delete_cec_adap;
+	} else {
+		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
+
+		ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
+						vc4_cec_irq_handler,
+						vc4_cec_irq_handler_thread, 0,
+						"vc4 hdmi cec", vc4_hdmi);
+		if (ret)
+			goto err_delete_cec_adap;
+	}
 
 	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
 	if (ret < 0)
@@ -2083,6 +2103,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 		PHY_LANE_CK,
 	},
 	.unsupported_odd_h_timings	= true,
+	.external_irq_controller	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
@@ -2109,6 +2130,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 		PHY_LANE_2,
 	},
 	.unsupported_odd_h_timings	= true,
+	.external_irq_controller	= true,
 
 	.init_resources		= vc5_hdmi_init_resources,
 	.csc_setup		= vc5_hdmi_csc_setup,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index adc4bf33ff15..27352827f70c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -64,6 +64,13 @@ struct vc4_hdmi_variant {
 	/* The BCM2711 cannot deal with odd horizontal pixel timings */
 	bool unsupported_odd_h_timings;
 
+	/*
+	 * The BCM2711 CEC/hotplug IRQ controller is shared between the
+	 * two HDMI controllers, and we have a proper irqchip driver for
+	 * it.
+	 */
+	bool external_irq_controller;
+
 	/* Callback to get the resources (memory region, interrupts,
 	 * clocks, etc) for that variant.
 	 */
-- 
2.28.0

