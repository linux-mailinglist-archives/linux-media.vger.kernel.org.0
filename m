Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A672D5CE5
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389231AbgLJNsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:48:10 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:53467 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389162AbgLJNsE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:48:04 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id E20BDEAF;
        Thu, 10 Dec 2020 08:46:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Dec 2020 08:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=Y7jlyLm1g9BaE
        j3fHOaKvtPJ6kyTLaLrMbDU13MaKU0=; b=rgbi72icGzpR4PywxXuAsvfWnfd5V
        thxjQ+xVCQwQFxPe8+JU5FYEP/pDab6QnI3qTJbxXSNa1vheNojqwA7c7ddD1BdB
        U5yPE9K9/tNzikSCqfgtNwNx9HYGR9O/6E3D3dFMjzbdHH5UGnhMMKzIjqQJ8K6I
        388zx/7tHRg90Zp+FRKNZyBnHvhO2rz+EkVId2IBjQwdk+8vHyJlTplawsHHe6aZ
        sYNiQ6qKyayk/NkS2AmWlfHcmvXMEMXkNfxpUtm2fnDinB3adY0oPzZk9rwjogAx
        e0vsgMraxE/G4wd7zEfxpW5CWfIdYE5PcP89s5jM74fQum+e+aZim9KWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Y7jlyLm1g9BaEj3fHOaKvtPJ6kyTLaLrMbDU13MaKU0=; b=ix991TOT
        r2ZyaYZezqxURG50cTAmfpFqOg21AD9ZKct8f6Sa2ASZMQIh8ZWp5ym3RNSrp6th
        GRmXKHagSlhKHflzVFfGyrXkgD28fwDVkJFdQX2CMabSta7AXACoOY7lMPCU39HM
        DvWa7MM7fLhLPtLK2jFdCauZPNasTDf/NpOfovNS7/OJCgvDXcMmAm9YE/EoNeYy
        sUlE/qw1iYXmitN9IBQX4w5HQVNE7plJIicGTR82uQkV09wYMflMgJpSOzE34ikr
        XR/WcPBE5cbtXmGTNnWzJgzdSiU8nMI14bn7YfZ6QdecYL6oCo9SMgnG+kAWvtnV
        d5KZCHn/L8eVZQ==
X-ME-Sender: <xms:zybSX4QKd1kizgccUcbQhx8nEUmE6lRn1UbDj5v58DvhLbea4kXGyQ>
    <xme:zybSX1uTR50krfvEouCckwVCgAlnJob6tfCoeqBtzhEniWZFdIhbC33pWcnynRUcL
    6RhcUO5V32rq_WgoaE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zybSXyt15qj92xiGeTItMdXMl72XZobjpngPfExCiw0uZ1lp_J6ZtA>
    <xmx:zybSXzxyswZoob1gGuNWqQ6GMgdH7Vd7Cqc_7aYAR6xlUux6HGy2rQ>
    <xmx:zybSXwiVWHmEE8WPx3vdeas85jA4eXoMl53w4Id9dPJoPT4vODKcnQ>
    <xmx:0CbSX6M8f7pnTGh5OZmSi65Rz-AA-FDoy1r0MvbOTo_dWeAbR3C_y3JDE1c>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 439911080059;
        Thu, 10 Dec 2020 08:46:55 -0500 (EST)
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
Subject: [PATCH 04/15] drm/vc4: hdmi: Fix up CEC registers
Date:   Thu, 10 Dec 2020 14:46:37 +0100
Message-Id: <20201210134648.272857-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dom Cobley <popcornmix@gmail.com>

The commit 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout
abstraction") forgot one CEC register, and made a copy and paste mistake
for another one. Fix those mistakes.

Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 013fd57febd8..20a1438a72cb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -29,6 +29,7 @@ enum vc4_hdmi_field {
 	HDMI_CEC_CPU_MASK_SET,
 	HDMI_CEC_CPU_MASK_STATUS,
 	HDMI_CEC_CPU_STATUS,
+	HDMI_CEC_CPU_SET,
 
 	/*
 	 * Transmit data, first byte is low byte of the 32-bit reg.
@@ -199,9 +200,10 @@ static const struct vc4_hdmi_register vc4_hdmi_fields[] = {
 	VC4_HDMI_REG(HDMI_TX_PHY_RESET_CTL, 0x02c0),
 	VC4_HDMI_REG(HDMI_TX_PHY_CTL_0, 0x02c4),
 	VC4_HDMI_REG(HDMI_CEC_CPU_STATUS, 0x0340),
+	VC4_HDMI_REG(HDMI_CEC_CPU_SET, 0x0344),
 	VC4_HDMI_REG(HDMI_CEC_CPU_CLEAR, 0x0348),
 	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_STATUS, 0x034c),
-	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x034c),
+	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x0350),
 	VC4_HDMI_REG(HDMI_CEC_CPU_MASK_CLEAR, 0x0354),
 	VC4_HDMI_REG(HDMI_RAM_PACKET_START, 0x0400),
 };
-- 
2.28.0

