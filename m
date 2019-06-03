Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2371327A2
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 06:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfFCEdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 00:33:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45057 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfFCEdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 00:33:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id x7so5471506plr.12
        for <linux-media@vger.kernel.org>; Sun, 02 Jun 2019 21:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=THpWWd94tGmQN+NdFGT3/k0LHquClB5/KK663N0sln0=;
        b=KJJ1x0++tPXhvMrHIIn+IkJ/vK8nkc8NHbB2D6JxfEvO7fQ7JvXfP5vQQym4cUZid7
         eXWRl+urkk59DTsjUfW4h8UzpjNysutkrDV8SjNkxUyhnoYvWF9oflHr5Gj4oI4wI2dE
         aKzJPUU63kjAbR5g+z6/OO2IamS68nQduWMvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=THpWWd94tGmQN+NdFGT3/k0LHquClB5/KK663N0sln0=;
        b=ug+nhcwChaFGeoiCrjENtYXpJ/5w75kDZAcvWpD/jluF3a3DYogeTJXQfQQwrVJuuT
         arhTkp3gwnOljWwbsdaZFRdu55lVe7g7eu8r4dRkUZ2/L7sjF5GSckuKg4hJv+90jB25
         JgZ3d/doHwqn6siYYY+IFNUmMaAY/Wefm1BTDxixGjacu1znXa2/XsONPZhtR/6Ic00b
         QM0qEgOlzucJ3vWQCvCOIjdMe9K7x91rtN72XGYq1KMF0DdvcUZlPSPJFpmpnAt9wrSg
         KEEH7AUd0K1ZDGfZqnC/TUtXRUaRdC5PLbknnRT7pGXkGK0qNe4+UAK0JF/mt74SmK0d
         8ZJw==
X-Gm-Message-State: APjAAAUhVpnLXWdUcc/CkndNjXBrort0X4F3HV1xGvfZJNdMTwFzzntU
        JfGWbN42RRx0NU6l1/phg+kjWQ==
X-Google-Smtp-Source: APXvYqwws/fG+++4fl7pwkP7whHCh5KwVv/jHX0W+ARw9Qav4UnXZIe+8/mlxxK/nHoVLY0RrHtTyw==
X-Received: by 2002:a17:902:7591:: with SMTP id j17mr27660314pll.200.1559536416450;
        Sun, 02 Jun 2019 21:33:36 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
        by smtp.gmail.com with ESMTPSA id i25sm13348782pfr.73.2019.06.02.21.33.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 21:33:35 -0700 (PDT)
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
Subject: [PATCH 2/7] ASoC: hdmi-codec: use HDMI state notifier to add jack support
Date:   Mon,  3 Jun 2019 12:32:46 +0800
Message-Id: <20190603043251.226549-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

Use HDMI connection / disconnection notifications to update an ALSA
jack object. Also make a copy of the ELD block after every change.

This was posted by Philipp Zabel at

https://patchwork.kernel.org/patch/9430747/

Modified by Cheng-Yi Chiang:
- Fix the conflict of removed hdmi_codec_remove ops.
- Other minor fix for the conflict with latest hdmi-codec on ASoC
  for-next tree.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
The original patch is at https://patchwork.kernel.org/patch/9430747/
I could not find the LKML link for the patch.

 include/sound/hdmi-codec.h    |   7 +++
 sound/soc/codecs/Kconfig      |   1 +
 sound/soc/codecs/hdmi-codec.c | 104 +++++++++++++++++++++++++++++++++-
 3 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 9483c55f871b..4fa39c93363f 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -107,6 +107,13 @@ struct hdmi_codec_pdata {
 	void *data;
 };
 
+struct snd_soc_component;
+struct snd_soc_jack;
+
+int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack,
+			       struct device *dev);
+
 #define HDMI_CODEC_DRV_NAME "hdmi-audio-codec"
 
 #endif /* __HDMI_CODEC_H__ */
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8f577258080b..f5f6dd04234c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -639,6 +639,7 @@ config SND_SOC_HDMI_CODEC
 	select SND_PCM_ELD
 	select SND_PCM_IEC958
 	select HDMI
+	select HDMI_NOTIFIERS
 
 config SND_SOC_ES7134
        tristate "Everest Semi ES7134 CODEC"
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 6a0cc8d7e141..fe796a7475a5 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -12,9 +12,12 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
  * General Public License for more details.
  */
