Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADFBCBAFB
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 14:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387616AbfJDMzp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 08:55:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:36540 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387440AbfJDMzp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 08:55:45 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 05:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; 
   d="scan'208";a="276036565"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga001.jf.intel.com with SMTP; 04 Oct 2019 05:55:41 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 04 Oct 2019 15:55:41 +0300
Date:   Fri, 4 Oct 2019 15:55:41 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] cec: add cec_adapter to
 cec_notifier_cec_adap_unregister()
Message-ID: <20191004125541.GW1208@intel.com>
References: <e9fc8740-6be6-43a7-beee-ce2d7b54936e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9fc8740-6be6-43a7-beee-ce2d7b54936e@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 04, 2019 at 01:04:24PM +0200, Hans Verkuil wrote:
> It is possible for one HDMI connector to have multiple CEC adapters. The
> typical real-world scenario is that where one adapter is used when the device
> is in standby, and one that's better/smarter when the device is powered up.
> 
> The cec-notifier changes were made with that in mind, but I missed that in
> order to support this you need to tell cec_notifier_cec_adap_unregister()
> which adapter you are unregistering from the notifier.
> 
> Add this additional argument. It is currently unused, but once all drivers
> use this, the CEC core will be adapted for these use-cases.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> This patch should go in via the drm subsystem since all CEC adapters in the
> drm subsystem have been converted to use cec_notifier_cec_adap_unregister().
> The media subsystem still has older drm drivers that weren't converted to use
> cec_notifier_cec_adap_unregister().
> 
> This will only be a problem if a new CEC adapter driver is added to the media
> subsystem for v5.5, but I am not aware of any plans for that. Should it happen,
> then that just means that the media subsystem needs to resolve a fairly trivial
> merge conflict.
> 
> Ville, Mauro, can you review/ack?

