Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEBD785D25
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731560AbfHHIoV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 04:44:21 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:47893 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728289AbfHHIoV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 04:44:21 -0400
Received: from [IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93] ([IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ve1whrduDAffAve1xhBLmg; Thu, 08 Aug 2019 10:44:18 +0200
Subject: Re: [PATCH v5 1/9] drm_dp_cec: add connector info support.
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        linux-media@vger.kernel.org
References: <20190807085232.151260-1-darekm@google.com>
 <20190807085232.151260-2-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c644acb0-9e47-5dc5-61d2-6aae3aef6510@xs4all.nl>
Date:   Thu, 8 Aug 2019 10:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807085232.151260-2-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCylCuoJsVBDKLrwTVsE8e9f+V9J5/Xqf0RFlEhQuRCEEMBNcfCClhDZbAqU43oSPrFhJaPaC6WD9dmZvUgQcGMKwYEiYGYAXtRNFmzPxipQ+HXAgKjh
 /z8Ht4L//Oa5bDH4tkBiSdL47vFxU/lGE030dJsOkyoC5AymGllWwwn+Ib8IniSXYGJD+bEF3wMb5RH5ty7Wr9TEUWowwqE7aFBb+yyeAVE0FAJZBGXHNPV3
 0/X4dQJHvS6YLzclrZOyfDOLVUScnJv8T62FFbEfjJEQVs34zaRTttLeaXX9XX6ao5Mayup4WEvUxtJiyB4y4A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/7/19 10:52 AM, Dariusz Marcinkiewicz wrote:
> Pass the connector info to the CEC adapter. This makes it possible
> to associate the CEC adapter with the corresponding drm connector.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Tested with a USB-C-to-HDMI adapter on an Intel NUC and with a DP-to-HDMI
adapter on an AMD GPU and an NVIDIA GPU.

Regards,

	Hans

> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++++++-------
>  drivers/gpu/drm/i915/intel_dp.c               |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +--
>  include/drm/drm_dp_helper.h                   | 14 +++++------
>  5 files changed, 26 insertions(+), 22 deletions(-)
> 
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
> diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
> index b15cee85b702b..b457c16c3a8bb 100644
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
> @@ -295,7 +297,10 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
>   */
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  {
> -	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD;
> +	struct drm_connector *connector = aux->cec.connector;
> +	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> +		       CEC_CAP_CONNECTOR_INFO;
> +	struct cec_connector_info conn_info;
>  	unsigned int num_las = 1;
>  	u8 cap;
>  
> @@ -344,13 +349,17 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  
>  	/* Create a new adapter */
>  	aux->cec.adap = cec_allocate_adapter(&drm_dp_cec_adap_ops,
> -					     aux, aux->cec.name, cec_caps,
> +					     aux, connector->name, cec_caps,
>  					     num_las);
>  	if (IS_ERR(aux->cec.adap)) {
>  		aux->cec.adap = NULL;
>  		goto unlock;
>  	}
> -	if (cec_register_adapter(aux->cec.adap, aux->cec.parent)) {
> +
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +	cec_s_conn_info(aux->cec.adap, &conn_info);
> +
> +	if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
>  		cec_delete_adapter(aux->cec.adap);
>  		aux->cec.adap = NULL;
>  	} else {
> @@ -406,22 +415,20 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
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
> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
> index 4336df46fe782..79c8afdbc4869 100644
> --- a/drivers/gpu/drm/i915/intel_dp.c
> +++ b/drivers/gpu/drm/i915/intel_dp.c
> @@ -5693,7 +5693,6 @@ static int
>  intel_dp_connector_register(struct drm_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_device *dev = connector->dev;
>  	int ret;
>  
>  	ret = intel_connector_register(connector);
> @@ -5708,8 +5707,7 @@ intel_dp_connector_register(struct drm_connector *connector)
>  	intel_dp->aux.dev = connector->kdev;
>  	ret = drm_dp_aux_register(&intel_dp->aux);
>  	if (!ret)
> -		drm_dp_cec_register_connector(&intel_dp->aux,
> -					      connector->name, dev->dev);
> +		drm_dp_cec_register_connector(&intel_dp->aux, connector);
>  	return ret;
>  }
>  
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
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 3fc534ee81746..729af0b812909 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1221,6 +1221,7 @@ struct drm_dp_aux_msg {
>  
>  struct cec_adapter;
>  struct edid;
> +struct drm_connector;
>  
>  /**
>   * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
> @@ -1233,8 +1234,7 @@ struct edid;
>  struct drm_dp_aux_cec {
>  	struct mutex lock;
>  	struct cec_adapter *adap;
> -	const char *name;
> -	struct device *parent;
> +	struct drm_connector *connector;
>  	struct delayed_work unregister_work;
>  };
>  
> @@ -1431,8 +1431,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
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
> @@ -1441,9 +1441,9 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux *aux)
>  {
>  }
>  
> -static inline void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> -						 const char *name,
> -						 struct device *parent)
> +static inline void
> +drm_dp_cec_register_connector(struct drm_dp_aux *aux,
> +			      struct drm_connector *connector)
>  {
>  }
>  
> 