+#include <linux/hdmi-notifier.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/string.h>
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -282,6 +285,13 @@ struct hdmi_codec_priv {
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
 	struct mutex lock;
+	struct snd_soc_jack *jack;
+	/* Lock to protect setting and getting eld. */
+	struct mutex eld_lock;
+	struct device *dev;
+	struct hdmi_notifier *notifier;
+	struct notifier_block nb;
+	unsigned int jack_status;
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -308,7 +318,9 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
 
+	mutex_lock(&hcp->eld_lock);
 	memcpy(ucontrol->value.bytes.data, hcp->eld, sizeof(hcp->eld));
+	mutex_unlock(&hcp->eld_lock);
 
 	return 0;
 }
@@ -393,7 +405,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	int ret = 0;
+	int ret;
 
 	ret = mutex_trylock(&hcp->lock);
 	if (!ret) {
@@ -408,9 +420,9 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	}
 
 	if (hcp->hcd.ops->get_eld) {
+		mutex_lock(&hcp->eld_lock);
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
-
 		if (!ret) {
 			ret = snd_pcm_hw_constraint_eld(substream->runtime,
 							hcp->eld);
@@ -419,6 +431,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		}
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
+		mutex_unlock(&hcp->eld_lock);
 	}
 	return 0;
 
@@ -747,6 +760,77 @@ static const struct snd_soc_component_driver hdmi_driver = {
 	.non_legacy_dai_naming	= 1,
 };
 
+static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
+				   unsigned int jack_status)
+{
+	if (!hcp->jack)
+		return;
+
+	if (jack_status != hcp->jack_status) {
+		snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
+		hcp->jack_status = jack_status;
+	}
+}
+
+static int hdmi_codec_notify(struct notifier_block *nb, unsigned long event,
+			     void *data)
+{
+	struct hdmi_codec_priv *hcp = container_of(nb, struct hdmi_codec_priv,
+						   nb);
+	struct hdmi_notifier *n = data;
+
+	if (!hcp->jack)
+		return NOTIFY_OK;
+
+	switch (event) {
+	case HDMI_NEW_ELD:
+		mutex_lock(&hcp->eld_lock);
+		memcpy(hcp->eld, n->eld, sizeof(hcp->eld));
+		mutex_unlock(&hcp->eld_lock);
+		/* fall through */
+	case HDMI_CONNECTED:
+		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
+		break;
+	case HDMI_DISCONNECTED:
+		hdmi_codec_jack_report(hcp, 0);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+/**
+ * hdmi_codec_set_jack_detect - register HDMI state notifier callback
+ * @component: the hdmi-codec instance
+ * @jack: ASoC jack to report (dis)connection events on
+ * @dev: hdmi_notifier device, usually HDMI_TX or CEC device
+ */
+int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack,
+			       struct device *dev)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	hcp->notifier = hdmi_notifier_get(dev);
+	if (!hcp->notifier)
+		return -ENOMEM;
+
+	hcp->jack = jack;
+	hcp->nb.notifier_call = hdmi_codec_notify;
+	ret = hdmi_notifier_register(hcp->notifier, &hcp->nb);
+	if (ret)
+		goto err_notifier_put;
+
+	return 0;
+
+err_notifier_put:
+	hdmi_notifier_put(hcp->notifier);
+	hcp->notifier = NULL;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);
+
 static int hdmi_codec_probe(struct platform_device *pdev)
 {
 	struct hdmi_codec_pdata *hcd = pdev->dev.platform_data;
@@ -774,6 +858,7 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 
 	hcp->hcd = *hcd;
 	mutex_init(&hcp->lock);
+	mutex_init(&hcp->eld_lock);
 
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
@@ -797,6 +882,20 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 			__func__, ret);
 		return ret;
 	}
+
+	hcp->dev = dev;
+
+	return 0;
+}
+
+static int hdmi_codec_remove(struct platform_device *pdev)
+{
+	struct hdmi_codec_priv *hcp = platform_get_drvdata(pdev);
+
+	if (hcp->notifier) {
+		hdmi_notifier_unregister(hcp->notifier, &hcp->nb);
+		hdmi_notifier_put(hcp->notifier);
+	}
 	return 0;
 }
 
@@ -805,6 +904,7 @@ static struct platform_driver hdmi_codec_driver = {
 		.name = HDMI_CODEC_DRV_NAME,
 	},
 	.probe = hdmi_codec_probe,
+	.remove = hdmi_codec_remove,
 };
 
 module_platform_driver(hdmi_codec_driver);
-- 
2.22.0.rc1.257.g3120a18244-goog

