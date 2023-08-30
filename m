Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2878978D873
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbjH3Sae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243233AbjH3K0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 06:26:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064F2C0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 03:26:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 904D561305
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 10:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1D5C433C7;
        Wed, 30 Aug 2023 10:26:04 +0000 (UTC)
Message-ID: <bdebe804-139e-f3d4-f77a-1ede7e6ac02c@xs4all.nl>
Date:   Wed, 30 Aug 2023 12:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/cec: add drm_dp_cec_attach() as the non-edid
 version of set edid
Content-Language: en-US, nl
To:     Jani Nikula <jani.nikula@intel.com>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
References: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
 <20230825130120.1250089-1-jani.nikula@intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230825130120.1250089-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jani,

Sorry, I missed the v2.

On 25/08/2023 15:01, Jani Nikula wrote:
> Connectors have source physical address available in display
> info. There's no need to parse the EDID again for this. Add
> drm_dp_cec_attach() to do this.
> 
> Seems like the set_edid/unset_edid naming is a bit specific now that
> there's no need to pass the EDID at all, so aim for attach/detach going
> forward.
> 
> v2: Fix the embarrashing build failures
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/gpu/drm/display/drm_dp_cec.c | 23 ++++++++++++++++++++---
>  include/drm/display/drm_dp_helper.h  |  6 ++++++
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
> index ae39dc794190..007ceb281d00 100644
> --- a/drivers/gpu/drm/display/drm_dp_cec.c
> +++ b/drivers/gpu/drm/display/drm_dp_cec.c
> @@ -14,6 +14,7 @@
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_edid.h>
>  
>  /*
>   * Unfortunately it turns out that we have a chicken-and-egg situation
> @@ -297,7 +298,7 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
>   * were unchanged and just update the CEC physical address. Otherwise
>   * unregister the old CEC adapter and create a new one.
>   */
> -void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> +void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
>  {
>  	struct drm_connector *connector = aux->cec.connector;
>  	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> @@ -339,7 +340,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  		if (aux->cec.adap->capabilities == cec_caps &&
>  		    aux->cec.adap->available_log_addrs == num_las) {
>  			/* Unchanged, so just set the phys addr */
> -			cec_s_phys_addr_from_edid(aux->cec.adap, edid);
> +			cec_s_phys_addr(aux->cec.adap, source_physical_address, false);
>  			goto unlock;
>  		}
>  		/*
> @@ -370,11 +371,27 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  		 * from drm_dp_cec_register_connector() edid == NULL, so in
>  		 * that case the phys addr is just invalidated.
>  		 */
> -		cec_s_phys_addr_from_edid(aux->cec.adap, edid);
> +		cec_s_phys_addr(aux->cec.adap, source_physical_address, false);
>  	}
>  unlock:
>  	mutex_unlock(&aux->cec.lock);
>  }
> +EXPORT_SYMBOL(drm_dp_cec_attach);
> +
> +/*
> + * Note: Prefer calling drm_dp_cec_attach() with
> + * connector->display_info.source_physical_address if possible.
> + */
> +void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> +{
> +	u16 pa = CEC_PHYS_ADDR_INVALID;
> +
> +	if (edid && edid->extensions)
> +		pa = cec_get_edid_phys_addr((const u8 *)edid,
> +					    EDID_LENGTH * (edid->extensions + 1), NULL);
> +
> +	drm_dp_cec_attach(aux, pa);
> +}
>  EXPORT_SYMBOL(drm_dp_cec_set_edid);
>  
>  /*
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 86f24a759268..3369104e2d25 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -699,6 +699,7 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux);
>  void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
>  				   struct drm_connector *connector);
>  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
> +void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address);
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
>  #else
> @@ -716,6 +717,11 @@ static inline void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
>  {
>  }
>  
> +static inline void drm_dp_cec_attach(struct drm_dp_aux *aux,
> +				     u16 source_physical_address)
> +{
> +}
> +
>  static inline void drm_dp_cec_set_edid(struct drm_dp_aux *aux,
>  				       const struct edid *edid)
>  {

