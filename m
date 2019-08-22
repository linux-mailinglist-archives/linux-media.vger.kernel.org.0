Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A426098D06
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbfHVIIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:08:43 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55301 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725987AbfHVIIn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:08:43 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 0i96iaakLThuu0i99ij8lY; Thu, 22 Aug 2019 10:08:40 +0200
Subject: Re: [PATCH v7 1/9] drm_dp_cec: add connector info support.
To:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
        Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
        Anthony Koo <Anthony.Koo@amd.com>,
        David Francis <David.Francis@amd.com>,
        amd-gfx@lists.freedesktop.org,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>, Leo Li <sunpeng.li@amd.com>,
        intel-gfx@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Sean Paul <sean@poorly.run>, Thomas Lim <Thomas.Lim@amd.com>,
        linux-kernel@vger.kernel.org,
        Manasi Navare <manasi.d.navare@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-2-darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <38cda4f5-3299-2bd4-65f5-9a0f948902c6@xs4all.nl>
Date:   Thu, 22 Aug 2019 10:08:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-2-darekm@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPWtQbBtTbaDHxFeyBb7ygW2PsLRysFGSHFJf5O77Fe4xUN5k2EdXnE0k7b/68OB9T5KEn44P6ppCAbw0dKuKCywDe8zm2wKSTiCBpX5SNOGqVkb+NkH
 AJcLKlyAB//eccrjvPOeJLJsJK0K+70oXNtIJaZvhqK/YLWfEEOkUvT0ArUq6VTzPHf7174IRQ+YIGgidYvEejsPLFEqO4uhuQggI19K7VTgah8OIdPO9Syc
 Z7f3kPcFLErs32csa0DU442Kf0WsarTHrq1h84vUwR5/WgiNv1WR2bvY+bpWxVUyuMfbFndXuLHrfnYy20OLCc+SHVhCoR9pJYHsHxjgaG+Ks6c/hAB66KLf
 O6XLRHzKukQFd3u4AMuayXJ1R1Zp2Yt5gQf2X0u+nh5fUlIa2wip6REiiPAFwzznY6poFrYtGgbh+eBswkL7JujosqgNqfRXxVTiqaUIayHykZ7Bz22LSorn
 lETmFGAc/4pT6khECdVKTjraKmIy8KLPJCRSCiVFXNn8yZCS20yAJuUm6NuTVdWMxjJJ/EoG6Arz+/VCb3GrZrbNClOVNMeocFWKcqFVpzq0XQXhvkNaKH98
 KlN2IMqi1QvcP1za1UwcJhpGb1ZZIp1nHDpE9/GW8mHyXz2JQbLYLW7HQ1anGajADr6z6DFfazz0VrECE3YMsM+FHkPaGpJwWI/eEqA4RGk0TkW9k0YpWbr6
 hNq5s6AgmbGrf6n6ha0EQHPan75U8yNT/qPTUQiRdHfQWcVJjzmW7YKAeJ5bjxH5DvX9ve1SyjxOFwF4YSS7W303CBIQy+GFpdBLEkKSuqSbEc8mcWd56sQk
 ZEmk6NHZBNgJqPBkInqxhwHiE3qB6tO4TQDaKcyQYuYzY5QqdOPQv6rJ7Toe4utCVUKOywgFCZRtGoqdeYhQAIGb+l+aTtdLrFDEEgVo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Alex, Ville/Rodrigo, Ben,

Can you (hopefully) Ack this patch so that I can merge it?

Thank you!

	Hans

On 8/14/19 12:44 PM, Dariusz Marcinkiewicz wrote:
> Pass the connector info to the CEC adapter. This makes it possible
> to associate the CEC adapter with the corresponding drm connector.
> 
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +--
>  include/drm/drm_dp_helper.h                   | 17 ++++++-------
>  5 files changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 16218a202b591..5ec14efd4d8cb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -416,7 +416,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
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
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 1092499115760..de2486fe7bf2d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5497,7 +5497,6 @@ static int
>  intel_dp_connector_register(struct drm_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_device *dev = connector->dev;
>  	int ret;
>  
>  	ret = intel_connector_register(connector);
> @@ -5512,8 +5511,7 @@ intel_dp_connector_register(struct drm_connector *connector)
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
> index 330d7d29a6e34..8aa703347eb54 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1416,8 +1416,7 @@ nouveau_connector_create(struct drm_device *dev,
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
> index 8364502f92cfe..7972b925a952b 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1230,20 +1230,19 @@ struct drm_dp_aux_msg {
>  
>  struct cec_adapter;
>  struct edid;
> +struct drm_connector;
>  
>  /**
>   * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
>   * @lock: mutex protecting this struct
>   * @adap: the CEC adapter for CEC-Tunneling-over-AUX support.
> - * @name: name of the CEC adapter
> - * @parent: parent device of the CEC adapter
> + * @connector: the connector this CEC adapter is associated with
>   * @unregister_work: unregister the CEC adapter
>   */
>  struct drm_dp_aux_cec {
>  	struct mutex lock;
>  	struct cec_adapter *adap;
> -	const char *name;
> -	struct device *parent;
> +	struct drm_connector *connector;
>  	struct delayed_work unregister_work;
>  };
>  
> @@ -1451,8 +1450,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
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
> @@ -1461,9 +1460,9 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux *aux)
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

