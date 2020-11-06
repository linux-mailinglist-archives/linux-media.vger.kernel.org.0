Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65F92A984D
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 16:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgKFPOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 10:14:33 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38511 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727665AbgKFPOY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 10:14:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id AC98F580701;
        Fri,  6 Nov 2020 10:14:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 06 Nov 2020 10:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=SzmJUpEELVvdR
        xE50uIjwGm8zMB0GdoR18I3irVVZQI=; b=RCCAOLFsgkOyCNGZmUO2sVk9uv06J
        qAMp84Mbv5OmnpO/oVhohP81FilXzdgbNTPY5Vey/aaI6uwCVYhNdMj8RAy7WfLF
        cewW8iwlEUaJ/Ht0CTeKievU0XRMTCbvSgErdO/Bc4Crolk3qtQBaPmkMdI+nUpz
        LEoytHBqeIRu4RpQyyeoeJqwSJoBOdClaFeJ2o647tNTEKWZSk48PHbLV4OGLi3T
        5Cvavapc44/EaKa8zp3ePHMUCMpXpHFK7LJal33umIuxukpjS92KSLd60cHRyAm0
        T1aZUyLVd3XIF2Tug8RfKzswxFEKadKJbC7BG+Uw2p5AKil+Yawb+BV7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=SzmJUpEELVvdRxE50uIjwGm8zMB0GdoR18I3irVVZQI=; b=BytyAt+R
        sMjY8gQbI5HJ5sGPo6QMPPFmnCK6+KDsy1wvSPU0nUAMhn22BnTQ4UsS8vgfAMEZ
        XUSiSKZvoutzCYgQDjaG0E/TgT6iobizThUVMxKZDUkhS8Ewm8RVjboX1gLeecuP
        m6coczlSLFXfEp01WZoxwipYBERIhmEfE6vLVNW0UIAQuNwTNUJKDyyHyVDnFEoX
        m5QFhDNhHb+Cu9rFJzxqKkz3xHMqWs25OxxNccD5E9J1zS9cJZSHI6Jp6c98lYEH
        r2ZnXRfQ4BpNdukZtCgaBD8TtUqv6bycm6ePNgApkjMltKFmyPF4hUMACdxHlSBP
        a2vSkZnYalBYvA==
X-ME-Sender: <xms:T2ilX3wyiOdT9FK4ymEi7mv0oneD9pLoakL_Gd5lN1vmObQvLdgtNQ>
    <xme:T2ilX_QCn0yjaf2aRsn4v-tTfUDa1K5rZW1Rwf8uBi0VqtZIePj81TwvMY94B-y8a
    Io1KDl1fdtptIFVLzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:T2ilXxXSq8RdxYQlQcj5jRxU4aDsgUE7HxME6IVD9t7B3HAwRSUE6A>
    <xmx:T2ilXxi9JkK6tkWO8M4i4vcxe-MJPWxkRqh2e1-AILWKMg9qMyoCNA>
    <xmx:T2ilX5DXxVbPlhA9QFSjBI-d6KI2kuMH83T7uZcFHCXY1EX4eoE6Nw>
    <xmx:T2ilXxZRyNBPR3tXZYSnu_anBhpuggG2k4xdndsixbBfBz07at6CLA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 24297306005B;
        Fri,  6 Nov 2020 10:14:23 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 7/7] media: sun8i-di: Remove the call to of_dma_configure
Date:   Fri,  6 Nov 2020 16:14:11 +0100
Message-Id: <20201106151411.321743-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106151411.321743-1-maxime@cerno.tech>
References: <20201106151411.321743-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

of_dma_configure is called by the core before probe gets called so this
is redundant.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index ba5d07886607..ed863bf5ea80 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -825,10 +825,6 @@ static int deinterlace_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_dma_configure(dev->dev, dev->dev->of_node, true);
-	if (ret)
-		return ret;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(dev->base))
-- 
2.28.0

