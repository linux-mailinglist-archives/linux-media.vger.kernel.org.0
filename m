Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070E42F182A
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbhAKOZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:25:06 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35043 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728070AbhAKOZF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:25:05 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id A5420580673;
        Mon, 11 Jan 2021 09:23:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 11 Jan 2021 09:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=SDxCcurjWzwhz
        oqpeRp22hxUkocQjnOCHFbLsnXrelE=; b=D+LEoaF6HueE3Wks02j55NVuTL/cZ
        1CY4KCGOq32XRV2c+p9uS4hGFDEAHFV8pq1Jn8mPaQAM5AF45LLZYqDqePG+NtaV
        uoKJvMD3Qg3GcIsCTNMPlD+YL7dSn8UBEH6cqwx8VG7o3CqIflJgCxDyHu/T9uCi
        fawVKXb8s9lNK4m35p+F92E8PUwO/Ug6pNAVsLjSe9n/6V1ksimkCPWqLdHJHATF
        BoOvkEQS1AU40oQO2t3kMXeVCi+X87nr9DfXHMkw+tt1QcF7OPsvem469KlOmN6V
        Zyhm8i5S5MClRFDenX9Y2W1mb1DQKwCYxJ/rsDn1SLsaHdIpjiwhdJG0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=SDxCcurjWzwhzoqpeRp22hxUkocQjnOCHFbLsnXrelE=; b=HhF6kXQQ
        cEKEl9jZKhStuGk+b3lesfGKOY8hkTzPU1sHMOYIcPhOZdhgQwXpRzqQr5ZXGzqs
        ndfwhsZC4BgGHRtFtUgWEMkcAlfoDX//PplH/MudRHyLwpsV7JGPmBUvDktZRRYO
        SLYaeRHjx7IPFMIxIJVpxq6+dGh4CALFt/Rh4K9NticKUs8p8/1nbxLl4AW+YhUt
        /8/RTlxb1chT2cfOq/wAsCrESnzimcIG+F6BZEYWO4Vxbs4lF6iW5M49rdXX4nb9
        m1ETwHnT2Pbv7om7GzD45yA4Oxrbt0yPCdqK/Hqyj2PbMNL1l2LCaBrY04G7jqMV
        teN4D7inzRH2rA==
X-ME-Sender: <xms:Vl_8X5HRt8qKjpfBbOUcoUwhfPBzsJZN-xShvr2J4-OwZk60HUr08A>
    <xme:Vl_8X-WcLq5u2b1y5t2c7tEePs_DxAFMVRyRjPxwzru5SiwH7mmjJBfuWz8niQeAV
    iR54fX2AtEVWP6vzuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Vl_8X7LjSjs0a_zSM-l1EoMrIc369zB8sbdkLOWUL84pQFH8-_r6EA>
    <xmx:Vl_8X_FKcBBDleLaSYlx2QEstoA8EMpC_cLTl2iRWUCnA_V-lfb9CQ>
    <xmx:Vl_8X_UylDOXK4QXHzKLcH-C-Mnys6FdsT4-jClevtHHriR48U7X5w>
    <xmx:Vl_8X8Xq-dcaSe5McG77zpkAeyTlIcip_zw5GmUCQyxduILCvJ2tdQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 33EC6240057;
        Mon, 11 Jan 2021 09:23:18 -0500 (EST)
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
Subject: [PATCH v2 05/15] drm/vc4: hdmi: Restore cec physical address on reconnect
Date:   Mon, 11 Jan 2021 15:22:59 +0100
Message-Id: <20210111142309.193441-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dom Cobley <popcornmix@gmail.com>

Currently we call cec_phys_addr_invalidate on a hotplug deassert.
That may be due to a TV power cycling, or an AVR being switched
on (and switching edid).

This makes CEC unusable since our controller wouldn't have a physical
address anymore.

Set it back up again on the hotplug assert.

Fixes: 15b4511a4af6 ("drm/vc4: add HDMI CEC support")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7945dbcee78c..c3a301396aad 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -136,20 +136,32 @@ static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	bool connected = false;
 
 	if (vc4_hdmi->hpd_gpio) {
 		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
 		    vc4_hdmi->hpd_active_low)
-			return connector_status_connected;
-		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
-		return connector_status_disconnected;
+			connected = true;
+	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
+		connected = true;
+	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
+		connected = true;
 	}
 
-	if (drm_probe_ddc(vc4_hdmi->ddc))
-		return connector_status_connected;
+	if (connected) {
+		if (connector->status != connector_status_connected) {
+			struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
+
+			if (edid) {
+				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
+				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
+				kfree(edid);
+			}
+		}
 
-	if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
 		return connector_status_connected;
+	}
+
 	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 	return connector_status_disconnected;
 }
-- 
2.29.2

