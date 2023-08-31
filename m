Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C0078F2E7
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 20:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbjHaSvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 14:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346419AbjHaSvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 14:51:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F96CE69
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 11:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693507893; x=1725043893;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=aK2L0FYFMIs2rz3U06qLaSbuCoImaDU74MHF3sKOzWE=;
  b=mGE6XxH/GMyVY/IesFOEURBYmJaVOcytGmbabvWeBJfyp7F8w3V9Uc9X
   2nMs6HmNR6c7bJWR+46Srlt/t+BQnlMoX6bp8m5rPR4EQYRk2bobpedx3
   nBHvoNdPqEhH9lPTwMRR92m2ow5SqimE/Gq/TXE0ooD6zHaBB0I/KlJpw
   LESlJxapD6DAOzThd4Z/6J2iDVobLRac5Be4a1iAlX3+SzDHjpAKtCmik
   ybBNJY1phLGjCBsReYqNoV0hN662d3yhs5eJ9JuQn2BbUFfbe6ELO1oEq
   yi19+AE15cn4Fx+QPcKN+LHAGKxgEGB0FOA9vbcoWgw0h8waWqmAu8mVI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355532452"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="355532452"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863244303"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="863244303"
Received: from shochwel-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.58.219])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:51:29 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 0/6] drm, cec and edid updates
In-Reply-To: <cover.1692884619.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692884619.git.jani.nikula@intel.com>
Date:   Thu, 31 Aug 2023 21:51:24 +0300
Message-ID: <8734zzjb9v.fsf@intel.com>
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

On Thu, 24 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Avoid accessing the raw edid directly. Pre-parse the source physical
> address during normal EDID parsing and use that for CEC.
>
> Jani Nikula (6):
>   drm/edid: add drm_edid_is_digital()
>   drm/i915/display: use drm_edid_is_digital()
>   drm/edid: parse source physical address
>   drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
>   drm/i915/cec: switch to setting physical address directly

Maarten, Maxime, Thomas, ack for merging patches 1, 3 and 4 via via
drm-intel?

>   media: cec: core: add note about *_from_edid() function usage in drm

Hans, while there's no build dependency here, I think it would make
sense to merge this together with patches 3 and 4. Ack for merging via
drm-intel?

Thanks,
Jani.


>
>  drivers/gpu/drm/display/drm_dp_cec.c      | 22 +++++++++++++++++++---
>  drivers/gpu/drm/drm_edid.c                | 22 ++++++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
>  drivers/gpu/drm/i915/display/intel_dp.c   |  7 ++-----
>  drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +++-----
>  drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
>  drivers/media/cec/core/cec-adap.c         |  4 ++++
>  drivers/media/cec/core/cec-notifier.c     |  4 ++++
>  include/drm/display/drm_dp_helper.h       |  6 ++++++
>  include/drm/drm_connector.h               |  8 ++++++++
>  include/drm/drm_edid.h                    |  1 +
>  11 files changed, 73 insertions(+), 27 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
