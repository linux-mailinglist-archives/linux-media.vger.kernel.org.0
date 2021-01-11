Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1E92F181C
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388425AbhAKOYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:24:24 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:55909 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731452AbhAKOYV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:24:21 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id AF511580671;
        Mon, 11 Jan 2021 09:23:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 11 Jan 2021 09:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=dUEU7+mtatpsm
        3n6Bg9z6AG1wwyBz3mt2EN+DMCMFms=; b=VFeIERgoP1KDc8lohNc8ynOVu49A5
        3/TrQ4eZOaCgUJxaXOtul3Qca276iGHNMW3OcDuC9xTG4z5T8BDynGRbUzJo3nOP
        4OLXd/jkXfqWw/mNqqeYmUlv+lNTNINkOP7vhVnNmygeyi7zyCa8ztLbvBS67BuV
        LAB3dMMil6gtioJ5S+agh4JWHbgriUb/kPpD8BQO6EIa6cVz0bJg5XSoQlgZGpto
        V6TzRGj1d9UuV8qTDS7JSMrR/pqkhDuAY8mb9niufbP4iIoPz+fsUs6JN8FLJp+T
        7HlCbDkxL+Zu9BQwlEbxax+V2X+nTe2dZw28eNU6T6QPOBFdk+ddaBO8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=dUEU7+mtatpsm3n6Bg9z6AG1wwyBz3mt2EN+DMCMFms=; b=fH/TbQTu
        VvTYmy6eZuzBRMdE3KBI07s7S/ZYHniQm6doAXT9gAAbQgjNHtijFC/Y6d7Rk8hY
        S1YckK3IAHB7cMb/2kZcpaMe2mhoPMAZDkWJsEb2oK22dxQwVWXiTkbdzQnMP08O
        9EN48FKCTeWDnfWBpfEYyV1z/gkGEsgLh1Tr0SBk9bk4ZqLC5YRmmX77g7aRBWvY
        0LFg5bOa762jwLji/rufhVoqePEUncPcv1rBVIWiCCJj3UX15cw8WEAYdSvqRvFn
        lBO/CzTL0x/o43+8ktuDCW5fj0/rUOu6L+/H9g/U4VByc40b+XBOABGVDXxqyXZG
        MPOUAQoa1ucpLg==
X-ME-Sender: <xms:U1_8X7UVCdisTpJ7vaMe3JuXFjcc2NDJ_KdwgfvCzcGFS5NpZkwcAA>
    <xme:U1_8Xzn4MGbOsmdrTpSkCHy3lCa1E-erWxuCouOnaRw6RfCgptt2jVSKJNqkn8kMA
    rM6u8HS0LftUpI_VOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:U1_8X3Y-ybsz3HGTv3PYvFb7qy_iwQpNldmEEbBsTAnHFC14jWZcyg>
    <xmx:U1_8X2UIefAFuq4WR4wWjsq2wxmQ0CPlRi2oWvDrWAXZUwKv2dggfQ>
    <xmx:U1_8X1kVc7Bz2Rc6zV1UDu1yQun8u_lXFLxEi6J_vXeDTP9aMUmUkQ>
    <xmx:U1_8X3kgRh5ylHHeQzEqrz_2skjiwpGGtezW0VupgA106v2kU71lcA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4300824005A;
        Mon, 11 Jan 2021 09:23:15 -0500 (EST)
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
Subject: [PATCH v2 03/15] drm/vc4: hdmi: Fix register offset with longer CEC messages
Date:   Mon, 11 Jan 2021 15:22:57 +0100
Message-Id: <20210111142309.193441-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dom Cobley <popcornmix@gmail.com>

The code prior to 311e305fdb4e ("drm/vc4: hdmi: Implement a register
layout abstraction") was relying on the fact that the register offset
was incremented by 4 for each readl call. That worked since the register
width is 4 bytes.

However, since that commit the HDMI_READ macro is now taking an enum,
and the offset doesn't increment by 4 but 1 now. Divide the index by 4
to fix this.

Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cb4594e7df6f..7945dbcee78c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1443,13 +1443,20 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 
 static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 {
+	struct drm_device *dev = vc4_hdmi->connector.dev;
 	struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
 	unsigned int i;
 
 	msg->len = 1 + ((cntrl1 & VC4_HDMI_CEC_REC_WRD_CNT_MASK) >>
 					VC4_HDMI_CEC_REC_WRD_CNT_SHIFT);
+
+	if (msg->len > 16) {
+		drm_err(dev, "Attempting to read too much data (%d)\n", msg->len);
+		return;
+	}
+
 	for (i = 0; i < msg->len; i += 4) {
-		u32 val = HDMI_READ(HDMI_CEC_RX_DATA_1 + i);
+		u32 val = HDMI_READ(HDMI_CEC_RX_DATA_1 + (i >> 2));
 
 		msg->msg[i] = val & 0xff;
 		msg->msg[i + 1] = (val >> 8) & 0xff;
@@ -1542,11 +1549,17 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct drm_device *dev = vc4_hdmi->connector.dev;
 	u32 val;
 	unsigned int i;
 
+	if (msg->len > 16) {
+		drm_err(dev, "Attempting to transmit too much data (%d)\n", msg->len);
+		return -ENOMEM;
+	}
+
 	for (i = 0; i < msg->len; i += 4)
-		HDMI_WRITE(HDMI_CEC_TX_DATA_1 + i,
+		HDMI_WRITE(HDMI_CEC_TX_DATA_1 + (i >> 2),
 			   (msg->msg[i]) |
 			   (msg->msg[i + 1] << 8) |
 			   (msg->msg[i + 2] << 16) |
-- 
2.29.2

