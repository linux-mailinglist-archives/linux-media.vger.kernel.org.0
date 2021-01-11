Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86FA2F182E
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 15:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732653AbhAKOZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 09:25:12 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44297 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728945AbhAKOZK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 09:25:10 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 82DA858067A;
        Mon, 11 Jan 2021 09:23:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 11 Jan 2021 09:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=11pCekn6vi323
        R47NZChoCtnD6NCg2tPit6OTEdjkCg=; b=W2Z52a4XnA1vMC9ArxSUAhBjKt5M9
        ZdeKIVGkIHnmpGibekMNERzrUFZjjJ2g7Z9P8u2Qu+T0310gEflhTDymy0Z2Fa6z
        YHfocyjZlT0YgmBk+Sc79olLw0yQmaazJNcpeH9XUxrpYac1Ja6cHzxuZ6SH/4Ql
        CMRIXjg4u67/8dCM+brG0OWh1G/5dyrKzZlOaZrYfJV+SDumRqBuiwyhMzQ0iK1C
        RRtysxLfdJhcJn5frcYeVqrWAyD8c78kymdQqr2bOEi5FpyM22LIyq8ExdLqcnwX
        HB2MTLwxalZ7s3UbV2aKD6G4JQJVk5zjQ0jSBJ1CM2uc0Dh6GpVpBjVPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=11pCekn6vi323R47NZChoCtnD6NCg2tPit6OTEdjkCg=; b=riLtP+ur
        EsjzAleo/MODN3QAQhjIoBLVVHucc+tzhbf3kPkTeG+2y8AuSgLfxyHj4ctCSqe4
        MqhGbcuNuJv3oy//5q9ddgOZcxc3+so82HqynwgDLh5LXLvTaqkzVAw6rIB2xwUc
        HSzfiMAYldpWjcMOHDkJzvCJAzl46O+NKARXtPy5iqcmCsosefO7Za0wo0UToFMb
        +HG6QnUy1VWyycJMv+eG8Q/2BFx0H1I+/LCn1c4JLy4HM8c1SqbtkZOadceYjk1h
        x89qomO6daLAFHnocUrX2B5n9KU4hBuBLFY4B85uFJtXmQKqshatQoN5pMkCobdP
        +ZSWPv4M1Vtkeg==
X-ME-Sender: <xms:YF_8XwU16bYmQ5karTicUc_X_j3VHuxxV3ybXhr9YXZ0Agnjvq4ewQ>
    <xme:YF_8XzwsVW2MmxbBTu-DZwPBPGw2nUr1Fs5QNJCwfwNOMAwloh5OCl-Ox30x6wxPB
    hVdcEVDV5-dKCG04SE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YF_8X3Eog5_MrfJuNEsWWZh-ubnOy6x4uPs3ID7KNt40pcsH5apBUA>
    <xmx:YF_8X4v3qs91FpzFEHJXCtY6Zl9movLESimVHD2WyImLQFbUNEstuQ>
    <xmx:YF_8X3CFBPdCHurApCQgBNST-GKVP9SweM5Q4Zff8g2zNGjHiIaH9w>
    <xmx:YF_8X2xqqJK2pJ1QoXE1oS-19Ert22e4X20uUffGHnCjLi_iMxHnAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2B57C24005D;
        Mon, 11 Jan 2021 09:23:28 -0500 (EST)
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
Subject: [PATCH v2 12/15] drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts
Date:   Mon, 11 Jan 2021 15:23:06 +0100
Message-Id: <20210111142309.193441-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We introduced the BCM2711 support to the vc4 HDMI controller with 5.10,
but this was lacking any of the interrupts of the CEC controller so we
have to deal with the backward compatibility.

Do so by simply ignoring the CEC setup if the DT doesn't have the
interrupts property.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5a606b6f2917..eee9751009c2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1667,9 +1667,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
 	u32 value;
 	int ret;
 
+	if (!of_find_property(dev->of_node, "interrupts", NULL)) {
+		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
+		return 0;
+	}
+
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
-- 
2.29.2

