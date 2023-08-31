Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2F578EB1B
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 12:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236996AbjHaKwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 06:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbjHaKwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 06:52:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFC8CFA
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693479152; x=1725015152;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=IKJ9fvESNpOgrVXSrWsbLPo/JZkMzvWxB+Z5zCbjbYw=;
  b=hLA80fp2WG54MitGp9YMJS4h2vzcIUXTvJQ43vRy3tWEGvtp8jQWIk8v
   CbOXUzQ5n1a4dVS0ICniTd/0/1Wa33dOUCl1NNPk/zhyMZ0nVwlM1/8pC
   jaH5VbuUQLxNrkSN95Y+j078SJaaGaEpC9duXfBVhOEj/OdiVjksq8gSe
   5hGbJWDKNLKEzzsxHQcMR7JG4ZXbF7jseYJgAx4XwxNhJ3DEBOHHkYdNv
   7+0sXBTyYp2+D6zZWt3LxwlioYpcoFyxrfcJoAdXZr2v3nmWrsQrjBEx9
   /dfM39C4i0ZhJrk/Zy3vQVP5nx/rN2mJYB16AtSEdIaa5xRUEWDBV1jqK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442262363"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="442262363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809548043"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="809548043"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:52:28 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 6/6] media: cec: core: add note about *_from_edid()
 function usage in drm
In-Reply-To: <343ed7f5-194a-805c-5608-b9000a868d5f@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692884619.git.jani.nikula@intel.com>
 <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
 <343ed7f5-194a-805c-5608-b9000a868d5f@xs4all.nl>
Date:   Thu, 31 Aug 2023 13:52:26 +0300
Message-ID: <87edjjjxg5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 30 Aug 2023, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 24/08/2023 15:46, Jani Nikula wrote:
>> In the drm subsystem, the source physical address is, in most cases,
>> available without having to parse the EDID again. Add notes about
>> preferring to use the pre-parsed address instead.
>> 
>> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: linux-media@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/media/cec/core/cec-adap.c     | 4 ++++
>>  drivers/media/cec/core/cec-notifier.c | 4 ++++
>>  2 files changed, 8 insertions(+)
>> 
>> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
>> index 241b1621b197..2c627ed611ed 100644
>> --- a/drivers/media/cec/core/cec-adap.c
>> +++ b/drivers/media/cec/core/cec-adap.c
>> @@ -1688,6 +1688,10 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
>>  }
>>  EXPORT_SYMBOL_GPL(cec_s_phys_addr);
>>  
>> +/*
>> + * Note: In the drm subsystem, prefer calling cec_s_phys_addr() with
>> + * connector->display_info.source_physical_address if possible.
>> + */
>
> I would rephrase this:
>
> /*
>  * Note: in the drm subsystem, prefer calling (if possible):
>  *
>  * cec_s_phys_addr(adap, connector->display_info.source_physical_address, false);
>  */
>
> I think it is important to indicate that the last argument should be 'false'.

Agreed.

>
>>  void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
>>  			       const struct edid *edid)
>>  {
>> diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
>> index 389dc664b211..13f043b3025b 100644
>> --- a/drivers/media/cec/core/cec-notifier.c
>> +++ b/drivers/media/cec/core/cec-notifier.c
>> @@ -195,6 +195,10 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
>>  }
>>  EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
>>  
>> +/*
>> + * Note: In the drm subsystem, prefer calling cec_notifier_set_phys_addr() with
>> + * connector->display_info.source_physical_address if possible.
>> + */
>
> This comment is fine, there is no similar last argument here. But perhaps
> it is good to use a similar format as above. Up to you.

Thanks, rephrased both in v2.

BR,
Jani.


>
>>  void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>>  					  const struct edid *edid)
>>  {
>
> Regards,
>
> 	Hans

-- 
Jani Nikula, Intel Open Source Graphics Center
