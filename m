Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9B42D5D1B
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732994AbgLJNrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:47:51 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:52439 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726253AbgLJNrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:47:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id E2BA3EC4;
        Thu, 10 Dec 2020 08:46:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 10 Dec 2020 08:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=xUPcbQNT0o/CK
        S0rMi5Iv5Xji1UkV8zkkBcQWdsfXpY=; b=JMm31KUvz7mbDQ0boB7bou0KEzH3Q
        PgsQy9GAKfAQMD+NjNairgVlTogOqHJjnGqDBOwycXJ7uY5sttSrckTs/X1m6w0m
        Df3KubKJmlXKlxphjOU34C2Vv/lCq+DLweNjThcArLH94cgu4rGOUAietZXV55kl
        Sd9KtpIUfwTm1ZyzbESo0+0jaSXG6F0s5NISKjZUNntHJSut8wN72DBvF2Obtb0h
        ktBRDQZ/7/TzLeINAqOn7j1nzC3HQnEPiXqVp9/35QYtc7bmUTXQj76qVdsrv25V
        DLyhpMGiQiII+f5XKTQj6S+KhjL5PRuGbhFsfsQ8IdVqQQum1vUcyIqgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=xUPcbQNT0o/CKS0rMi5Iv5Xji1UkV8zkkBcQWdsfXpY=; b=mSvmhvww
        3jLyyDHXeLC9oECwRdgfJCfrQPh4XFSyFweQ5u9E+4alfGZBGGWh0NOvh2g7aqbi
        xSKWqBDj1orLZkFlYcq6NFRqg3KsRImcfoer7V11VgM+wR3MT1qZTZcEZR8dKwA5
        XM4sTo4EiscX1eYFw8HBqnA6BjmNd2DqNskCsFBhxuF/M7jDoToSaPSKsP40reEm
        u2FrTQBBojEjhfTSMbmTdT2mhd0iLmm7BxHQYUECDEyPYyXOQWx5xOik64RJz/9B
        wNW74ba0rZRMdUhes2hO2HyCGItWPY/1tU4pvkI0X7yjkGeFnHA70B4Nsii/+Iut
        YRQCaQ5Tf4sASg==
X-ME-Sender: <xms:yybSX_j0e4yGW2dtTLl_q73iv_z3BqtIl72BUAxELajiGGeTdpF4_A>
    <xme:yybSX8A5dFvyR5vgcEmj5jqqTDWfTcy8ZktXSmZKIxObJlUpNWV7-wvfySnIQK5sD
    2vtnXgOAUdlHyky-I0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yybSX_FuvxD896r7flb3CVR6m2ytShP7CPii8l9wCUGyGz5dQbJVwA>
    <xmx:yybSX8QuPqhLh74EJmLRXRSy41leD8sTULW-FHvcgbC91EGuBPVmuw>
    <xmx:yybSX8zFcdFeTo-8DMTUjHmJoBMy4DscnTOqIxhLwB8xL2C2ZAa06A>
    <xmx:zSbSX4DDaQpSR38Y6He26jGLlHI1ZUwdGvLSBl4nQ-n_U-Sfyqf1-UNNiOk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 154541080059;
        Thu, 10 Dec 2020 08:46:51 -0500 (EST)
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
Subject: [PATCH 01/15] irqchip: Allow to compile bcmstb on other platforms
Date:   Thu, 10 Dec 2020 14:46:34 +0100
Message-Id: <20201210134648.272857-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BCM2711 uses a number of instances of the bcmstb-l2 controller in its
display engine. Let's allow the driver to be enabled through KConfig.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index c6098eee0c7c..f1e58de117dc 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -131,7 +131,7 @@ config BCM7120_L2_IRQ
 	select IRQ_DOMAIN
 
 config BRCMSTB_L2_IRQ
-	bool
+	bool "Broadcom STB L2 Interrupt Controller"
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
-- 
2.28.0