Looks harmless enough to me :)

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index ac1e001d0882..70ab4fbdc23e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -285,7 +285,7 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
> 
>  	ret = cec_register_adapter(cec->adap, pdev->dev.parent);
>  	if (ret < 0) {
> -		cec_notifier_cec_adap_unregister(cec->notify);
> +		cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
>  		return ret;
>  	}
> 
> @@ -302,7 +302,7 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
>  {
>  	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
> 
> -	cec_notifier_cec_adap_unregister(cec->notify);
> +	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
>  	cec_unregister_adapter(cec->adap);
> 
>  	return 0;
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
> index a5a75bdeb7a5..5b03fdd1eaa4 100644
> --- a/drivers/gpu/drm/i2c/tda9950.c
> +++ b/drivers/gpu/drm/i2c/tda9950.c
> @@ -465,7 +465,7 @@ static int tda9950_probe(struct i2c_client *client,
> 
>  	ret = cec_register_adapter(priv->adap, priv->hdmi);
>  	if (ret < 0) {
> -		cec_notifier_cec_adap_unregister(priv->notify);
> +		cec_notifier_cec_adap_unregister(priv->notify, priv->adap);
>  		return ret;
>  	}
> 
> @@ -482,7 +482,7 @@ static int tda9950_remove(struct i2c_client *client)
>  {
>  	struct tda9950_priv *priv = i2c_get_clientdata(client);
> 
> -	cec_notifier_cec_adap_unregister(priv->notify);
> +	cec_notifier_cec_adap_unregister(priv->notify, priv->adap);
>  	cec_unregister_adapter(priv->adap);
> 
>  	return 0;
> diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
> index 4d82a5522072..7cf42b133dbc 100644
> --- a/drivers/media/cec/cec-notifier.c
> +++ b/drivers/media/cec/cec-notifier.c
> @@ -153,13 +153,14 @@ cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
>  }
>  EXPORT_SYMBOL_GPL(cec_notifier_cec_adap_register);
> 
> -void cec_notifier_cec_adap_unregister(struct cec_notifier *n)
> +void cec_notifier_cec_adap_unregister(struct cec_notifier *n,
> +				      struct cec_adapter *adap)
>  {
>  	if (!n)
>  		return;
> 
>  	mutex_lock(&n->lock);
> -	n->cec_adap->notifier = NULL;
> +	adap->notifier = NULL;

Maybe assert that the notifier and adapter know each other?

>  	n->cec_adap = NULL;
>  	n->callback = NULL;
>  	mutex_unlock(&n->lock);
> diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> index 4a3b3810fd89..f048e8994785 100644
> --- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> +++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> @@ -314,7 +314,8 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
>  	return 0;
> 
>  out_probe_notify:
> -	cec_notifier_cec_adap_unregister(cros_ec_cec->notify);
> +	cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
> +					 cros_ec_cec->adap);
>  out_probe_adapter:
>  	cec_delete_adapter(cros_ec_cec->adap);
>  	return ret;
> @@ -335,7 +336,8 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
>  		return ret;
>  	}
> 
> -	cec_notifier_cec_adap_unregister(cros_ec_cec->notify);
> +	cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
> +					 cros_ec_cec->adap);
>  	cec_unregister_adapter(cros_ec_cec->adap);
> 
>  	return 0;
> diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
> index 3b39e875292e..70f875b4a01e 100644
> --- a/drivers/media/platform/meson/ao-cec-g12a.c
> +++ b/drivers/media/platform/meson/ao-cec-g12a.c
> @@ -736,7 +736,7 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(ao_cec->core);
> 
>  out_probe_notify:
> -	cec_notifier_cec_adap_unregister(ao_cec->notify);
> +	cec_notifier_cec_adap_unregister(ao_cec->notify, ao_cec->adap);
> 
>  out_probe_adapter:
>  	cec_delete_adapter(ao_cec->adap);
> @@ -752,7 +752,7 @@ static int meson_ao_cec_g12a_remove(struct platform_device *pdev)
> 
>  	clk_disable_unprepare(ao_cec->core);
> 
> -	cec_notifier_cec_adap_unregister(ao_cec->notify);
> +	cec_notifier_cec_adap_unregister(ao_cec->notify, ao_cec->adap);
> 
>  	cec_unregister_adapter(ao_cec->adap);
> 
> diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
> index 64ed549bf012..92859a6d006f 100644
> --- a/drivers/media/platform/meson/ao-cec.c
> +++ b/drivers/media/platform/meson/ao-cec.c
> @@ -688,7 +688,7 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(ao_cec->core);
> 
>  out_probe_notify:
> -	cec_notifier_cec_adap_unregister(ao_cec->notify);
> +	cec_notifier_cec_adap_unregister(ao_cec->notify, ao_cec->adap);
> 
>  out_probe_adapter:
>  	cec_delete_adapter(ao_cec->adap);
> @@ -704,7 +704,7 @@ static int meson_ao_cec_remove(struct platform_device *pdev)
> 
>  	clk_disable_unprepare(ao_cec->core);
> 
> -	cec_notifier_cec_adap_unregister(ao_cec->notify);
> +	cec_notifier_cec_adap_unregister(ao_cec->notify, ao_cec->adap);
>  	cec_unregister_adapter(ao_cec->adap);
> 
>  	return 0;
> diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platform/s5p-cec/s5p_cec.c
> index 6ddcc35b0bbd..2a3e7ffefe0a 100644
> --- a/drivers/media/platform/s5p-cec/s5p_cec.c
> +++ b/drivers/media/platform/s5p-cec/s5p_cec.c
> @@ -239,7 +239,7 @@ static int s5p_cec_probe(struct platform_device *pdev)
>  	return 0;
> 
>  err_notifier:
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> 
>  err_delete_adapter:
>  	cec_delete_adapter(cec->adap);
> @@ -250,7 +250,7 @@ static int s5p_cec_remove(struct platform_device *pdev)
>  {
>  	struct s5p_cec_dev *cec = platform_get_drvdata(pdev);
> 
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  	cec_unregister_adapter(cec->adap);
>  	pm_runtime_disable(&pdev->dev);
>  	return 0;
> diff --git a/drivers/media/platform/seco-cec/seco-cec.c b/drivers/media/platform/seco-cec/seco-cec.c
> index 9cd60fe1867c..54b0d51e9c55 100644
> --- a/drivers/media/platform/seco-cec/seco-cec.c
> +++ b/drivers/media/platform/seco-cec/seco-cec.c
> @@ -671,7 +671,7 @@ static int secocec_probe(struct platform_device *pdev)
>  	return ret;
> 
>  err_notifier:
> -	cec_notifier_cec_adap_unregister(secocec->notifier);
> +	cec_notifier_cec_adap_unregister(secocec->notifier, secocec->cec_adap);
>  err_delete_adapter:
>  	cec_delete_adapter(secocec->cec_adap);
>  err:
> @@ -692,7 +692,7 @@ static int secocec_remove(struct platform_device *pdev)
> 
>  		dev_dbg(&pdev->dev, "IR disabled");
>  	}
> -	cec_notifier_cec_adap_unregister(secocec->notifier);
> +	cec_notifier_cec_adap_unregister(secocec->notifier, secocec->cec_adap);
>  	cec_unregister_adapter(secocec->cec_adap);
> 
>  	release_region(BRA_SMB_BASE_ADDR, 7);
> diff --git a/drivers/media/platform/sti/cec/stih-cec.c b/drivers/media/platform/sti/cec/stih-cec.c
> index 8118c7365d3f..f0c73e64b586 100644
> --- a/drivers/media/platform/sti/cec/stih-cec.c
> +++ b/drivers/media/platform/sti/cec/stih-cec.c
> @@ -359,7 +359,7 @@ static int stih_cec_probe(struct platform_device *pdev)
>  	return 0;
> 
>  err_notifier:
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> 
>  err_delete_adapter:
>  	cec_delete_adapter(cec->adap);
> @@ -370,7 +370,7 @@ static int stih_cec_remove(struct platform_device *pdev)
>  {
>  	struct stih_cec *cec = platform_get_drvdata(pdev);
> 
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  	cec_unregister_adapter(cec->adap);
> 
>  	return 0;
> diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
> index a632602131f2..a99caac59f44 100644
> --- a/drivers/media/platform/tegra-cec/tegra_cec.c
> +++ b/drivers/media/platform/tegra-cec/tegra_cec.c
> @@ -409,7 +409,7 @@ static int tegra_cec_probe(struct platform_device *pdev)
>  	return 0;
> 
>  err_notifier:
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  err_adapter:
>  	cec_delete_adapter(cec->adap);
>  err_clk:
> @@ -423,7 +423,7 @@ static int tegra_cec_remove(struct platform_device *pdev)
> 
>  	clk_disable_unprepare(cec->clk);
> 
> -	cec_notifier_cec_adap_unregister(cec->notifier);
> +	cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
>  	cec_unregister_adapter(cec->adap);
> 
>  	return 0;
> diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
> index f161f8a493ac..985afea1ee36 100644
> --- a/include/media/cec-notifier.h
> +++ b/include/media/cec-notifier.h
> @@ -93,8 +93,10 @@ cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
>   * cec_notifier_cec_adap_unregister - decrease refcount and delete when the
>   * refcount reaches 0.
>   * @n: notifier. If NULL, then this function does nothing.
> + * @adap: the cec adapter that registered this notifier.
>   */
> -void cec_notifier_cec_adap_unregister(struct cec_notifier *n);
> +void cec_notifier_cec_adap_unregister(struct cec_notifier *n,
> +				      struct cec_adapter *adap);
> 
>  /**
>   * cec_notifier_set_phys_addr - set a new physical address.
> @@ -160,7 +162,8 @@ cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
>  	return (struct cec_notifier *)0xdeadfeed;
>  }
> 
> -static inline void cec_notifier_cec_adap_unregister(struct cec_notifier *n)
> +static inline void cec_notifier_cec_adap_unregister(struct cec_notifier *n,
> +						    struct cec_adapter *adap)
>  {
>  }

-- 
Ville Syrjälä
Intel
