Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9234A327B1
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 06:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfFCEeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 00:34:05 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46169 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfFCEeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 00:34:05 -0400
Received: by mail-pl1-f194.google.com with SMTP id e5so4713995pls.13
        for <linux-media@vger.kernel.org>; Sun, 02 Jun 2019 21:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cjn+fe9pHSnglvx4T5q/xNRom5yt6XJeMvAMIuyqpGU=;
        b=Hfq6ax4j9v67eMl3jzhORUV9xlodMxfyEB5jUFylBnMvGjbup0xltWak92wPnYo8jT
         z0URgg2rd1r5wg+Oy3xrddVqdvePsxYBMv74zKntc+d+vjFpS0hNfzpdzd1s9AT5d4X1
         i8E4gAcDkyjhrEy5aOZTU8DXTpX6OpurnFU4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cjn+fe9pHSnglvx4T5q/xNRom5yt6XJeMvAMIuyqpGU=;
        b=OHdDLwmbON91ecXn+UF7QUgyhSHz00K9H4nOOKtaXdjB6pjizV9t8LEVyZa7SoQFDn
         CKg7pM4y8g2qXDFnI5PqloQRDxUQCdKOYA4nsSZcGpioIdVif0EaEpMUubIPrCy2qQsS
         xCFg+C7HUKH/9G4Obg8+YqTDnoYD6/Gh+q22G1r1x16Bj7CSwXEezZiWEPzUEX/luRj3
         grvpsdmdRwIsOTqtQJHa/pwGkOm0yr2CUULcsPSMVbUsQmMul3JwSHeksiVd9SY0N7WU
         vnW9X65UaEwNfMqEHIx5yPEq1nLR6W+SSQNgccU53JeRftGoRDuBd13EvNhPexmcshGR
         sy8Q==
X-Gm-Message-State: APjAAAWHd/ZvbwVsjVadavL8zOmlxNaTMfeT4VSsJ91Q41jrwkg/7LVR
        MRmgiCdvuCsqfHcBjOX8dXPcWA==
X-Google-Smtp-Source: APXvYqwtsOJ5Pc96EE50WIzahRr4M7P5Cn839A0uqq7pGgYj7JP4xpqAWFOhLexsz8HaBDU7wChTEA==
X-Received: by 2002:a17:902:9885:: with SMTP id s5mr27565604plp.102.1559536444754;
        Sun, 02 Jun 2019 21:34:04 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
        by smtp.gmail.com with ESMTPSA id r64sm16094840pfr.58.2019.06.02.21.34.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 21:34:04 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH 6/7] ASoC: rockchip_max98090: Add HDMI jack support
Date:   Mon,  3 Jun 2019 12:32:50 +0800
Message-Id: <20190603043251.226549-7-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In machine driver, create a jack and let hdmi-codec report jack status.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 2dd247670c7a..17c50d9fbac1 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
@@ -27,6 +28,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/hdmi-codec.h>
 
 #include "rockchip_i2s.h"
 #include "../codecs/ts3a227e.h"
@@ -131,6 +133,26 @@ enum {
 	DAILINK_HDMI,
 };
 
+static struct snd_soc_jack rk_hdmi_jack;
+
+static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_component *component = runtime->codec_dai->component;
+	struct device *hdmi_dev = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	/* enable jack detection */
+	ret = snd_soc_card_jack_new(card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &rk_hdmi_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "Can't new HDMI Jack %d\n", ret);
+		return ret;
+	}
+
+	return hdmi_codec_set_jack_detect(component, &rk_hdmi_jack, hdmi_dev);
+}
+
 /* max98090 and HDMI codec dai_link */
 static struct snd_soc_dai_link rk_dailinks[] = {
 	[DAILINK_MAX98090] = {
@@ -148,6 +170,7 @@ static struct snd_soc_dai_link rk_dailinks[] = {
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
+		.init = rk_hdmi_init,
 	}
 };
 
@@ -200,6 +223,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *np_cpu;
 	struct of_phandle_args args;
+	struct device_node *np_hdmi;
+	struct platform_device *hdmi_pdev;
 
 	/* register the soc card */
 	card->dev = &pdev->dev;
@@ -248,6 +273,22 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* The hdmi device handles HDMI hotplug detection */
+	np_hdmi = of_parse_phandle(np, "rockchip,hdmi", 0);
+	if (!np_hdmi) {
+		dev_err(&pdev->dev, "Failed to find HDMI node\n");
+		return -EINVAL;
+	}
+
+	hdmi_pdev = of_find_device_by_node(np_hdmi);
+	if (!hdmi_pdev) {
+		dev_err(&pdev->dev, "Waiting for HDMI device %s\n",
+			np_hdmi->full_name);
+		return -EPROBE_DEFER;
+	}
+
+	snd_soc_card_set_drvdata(card, &hdmi_pdev->dev);
+
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
2.22.0.rc1.257.g3120a18244-goog

