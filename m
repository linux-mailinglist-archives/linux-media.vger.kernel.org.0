Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D3B2F1813
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732248AbhAKOX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:23:59 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40869 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730751AbhAKOX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:23:59 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 09DA9580670;
        Mon, 11 Jan 2021 09:23:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jan 2021 09:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=4BSaHLw3KPdxH
        bMNV3PdDbKQd3CKTveEB4TTLTjk8aA=; b=rgQIhNa/a1XIPJ+qvGyOXU9eWI7OG
        BSmSuwJxYjAlug3jF4gaZwhsvve7CiFXe0quFNK8fe2ek5pWVJM98eXFigFi/Tvr
        yZC6RFeuDxyda31Tsk9JTPmENyPHtexYyGH4wrYPz0lpsd/c3s14GZ/l2U26QsoQ
        ZNIA4W3004K1moCxDHDRjSqKKGYV3NK5CBK/RUwzkMNdvUhvBJWzSWJALSZOuTEC
        9bB0lE2A3JaHxkH2YEra/M54wttA0RIJ4plGRZa7OqD0me8XaKERAc0Geqv9A8ko
        c+ws4oNj0JOeYo7CPsmFRHpW0VYadcSUNic0gcoFhgCAtFUeeqBXjGDtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=4BSaHLw3KPdxHbMNV3PdDbKQd3CKTveEB4TTLTjk8aA=; b=hDvt7dXr
        R559AxGgyFT55gPkMwEeAtGp9AA3E9g5MBn9R7ywg9kAWvjKnCqWol5OKxjiZ1JL
        z5H12v39nUSS62MOzeGhn0okPCi8zPndRfT6ajzq9+uw9uhouuT7HZ/62xlkn8/L
        3Mi5jV8/WJ1bkJzzBo3RTyo4brddkianIOOSzVGLzDj6VaoknwAAAs/l7eZOE4oI
        O2yxQysiO9+EfodcqbvjQZxLmHI0PonX50UTYBVLWLIY6a+1aPD3BwkPMMTsZZRC
        4XuAYvTaFp3uBze4XLMKEECz4pLw3ID7xg9/0DatuSG8PrU+3twZSQH+/13w4Nup
        zCnTFjXTa/TRBQ==
X-ME-Sender: <xms:UF_8X4mPoa4gbnfOOv16qGbZO9HougDDaUVS8aAzNkIJpYu_pBHXRA>
    <xme:UF_8X3y0gAo_oYlzikOpJJrWKHlSNPf2-IxP6FSB70yJG960jBT189dHAtrQrZ9Lo
    Bjor4AG7p8KgJnzD9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UF_8Xzg2aaaWs-UAoKKoN4wFCFeGE81siezGjYHb900F-g96J7S1SA>
    <xmx:UF_8X8VSza4svDVCFfbiU8Qcbe0o8dHfFIaDsEVl8pNEcRoP-gTIHw>
    <xmx:UF_8X11FZBiuf8ckcN0vVLMW982UANkluXKZOzO0dHnQIv7rXbxZ7g>
    <xmx:UV_8X-g44pZhHaDqIS7JWrShcE69GyxnQLCiUmYItwzd1HENbuV_PA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6630624005D;
        Mon, 11 Jan 2021 09:23:12 -0500 (EST)
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
        linux-media@vger.kernel.org
Subject: [PATCH v2 01/15] ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
Date:   Mon, 11 Jan 2021 15:22:55 +0100
Message-Id: <20210111142309.193441-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The BCM2711 has a number of instances of interrupt controllers handled
by the driver behind the BRCMSTB_L2_IRQ Kconfig option (irq-brcmstb-l2).

Let's select that driver as part of the ARCH_BCM2835 Kconfig option.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/mach-bcm/Kconfig    | 1 +
 arch/arm64/Kconfig.platforms | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index ae790908fc74..c9b24ecb56c6 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -161,6 +161,7 @@ config ARCH_BCM2835
 	select ARM_TIMER_SP804
 	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
 	select BCM2835_TIMER
+	select BRCMSTB_L2_IRQ
 	select PINCTRL
 	select PINCTRL_BCM2835
 	select MFD_CORE
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 5c4ac1c9f4e0..2c5620822895 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -39,6 +39,7 @@ config ARCH_BCM2835
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_TIMER_SP804
+	select BRCMSTB_L2_IRQ
 	help
 	  This enables support for the Broadcom BCM2837 and BCM2711 SoC.
 	  These SoCs are used in the Raspberry Pi 3 and 4 devices.
-- 
2.29.2

