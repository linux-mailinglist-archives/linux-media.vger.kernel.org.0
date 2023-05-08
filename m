Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19566FA343
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 11:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbjEHJ2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 05:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbjEHJ2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 05:28:01 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA563FD
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683538064; x=1715074064;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/DH1tNXODE5JyGXdPwyv8eF6C5DiOTbrw+x1Km7ohXA=;
  b=KynGiIe9ShOSalWeTCcTAC63AroC/y1bVAM7+JOooyvirT3kvAIf6SiY
   4a33/kXowdL11X5HzHvzENh2D9zvPTYcdmD0b4VxmpwoUzpVyobKmBO0w
   yx1D7fDRzPWokbQNcgXZl8Lv+iU9iVQQ97oL1CdjUAaqseqlkNrseJ4yo
   rCKxheOzpLROdfiNSsibcXAeoEhfiIi+9g4FZVedsg8NHvdjbji8hSM7m
   Ol13Rx2tJ7jOueI6SAXznIbMUjLFEq5A6u9Omlpre4MI30SCdncO8KN3e
   QByTrnzVyf+Fw045LJ7ifN+Fpt+diUC7diYtHBvli63u5g9ZNM5joR+wW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415159362"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="415159362"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="810191832"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="810191832"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:27:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id CFCAA1203DA;
        Mon,  8 May 2023 12:17:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
Subject: [PATCH v2 0/3] Random cleanups
Date:   Mon,  8 May 2023 12:17:50 +0300
Message-Id: <20230508091753.80803-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

These three patches are seemingly random cleanups but are a pre-requisite
for another set for supporting generic metadata formats. I'll post that
set separately. These three should be merged independently though.

since v1:

- Use _BITUL macro instead.

- Also add U after 0.

Sakari Ailus (3):
  media: mc: Make media_get_pad_index() use pad type flag
  media: Documentation: Rename meta format files
  media: uapi: Use _BITUL macro for assigning bits in u32 fields

 .../userspace-api/media/v4l/meta-formats.rst  | 14 +++----
 ...{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} |  0
 ...-intel-ipu3.rst => metafmt-intel-ipu3.rst} |  0
 ...fmt-meta-rkisp1.rst => metafmt-rkisp1.rst} |  0
 .../{pixfmt-meta-uvc.rst => metafmt-uvc.rst}  |  0
 ...ixfmt-meta-vivid.rst => metafmt-vivid.rst} |  0
 ...meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} |  0
 ...meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} |  0
 MAINTAINERS                                   |  4 +-
 drivers/media/dvb-core/dvbdev.c               |  4 +-
 drivers/media/mc/mc-entity.c                  | 16 +++-----
 drivers/media/usb/au0828/au0828-core.c        |  2 +-
 drivers/media/v4l2-core/v4l2-mc.c             | 38 ++++++++++++-------
 include/media/media-entity.h                  |  4 +-
 include/uapi/linux/media.h                    | 30 +++++++--------
 15 files changed, 59 insertions(+), 53 deletions(-)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vivid.rst => metafmt-vivid.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} (100%)

-- 
2.30.2

