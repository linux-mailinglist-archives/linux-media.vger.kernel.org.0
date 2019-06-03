Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 752AD32A2D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 09:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfFCH7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 03:59:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:41010 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfFCH7R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 03:59:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jun 2019 00:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,546,1549958400"; 
   d="scan'208";a="181072014"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 00:59:10 -0700
Date:   Mon, 3 Jun 2019 10:03:01 +0200
From:   Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Heiko Stuebner <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Takashi Iwai <tiwai@suse.com>,
        linux-rockchip@lists.infradead.org, dgreid@chromium.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        tzungbi@chromium.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dianders@chromium.org, Mark Brown <broonie@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: hdmi-codec: use HDMI state
 notifier to add jack support
Message-ID: <20190603100301.00d68690@xxx>
In-Reply-To: <20190603043251.226549-3-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
 <20190603043251.226549-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  3 Jun 2019 12:32:46 +0800
Cheng-Yi Chiang <cychiang@chromium.org> wrote:

> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Use HDMI connection / disconnection notifications to update an ALSA
> jack object. Also make a copy of the ELD block after every change.
> 
> This was posted by Philipp Zabel at
> 
> https://patchwork.kernel.org/patch/9430747/
> 
> Modified by Cheng-Yi Chiang:
> - Fix the conflict of removed hdmi_codec_remove ops.
> - Other minor fix for the conflict with latest hdmi-codec on ASoC
>   for-next tree.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
> The original patch is at https://patchwork.kernel.org/patch/9430747/
> I could not find the LKML link for the patch.
> 
>  include/sound/hdmi-codec.h    |   7 +++
>  sound/soc/codecs/Kconfig      |   1 +
>  sound/soc/codecs/hdmi-codec.c | 104
> +++++++++++++++++++++++++++++++++- 3 files changed, 110
> insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 9483c55f871b..4fa39c93363f 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -107,6 +107,13 @@ struct hdmi_codec_pdata {
>  	void *data;
>  };
>  
> +struct snd_soc_component;
> +struct snd_soc_jack;
> +
> +int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
> +			       struct snd_soc_jack *jack,
> +			       struct device *dev);
> +
>  #define HDMI_CODEC_DRV_NAME "hdmi-audio-codec"
>  
>  #endif /* __HDMI_CODEC_H__ */
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 8f577258080b..f5f6dd04234c 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -639,6 +639,7 @@ config SND_SOC_HDMI_CODEC
>  	select SND_PCM_ELD
>  	select SND_PCM_IEC958
>  	select HDMI
> +	select HDMI_NOTIFIERS
>  
>  config SND_SOC_ES7134
>         tristate "Everest Semi ES7134 CODEC"
> diff --git a/sound/soc/codecs/hdmi-codec.c
> b/sound/soc/codecs/hdmi-codec.c index 6a0cc8d7e141..fe796a7475a5
> 100644 --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -12,9 +12,12 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See
> the GNU
>   * General Public License for more details.
>   */
> +#include <linux/hdmi-notifier.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/string.h>
>  #include <sound/core.h>
> +#include <sound/jack.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -282,6 +285,13 @@ struct hdmi_codec_priv {
>  	struct snd_pcm_chmap *chmap_info;
>  	unsigned int chmap_idx;
>  	struct mutex lock;
> +	struct snd_soc_jack *jack;
> +	/* Lock to protect setting and getting eld. */
> +	struct mutex eld_lock;
> +	struct device *dev;
> +	struct hdmi_notifier *notifier;
> +	struct notifier_block nb;
> +	unsigned int jack_status;
>  };
>  
>  static const struct snd_soc_dapm_widget hdmi_widgets[] = {
> @@ -308,7 +318,9 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol
> *kcontrol, struct snd_soc_component *component =
> snd_kcontrol_chip(kcontrol); struct hdmi_codec_priv *hcp =
> snd_soc_component_get_drvdata(component); 
> +	mutex_lock(&hcp->eld_lock);
>  	memcpy(ucontrol->value.bytes.data, hcp->eld,
> sizeof(hcp->eld));
> +	mutex_unlock(&hcp->eld_lock);
>  
>  	return 0;
>  }
> @@ -393,7 +405,7 @@ static int hdmi_codec_startup(struct
> snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  {
>  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
> -	int ret = 0;
> +	int ret;
>  
>  	ret = mutex_trylock(&hcp->lock);
>  	if (!ret) {
> @@ -408,9 +420,9 @@ static int hdmi_codec_startup(struct
> snd_pcm_substream *substream, }
>  
>  	if (hcp->hcd.ops->get_eld) {
> +		mutex_lock(&hcp->eld_lock);
>  		ret = hcp->hcd.ops->get_eld(dai->dev->parent,
> hcp->hcd.data, hcp->eld, sizeof(hcp->eld));
> -
>  		if (!ret) {
>  			ret =
> snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);

Seems to me like you missed unlock here. There is return inside this
if().

> @@ -419,6 +431,7 @@ static int hdmi_codec_startup(struct
> snd_pcm_substream *substream, }
>  		/* Select chmap supported */
>  		hdmi_codec_eld_chmap(hcp);
> +		mutex_unlock(&hcp->eld_lock);
>  	}
>  	return 0;
>  
> @@ -747,6 +760,77 @@ static const struct snd_soc_component_driver
> hdmi_driver = { .non_legacy_dai_naming	= 1,
>  };
>  
> +static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
> +				   unsigned int jack_status)
> +{
> +	if (!hcp->jack)
> +		return;
> +
> +	if (jack_status != hcp->jack_status) {
> +		snd_soc_jack_report(hcp->jack, jack_status,
> SND_JACK_LINEOUT);
> +		hcp->jack_status = jack_status;
> +	}
> +}
> +
> +static int hdmi_codec_notify(struct notifier_block *nb, unsigned
> long event,
> +			     void *data)
> +{
> +	struct hdmi_codec_priv *hcp = container_of(nb, struct
> hdmi_codec_priv,
> +						   nb);
> +	struct hdmi_notifier *n = data;
> +
> +	if (!hcp->jack)
> +		return NOTIFY_OK;
> +
> +	switch (event) {
> +	case HDMI_NEW_ELD:
> +		mutex_lock(&hcp->eld_lock);
> +		memcpy(hcp->eld, n->eld, sizeof(hcp->eld));
> +		mutex_unlock(&hcp->eld_lock);
> +		/* fall through */
> +	case HDMI_CONNECTED:
> +		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
> +		break;
> +	case HDMI_DISCONNECTED:
> +		hdmi_codec_jack_report(hcp, 0);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +/**
> + * hdmi_codec_set_jack_detect - register HDMI state notifier callback
> + * @component: the hdmi-codec instance
> + * @jack: ASoC jack to report (dis)connection events on
> + * @dev: hdmi_notifier device, usually HDMI_TX or CEC device
> + */
> +int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
> +			       struct snd_soc_jack *jack,
> +			       struct device *dev)
> +{
> +	struct hdmi_codec_priv *hcp =
> snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	hcp->notifier = hdmi_notifier_get(dev);
> +	if (!hcp->notifier)
> +		return -ENOMEM;
> +
> +	hcp->jack = jack;
> +	hcp->nb.notifier_call = hdmi_codec_notify;
> +	ret = hdmi_notifier_register(hcp->notifier, &hcp->nb);
> +	if (ret)
> +		goto err_notifier_put;
> +
> +	return 0;
> +
> +err_notifier_put:
> +	hdmi_notifier_put(hcp->notifier);
> +	hcp->notifier = NULL;
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);
> +
>  static int hdmi_codec_probe(struct platform_device *pdev)
>  {
>  	struct hdmi_codec_pdata *hcd = pdev->dev.platform_data;
> @@ -774,6 +858,7 @@ static int hdmi_codec_probe(struct
> platform_device *pdev) 
>  	hcp->hcd = *hcd;
>  	mutex_init(&hcp->lock);
> +	mutex_init(&hcp->eld_lock);
>  
>  	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv),
> GFP_KERNEL); if (!daidrv)
> @@ -797,6 +882,20 @@ static int hdmi_codec_probe(struct
> platform_device *pdev) __func__, ret);
>  		return ret;
>  	}
> +
> +	hcp->dev = dev;
> +
> +	return 0;
> +}
> +
> +static int hdmi_codec_remove(struct platform_device *pdev)
> +{
> +	struct hdmi_codec_priv *hcp = platform_get_drvdata(pdev);
> +
> +	if (hcp->notifier) {
> +		hdmi_notifier_unregister(hcp->notifier, &hcp->nb);
> +		hdmi_notifier_put(hcp->notifier);
> +	}
>  	return 0;
>  }
>  
> @@ -805,6 +904,7 @@ static struct platform_driver hdmi_codec_driver =
> { .name = HDMI_CODEC_DRV_NAME,
>  	},
>  	.probe = hdmi_codec_probe,
> +	.remove = hdmi_codec_remove,
>  };
>  
>  module_platform_driver(hdmi_codec_driver);

