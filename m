Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529B318803
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 11:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbfEIJvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 05:51:35 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43385 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725869AbfEIJvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 05:51:35 -0400
Received: from [IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b] ([IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Ofi5h6WlH3qlsOfi6hQwNk; Thu, 09 May 2019 11:51:30 +0200
Subject: Re: [PATCH v4] media: cec: expose HDMI connector to CEC dev mapping
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org, hans.verkuil@cisco.com
Cc:     linux-kernel@vger.kernel.org
References: <20190509075122.98558-1-darekm@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f81a178f-3605-2af7-5863-a982a36bd168@xs4all.nl>
Date:   Thu, 9 May 2019 11:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509075122.98558-1-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIzRUi5M8pdZbYZw/JdqGHypeWcK0/638Zx+W3h7yfJyVEWulQ00mNMlqDfWhhI/vF7E6wBXv1MRAIK0rA2Vs7E/hyvnnNxc5TDSbBCSjo9zkD0wIl0e
 8rXzU0TIbWTs+/li6/QV4QAY1X2A4ni8X4kQkI57LZcMwaCxTRSLaDbE5aOWpsl/6P07Y/Xo/EIz+cztBDz1AmeqLOyn+rDGVt3NFlML5oz37cIErXvblTPn
 c+zIsI6UsbNEuq9ejUA5bOYuDjfChFRNpmLXLRzB5VFfZJd9dJOTjZvZrNcDPIhvOPFTENuhhFx8EA9IDaxoDD0LC2icU9Jj08Rqq8h/WxTuqXMs3+pwxADA
 wx//Us2ZM0CiFqks9TwEU5SCJYbigw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dariusz,

This is getting quite nice!

Still some minor comments, though:

On 5/9/19 9:51 AM, Dariusz Marcinkiewicz wrote:
> This patch proposes to expose explicit mapping between HDMI connectors
> and /dev/cecX adapters to userland.
> 
> New structure with connector info (card number and connector id in case
> of DRM connectors) is added to cec_adapter. That connector info is expected
> to be provided when an adapter is created.
> 
> CEC notifier is extended so that it can be used to communicate the
> connector's info to CEC adapters' creators.
> 
> New ioctl, exposing connector info to userland, is added to /dev/cec.
> 
> Changes since v3:
>  - cec_get_connter_conn takes connector_info as argument
> Changes since v2:
>  - cec_s_connector_info removed, the connector info is now passed to
>    cec_allocate_adapter
>  - updated commit message
> Changes since v1:
>  - removed the unnecessary event,
>  - extended cec_connctor_info to allow for various types of connectors.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  Documentation/media/kapi/cec-core.rst         |  7 +++-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c  |  3 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  1 +
>  drivers/gpu/drm/drm_dp_cec.c                  | 22 +++++++-----
>  drivers/gpu/drm/i2c/tda9950.c                 |  3 +-
>  drivers/gpu/drm/i915/intel_dp.c               |  4 +--
>  drivers/gpu/drm/i915/intel_hdmi.c             |  6 +++-
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |  6 +++-
>  drivers/media/cec/cec-adap.c                  | 12 +++++++
>  drivers/media/cec/cec-api.c                   | 12 +++++++
>  drivers/media/cec/cec-core.c                  | 10 ++++--
>  drivers/media/cec/cec-notifier.c              | 21 ++++++++++--
>  drivers/media/cec/cec-pin.c                   |  2 +-
>  drivers/media/i2c/tc358743.c                  |  3 +-
>  .../media/platform/cros-ec-cec/cros-ec-cec.c  |  7 ++--
>  drivers/media/platform/meson/ao-cec.c         |  6 +++-
>  drivers/media/platform/s5p-cec/s5p_cec.c      |  6 +++-
>  drivers/media/platform/seco-cec/seco-cec.c    |  8 +++--
>  drivers/media/platform/sti/cec/stih-cec.c     |  6 +++-
>  drivers/media/platform/stm32/stm32-cec.c      |  2 +-
>  drivers/media/platform/tegra-cec/tegra_cec.c  |  5 ++-
>  drivers/media/platform/vivid/vivid-cec.c      |  2 +-
>  drivers/media/usb/pulse8-cec/pulse8-cec.c     |  3 +-
>  .../media/usb/rainshadow-cec/rainshadow-cec.c |  3 +-
>  include/drm/drm_dp_helper.h                   | 14 ++++----
>  include/media/cec-notifier.h                  | 34 +++++++++++++++----
>  include/media/cec.h                           | 17 ++++++++--
>  include/uapi/linux/cec.h                      | 24 +++++++++++++
>  31 files changed, 201 insertions(+), 55 deletions(-)
> 
> diff --git a/Documentation/media/kapi/cec-core.rst b/Documentation/media/kapi/cec-core.rst
> index 3ce26b7c2b2b6..3678a0a75104e 100644
> --- a/Documentation/media/kapi/cec-core.rst
> +++ b/Documentation/media/kapi/cec-core.rst
> @@ -37,7 +37,8 @@ calling cec_allocate_adapter() and deleted by calling cec_delete_adapter():
>  
>  .. c:function::
>     struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops, void *priv,
> -   const char *name, u32 caps, u8 available_las);
> +                                            const char *name, u32 caps, u8 available_las,
> +                                            const struct cec_connector_info *connector_info);

