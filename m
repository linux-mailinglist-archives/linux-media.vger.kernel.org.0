Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8232D5C64
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 14:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389621AbgLJNxW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:53:22 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:35563 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389333AbgLJNsv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:48:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id CC067EAA;
        Thu, 10 Dec 2020 08:46:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 10 Dec 2020 08:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=9zT4SpUh2O9xg
        fXQcQB0u+zTC7OafgG+M5FT6pVoNfg=; b=VULlHb9jbwXMgeHYzRNqxqcW9SDI7
        bHEI8QFkUOeFuDfI+gyMqT99YnC/os9n6kF3AQ8F9kzWnzXfBHvPJuR9RChkYIze
        lCmuM13Sp9aWo7Y08fy0LdW4BTfd3cvsRXJH3ayA/3u5pBgX5zzsIkhKdVaELt8L
        879fL1mmTTSVJHYREQgbgA7uvSVm1pUBJgM++ldhu1asZklBspA1lkBmLE7Fi7P8
        epMwNVtFNxJ9SwffaxpF1niUI6JGRIanCxQpI6T6tbX1l3EqhxK27EwNzV7h+PWW
        vETsO3PYguSDH99iKgsk1jXnK1hyKJuc0HyFMnYnkY90ckMwTu3LtFEyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=9zT4SpUh2O9xgfXQcQB0u+zTC7OafgG+M5FT6pVoNfg=; b=XsU0O7xx
        J0K/JerxzxpfuUBpLgjubCgq/b6Bqaa2gp6L/XDMKGBqSFkOfGawuennNy5Cf5t9
        bnjD3z5BKASkho1mZgA/vSLX0dH9pTmQpO8QWPoPDU78LjbwvPKnicjweZv3n1Pd
        BjMehmcnxz+3d5/j7UH0lBfZ/LQ56jjsE8PAZrKcKdepbbUveWHsvOVLqK1H+5dZ
        N9CoD60JmV6JDsh+lQYKBZXBbibWN38/lbF4XWEfL1sqINPn1N2q9eRqwFOPrJB8
        TIFFq3SSVGmHkUxQi6llCz0Fp/4J/ubPCMgfNdDo86Wm1jU+z0j9vRp30ww0cY7w
        MYJTYDuHBJJegA==
X-ME-Sender: <xms:0ibSX8MX3CqqxVyhS5B-IjPIfTBov5rWeTxt8cjkG0LzhDRwrpS_VQ>
    <xme:0ibSXzYGdRAZTYBYR1_NSorUXYfW0a9gbWRMew1JDtjujpk3z4chgrWXoiRKhi3nY
    cAHw1M-IDdtJ9TsaVk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0ibSXz8lN3zrwRSS2L5WNvIzmJqL1qOqvnI3xRWxWJkPVjN-By_nrQ>
    <xmx:0ibSX8Rc0d6fIDy8LuUJoZ-rke9Ef9QfciqYyyG6fAS70sdKsIL5Pw>
    <xmx:0ibSX1fQ0uibyiL1aQhItbUaq65bIYvmd6Q7FAHkdH72p7Dm88GsGQ>
    <xmx:0ibSXx8ScEJ_joiADrk3jnjAhpOo_IPXXIOd9j5fmSNqNho2g7bZXOWWyEo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0E0CD108005F;
        Thu, 10 Dec 2020 08:46:57 -0500 (EST)
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
Subject: [PATCH 06/15] drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
Date:   Thu, 10 Dec 2020 14:46:39 +0100
Message-Id: <20201210134648.272857-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC clock divider needs to output a frequency of 40kHz from the HSM
rate on the BCM2835. The driver used to have a fixed frequency for it,
but that changed and we now need to compute it dynamically to maintain
the proper rate.

Fixes: cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eff3bac562c6..0c53d7427d15 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1586,6 +1586,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
+	u16 clk_cnt;
 	u32 value;
 	int ret;
 
@@ -1611,8 +1612,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	 * divider: the hsm_clock rate and this divider setting will
 	 * give a 40 kHz CEC clock.
 	 */
+	clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
 	value |= VC4_HDMI_CEC_ADDR_MASK |
-		 (4091 << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
+		 (clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
 	ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
 					vc4_cec_irq_handler,
-- 
2.28.0

