Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F092D5D0C
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389980AbgLJOHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 09:07:03 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:49809 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389126AbgLJNsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:48:02 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.west.internal (Postfix) with ESMTP id 037C7EC0;
        Thu, 10 Dec 2020 08:46:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 10 Dec 2020 08:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=+8Peq+aA0pf7+
        XBnW4o9oio5mhtAYTcXdLqVFsQqfiA=; b=fQvsria5XvwY+V4dl+JNKr3FZX9M6
        d+1O5uIqXC51gdbrNsO/7qhAHl0BvNPDgBf8sZYVJMJIY7/HC4M6IhIeQDZ4ZOuc
        JODf1wp9bPHvZ3wtT6DaFEw/uZBQ42XZQlIFPgz2SnpoXNScxChtMOlwaPBiSh9+
        /hgLnxei4WImhKzj2wydujo20VRRLTlwciz+31jsgebDLLTkNScrqFGQH+z7VOym
        R6IIqolSr5WvVWpa9eJ6uTF7/BstxOQdfU07+LnIn/nJmrhg9PUjzYUWb9SS6J6Y
        ZJqwIN8gW71fc7TttEBQJTi3uEM2wT+7aCucikUFs1s6eSHGyZ1lI8PFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=+8Peq+aA0pf7+XBnW4o9oio5mhtAYTcXdLqVFsQqfiA=; b=NzYOiw8y
        g//hMBaNu/MNPxcjNtWSBOyj3+gvUGSfqvfrnVHy7OHQufOARZp4zweXON+vjRGw
        iJdWF92hhuO8Ir++YTZlV93jDZfso8vOpCGLFjKYdcXz+4njSTAsJvnA5JZfPAvJ
        d0c+k8tVrUQ45ZY0izCOs3TrrZ4o6NXNk9ziBc5NukQCqSVsCC5xEIuNsIFcT33P
        2aiqTA1uS8DBNPOYXlfIOz8Qqa2oXq6LmUurjGjvH+/jeisogugAXjr/G5h1ytM5
        M7lULzE6c1Du6zrTKcuSOKkDN6k31Fj8LVhIWFGrXencgDJZ3qp3KiMgX2zMpPDf
        xXqJDPOLihuTqA==
X-ME-Sender: <xms:zibSX72Xu7MRAPT1h0jQYRGpRbcqPC2oxKJRGfQgd3RjJlcn-lsRag>
    <xme:zibSX6Dq5EEcEvoQ8a6sy6ZUdkGurvM2JSwOFmml_KnKNzZ1z_TMRWVWxsDalcG3j
    m-L-n6urcOx9rN7ZcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zibSX4yb6GVJgVXMpnekNydSd-PYarmCh4eIZ9X-Uz3P66KprZJE1g>
    <xmx:zibSX4nvhO4ZnDGOhzrMZ9_b9fM-6wcMkJWKzWNTR5PNRDMMoZtngQ>
    <xmx:zibSX9EcGq272ZiwpwUsQvWwyt85a4lmH7HutKsMqZZWoRVKogZsjw>
    <xmx:zibSX2TQBNT5ZVUzNMIXOobpBIbhl6GwY7-nD_eYrlLzvbFnKh3vb-eMTsc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DBDBA108005C;
        Thu, 10 Dec 2020 08:46:53 -0500 (EST)
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
Subject: [PATCH 03/15] drm/vc4: hdmi: Fix register offset with longer CEC messages
Date:   Thu, 10 Dec 2020 14:46:36 +0100
Message-Id: <20201210134648.272857-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
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
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3df1747dd917..28b78ea885ea 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1434,13 +1434,20 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 
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
@@ -1533,11 +1540,17 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
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
2.28.0

