Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B359A2D5D1A
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389034AbgLJNr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:47:58 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:50127 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732914AbgLJNru (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:47:50 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 0E8A7EB0;
        Thu, 10 Dec 2020 08:46:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 10 Dec 2020 08:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=4uSLGMOTN/kuy
        PBLvbfMTLZ21B8ll+2AEDI/gh8lioE=; b=HD1EvQAL3sVyckXCOBViLnMFTJCag
        cIoMV6nCDN0ADH6TM+bOYn2NrX755sJxB6dHnyM3WRRlWGw3Mf75CZH483AyrBCT
        5pVLgY9DXdWIWYtYKkmplwxCdeVir6yqWNbhi75sl+b1thX5cQOQHvFEwNSbE+h8
        22jb/JLKG9aWbyIdqmlyxOyYMS37bVEyLlorwnkhEgWs9MQ+r0yisvzAE36Dz0QR
        bHocyAP+Ea6UK6oTXD/KJI65wS7AJxYQ5mAdWWjsObPdHsxFGHuGmX7efer3imGS
        S8mHlfPAqRHz6DA2XqVdc7cboOw5JMzePrYUQ4F1R81xahA8HIuL1H21w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=4uSLGMOTN/kuyPBLvbfMTLZ21B8ll+2AEDI/gh8lioE=; b=WNXf2lxU
        3NBnjibPGKXYVhaJtm+bl8+avMoo3FRNI+ETqctqw+6XTsqC0rgaqSQxKJzCwlit
        CehR81o1LCk4vHlOOfzRJqYQw8uaer5ojtV255JqaUr9ju7yLVmnIJ20JFc8+n9B
        8/0Mq+6ALPSxKHItNvDEQJ1zUK0ZKwNSI1dGEXOZVy1OGo6L1JRmw0YqM5thvOt0
        Y0weLavKkHsfdH6YnDyqFqbvguV35jrTyvoTDIvMfGqJO4ZQOVH6RcjFxfSIJSZ5
        u01DyyDo9o4Xw2oYTOaszUMvakl6439Wn983G9KCCLAGDIYdldM7FhljIJYr3D7N
        bnfwtA8bntooJQ==
X-ME-Sender: <xms:zCbSXyYyFp6zH6Q_4lTzaRyw1LUauGB2m4WaO1RLYoPNzUJR9Y8ylw>
    <xme:zCbSX1aaf7eYCVujKirHzeN1_43gKfno8p_ctTrN1XdZyT47-6WFtuq9WIhjds6rE
    EMO4Disl6ZeKxKfadM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zCbSX89SppgnOqe3IcJHIQA9y2pM3q5qBXbipU32rLtceijz_hEzcw>
    <xmx:zCbSX0qo7ook0jv7aTZ8WucJ0CvpEHiFz8HLRTll2YuEZEeisg0BDA>
    <xmx:zCbSX9rnSx-8QwkHKzYlNyxPRBnFkYyJ5bm6cZR_05o8_GkhlFDQFA>
    <xmx:zSbSXzbjZ-P0snDgu2aGq6OZJTWlbSWVFoAAoayMLL_l5G4Tg8T7z44w6SE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 78850108005F;
        Thu, 10 Dec 2020 08:46:52 -0500 (EST)
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
        dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH 02/15] drm/vc4: hdmi: Move hdmi reset to bind
Date:   Thu, 10 Dec 2020 14:46:35 +0100
Message-Id: <20201210134648.272857-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
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
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8006bddc8fbb..3df1747dd917 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -773,9 +773,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 		return;
 	}
 
-	if (vc4_hdmi->variant->reset)
-		vc4_hdmi->variant->reset(vc4_hdmi);
-
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
 
@@ -1865,6 +1862,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->disable_wifi_frequencies =
 		of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
 
+	if (vc4_hdmi->variant->reset)
+		vc4_hdmi->variant->reset(vc4_hdmi);
+
 	pm_runtime_enable(dev);
 
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-- 
2.28.0

