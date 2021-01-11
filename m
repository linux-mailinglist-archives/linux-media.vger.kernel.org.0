Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC932F1815
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387520AbhAKOYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:24:01 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:50505 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729850AbhAKOYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:24:00 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 518E2580661;
        Mon, 11 Jan 2021 09:23:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 11 Jan 2021 09:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=HbYxmffJ5MTu/
        ilOrHKCEGTMSMCF1Ah2LxtkepDiePQ=; b=GnnoDI03HQiKgx3Du031mc35qS64h
        Bwo8zOaygK8JUEtqLsokWRxT8YqPrjUphEz4zToujN0Yus1rtU1RZhlJRAVm98cM
        RCf7Ao+Ovn41FhVbCsHlDwbSpByOQcoMoUSj9PADPnwLEkaITSROHRl46smxus0v
        BYg/kywJehuCotEk8xDpE/6Dae1venyEkIfO4RVrsZBrT2fxQsBFmrzsPKXh/n7B
        BpC5WErVhbypXj3eHHoViJ2lNOMKvKVaczlVGCuppu28944rx0n43j6jwrqJKlMI
        GGvBVpi6q+bce7x18Xhx6/OpscoLIMczNk97hYxtVItmXlGSyBPZlvqQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=HbYxmffJ5MTu/ilOrHKCEGTMSMCF1Ah2LxtkepDiePQ=; b=fpqCF0js
        cCD4QzgYr7ORKsPoR/tgsahcxK2fG5wpXczNhQjHlyFqiEtBWQMWCWhdh6iOO1aH
        4VB3GbH91vfFaE10jplfExIvaqfhe9xmPPnTGJOErRbT4OCx5qF/+zES/+XY/+hI
        aODx7gOgvD63EfTY5jQPXZDwr86RgdZmFJxT1Z/KR5aKjhcl9UGQOssB+W/LrMxJ
        h1fbIAR5ckmDBLKSkTdqkBpLYPkze3g+PNX7LoZ1voK8nt0B1A4GnWoEvc9MliYr
        GuwW59nt6Xd1rCGXyr04hTa28miVK6qJ1KYLwTRwizrRvIpUiIIpIxsQWDOpYBL+
        4YI/kUv/Lfc/JQ==
X-ME-Sender: <xms:Ul_8X_K6pnZH9IXAyKTAWA_gs5Nca3i-pbVnrIaGRfp1V1VwYvO40w>
    <xme:Ul_8XzIhAcxnLHCe_S_k1_CKdDMVYNGRwuA4QUyfUJZuhfGFbmwmCTSPTJ0kEyFlz
    -OdK6dIkFauvLRbnwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ul_8X3tmxs15lYmBONCbZto5FafHs28y-Jc5FnXzCPb27BHOOQrcfg>
    <xmx:Ul_8X4aQ00Vsir3dXihDOnk-Tiqb-Xl8x3FTFNVc5anHag-7iiQRhQ>
    <xmx:Ul_8X2axuHqn3AMIYi2yQHyXRSiIQZEHWsXlR1AJO4DrMvho0Mwbag>
    <xmx:Ul_8X-oXEhyvS3JcXsJxE4iPph9AQI7v03L2XcOVGdCVhzlBwnl3Kw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CF874240067;
        Mon, 11 Jan 2021 09:23:13 -0500 (EST)
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
Subject: [PATCH v2 02/15] drm/vc4: hdmi: Move hdmi reset to bind
Date:   Mon, 11 Jan 2021 15:22:56 +0100
Message-Id: <20210111142309.193441-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dom Cobley <popcornmix@gmail.com>

The hdmi reset got moved to a later point in the commit 9045e91a476b
("drm/vc4: hdmi: Add reset callback").

However, the reset now occurs after vc4_hdmi_cec_init and so tramples
the setup of registers like HDMI_CEC_CNTRL_1

This only affects pi0-3 as on pi4 the cec registers are in a separate
block

Fixes: 9045e91a476b ("drm/vc4: hdmi: Add reset callback")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2e5449b25ce4..cb4594e7df6f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -779,9 +779,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
-	if (vc4_hdmi->variant->reset)
-		vc4_hdmi->variant->reset(vc4_hdmi);
-
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
 
@@ -1874,6 +1871,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->disable_wifi_frequencies =
 		of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
 
+	if (vc4_hdmi->variant->reset)
+		vc4_hdmi->variant->reset(vc4_hdmi);
+
 	pm_runtime_enable(dev);
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-- 
2.29.2

