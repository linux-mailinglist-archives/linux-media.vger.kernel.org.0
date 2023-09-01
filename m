Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9029D78FA54
	for <lists+linux-media@lfdr.de>; Fri,  1 Sep 2023 10:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbjIAI5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Sep 2023 04:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344480AbjIAI5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Sep 2023 04:57:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090F110D2
        for <linux-media@vger.kernel.org>; Fri,  1 Sep 2023 01:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693558653; x=1725094653;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=YaK0sBSfP+2sKQEf7Aebu7iHWoATcebhuYBSjbJ2WD0=;
  b=Wq3rJWJH+g3jAtw5OZWeQYZH/UMVnIl8WKaCzjAWxC4oLLVSAn+YXuQq
   aEFpL+dwMJdB5nVZ+m41yDlfdZPEkxavyPoa91bPUjByiH3asDwfuGoE5
   HE1PViTecILH5J7gJDOSemS10RGinQgaum8xKCHmQETw6TRtY8dkurdeq
   QlHNaECAHxhi0arajPynI/yxvcuOvJcDh0wIVVArV2VH6UJUJSyNpKda+
   /+Oa7zcLmq1jjdIoKaA87YLXt3wkzqT/qZkH1xn/FQ049bWeES2dI7Etb
   CWqlZxkUQDEeK/4qj65qaeHlNrO4KncMdHXMMYErLFQua1d8KZAvNgJdQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379957730"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="379957730"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 01:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774918806"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="774918806"
Received: from shochwel-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.58.219])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 01:57:30 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 0/6] drm, cec and edid updates
In-Reply-To: <6i3idgngjlyez6y7zleqrt54r7f4c3urifgerizhzoarwdilv2@auwk3cedxv2t>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692884619.git.jani.nikula@intel.com>
 <8734zzjb9v.fsf@intel.com>
 <6i3idgngjlyez6y7zleqrt54r7f4c3urifgerizhzoarwdilv2@auwk3cedxv2t>
Date:   Fri, 01 Sep 2023 11:57:24 +0300
Message-ID: <87wmxai83v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 01 Sep 2023, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, Aug 31, 2023 at 09:51:24PM +0300, Jani Nikula wrote:
>> On Thu, 24 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Avoid accessing the raw edid directly. Pre-parse the source physical
>> > address during normal EDID parsing and use that for CEC.
>> >
>> > Jani Nikula (6):
>> >   drm/edid: add drm_edid_is_digital()
>> >   drm/i915/display: use drm_edid_is_digital()
>> >   drm/edid: parse source physical address
>> >   drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
>> >   drm/i915/cec: switch to setting physical address directly
>> 
>> Maarten, Maxime, Thomas, ack for merging patches 1, 3 and 4 via via
>> drm-intel?
>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for all the reviews and acks, pushed the series to
drm-intel-next.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