I think calling cec_connector_info pointers 'connector_info' is a bit too
long. How about calling it 'conn_info' in the sources? Up to you, though.

>  
>  .. c:function::
>     void cec_delete_adapter(struct cec_adapter *adap);
> @@ -65,6 +66,10 @@ available_las:
>  	the number of simultaneous logical addresses that this
>  	adapter can handle. Must be 1 <= available_las <= CEC_MAX_LOG_ADDRS.
>  
> +connector_info:
> +        pointer to a struct describing connector this adapter is associated with,
> +        can be NULL.
> +
>  To obtain the priv pointer use this helper function:
>  
>  .. c:function::
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 6e205ee36ac3b..7f2eb4eb1035b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -394,7 +394,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  
>  	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
> -				      aconnector->base.name, dm->adev->dev);
> +				      &aconnector->base);
>  	aconnector->mst_mgr.cbs = &dm_mst_cbs;
>  	drm_dp_mst_topology_mgr_init(
>  		&aconnector->mst_mgr,
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> index a20a45c0b353f..6400ad9b85502 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -310,7 +310,8 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>  		goto err_cec_parse_dt;
>  
>  	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
> -		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
> +		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS,
> +		NULL);
>  	if (IS_ERR(adv7511->cec_adap)) {
>  		ret = PTR_ERR(adv7511->cec_adap);
>  		goto err_cec_alloc;
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 6c323510f1288..84fb7b6a0a5e0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -261,7 +261,7 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
>  					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
>  					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
> -					 CEC_MAX_LOG_ADDRS);
> +					 CEC_MAX_LOG_ADDRS, NULL);
>  	if (IS_ERR(cec->adap))
>  		return PTR_ERR(cec->adap);
>  
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index db761329a1e3e..0fa04be9e6fb5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2431,6 +2431,7 @@ static struct dw_hdmi *
>  __dw_hdmi_probe(struct platform_device *pdev,
>  		const struct dw_hdmi_plat_data *plat_data)
>  {
> +	struct cec_connector_info connector_info;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct platform_device_info pdevinfo;
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> index b15cee85b702b..84c0d4cd76fad 100644
> --- a/drivers/gpu/drm/drm_dp_cec.c
> +++ b/drivers/gpu/drm/drm_dp_cec.c
> @@ -8,7 +8,9 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_dp_helper.h>
> +#include <drm/drmP.h>
>  #include <media/cec.h>
>  
>  /*
> @@ -295,7 +297,9 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
>   */
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  {
> +	struct drm_connector *connector = aux->cec.connector;
>  	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD;
> +	struct cec_connector_info connector_info;
>  	unsigned int num_las = 1;
>  	u8 cap;
>  
> @@ -342,15 +346,17 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  		cec_unregister_adapter(aux->cec.adap);
>  	}
>  
> +	cec_get_drm_connector_info(connector, &connector_info);

I think this function name is very confusing. I'd swap the arguments and
call it:

	cec_fill_connector_info_from_drm(&conn_info, connector);

> +
>  	/* Create a new adapter */
>  	aux->cec.adap = cec_allocate_adapter(&drm_dp_cec_adap_ops,
> -					     aux, aux->cec.name, cec_caps,
> -					     num_las);
> +					     aux, connector->name, cec_caps,
> +					     num_las, &connector_info);
>  	if (IS_ERR(aux->cec.adap)) {
>  		aux->cec.adap = NULL;
>  		goto unlock;
>  	}
> -	if (cec_register_adapter(aux->cec.adap, aux->cec.parent)) {
> +	if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
>  		cec_delete_adapter(aux->cec.adap);
>  		aux->cec.adap = NULL;
>  	} else {
> @@ -406,22 +412,20 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
>  /**
>   * drm_dp_cec_register_connector() - register a new connector
>   * @aux: DisplayPort AUX channel
> - * @name: name of the CEC device
> - * @parent: parent device
> + * @connector: drm connector
>   *
>   * A new connector was registered with associated CEC adapter name and
>   * CEC adapter parent device. After registering the name and parent
>   * drm_dp_cec_set_edid() is called to check if the connector supports
>   * CEC and to register a CEC adapter if that is the case.
>   */
> -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *name,
> -				   struct device *parent)
> +void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> +				   struct drm_connector *connector)
>  {
>  	WARN_ON(aux->cec.adap);
>  	if (WARN_ON(!aux->transfer))
>  		return;
> -	aux->cec.name = name;
> -	aux->cec.parent = parent;
> +	aux->cec.connector = connector;
>  	INIT_DELAYED_WORK(&aux->cec.unregister_work,
>  			  drm_dp_cec_unregister_work);
>  }
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
> index 250b5e02a314a..b944dd9df85e1 100644
> --- a/drivers/gpu/drm/i2c/tda9950.c
> +++ b/drivers/gpu/drm/i2c/tda9950.c
> @@ -424,7 +424,8 @@ static int tda9950_probe(struct i2c_client *client,
>  
>  	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
>  					  CEC_CAP_DEFAULTS,
> -					  CEC_MAX_LOG_ADDRS);
> +					  CEC_MAX_LOG_ADDRS,
> +					  NULL);
>  	if (IS_ERR(priv->adap))
>  		return PTR_ERR(priv->adap);
>  
> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
> index 72c49070ed14c..dfe446e6d8167 100644
> --- a/drivers/gpu/drm/i915/intel_dp.c
> +++ b/drivers/gpu/drm/i915/intel_dp.c
> @@ -5550,7 +5550,6 @@ static int
>  intel_dp_connector_register(struct drm_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_device *dev = connector->dev;
>  	int ret;
>  
>  	ret = intel_connector_register(connector);
> @@ -5565,8 +5564,7 @@ intel_dp_connector_register(struct drm_connector *connector)
>  	intel_dp->aux.dev = connector->kdev;
>  	ret = drm_dp_aux_register(&intel_dp->aux);
>  	if (!ret)
> -		drm_dp_cec_register_connector(&intel_dp->aux,
> -					      connector->name, dev->dev);
> +		drm_dp_cec_register_connector(&intel_dp->aux, connector);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel_hdmi.c
> index 26767785f14aa..0f298175cf9c5 100644
> --- a/drivers/gpu/drm/i915/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/intel_hdmi.c
> @@ -2966,6 +2966,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
>  	struct intel_encoder *intel_encoder = &intel_dig_port->base;
>  	struct drm_device *dev = intel_encoder->base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct cec_connector_info connector_info;
>  	enum port port = intel_encoder->port;
>  
>  	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
> @@ -3019,8 +3020,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
>  		I915_WRITE(PEG_BAND_GAP_DATA, (temp & ~0xf) | 0xd);
>  	}
>  
> +	cec_get_drm_connector_info(connector, &connector_info);
> +
>  	intel_hdmi->cec_notifier = cec_notifier_get_conn(dev->dev,
> -							 port_identifier(port));
> +							 port_identifier(port),
> +							 &connector_info);
>  	if (!intel_hdmi->cec_notifier)
>  		DRM_DEBUG_KMS("CEC notifier get failed\n");
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 4116ee62adafe..4438824ca88b0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1413,8 +1413,7 @@ nouveau_connector_create(struct drm_device *dev,
>  	switch (type) {
>  	case DRM_MODE_CONNECTOR_DisplayPort:
>  	case DRM_MODE_CONNECTOR_eDP:
> -		drm_dp_cec_register_connector(&nv_connector->aux,
> -					      connector->name, dev->dev);
> +		drm_dp_cec_register_connector(&nv_connector->aux, connector);
>  		break;
>  	}
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 88fd5df7e7dc6..a7c9c776fe7f2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1304,6 +1304,7 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
>  
>  static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  {
> +	struct cec_connector_info connector_info;

I think this should be under #ifdef CONFIG_DRM_VC4_HDMI_CEC as well, otherwise
you'll get a warning about an unused variable if CONFIG_DRM_VC4_HDMI_CEC isn't set.

You should check if that's the case in other drivers as well.

>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct drm_device *drm = dev_get_drvdata(master);
>  	struct vc4_dev *vc4 = drm->dev_private;
> @@ -1413,12 +1414,15 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  		goto err_destroy_encoder;
>  	}
>  #ifdef CONFIG_DRM_VC4_HDMI_CEC
> +	cec_get_drm_connector_info(hdmi->connector, &connector_info);
> +
>  	hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
>  					      vc4, "vc4",
>  					      CEC_CAP_TRANSMIT |
>  					      CEC_CAP_LOG_ADDRS |
>  					      CEC_CAP_PASSTHROUGH |
> -					      CEC_CAP_RC, 1);
> +					      CEC_CAP_RC, 1,
> +					      &connector_info);
>  	ret = PTR_ERR_OR_ZERO(hdmi->cec_adap);
>  	if (ret < 0)
>  		goto err_destroy_conn;
> diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
> index f1261cc2b6fa5..75c5772cd2f5e 100644
> --- a/drivers/media/cec/cec-adap.c
> +++ b/drivers/media/cec/cec-adap.c
> @@ -16,7 +16,10 @@
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> +#include <drm/drm_connector.h>
> +#include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_file.h>
>  
>  #include "cec-priv.h"
>  
> @@ -75,6 +78,15 @@ u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
>  }
>  EXPORT_SYMBOL_GPL(cec_get_edid_phys_addr);
>  
> +void cec_get_drm_connector_info(const struct drm_connector *connector,
> +				struct cec_connector_info *connector_info)
> +{
> +	connector_info->type = CEC_CONNECTOR_TYPE_DRM;
> +	connector_info->drm.card_no = connector->dev->primary->index;
> +	connector_info->drm.connector_id = connector->base.id;
> +}
> +EXPORT_SYMBOL_GPL(cec_get_drm_connector_info);
> +
>  /*
>   * Queue a new event for this filehandle. If ts == 0, then set it
>   * to the current time.
> diff --git a/drivers/media/cec/cec-api.c b/drivers/media/cec/cec-api.c
> index 156a0d76ab2a1..2ed312ad34a39 100644
> --- a/drivers/media/cec/cec-api.c
> +++ b/drivers/media/cec/cec-api.c
> @@ -187,6 +187,15 @@ static long cec_adap_s_log_addrs(struct cec_adapter *adap, struct cec_fh *fh,
>  	return 0;
>  }
>  
> +static long cec_adap_g_connector_info(struct cec_adapter *adap,
> +				      struct cec_log_addrs __user *parg)
> +{
> +	if (copy_to_user(parg, &adap->connector_info,
> +			 sizeof(adap->connector_info)))
> +		return -EFAULT;
> +	return 0;
> +}
> +
>  static long cec_transmit(struct cec_adapter *adap, struct cec_fh *fh,
>  			 bool block, struct cec_msg __user *parg)
>  {
> @@ -514,6 +523,9 @@ static long cec_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	case CEC_ADAP_S_LOG_ADDRS:
>  		return cec_adap_s_log_addrs(adap, fh, block, parg);
>  
> +	case CEC_ADAP_G_CONNECTOR_INFO:
> +		return cec_adap_g_connector_info(adap, parg);
> +
>  	case CEC_TRANSMIT:
>  		return cec_transmit(adap, fh, block, parg);
>  
> diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
> index f5d1578e256a7..62039b0a7d7ec 100644
> --- a/drivers/media/cec/cec-core.c
> +++ b/drivers/media/cec/cec-core.c
> @@ -250,8 +250,9 @@ static const struct file_operations cec_error_inj_fops = {
>  #endif
>  
>  struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
> -					 void *priv, const char *name, u32 caps,
> -					 u8 available_las)
> +			void *priv, const char *name, u32 caps,
> +			u8 available_las,
> +			const struct cec_connector_info *connector_info)
>  {
>  	struct cec_adapter *adap;
>  	int res;
> @@ -288,6 +289,11 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
>  	INIT_LIST_HEAD(&adap->wait_queue);
>  	init_waitqueue_head(&adap->kthread_waitq);
>  
> +	if (connector_info)
> +		adap->connector_info = *connector_info;
> +	else
> +		adap->connector_info.type = CEC_CONNECTOR_TYPE_NO_CONNECTOR;

You can drop the 'else' part since CEC_CONNECTOR_TYPE_NO_CONNECTOR is 0 and
adap->connector_info is zeroed already.

> +
>  	/* adap->devnode initialization */
>  	INIT_LIST_HEAD(&adap->devnode.fhs);
>  	mutex_init(&adap->devnode.lock);
> diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notifier.c
> index dd2078b27a419..c1ad999f1de47 100644
> --- a/drivers/media/cec/cec-notifier.c
> +++ b/drivers/media/cec/cec-notifier.c
> @@ -26,12 +26,15 @@ struct cec_notifier {
>  	void (*callback)(struct cec_adapter *adap, u16 pa);
>  
>  	u16 phys_addr;
> +	struct cec_connector_info connector_info;
>  };
>  
>  static LIST_HEAD(cec_notifiers);
>  static DEFINE_MUTEX(cec_notifiers_lock);
>  
> -struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char *conn)
> +struct cec_notifier *cec_notifier_get_conn(
> +			struct device *dev, const char *conn,
> +			const struct cec_connector_info *connector_info)
>  {
>  	struct cec_notifier *n;
>  
> @@ -51,6 +54,12 @@ struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char *conn)
>  	if (conn)
>  		n->conn = kstrdup(conn, GFP_KERNEL);
>  	n->phys_addr = CEC_PHYS_ADDR_INVALID;
> +
> +	if (connector_info)
> +		n->connector_info = *connector_info;
> +	else
> +		n->connector_info.type = CEC_CONNECTOR_TYPE_NO_CONNECTOR;

