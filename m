Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20DF2F1836
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388658AbhAKOZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:25:30 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33651 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388653AbhAKOZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:25:30 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2B3E558067B;
        Mon, 11 Jan 2021 09:23:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 11 Jan 2021 09:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=oF2c8RtGuGOQx
        0NuWFKyb1O+fDU65e2lv5WMJgou8cE=; b=lgKYipFHSFFzM0LKtX5AT61Vez63G
        anGWlYQALJW5d6eNLP+tGCuT9GasTnDz9ODD8sL6MIC4DsHu4gotPP2V5zAXmdQb
        sYVaOkft7OqdbO2/GDxORSRyQWBIqq0bwcOGHM1TmgKWyz6xActtPJmcXaRXYX0d
        12CY48Vo53JPrHGlaYPkfalDlophRfLBc6pAN4ZEY7WoOX838dVSAz04Fk+4zr7Z
        KrgFF/tPhavlV+L7hW7qz4jwC4dHWMcXUupULjS/VWMzNsWhiWsIn8GLneVh64Om
        7xg5jBUekyC3g16TK8kQVjqBUbE0KeKFvABkOJWp7xRSjnW+WuOPeptyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=oF2c8RtGuGOQx0NuWFKyb1O+fDU65e2lv5WMJgou8cE=; b=P9YwhTB2
        B7UyAlTc1OWZsHtIUxhpe7fA/nBqgNw1Bg4Gab/Nhod57rj2Kus0IYWAVY8IE2Gq
        pdYA2/lHRb2wn1lL7hz4cV4COzx1rYJfGS6aY6eIB6o4VtlzeFO/dxqxUHcNdzXI
        gY9g9I9xR+rw9nTxTW2rwyHcSWumuAKk0y4Boi090Nypi1IjyrAmoLuUbDsHUf+Y
        MZap2rlz+FL3BpmKaOazDW7w7hn2w38CQXaiT4sys/jlBxLczjkJLmCTnrI2BPiW
        A7C2Jih6euLPzV/Ku5gG11Pa0S5VyUpCDOmJE+yKFNPdQRythZSr+f8mnn3Xxv6U
        yOLAjfw9mRNyNg==
X-ME-Sender: <xms:Xl_8XxV429KJvoQ_3BaPoxuGQahpABg5Gg3wcxvOEORjEEnbnBKqdQ>
    <xme:Xl_8X5Nai1JeybK4OBQHNmIk0IPgQWvz7kg8OFO-PhAZfUCcLrkMxnglc9GB3EbXE
    5BcwYxyDrZEV9ur4kk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Xl_8X7CdouCGu1msd6SUQB-W_X0qG3uD3_xoGQonBfPPKBZrJdZiMQ>
    <xmx:Xl_8X-cBtlBKMPG5BFYFX_f--0C7X19NIrVSUImKM6C1KEL1aRNM5A>
    <xmx:Xl_8XyN3EWvKeElKLdCvK1uUPnyA3cBiUgk1jNbEWrPRCoAaCXYEkw>
    <xmx:X1_8XzsDmOghx9r4iOcgZ6PmSXes4Z6MkGqOHP8OstGa_U9yIEEScQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B1CD9240057;
        Mon, 11 Jan 2021 09:23:26 -0500 (EST)
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
        linux-media@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH v2 11/15] drm/vc4: hdmi: Remove cec_available flag
Date:   Mon, 11 Jan 2021 15:23:05 +0100
Message-Id: <20210111142309.193441-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dom Cobley <popcornmix@gmail.com>

Now that our HDMI controller supports CEC for the BCM2711, let's remove
that flag.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ----
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d116ecfd8cf7..5a606b6f2917 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1670,9 +1670,6 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	u32 value;
 	int ret;
 
-	if (!vc4_hdmi->variant->cec_available)
-		return 0;
-
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
@@ -2086,7 +2083,6 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.debugfs_name		= "hdmi_regs",
 	.card_name		= "vc4-hdmi",
 	.max_pixel_clock	= 162000000,
-	.cec_available		= true,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index d71f6ed321bf..3cebd1fd00fc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -42,9 +42,6 @@ struct vc4_hdmi_variant {
 	/* Filename to expose the registers in debugfs */
 	const char *debugfs_name;
 
-	/* Set to true when the CEC support is available */
-	bool cec_available;
-
 	/* Maximum pixel clock supported by the controller (in Hz) */
 	unsigned long long max_pixel_clock;
 
-- 
2.29.2

