Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFE62F1838
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730952AbhAKOZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:25:45 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53833 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732547AbhAKOZK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:25:10 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 130D3580675;
        Mon, 11 Jan 2021 09:23:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 11 Jan 2021 09:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=AgKCKi0QARr4S
        8+YcxFZCyP7RPZtrbbiyRr0jdL6ov8=; b=q2inPmSRkLvDdYDd0IKRmRqgPetqy
        53JiHeeq6alT7FaS8TACbFQOaypZ3ewk/X4tQgHPCGBC8SBQmC+f5aNHxH3Y6v/I
        qMMNfJ0s1cKuM6HXcn0jkuUspd6UzcxG/Py7zUiSQVY5xJrJ8UX6Hiq9FiSfaKvb
        cHXHwNiYY/+rxaQqkSbAOHAILOlUzxcBBDmEb6qeeU/2/5RJedV1BTsfdkBKn1bv
        OUZxpz+Xgm6YlfxQXpsBYbyjg48vwQYHZRsIDIjnt0rYDC/QEWvmgecVR9ln6wcB
        9dEpcCTTdu4fcU10ZSPjKDrJneAkiXw8GsOnXIFORm+5f8KXLOAxNkqhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=AgKCKi0QARr4S8+YcxFZCyP7RPZtrbbiyRr0jdL6ov8=; b=oNpj+mot
        78+oCeKYiC+0TbGX+XNnKovaP4CNRLhqY8z39bp+zEITFworh4ibVo1HfYgo0STh
        TzAobwkIPFGBE1lFPchzpdX1GaDKpyPvSIGULtU0+rEEUQXO2i86XdGrxn36YC+J
        bxhNwiZc9v+2721SNtdHhCx7RrQt5NYa/ILqXhNE88chOih3242DBjYldlLl02VO
        HN0PmJMGGdMTSDPVSCaDpHBYtZH3ZlSyKK1INa3k0yY9duC56I+JNpZXQ4VPjINe
        zOrDLjeqLNRjvLIn0HkVQz5RmEo8JsnSXWgdZKEHxuxzqviCGqDItEyZSx39eOu6
        mWP8Ttq2vDQwxQ==
X-ME-Sender: <xms:V1_8Xwt1g8xs4YyJ0kvewhDCzc9m88YG7YbgYET-Xz0HYUzYBxD95Q>
    <xme:V1_8X4XBFw1oXt1-BqgQ1XfJTEVAjpVRy-ZaNpMSnqGVrXEtxJycjizI5V-Wu792l
    wAhQzPURYr9p6IRPnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:V1_8XzmkxQor4FpMppnwtpJ3D_xv_KtMqfMysyO21gn5WFSLJXqWQw>
    <xmx:V1_8XxYwKGhLQXCOTb1o_6qjxeKJuBwbARztZC0KWUcbtE3ezebjSw>
    <xmx:V1_8X2NLuLWOLggumUSL1xJLirhRUX2i4wO5yxTHixj5-DnwpAKzOg>
    <xmx:WF_8XwX-Tul54PUjMaqmnXcCjFXUAXHrA_EaCv_xCyh2RF17RhNQVw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A789924005E;
        Mon, 11 Jan 2021 09:23:19 -0500 (EST)
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
Subject: [PATCH v2 06/15] drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
Date:   Mon, 11 Jan 2021 15:23:00 +0100
Message-Id: <20210111142309.193441-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC clock divider needs to output a frequency of 40kHz from the HSM
rate on the BCM2835. The driver used to have a fixed frequency for it,
but that changed for the BCM2711 and we now need to compute it
dynamically to maintain the proper rate.

Fixes: cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index c3a301396aad..50008513edfc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1598,6 +1598,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
+	u16 clk_cnt;
 	u32 value;
 	int ret;
 
@@ -1623,8 +1624,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
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
2.29.2