Ditto.

> +
>  	mutex_init(&n->lock);
>  	kref_init(&n->kref);
>  	list_add_tail(&n->head, &cec_notifiers);
> @@ -106,9 +115,17 @@ void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>  }
>  EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr_from_edid);
>  
> +const struct cec_connector_info *cec_notifier_get_connector_info(

I think I would prefer cec_notifier_get_conn_info(), up to you though.

> +	struct cec_notifier *n)
> +{
> +	return &n->connector_info;
> +}
> +EXPORT_SYMBOL_GPL(cec_notifier_get_connector_info);
> +
>  void cec_notifier_register(struct cec_notifier *n,
>  			   struct cec_adapter *adap,
> -			   void (*callback)(struct cec_adapter *adap, u16 pa))
> +			   void (*callback)(struct cec_adapter *adap,
> +					    u16 pa))
>  {
>  	kref_get(&n->kref);
>  	mutex_lock(&n->lock);
> diff --git a/drivers/media/cec/cec-pin.c b/drivers/media/cec/cec-pin.c
> index 8f987bc0dd883..1a04a9be737a9 100644
> --- a/drivers/media/cec/cec-pin.c
> +++ b/drivers/media/cec/cec-pin.c
> @@ -1320,7 +1320,7 @@ struct cec_adapter *cec_pin_allocate_adapter(const struct cec_pin_ops *pin_ops,
>  
>  	adap = cec_allocate_adapter(&cec_pin_adap_ops, priv, name,
>  			    caps | CEC_CAP_MONITOR_ALL | CEC_CAP_MONITOR_PIN,
> -			    CEC_MAX_LOG_ADDRS);
> +			    CEC_MAX_LOG_ADDRS, NULL);
>  
>  	if (IS_ERR(adap)) {
>  		kfree(pin);
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index bc2e35e5ce615..14a686c80a9e6 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -2117,7 +2117,8 @@ static int tc358743_probe(struct i2c_client *client,
>  #ifdef CONFIG_VIDEO_TC358743_CEC
>  	state->cec_adap = cec_allocate_adapter(&tc358743_cec_adap_ops,
>  		state, dev_name(&client->dev),
> -		CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL, CEC_MAX_LOG_ADDRS);
> +		CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL, CEC_MAX_LOG_ADDRS,
> +		NULL);
>  	if (IS_ERR(state->cec_adap)) {
>  		err = PTR_ERR(state->cec_adap);
>  		goto err_hdl;
> diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> index 7bc4d8a9af287..817b1efb8b814 100644
> --- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> +++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
> @@ -235,7 +235,7 @@ static int cros_ec_cec_get_notifier(struct device *dev,
>  			if (!d)
>  				return -EPROBE_DEFER;
>  
> -			*notify = cec_notifier_get_conn(d, m->conn);
> +			*notify = cec_notifier_get_conn(d, m->conn, NULL);
>  			return 0;
>  		}
>  	}
> @@ -259,6 +259,7 @@ static int cros_ec_cec_get_notifier(struct device *dev,
>  static int cros_ec_cec_probe(struct platform_device *pdev)
>  {
>  	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
> +	const struct cec_connector_info *connector_info;
>  	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
>  	struct cros_ec_cec *cros_ec_cec;
>  	int ret;
> @@ -281,8 +282,10 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	connector_info = cec_notifier_get_connector_info(cros_ec_cec->notify);
> +
>  	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
> -						 DRV_NAME, CEC_CAP_DEFAULTS, 1);
> +				DRV_NAME, CEC_CAP_DEFAULTS, 1, connector_info);
>  	if (IS_ERR(cros_ec_cec->adap))
>  		return PTR_ERR(cros_ec_cec->adap);
>  
> diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform/meson/ao-cec.c
> index cd4be38ab5acc..3a8097d8be8ce 100644
> --- a/drivers/media/platform/meson/ao-cec.c
> +++ b/drivers/media/platform/meson/ao-cec.c
> @@ -600,6 +600,7 @@ static const struct cec_adap_ops meson_ao_cec_ops = {
>  
>  static int meson_ao_cec_probe(struct platform_device *pdev)
>  {
> +	const struct cec_connector_info *connector_info;
>  	struct meson_ao_cec_device *ao_cec;
>  	struct platform_device *hdmi_dev;
>  	struct device_node *np;
> @@ -626,13 +627,16 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  	if (!ao_cec->notify)
>  		return -ENOMEM;
>  
> +	connector_info = cec_notifier_get_connector_info(ao_cec->notify);
> +
>  	ao_cec->adap = cec_allocate_adapter(&meson_ao_cec_ops, ao_cec,
>  					    "meson_ao_cec",
>  					    CEC_CAP_LOG_ADDRS |
>  					    CEC_CAP_TRANSMIT |
>  					    CEC_CAP_RC |
>  					    CEC_CAP_PASSTHROUGH,
> -					    1); /* Use 1 for now */
> +					    1, /* Use 1 for now */
> +					    connector_info);
>  	if (IS_ERR(ao_cec->adap)) {
>  		ret = PTR_ERR(ao_cec->adap);
>  		goto out_probe_notify;
> diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platform/s5p-cec/s5p_cec.c
> index 8837e2678bdeb..cf5038d7dc5dc 100644
> --- a/drivers/media/platform/s5p-cec/s5p_cec.c
> +++ b/drivers/media/platform/s5p-cec/s5p_cec.c
> @@ -177,6 +177,7 @@ static const struct cec_adap_ops s5p_cec_adap_ops = {
>  
>  static int s5p_cec_probe(struct platform_device *pdev)
>  {
> +	const struct cec_connector_info *connector_info;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np;
>  	struct platform_device *hdmi_dev;
> @@ -228,8 +229,11 @@ static int s5p_cec_probe(struct platform_device *pdev)
>  	if (cec->notifier == NULL)
>  		return -ENOMEM;
>  
> +	connector_info = cec_notifier_get_connector_info(cec->notifier);
> +
>  	cec->adap = cec_allocate_adapter(&s5p_cec_adap_ops, cec, CEC_NAME,
> -		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0), 1);
> +		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0), 1,
> +		connector_info);
>  	ret = PTR_ERR_OR_ZERO(cec->adap);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/seco-cec/seco-cec.c b/drivers/media/platform/seco-cec/seco-cec.c
> index a425a10540c19..fbb9b9a2b4abb 100644
> --- a/drivers/media/platform/seco-cec/seco-cec.c
> +++ b/drivers/media/platform/seco-cec/seco-cec.c
> @@ -535,7 +535,7 @@ static int secocec_cec_get_notifier(struct cec_notifier **notify)
>  			if (!d)
>  				return -EPROBE_DEFER;
>  
> -			*notify = cec_notifier_get_conn(d, m->conn);
> +			*notify = cec_notifier_get_conn(d, m->conn, NULL);
>  
>  			return 0;
>  		}
> @@ -570,6 +570,7 @@ static int secocec_acpi_probe(struct secocec_data *sdev)
>  
>  static int secocec_probe(struct platform_device *pdev)
>  {
> +	struct cec_connector_info *connector_info;
>  	struct secocec_data *secocec;
>  	struct device *dev = &pdev->dev;
>  	int ret;
> @@ -635,12 +636,15 @@ static int secocec_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> +	connector_info = cec_notifier_get_connector_info(secocec->notifier);
> +
>  	/* Allocate CEC adapter */
>  	secocec->cec_adap = cec_allocate_adapter(&secocec_cec_adap_ops,
>  						 secocec,
>  						 dev_name(dev),
>  						 CEC_CAP_DEFAULTS,
> -						 SECOCEC_MAX_ADDRS);
> +						 SECOCEC_MAX_ADDRS,
> +						 connector_info);
>  
>  	if (IS_ERR(secocec->cec_adap)) {
>  		ret = PTR_ERR(secocec->cec_adap);
> diff --git a/drivers/media/platform/sti/cec/stih-cec.c b/drivers/media/platform/sti/cec/stih-cec.c
> index d34099f759901..062720631dcdb 100644
> --- a/drivers/media/platform/sti/cec/stih-cec.c
> +++ b/drivers/media/platform/sti/cec/stih-cec.c
> @@ -298,6 +298,7 @@ static const struct cec_adap_ops sti_cec_adap_ops = {
>  
>  static int stih_cec_probe(struct platform_device *pdev)
>  {
> +	const struct cec_connector_info *connector_info;
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct stih_cec *cec;
> @@ -347,8 +348,11 @@ static int stih_cec_probe(struct platform_device *pdev)
>  		return PTR_ERR(cec->clk);
>  	}
>  
> +	connector_info = cec_notifier_get_connector_info(cec->notifier);
> +
>  	cec->adap = cec_allocate_adapter(&sti_cec_adap_ops, cec,
> -			CEC_NAME, CEC_CAP_DEFAULTS, CEC_MAX_LOG_ADDRS);
> +			CEC_NAME, CEC_CAP_DEFAULTS, CEC_MAX_LOG_ADDRS,
> +			connector_info);
>  	ret = PTR_ERR_OR_ZERO(cec->adap);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/stm32/stm32-cec.c b/drivers/media/platform/stm32/stm32-cec.c
> index 7c496bc1cf381..ee23b9efd45ec 100644
> --- a/drivers/media/platform/stm32/stm32-cec.c
> +++ b/drivers/media/platform/stm32/stm32-cec.c
> @@ -304,7 +304,7 @@ static int stm32_cec_probe(struct platform_device *pdev)
>  	 * available for example when a drm driver can provide edid
>  	 */
>  	cec->adap = cec_allocate_adapter(&stm32_cec_adap_ops, cec,
> -			CEC_NAME, caps,	CEC_MAX_LOG_ADDRS);
> +			CEC_NAME, caps,	CEC_MAX_LOG_ADDRS, NULL);
>  	ret = PTR_ERR_OR_ZERO(cec->adap);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
> index aba488cd0e645..386b26b8f8d46 100644
> --- a/drivers/media/platform/tegra-cec/tegra_cec.c
> +++ b/drivers/media/platform/tegra-cec/tegra_cec.c
> @@ -327,6 +327,7 @@ static const struct cec_adap_ops tegra_cec_ops = {
>  
>  static int tegra_cec_probe(struct platform_device *pdev)
>  {
> +	const struct cec_connector_info *connector_info;
>  	struct platform_device *hdmi_dev;
>  	struct device_node *np;
>  	struct tegra_cec *cec;
> @@ -406,9 +407,11 @@ static int tegra_cec_probe(struct platform_device *pdev)
>  		goto clk_error;
>  	}
>  
> +	connector_info = cec_notifier_get_connector_info(cec->notifier);
> +
>  	cec->adap = cec_allocate_adapter(&tegra_cec_ops, cec, TEGRA_CEC_NAME,
>  			CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL,
> -			CEC_MAX_LOG_ADDRS);
> +			CEC_MAX_LOG_ADDRS, connector_info);
>  	if (IS_ERR(cec->adap)) {
>  		ret = -ENOMEM;
>  		dev_err(&pdev->dev, "Couldn't create cec adapter\n");
> diff --git a/drivers/media/platform/vivid/vivid-cec.c b/drivers/media/platform/vivid/vivid-cec.c
> index 4d822dbed9726..ef15c9c58c2a6 100644
> --- a/drivers/media/platform/vivid/vivid-cec.c
> +++ b/drivers/media/platform/vivid/vivid-cec.c
> @@ -283,5 +283,5 @@ struct cec_adapter *vivid_cec_alloc_adap(struct vivid_dev *dev,
>  		 is_source ? dev->vid_out_dev.name : dev->vid_cap_dev.name,
>  		 idx);
>  	return cec_allocate_adapter(&vivid_cec_adap_ops, dev,
> -		name, caps, 1);
> +		name, caps, 1, NULL);
>  }
> diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
> index b085b14f3f877..b1a741584a648 100644
> --- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
> +++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
> @@ -656,7 +656,8 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
>  
>  	pulse8->serio = serio;
>  	pulse8->adap = cec_allocate_adapter(&pulse8_cec_adap_ops, pulse8,
> -					    dev_name(&serio->dev), caps, 1);
> +					    dev_name(&serio->dev), caps, 1,
> +					    NULL);
>  	err = PTR_ERR_OR_ZERO(pulse8->adap);
>  	if (err < 0)
>  		goto free_device;
> diff --git a/drivers/media/usb/rainshadow-cec/rainshadow-cec.c b/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
> index d9964da05976b..8681e4d6b3d59 100644
> --- a/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
> +++ b/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
> @@ -323,7 +323,8 @@ static int rain_connect(struct serio *serio, struct serio_driver *drv)
>  
>  	rain->serio = serio;
>  	rain->adap = cec_allocate_adapter(&rain_cec_adap_ops, rain,
> -					  dev_name(&serio->dev), caps, 1);
> +					  dev_name(&serio->dev), caps, 1,
> +					  NULL);
>  	err = PTR_ERR_OR_ZERO(rain->adap);
>  	if (err < 0)
>  		goto free_device;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 97ce790a5b5aa..ded0ff01f2ac7 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1208,6 +1208,7 @@ struct drm_dp_aux_msg {
>  
>  struct cec_adapter;
>  struct edid;
> +struct drm_connector;
>  
>  /**
>   * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
> @@ -1220,8 +1221,7 @@ struct edid;
>  struct drm_dp_aux_cec {
>  	struct mutex lock;
>  	struct cec_adapter *adap;
> -	const char *name;
> -	struct device *parent;
> +	struct drm_connector *connector;
>  	struct delayed_work unregister_work;
>  };
>  
> @@ -1418,8 +1418,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
>  
>  #ifdef CONFIG_DRM_DP_CEC
>  void drm_dp_cec_irq(struct drm_dp_aux *aux);
> -void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *name,
> -				   struct device *parent);
> +void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> +				   struct drm_connector *connector);
>  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
> @@ -1428,9 +1428,9 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux *aux)
>  {
>  }
>  
> -static inline void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> -						 const char *name,
> -						 struct device *parent)
> +static inline
> +void drm_dp_cec_register_connector(struct drm_dp_aux *aux,

Add the 'void' to the 'static inline':

static inline void
drm_dp_cec_register_connector(struct drm_dp_aux *aux,

That's how a long prototype is typically broken up.

> +				   struct drm_connector *connector)
>  {
>  }
>  
> diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
> index 814eeef35a5cf..49c6c5b90c81f 100644
> --- a/include/media/cec-notifier.h
> +++ b/include/media/cec-notifier.h
> @@ -24,6 +24,8 @@ struct cec_notifier;
>   * device and connector tuple.
>   * @dev: device that sends the events.
>   * @conn: the connector name from which the event occurs
> + * @connector_info: relevant only if the call is used to create a notifier,
> + *   the connector's info to associate with new notifier.
>   *
>   * If a notifier for device @dev already exists, then increase the refcount
>   * and return that notifier.
> @@ -33,8 +35,10 @@ struct cec_notifier;
>   *
>   * Return NULL if the memory could not be allocated.
>   */
> -struct cec_notifier *cec_notifier_get_conn(struct device *dev,
> -					   const char *conn);
> +struct cec_notifier *cec_notifier_get_conn(
> +			struct device *dev,
> +			const char *conn,
> +			const struct cec_connector_info *connector_info);

Hmm, this is a bit ugly. How about this:

struct cec_notifier *
cec_notifier_get_conn(struct device *dev,
		      const char *conn,
		      const struct cec_connector_info *connector_info);

>  
>  /**
>   * cec_notifier_put - decrease refcount and delete when the refcount reaches 0.
> @@ -79,6 +83,14 @@ void cec_notifier_register(struct cec_notifier *n,
>   */
>  void cec_notifier_unregister(struct cec_notifier *n);
>  
> +/**
> + * cec_notifier_get_connector_info - get connector info associated with a
> + * notifier.
> + * @n: the CEC notifier
> + */
> +const struct cec_connector_info*

Add space before *

> +cec_notifier_get_connector_info(struct cec_notifier *n);
> +
>  /**
>   * cec_register_cec_notifier - register the notifier with the cec adapter.
>   * @adap: the CEC adapter
> @@ -88,8 +100,10 @@ void cec_register_cec_notifier(struct cec_adapter *adap,
>  			       struct cec_notifier *notifier);
>  
>  #else
> -static inline struct cec_notifier *cec_notifier_get_conn(struct device *dev,
> -							 const char *conn)
> +static inline struct cec_notifier *cec_notifier_get_conn(
> +			struct device *dev,
> +			const char *conn,
> +			const struct cec_connector_info *connector_info)

Similar issue as above, can be solved in the same way.

>  {
>  	/* A non-NULL pointer is expected on success */
>  	return (struct cec_notifier *)0xdeadfeed;
> @@ -108,9 +122,15 @@ static inline void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>  {
>  }
>  
> +static inline const struct cec_connector_info*

Space before *

> +	cec_notifier_get_connector_info(struct cec_notifier *n)

Just start at the beginning of the line.

> +{
> +	return NULL;
> +}
> +
>  static inline void cec_notifier_register(struct cec_notifier *n,
> -			 struct cec_adapter *adap,
> -			 void (*callback)(struct cec_adapter *adap, u16 pa))
> +			struct cec_adapter *adap,
> +			void (*callback)(struct cec_adapter *adap, u16 pa))
>  {
>  }
>  
> @@ -138,7 +158,7 @@ static inline void cec_register_cec_notifier(struct cec_adapter *adap,
>   */
>  static inline struct cec_notifier *cec_notifier_get(struct device *dev)
>  {
> -	return cec_notifier_get_conn(dev, NULL);
> +	return cec_notifier_get_conn(dev, NULL, NULL);
>  }
>  
>  /**
> diff --git a/include/media/cec.h b/include/media/cec.h
> index 707411ef8ba28..4d5edfd18f662 100644
> --- a/include/media/cec.h
> +++ b/include/media/cec.h
> @@ -200,6 +200,8 @@ struct cec_adapter {
>  	u32 sequence;
>  
>  	char input_phys[32];
> +
> +	struct cec_connector_info connector_info;
>  };
>  
>  static inline void *cec_get_drvdata(const struct cec_adapter *adap)
> @@ -233,10 +235,12 @@ static inline bool cec_is_registered(const struct cec_adapter *adap)
>  	((pa) >> 12), ((pa) >> 8) & 0xf, ((pa) >> 4) & 0xf, (pa) & 0xf
>  
>  struct edid;
> +struct drm_connector;
>  
>  #if IS_REACHABLE(CONFIG_CEC_CORE)
>  struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
> -		void *priv, const char *name, u32 caps, u8 available_las);
> +		void *priv, const char *name, u32 caps, u8 available_las,
> +		const struct cec_connector_info *connector_info);
>  int cec_register_adapter(struct cec_adapter *adap, struct device *parent);
>  void cec_unregister_adapter(struct cec_adapter *adap);
>  void cec_delete_adapter(struct cec_adapter *adap);
> @@ -249,7 +253,6 @@ void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
>  			       const struct edid *edid);
>  int cec_transmit_msg(struct cec_adapter *adap, struct cec_msg *msg,
>  		     bool block);
> -

Spurious change.

>  /* Called by the adapter */
>  void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
>  			  u8 arb_lost_cnt, u8 nack_cnt, u8 low_drive_cnt,
> @@ -331,6 +334,9 @@ void cec_queue_pin_5v_event(struct cec_adapter *adap, bool is_high, ktime_t ts);
>  u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
>  			   unsigned int *offset);
>  
> +void cec_get_drm_connector_info(const struct drm_connector *connector,
> +				struct cec_connector_info *connector_info);
> +
>  #else
>  
>  static inline int cec_register_adapter(struct cec_adapter *adap,
> @@ -365,6 +371,13 @@ static inline u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
>  	return CEC_PHYS_ADDR_INVALID;
>  }
>  
> +static inline void cec_get_drm_connector_info(
> +			const struct drm_connector *connector,
> +			struct cec_connector_info *connector_info)
> +{
> +	connector_info->type = CEC_CONNECTOR_TYPE_NO_CONNECTOR;

I prefer a memset here. That way no stack memory can leak.

Actually, I think the same should be done in the actual cec_get_drm_connector_info
function.

> +}
> +
>  #endif
>  
>  /**
> diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
> index 3094af68b6e76..43bc25db38297 100644
> --- a/include/uapi/linux/cec.h
> +++ b/include/uapi/linux/cec.h
> @@ -411,6 +411,27 @@ struct cec_event_lost_msgs {
>  	__u32 lost_msgs;
>  };
>  
> +/**
> + * struct cec_event_connector - tells if and which connector is associated
> + * with the CEC adapter.
> + * @card_no: drm card number
> + * @connector_id: drm connector id.

connector id -> connector ID

> + */
> +struct cec_drm_connector_info {
> +	__u32 card_no;
> +	__u32 connector_id;
> +};
> +
> +#define CEC_CONNECTOR_TYPE_NO_CONNECTOR	0
> +#define CEC_CONNECTOR_TYPE_DRM		1
> +struct cec_connector_info {
> +	__u32 type;
> +	union {
> +		struct cec_drm_connector_info drm;
> +		__u32 raw[16];
> +	};
> +};
> +
>  /**
>   * struct cec_event - CEC event structure
>   * @ts: the timestamp of when the event was sent.
> @@ -475,6 +496,9 @@ struct cec_event {
>  #define CEC_G_MODE		_IOR('a',  8, __u32)
>  #define CEC_S_MODE		_IOW('a',  9, __u32)
>  
> +/* Gets the connector info */
> +#define CEC_ADAP_G_CONNECTOR_INFO _IOR('a',  10, struct cec_connector_info)
> +
>  /*
>   * The remainder of this header defines all CEC messages and operands.
>   * The format matters since it the cec-ctl utility parses it to generate
> 

Regards,

	Hans
