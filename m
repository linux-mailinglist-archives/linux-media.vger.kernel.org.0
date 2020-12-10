Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8099D2D5C57
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 14:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389440AbgLJNtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:49:11 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:37449 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389353AbgLJNsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:48:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 93AC8EC7;
        Thu, 10 Dec 2020 08:47:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Dec 2020 08:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=ILrwATdFQbDXy
        /hbJDA31S4DpWf2MY5kgd2rVvGLBCM=; b=d6nzjjUC08S5ahztcn353xTFz4jwk
        M6imtSFXJ+cfXtXyAhxLh2gEbVft6ScAGDvAXdSfTL3h5m+NA7thXeUfYIQI/B+x
        xEz6LCeCdMi1AJkfR0qPT0U6mF9ePcuoYomEGx9Ks1192UksxbSZ40SggoR+4VGR
        HuAifR5DYFjn1DxRMzekU9mXdo5rJ5OiXSLeVh5HDuyApsdcaf3LwXPl1Du/jRpI
        o+u2yNbahPw/EL3DHmn3PnjZh5ile1fxzTnlbu0ymnjqJ7M2gEkx9OempLDwtL37
        YdT3QSB66kKo6LIS/PYZVLsnOE5sgtocuAP8StUYYoa04d/ZeoqYRuAZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=ILrwATdFQbDXy/hbJDA31S4DpWf2MY5kgd2rVvGLBCM=; b=AQ/qt3Xx
        NWA1PWSberWpd9hczwVW/jxuMmZbL0Gt+qSpJzn+Az7NfJaimEP9/kgwa/Ihxzm7
        /l1LSMq3h64e6BzcTvEY0B6UzWxfUYk6Snqzg41Tf6FvYUd7xoxMXfRZy6Wk/gtr
        A+GiqkFSN3zyt6dSVqFKFolvPB4ioyIiI1YjuC+pC0rucJgjO/vijKPFWUmvLgs6
        Nhp6XRU9ny/54ulin2Kdg/cQt8Q3Yx4Vd+IPxzFeCjDBuSMw1iWHUybHOtUY87DL
        0+guFLC1YHG9Kp/ow8ZY/YHb0n5hVGgQ5cQB9SRB/pkweDBEdyAUgsxCrUs+uoOf
        oBv3m5roYBGESQ==
X-ME-Sender: <xms:1SbSXzN0gQro9MUZEX31A5-_C6rBU9Nb25LeGgSryMfGoHb6cBR2tg>
    <xme:1SbSXxo_Tr40dl4faA5wq_3vMLgaOz007hcXNEsI6Ug3D4fMBCNOfuoCWJRg5BXsF
    7NDTimdhxwsAIQ3XBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1SbSX66HcdO8wUY7D8Uyn6q9x16DIDHIl-wlC4eDI52VZ6GJ4NlkmQ>
    <xmx:1SbSX5FgJTAy3ns9p1zVzd5keJsuAdbRWk6z1PDS131D2KYvXvZo4g>
    <xmx:1SbSX83rwvdv8VUBgS3JmIydtvkS2PFjLoRhJhZL1oLyMJ1OkuPf-g>
    <xmx:1SbSX5i4i8WOhRz24Cpr8EJQrGkzSik5RMfPHOEmJxqt3-CzIPfntZr6LIA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C7CE6108005F;
        Thu, 10 Dec 2020 08:47:00 -0500 (EST)
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
Subject: [PATCH 08/15] drm/vc4: hdmi: Introduce a CEC clock
Date:   Thu, 10 Dec 2020 14:46:41 +0100
Message-Id: <20201210134648.272857-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the BCM2835 had the CEC clock derived from the HSM clock, the
BCM2711 has a dedicated parent clock for it.

Let's introduce a separate clock for it so that we can handle both
cases.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b93ee3e26e2b..0debd22bc992 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -145,7 +145,7 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 	 * Set the clock divider: the hsm_clock rate and this divider
 	 * setting will give a 40 kHz CEC clock.
 	 */
-	clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
+	clk_cnt = clk_get_rate(vc4_hdmi->cec_clock) / CEC_CLOCK_FREQ;
 	value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
 }
@@ -1740,6 +1740,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
+	vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
 
 	return 0;
 }
@@ -1833,6 +1834,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->audio_clock);
 	}
 
+	vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
+	if (IS_ERR(vc4_hdmi->cec_clock)) {
+		DRM_ERROR("Failed to get CEC clock\n");
+		return PTR_ERR(vc4_hdmi->cec_clock);
+	}
+
 	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(vc4_hdmi->reset)) {
 		DRM_ERROR("Failed to get HDMI reset line\n");
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 720914761261..adc4bf33ff15 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -155,6 +155,7 @@ struct vc4_hdmi {
 	bool cec_tx_ok;
 	bool cec_irq_was_rx;
 
+	struct clk *cec_clock;
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
 	struct clk *audio_clock;
-- 
2.28.0

