Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24CF2D5CE7
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389298AbgLJNso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:48:44 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:49761 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389162AbgLJNsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:48:35 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 41B95ED0;
        Thu, 10 Dec 2020 08:46:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 10 Dec 2020 08:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=zEz6d6/r2UCSq
        DFjDfIPTijjbsA3ikvSmj5cNSEn5Sw=; b=qSoFGnUF0NO8W40Z+5kn/OejeVUTh
        +KXpfLw2QTxbCPsoJMr6t2E+XtDn7aBrb6X6t01SzG55sXpqaaw318WKm0ZXTPqb
        FSz5q0t+KWRaZTs2YDevVjL0Rlxk8LqasFAvVs8Z+Pz1an5zY0s4c9kbMXgGcY6H
        27bIVbFgqizdOCOPNHigpN+A87cF12yjr+SJX/HzfGKNDxmA4pwxtzFODPSvdxAu
        wTiSgYNW54akI+5ywWIBoJ0RvIkeJIetpUlExHcj3Xn5ToB9g6DMuSFiHxIqt6MH
        rLRjBV3oPo9o7ILj36RrMIP//deTm4iJj6c2/LPf68bfjU9jX4yyD6HBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=zEz6d6/r2UCSqDFjDfIPTijjbsA3ikvSmj5cNSEn5Sw=; b=TLc97VWV
        lCnIjKWXtUutJ+L70xDn3B8zv1CPNpAvYIT3SUbQz6ZpQZdrW3Jf7mJYXponQGZT
        fvL6VNN/4RGt59WC13RppIxkSY0pkurMDFsqe777h/bIZiY7d986NwhH7jlrNXq2
        i/VzBQXaeR5x/pv24DvfqlPHo4yxtGDfgOe6x318KaH/4fzfq1TB89NxeRqJ6kwW
        dnvuucMphPneiVddq9yrt2wbXsBPCvTajhed5MDcWlLX6ZefNhmXiZtJTXAkGGK5
        lblg8iX6zQjySqhFJ6QVnjkr5EzlY7vafXVp8mFk90z72+al6IiC5S7le4vtOr/9
        M+fVdE76xtsxhQ==
X-ME-Sender: <xms:0CbSXzT3n3kxTM-tSxzHrWhrGpn2n3KE8R7-O8wVC0x0g91BM1UbxA>
    <xme:0CbSX5HkvBpE7eWX4t2pOMQj7xP6Zpc-1WBn_oCnHzhOvHOm6uO5TEfQTjmaYMfS4
    uMRG_pwKL_3D2YEsUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0CbSX39KCGdXKydDpHt57M_xHIZ-uVEE_51eLDot920tVwZa3F7g6w>
    <xmx:0CbSX7LJW9LqlBENmVLA10F_ZyiUh6U53_JFGYODacp26GOO2DPMuQ>
    <xmx:0CbSXybV4IjY1n4oNp7GON9TDLBLcWuh4w9IqQVPFmNWRtID283gwA>
    <xmx:0ibSX6DVcTPnbfikAbItFnqrrrjzDmEm3Z3gE1N-zd4Qm1En4VJqq0jLv68>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A4B2D108005C;
        Thu, 10 Dec 2020 08:46:56 -0500 (EST)
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
Subject: [PATCH 05/15] drm/vc4: hdmi: Restore cec physical address on reconnect
Date:   Thu, 10 Dec 2020 14:46:38 +0100
Message-Id: <20201210134648.272857-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 28b78ea885ea..eff3bac562c6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -136,20 +136,29 @@ static enum drm_connector_status
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
-	}
-
-	if (drm_probe_ddc(vc4_hdmi->ddc))
-		return connector_status_connected;
-
+			connected = true;
+	} else if (drm_probe_ddc(vc4_hdmi->ddc))
+		connected = true;
 	if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED)
+		connected = true;
+	if (connected) {
+		if (connector->status != connector_status_connected) {
+			struct edid *edid = drm_get_edid(connector, vc4_hdmi->ddc);
+
+			if (edid) {
+				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
+				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
+				drm_connector_update_edid_property(connector, edid);
+				kfree(edid);
+			}
+		}
 		return connector_status_connected;
+	}
 	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 	return connector_status_disconnected;
 }
-- 
2.28.0

