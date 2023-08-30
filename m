Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24A278D86F
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbjH3Sa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243220AbjH3KXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 06:23:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A29C0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693391028; x=1724927028;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=W3vvjQhcbNX0KJPka4HU7h1/MjFF7SSgmZXJv4jKzpg=;
  b=L05p7biGfXvf93dFfPhOIpdXXgrLOPnO9XpNMNKxRmvnn4ko357XKDXj
   TSia1Kc0roNok5TSxl3N0omI6cE4eXQGft82pCR45z4oD0vzohFBSMHDw
   Dvt8NJbCHQM64MW5DiywcNBAs0J0SX7hzmzBWBDehdnmzSZTDqRFwCmLl
   wMBvQiDSn3e5bajHuwxmhorzvM6l9/Z6XWsHMNuvzw85B7W8DbPu83+aG
   60JQfjxbnnBBDhMc3LATSEaYusZQN2mNERMqk0q8B6OU7+ddiiiI8IMSK
   htrCM/RnecQhtLAKmIiuKspCpQntpLuEtNGg4L6+yEi4BDuDopBWy2iMJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355113120"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="355113120"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="853676813"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="853676813"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.57.251])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:23:45 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/cec: add drm_dp_cec_attach() as the non-edid
 version of set edid
In-Reply-To: <8b6af8fa-8f43-1f68-4f9f-399576d61153@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692884619.git.jani.nikula@intel.com>
 <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
 <8b6af8fa-8f43-1f68-4f9f-399576d61153@xs4all.nl>
Date:   Wed, 30 Aug 2023 13:23:43 +0300
Message-ID: <87edjk25hs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 30 Aug 2023, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 24/08/2023 15:46, Jani Nikula wrote:
>> Connectors have source physical address available in display
>> info. There's no need to parse the EDID again for this. Add
>> drm_dp_cec_attach() to do this.
>> 
>> Seems like the set_edid/unset_edid naming is a bit specific now that
>> there's no need to pass the EDID at all, so aim for attach/detach going
>> forward.
>> 
>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/display/drm_dp_cec.c | 22 +++++++++++++++++++---
>>  include/drm/display/drm_dp_helper.h  |  6 ++++++
>>  2 files changed, 25 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
>> index ae39dc794190..da7a7d357446 100644
>> --- a/drivers/gpu/drm/display/drm_dp_cec.c
>> +++ b/drivers/gpu/drm/display/drm_dp_cec.c
>> @@ -297,7 +297,7 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
>>   * were unchanged and just update the CEC physical address. Otherwise
>>   * unregister the old CEC adapter and create a new one.
>>   */
>> -void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>> +void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
>>  {
>>  	struct drm_connector *connector = aux->cec.connector;
>>  	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
>> @@ -339,7 +339,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>>  		if (aux->cec.adap->capabilities == cec_caps &&
>>  		    aux->cec.adap->available_log_addrs == num_las) {
>>  			/* Unchanged, so just set the phys addr */
>> -			cec_s_phys_addr_from_edid(aux->cec.adap, edid);
>> +			cec_s_phys_addr(adap, source_physical_address, false);
>
> As the kernel test robot indicated, this does not compile, this should
> be aux->cec.adap.
>
>>  			goto unlock;
>>  		}
>>  		/*
>> @@ -370,11 +370,27 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>>  		 * from drm_dp_cec_register_connector() edid == NULL, so in
>>  		 * that case the phys addr is just invalidated.
>>  		 */
>> -		cec_s_phys_addr_from_edid(aux->cec.adap, edid);
>> +		cec_s_phys_addr(adap, source_physical_address, false);
>>  	}
>>  unlock:
>>  	mutex_unlock(&aux->cec.lock);
>>  }
>> +EXPORT_SYMBOL(drm_dp_cec_attach);
>> +
>> +/*
>> + * Note: Prefer calling drm_dp_cec_attach() with
>> + * connector->display_info.source_physical_address if possible.
>> + */
>> +void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>> +{
>> +	u16 source_physical_address = CEC_PHYS_ADDR_INVALID;
>> +
>> +	if (edid && edid->extensions)
>
> And this source needs to include <drm/drm_edid.h>, also as found by
> the kernel test robot.

Yes, very embarrassing, I sent the v2 in reply [1].

BR,
Jani.

[1] https://patchwork.freedesktop.org/patch/msgid/20230825130120.1250089-1-jani.nikula@intel.com


>
> Regards,
>
> 	Hans
>
>> +		pa = cec_get_edid_phys_addr((const u8 *)edid,
>> +					    EDID_LENGTH * (edid->extensions + 1), NULL);
>> +
>> +	drm_dp_cec_attach(aux, source_physical_address);
>> +}
>>  EXPORT_SYMBOL(drm_dp_cec_set_edid);
>>  
>>  /*
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index 86f24a759268..3369104e2d25 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -699,6 +699,7 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux);
>>  void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
>>  				   struct drm_connector *connector);
>>  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
>> +void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address);
>>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
>>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
>>  #else
>> @@ -716,6 +717,11 @@ static inline void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
>>  {
>>  }
>>  
>> +static inline void drm_dp_cec_attach(struct drm_dp_aux *aux,
>> +				     u16 source_physical_address)
>> +{
>> +}
>> +
>>  static inline void drm_dp_cec_set_edid(struct drm_dp_aux *aux,
>>  				       const struct edid *edid)
>>  {
>

-- 
Jani Nikula, Intel Open Source Graphics Center
