Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9367870CC
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 15:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241453AbjHXNqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 09:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241595AbjHXNq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 09:46:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A54110EF
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692884785; x=1724420785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k/KJQx8gqsSEm7rm85TQpOlExCDa24aHbOQ6NV6RaK4=;
  b=nSAK8S4doU3YaoqF31RBfK1sJr932UN0zMyujGaCzR/XISYPkr+l6MIW
   Cxj0hyuTiKp9syn7tSsfhf2oYyIT4vdXA7vR2N0OuNwpMCeUgoalT5ucW
   Jtb/jrcEO1h/a7ruQJz5OMpOfVhbqf5BXNmMc6wVkTZmHeUIAJBaSIiNE
   3CHvP3ktbBC6SX26H6iioByZ9vravO1yMY8CNekzJS55KPRxbd2w/PoWn
   4exVqHlo7f9L4g545wKK6wUi56C2I3Qr+48qZ7Q0EiYBHyNQxSvNkJl8p
   UyUobFjFX+rNIyMun7N4aXbVNMVAeyMdadVpiSth/A+ByNM28BcbE8TdG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405447497"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="405447497"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802550886"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802550886"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:46:12 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 0/6] drm, cec and edid updates
Date:   Thu, 24 Aug 2023 16:46:01 +0300
Message-Id: <cover.1692884619.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid accessing the raw edid directly. Pre-parse the source physical
address during normal EDID parsing and use that for CEC.

Jani Nikula (6):
  drm/edid: add drm_edid_is_digital()
  drm/i915/display: use drm_edid_is_digital()
  drm/edid: parse source physical address
  drm/cec: add drm_dp_cec_attach() as the non-edid version of set edid
  drm/i915/cec: switch to setting physical address directly
  media: cec: core: add note about *_from_edid() function usage in drm

 drivers/gpu/drm/display/drm_dp_cec.c      | 22 +++++++++++++++++++---
 drivers/gpu/drm/drm_edid.c                | 22 ++++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_crt.c  | 11 ++++-------
 drivers/gpu/drm/i915/display/intel_dp.c   |  7 ++-----
 drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +++-----
 drivers/gpu/drm/i915/display/intel_sdvo.c |  7 ++-----
 drivers/media/cec/core/cec-adap.c         |  4 ++++
 drivers/media/cec/core/cec-notifier.c     |  4 ++++
 include/drm/display/drm_dp_helper.h       |  6 ++++++
 include/drm/drm_connector.h               |  8 ++++++++
 include/drm/drm_edid.h                    |  1 +
 11 files changed, 73 insertions(+), 27 deletions(-)

-- 
2.39.2

